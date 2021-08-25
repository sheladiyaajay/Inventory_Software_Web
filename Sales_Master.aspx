<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sales_Master.aspx.cs" Inherits="Sales_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#AddModal').modal('show');
        }
        function closeModal() {
            $('#AddModal').modal('hide');
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#add_to_table").hide();
        });
        function Header_Data() {
            var txt_TrnNo = $("#txt_TrnNo").val();
            var txt_Date = $("#txt_Date").val();
            var txt_TillDate = $("#txt_TillDate").val();
            var txt_Invoice = $("#txt_Invoice").val();
            var txt_Client = $("#txt_Client").val();
            var txt_Mobile = $("#txt_Mobile").val();
            var txt_Address = $("#txt_Address").val();
            var txt_total = $("#txt_total").val();
            var txt_Grandtotal = $("#txt_Grandtotal").val();

            $.ajax({
                type: "POST",
                url: "Sales_Master.aspx/Header",
                data: "{txt_TrnNo:'" + txt_TrnNo + "',txt_Date:'" + txt_Date + "',txt_TillDate:'" + txt_TillDate + "',txt_Invoice:'" + txt_Invoice + "',txt_Client:'" + txt_Client + "',txt_Mobile:'" + txt_Mobile + "',txt_Address:'" + txt_Address + "',txt_total:'" + txt_total + "',txt_Grandtotal:'" + txt_Grandtotal + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    alert("hader data added");
                },
                error: function (result) {
                }
            });
        }
        function AddToList() {
            debugger
            var value = parseInt(document.getElementById('txtNo').value, 10);
            value = isNaN(value) ? 0 : value;
            value++;
            document.getElementById('txtNo').value = value;

            var txtNo = $("#txtNo").val();
            var no = $("#no").val();
            var Product = $("#Product").val();
            var Desc = $("#Desc").val();
            var HSN = $("#HSN").val();
            var Qty = $("#Qty").val();
            var Price = $("#Price").val();
            var txt_Client = $("#txt_Client").val();
            var total = (Qty * Price);
            var UntiPrice = $("#UnitPrice").val(total);
            var txt_TrnNo = $("#txt_TrnNo").val();
            var txt_Date = $("#txt_Date").val();
            var txt_TillDate = $("#txt_TillDate").val();
            var txt_Invoice = $("#txt_Invoice").val();

            var trHTML = '<tr no=' + txtNo +
            ' product=' + Product +
            ' Desc=' + Desc +
            ' HSN=' + HSN +
            ' Qty=' + Qty +
            ' UntiPrice=' + UntiPrice +
            ' txt_Client=' + txt_Client +
            ' txt_TrnNo=' + txt_TrnNo +
            ' Price=' + Price + ' >';

            trHTML = trHTML + '<td>' + txtNo + '</td>';
            trHTML = trHTML + '<td>' + Product + '</td>';
            trHTML = trHTML + '<td>' + Desc + '</td>';
            trHTML = trHTML + '<td>' + HSN + '</td>';
            trHTML = trHTML + '<td>' + Qty + '</td>';
            trHTML = trHTML + '<td>' + Price + '</td>';
            trHTML = trHTML + '<td class="tot">' + total + '</td>';
            trHTML = trHTML + '<td> <a href="#" class="btn btn-success" value="DeLete" onclick=deleteList(this)><i class="zmdi zmdi-delete">Delete</a></td>';
            trHTML = trHTML + '</tr>';
            $("#dispinvoice").append(trHTML);
            $("#add_to_table").show();
            setTimeout(function () { $('#Addmodal').modal('hide'); }, 100);
            foot_Total();
            closeModal();
            Clear();
        }
        function Sr_no() {
            var value = parseInt(document.getElementById('txtNo').value, 10);
            value = isNaN(value) ? 0 : value;
            value--;
            document.getElementById('txtNo').value = value;
        }
        function foot_Total() {
            debugger;
            var lastrow = $('table').find('tr:last');
            var total = 0
            $('.tot').each(function (i, element) {
                total += +$(this).text();
            });
            $("#txt_Grandtotal").val(total);
        }
        function deleteList(ctrl) {
            $(ctrl).parents('tr').remove();
            for (var i = 0; i < ItemArr.length; i++) {
                ItemArr.splice(i, 1);
            }
            foot_Total();
            Sr_no();
        }

        function Clear() {
            $("#Product").val();
            $("#Desc").val();
            $("#HSN").val();
            $("#Qty").val();
            $("#Price").val();
            $("#UnitPrice").val();
        }
    </script>
    <script>
        function AddData() {
            Header_Data();
            GetItemDetail();
            var itemdetail = ItemArr;
            if (itemdetail.length <= 0) {
                $("#error").html('<div class="alert alert-danger fade in"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong> Please Add At list One Item In List...</div>');
            }
            else {
                $("#preloader").show();
                $.ajax({
                    type: "POST",
                    url: "Sales_Master.aspx/AddDetails",
                    data: JSON.stringify({ 'Item_Detail': itemdetail }),
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.d == 1) {
                            $("#error").html('<div class="alert alert-success fade in"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Group Detail Add Successfully. </div>');
                            setTimeout(function () { window.location.href = "Display_All_Invoice.aspx"; }, 1200);
                        }
                        else if (result.d == 3) {
                            $("#error").html('<div class="alert alert-danger fade in"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong> Problem In Save Group. </div>');
                        }
                        $("#preloader").hide();
                    }
                });
                setTimeout(function () { $('#AddModal').modal('hide'); }, 100);
            }
        }
        var ItemArr = new Array();
        function GetItemDetail() {
            $("#dtItemList").find("tr").each(function (index, value) {
                if ($(value).length > 0) {
                    if ($(value)[0].hasAttribute("no")) {
                        var id = $(value).attr("no")
                        debugger
                        if (id != "" && id != undefined) {

                            ItemArr.push({
                                No: $(value).attr("no"),
                                Product: $(value).attr("product"),
                                Desc: $(value).attr("Desc"),
                                txt_TrnNo: $(value).attr('txt_TrnNo'),
                                txt_Client: $(value).attr('txt_Client'),
                                HSN: $(value).attr("HSN"),
                                Qty: $(value).attr("Qty"),
                                UnitPrice: $(value).attr("UnitPrice"),
                                Price: $(value).attr("Price").replace(/_/g, " "),
                            });
                        }
                    }
                }
            });

            if (ItemArr.length > 0)
                return "0";
            else
                return "-1";
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <asp:Label runat="server" ClientIDMode="Static" ID="error"></asp:Label>
        </div>
        <div class="col-md-12">
            <div class="col-md-1">
                <input type="hidden" id="txtNo" runat="server" clientidmode="static" />
                <label>Trn No</label>
            </div>
            <div class="col-md-2">
                <input type="text" runat="server" readonly id="txt_TrnNo" clientidmode="static" class="form-control" required placeholder="" />
            </div>
            <div class="col-md-1">
                <label>Date</label>
            </div>
            <div class="col-md-2">
                <input type="text" runat="server" id="txt_Date" clientidmode="static" class="form-control" required placeholder="" />
            </div>
            <div class="col-md-1">
                <label>Till Date</label>
            </div>
            <div class="col-md-2">
                <input type="text" runat="server" id="txt_TillDate" clientidmode="static" class="form-control" required placeholder=" " />
            </div>
            <div class="clear">
                <br />
            </div>
            <div class="col-md-1">
                <label>Invoice</label>
            </div>
            <div class="col-md-2">
                <input type="text" runat="server" id="txt_Invoice" clientidmode="static" class="form-control" required placeholder=" " />
            </div>
            <div class="col-md-1">
                <label>Client</label>
            </div>
            <div class="col-md-2">
                <select type="text" runat="server" clientidmode="static" id="txt_Client" class="form-control">
                </select>
            </div>
            <div class="col-md-1">
                <label>Mobile</label>
            </div>
            <div class="col-md-2">
                <input type="text" id="txt_Mobile" clientidmode="static" runat="server" class="form-control" required placeholder=" " />
            </div>
            <div class="clear">
                <br />
            </div>
            <div class="col-md-1">
                <label>Address</label>
            </div>
            <div class="col-md-2">
                <input type="text" id="txt_Address" clientidmode="static" runat="server" class="form-control" required placeholder="" />
            </div>
            <div class="clear">
                <br />
            </div>
            <div class="col-md-10"></div>
            <div class="col-md-1">
                <input type="button" runat="server" value="+ Add To List" data-toggle="modal" data-target="#AddModal" class="btn btn-green" />
            </div>
            <div class="clear">
                <br />
            </div>

        </div>

        <br />
        <div class="" id="add_to_table" style="height: 200px;">
            <table class="table table-bordered table-responsive" id="dtItemList" style="width: 100%">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>Product</th>
                        <th>Description</th>
                        <th>HSN</th>
                        <th>QTY</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="dispinvoice">
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <input type="text" runat="server" clientidmode="static" class="" id="txt_total" />
                        </td>
                        <td>
                            <input type="text" runat="server" clientidmode="static" class="" id="txt_Grandtotal" />
                        </td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
            <div class="col-md-1">
                <input type="button" runat="server" id="Button1" onclick="AddData()" class="form-control btn btn-success" value="submit" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="modal fade" id="AddModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Product</h4>
                    </div>
                    <div class="modal-body">
                        <input type="text" visible="false" runat="server" class="form-control" clientidmode="static" id="no" placeholder="No" />

                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" runat="server" class="form-control" clientidmode="static" id="Product" placeholder="Product" />
                            </div>
                            <div class="col-md-6">
                                <input type="text" runat="server" class="form-control" clientidmode="static" id="Desc" placeholder="Desc" />
                            </div>
                            <div class="clear">
                                <br />
                            </div>
                            <div class="col-md-6">
                                <input type="text" runat="server" class="form-control " clientidmode="static" id="HSN" placeholder="HSN" />
                            </div>
                            <div class="col-md-6">
                                <input type="text" runat="server" class="form-control" clientidmode="static" id="Qty" placeholder="Qty" />
                            </div>
                            <div class="clear">
                                <br />
                            </div>
                            <div class="col-md-6">
                                <input type="text" runat="server" class="form-control" clientidmode="static" id="Price" placeholder="Price" />
                            </div>
                            <div class="col-md-6">
                                <input type="text" readonly runat="server" class="form-control" clientidmode="static" id="UnitPrice" placeholder="Unit Price" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" runat="server" id="btnadd12" onclick="AddToList()" class="btn btn-success" value="Add" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>


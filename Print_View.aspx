<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print_View.aspx.cs" Inherits="Print_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="assets/css/font-icons/entypo/css/entypo.css" />
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic" />
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/neon-core.css" />
    <link rel="stylesheet" href="assets/css/neon-theme.css" />
    <link rel="stylesheet" href="assets/css/neon-forms.css" />
    <link rel="stylesheet" href="assets/css/custom.css" />
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <script src="assets/js/jquery-1.11.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="invoice">
                <div class="col-md-12">
                    <div class="col-md-6 invoice-left">
                        <label class="" runat="server" id="lbl_company_name"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_address"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_details"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_name"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_acno"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_ifsc_code"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_mobile_no"></label>
                        <br />
                        <label class="" runat="server" id="lbl_company_bank_email_id"></label>
                        <br />
                        <br />
                        <label class="">Buyer</label><br />

                        <label class="" runat="server" id="lbl_buyer_name"></label>,
                        <br />
                        <label class="" runat="server" id="lbl_buyer_addess"></label>,
                        <br />
                        <label class="" runat="server" id="lbl_buyer_mobile"></label>

                    </div>
                    <div class="col-md-6 invoice-right">
                        <label>Invoice No.</label>:
                        <label runat="server" id="lbl_invoiceno">156</label>

                        <br />

                        <label>Date</label>:
                        <label runat="server" id="lbl_date">20-Oct-2020</label>

                        <br />

                        <label>Dalivery Note</label>:
                        <label runat="server" id="lbl_dailvery_note">Mode/Terms Of Payment</label>

                        <br />

                        <label>Supplier's Ref.</label>:
                        <label runat="server" id="lbl_supplier_ref">Other Reference(s)</label>

                    </div>
                </div>

                <div class="col-md-12">
                    <asp:GridView ID="grid_display" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" ShowFooter="true" runat="server" ClientIDMode="Static" CssClass="table table-bordered" OnRowDataBound="grid_display_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" FooterStyle-CssClass="hidden" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%#Eval("id")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="S_SrNo" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_trnno" Text='<%# Eval("S_SrNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Product" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Product") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Description") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="HSN" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_HSN") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Qty") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rate" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Price") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <FooterTemplate>
                                    <asp:Label ID="lbl_total_unitprice" runat="server" Text="Label"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_unitprice" Text='<%# Eval("S_UnitPrice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <label>Amount Chargeable (in words) </label>
                    </div>
                    <div class="col-md-6">
                        <asp:Label runat="server" ID="total_words"></asp:Label>
                    </div>
                </div>
                <br /><br />
                <div class="col-md-12">
                    <div class="col-md-11 invoice-left">
                    <label>Declaration:</label><br /><br />
                        <label>Company's GSTIN"24BYPPK0557G1ZC </label><br />
                        <label>*Goods once sold will not be exchanged or taken back. </label><br />
                        <label>*Warranty as per company's rules.</label><br />
                        <label>*No oparating system application software are provided with computer systems.</label><br />
                        <label>*Software installation is not our responsibility or any other liabiity.</label><br />
                        <label>*Subject to amreli jurisduction.</label><br />
                        <label></label><br />
                    </div>
                    <div class="col-md-2 invoice-right">
                        <label>For <asp:Label runat="server" ClientIDMode="Static" ID="lbl_signatory_owner"></asp:Label></label>
                        <br />
                        <br />
                        <br />
                        <label>Authorised Signatory</label>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <link rel="stylesheet" href="assets/js/jvectormap/jquery-jvectormap-1.2.2.css" />
    <link rel="stylesheet" href="assets/js/rickshaw/rickshaw.min.css" />

    <!-- Bottom scripts (common) -->
    <script src="assets/js/gsap/TweenMax.min.js"></script>
    <script src="assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/joinable.js"></script>
    <script src="assets/js/resizeable.js"></script>
    <script src="assets/js/neon-api.js"></script>
    <script src="assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>


    <!-- Imported scripts on this page -->
    <script src="assets/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
    <script src="assets/js/jquery.sparkline.min.js"></script>
    <script src="assets/js/rickshaw/vendor/d3.v3.js"></script>
    <script src="assets/js/rickshaw/rickshaw.min.js"></script>
    <script src="assets/js/raphael-min.js"></script>
    <script src="assets/js/morris.min.js"></script>
    <script src="assets/js/toastr.js"></script>
    <script src="assets/js/neon-chat.js"></script>


    <!-- JavaScripts initializations and stuff -->
    <script src="assets/js/neon-custom.js"></script>


    <!-- Demo Settings -->
    <script src="assets/js/neon-demo.js"></script>
</body>
</html>

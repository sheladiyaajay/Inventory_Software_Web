<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function openModal() {
            $('#Add_Model').modal('show');
        }
        function closeModal() {
            $('#Add_Model').modal('hide');
        }
    </script>
    <script>
        $(document).ready(function () {
            $('.launch-modal').click(function () {
                $('#Add_Model').modal({
                    backdrop: 'static',
                    keyboard: false
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ClientIDMode="Static" ID="script1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:Button runat="server" ClientIDMode="Static" ID="btn_add" OnClick="btn_add_Click" Text="+ Add New" CssClass="btn btn-success" data-toggle="modal" data-target="#Add_Model" />
                    </div>

                    <div class="col-md-7"></div>
                    <%--<div class="col-md-2">
                        Product Name
                        <asp:Label runat="server" cli
                    </div>--%>
                    <div class="col-md-2">
                        Product Name<asp:TextBox runat="server" ClientIDMode="Static" ID="txt_search" Text=" " AutoPostBack="true" placeholder=" " OnTextChanged="txt_search_TextChanged" CssClass="form-control"  />
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:Button runat="server" ClientIDMode="Static" ID="btnreset" OnClick="btnreset_Click" Text="Reset" CssClass="btn btn-danger" />
                    </div>

                </div>
                <div class="col-md-12">
                    <hr />
                </div>
                <div class="col-md-12">
                    <asp:GridView runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" ClientIDMode="Static" ID="grid_display" CssClass="table table-bordered table-responsive">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%#Eval("Product_ID")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Product_Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="HSN SAC" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("HSN_SAC") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Qty") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit Price" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Unit_Price") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:ImageButton ID="BtnEdit" OnClick="BtnEdit_Click" CommandArgument='<%# Eval("Product_ID") %>' runat="server" Text="Edit" ImageUrl="~/images/edit.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="Add_Model">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="updatepanel2" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Product</h4>
                            <asp:HiddenField runat="server" ID="hdn_id" Value="0" />
                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label runat="server">Product Name</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtProduct_Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txtProduct_Name" ValidationGroup="Vg" ErrorMessage="Enter Product Name"></asp:RequiredFieldValidator>
                                </div> 
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">HSN / SAC</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtHAN_SAC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txtHAN_SAC" ValidationGroup="Vg" ErrorMessage="Enter HSN / SAC"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Unit Price</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUnit_Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txtUnit_Price" ValidationGroup="Vg" ErrorMessage="Enter Unit Price"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Qty</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtQty"></asp:TextBox>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="Vg" CssClass="btn btn-success" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function openModal() {
            $('#AddModal').modal('show');
        }
        function closeModal() {
            $('#AddModal').modal('hide');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" ID="scriptmanager"></asp:ScriptManager>
    <div class="row">
        <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatepanel123">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <label>Trn No</label>
                        <asp:TextBox runat="server" ID="txt_TrnNo" ReadOnly="true" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <label>Date</label>
                        <asp:TextBox runat="server" ID="txt_Date" ReadOnly="true" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <label>Till Date</label>
                        <asp:TextBox runat="server" ID="txt_TillDate" ClientIDMode="Static" CssClass="form-control datepicker" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_TillDate" ValidationGroup="Vg_header" ErrorMessage="Select Date"></asp:RequiredFieldValidator>
                    </div>


                    <div class="col-md-2">
                        <label>Invoice</label>
                        <asp:TextBox runat="server" ID="txt_Invoice" ReadOnly="true" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="clear">
                        <br />
                    </div>
                    <div class="col-md-2">
                        <label>Client</label>
                        <asp:DropDownList runat="server" ClientIDMode="Static" ID="txt_Client" OnSelectedIndexChanged="txt_Client_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_Client" ValidationGroup="Vg_header" ErrorMessage="Select Client"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-2">
                        <label>Mobile</label>
                        <asp:TextBox runat="server" ID="txt_Mobile" MaxLength="10" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_Mobile" ValidationGroup="Vg_header" ErrorMessage="Enter Mobile"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-4">
                        <label>Address</label>
                        <asp:TextBox runat="server" ID="txt_Address" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_Address" ValidationGroup="Vg_header" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clear">
                    <br />
                </div>


                <div class="col-md-12">
                    <asp:UpdatePanel runat="server" ID="updatepanel2">
                        <ContentTemplate>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Product :</label>
                                        <asp:DropDownList runat="server" ClientIDMode="Static" ID="dd_product" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="dd_product_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="dd_product" ValidationGroup="Vg" ErrorMessage="Select Product"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Description :</label><asp:TextBox runat="server" ID="txt_desc" CssClass="form-control"></asp:TextBox>

                                    </div>

                                    <div class="col-md-2">
                                        <label>HSN :</label><asp:TextBox runat="server" ID="txt_hsn" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_hsn" ValidationGroup="Vg" ErrorMessage="Enter HSN"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Qty :</label><asp:TextBox runat="server" ID="txt_qty" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_qty" ValidationGroup="Vg" ErrorMessage="Enter Qty"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-2">
                                        <label>Price :</label><asp:TextBox runat="server" ID="txt_price" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_price" ValidationGroup="Vg" ErrorMessage="Enter Price"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-6" style="display: none">
                                        <label>Unit Price :</label><asp:TextBox runat="server" ID="txt_unityprice" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="control-label col-md-1">
                                        <br />
                                        <asp:Button runat="server" ClientIDMode="Static" Width="80" CssClass="btn btn-success" ID="btn_add" ValidationGroup="Vg" OnClick="btn_add_Click" Text="Add" />
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="clear">
                    <br />
                </div>


                <div class="col-md-12">
                    <asp:GridView runat="server" ShowFooter="true" ID="GridData" CssClass="table table-striped jambo_table bulk_action" AutoGenerateColumns="false" OnRowDataBound="GridData_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Index" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_product" Text='<%# Eval("Product") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_desc" Text='<%# Eval("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="HSN" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_hsn" Text='<%# Eval("HSN") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_qty" Text='<%# Eval("Qty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbl_price" Text='<%# Eval("Price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit Price" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <FooterTemplate>
                                    <asp:Label ID="lbl_unit_price_total" runat="server" Text="Label"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_unit_price" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_remove" CssClass="btn btn-danger btn-sm" Text="Delete"  CommandArgument='<%# Container.DataItemIndex %>' OnClick="btn_remove_Click" />
                                    <%--<asp:Button runat="server" ClientIDMode="Static" ID="btn_Remove" Text="" CssClass="btn btn-danger btn-sm" CommandName="MyButtonClick" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btn_Remove_Click" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>

                    </asp:GridView>
                </div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <asp:Button runat="server" Visible="false" ClientIDMode="Static" ID="btn_submi" OnClick="btn_submi_Click" ValidationGroup="Vg_header" CssClass="btn btn-primary" Text="Submit" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>


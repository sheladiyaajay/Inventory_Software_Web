<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Client.aspx.cs" Inherits="Product" %>

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
                        <asp:Button runat="server" ClientIDMode="Static" ID="btn_add" Text="+ Add New" OnClick="btn_add_Click" CssClass="btn btn-success" data-toggle="modal" data-target="#Add_Model" />
                    </div>
                    <div class="col-md-7"></div>
                    <div class="col-md-2">
                        Mobile
                        <asp:TextBox  runat="server" ClientIDMode="Static" ID="txt_search" Text=" " AutoPostBack="true" placeholder="" OnTextChanged="txt_search_TextChanged" CssClass="form-control"  />
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
                                    <%#Eval("Client_ID")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comp_code" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Comp_code") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Client_Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Address") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:ImageButton ID="BtnEdit" OnClick="BtnEdit_Click" CommandArgument='<%# Eval("Client_ID") %>' runat="server" Text="Edit" ImageUrl="~/images/edit.png" />
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
                            <h4 class="modal-title">Client</h4>
                            <asp:HiddenField runat="server" ID="hdn_id" Value="0" />
                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label runat="server">Client Name</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_client_name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_client_name" ValidationGroup="Vg" ErrorMessage="Enter Client Name"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Mobile</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_mobile" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_mobile" ValidationGroup="Vg" ErrorMessage="Enter Mobile"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Address</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_address" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_address" ValidationGroup="Vg" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
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


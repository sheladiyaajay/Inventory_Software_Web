<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Company_Master.aspx.cs" Inherits="Company_Master" %>

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
                        <asp:TextBox runat="server" ClientIDMode="Static" ID="txt_search" Text=" " AutoPostBack="true" placeholder="" OnTextChanged="txt_search_TextChanged" CssClass="form-control" />
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
                                    <%#Eval("CompanyID")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Address") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("Mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:ImageButton ID="BtnEdit" OnClick="BtnEdit_Click" CommandArgument='<%# Eval("CompanyID") %>' runat="server" Text="Edit" ImageUrl="~/images/edit.png" />
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
                            <h4 class="modal-title">Company</h4>
                            <asp:HiddenField runat="server" ID="hdn_id" Value="0" />
                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label runat="server">Name</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_company_name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_name" ValidationGroup="Vg" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Address</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_computer_addess" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_computer_addess" ValidationGroup="Vg" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Mobile</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_company_mobile" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_mobile" ValidationGroup="Vg" ErrorMessage="Enter Mobile"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Bank</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="dd_company_bank"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="dd_company_bank" ValidationGroup="Vg" ErrorMessage="Select Bank"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Acc No</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_company_Acc_no"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_Acc_no" ValidationGroup="Vg" ErrorMessage="Enter Acc No"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">IFSC Code</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_company_ifsccode"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_ifsccode" ValidationGroup="Vg" ErrorMessage="Enter Ifsc Code"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>

                                <div class="col-md-2">
                                    <asp:Label runat="server">Email Id</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_company_bank_email_id"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_ifsccode" ValidationGroup="Vg" ErrorMessage="Enter Email Id"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear">
                                    <br />
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server">Is Active</asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="dd_Isactive">
                                        <asp:ListItem Text="" Value="">--Select--</asp:ListItem>
                                        <asp:ListItem Text="Active" Value="true"></asp:ListItem>
                                        <asp:ListItem Text="InActive" Value="false"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" CssClass="valiationmsg" ControlToValidate="txt_company_ifsccode" ValidationGroup="Vg" ErrorMessage="Select Active"></asp:RequiredFieldValidator>
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


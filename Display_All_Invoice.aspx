<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Display_All_Invoice.aspx.cs" Inherits="Display_All_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function setCookie(key, value, expiry) {
            var expires = new Date();
            expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
            document.cookie = key + '=' + value + ';path=/' + ';expires=' + expires.toUTCString();
        }
        //$(document).on('click', '#btn_show', function () {
        //    debugger;
        //    var currentrow = $(this).closest('tr');
        //    var trnno = currentrow.find('td:eq(2)').text();
        //    alert(trnno);
        //    setCookie("TrnNo", trnno);
        //    debugger;
        //    //window.location.reload = "~/DisplayReport.aspx";
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager runat="server" ClientIDMode="Static" ID="script1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ClientIDMode="Static" ID="updatepanel">
        <ContentTemplate>
            <div class="row">

                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<div class="col-md-12">--%>
                                <div class="col-md-2">
                                    Trn No
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="txt_search_trnno" CssClass="form-control"></asp:TextBox>
                                </div>


                                <div class="col-md-2">
                                    Invoice No
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="txt_search_invoice" CssClass="form-control"></asp:TextBox>
                                </div>


                                <div class="col-md-2">
                                    Client Name
                                    <asp:DropDownList runat="server" ClientIDMode="Static" ID="dd_search_Client" CssClass="form-control"></asp:DropDownList>
                                </div>

                                <div class="col-md-2">
                                    Mobile
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="txt_search_mobile" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-1">
                                    <br />
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_search" CssClass="btn btn-success" Text="Search" OnClick="btn_search_Click"></asp:Button>
                                </div>
                                <div class="col-md-1">
                                    <br />
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_reset" CssClass="btn btn-success" Text="Reset" OnClick="btn_reset_Click"></asp:Button>
                                </div>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear">
                <br />
            </div>

            <div class="row">
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
                                    <%#Eval("id")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TrnNo" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_trnno" Text='<%# Eval("S_TrnNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Date") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Invoice No" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Invoice") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Client Name" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("client_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <%# Eval("S_Mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_Edit" CommandArgument='<%# Eval("S_TrnNo") %>' CssClass="btn btn-success btn-sm" OnClick="btn_Edit_Click" Text="Edit" /></td>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="View" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_show" CommandArgument='<%# Eval("S_TrnNo") %>' CssClass="btn btn-success btn-sm" OnClick="btn_show_Click" Text="Show Invoice" /></td>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Print" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Button runat="server" ClientIDMode="Static" ID="btn_printview" CommandArgument='<%# Eval("S_TrnNo") %>' CssClass="btn btn-success btn-sm" OnClick="btn_printview_Click" Text="Print View" /></td>
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

</asp:Content>


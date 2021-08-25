<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div class="col-md-3">
                <div class="tile-stats tile-neon-red">
                    <a href="Client.aspx">
                        <div class="icon"><i class="entypo-chat"></i></div>
                        <div class="num" data-postfix="" data-duration="1400" data-delay="0">
                            <asp:Label ID="lbl_client" runat="server" Text="0"></asp:Label>
                        </div>
                        <h3>Client</h3>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="tile-stats tile-neon-red">
                    <a href="Product.aspx">
                        <div class="icon"><i class="entypo-chat"></i></div>
                        <div class="num" data-postfix="" data-duration="1400" data-delay="0">
                            <asp:Label ID="lbl_product" runat="server" Text="0"></asp:Label>
                        </div>
                        <h3>Product</h3>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="tile-stats tile-neon-red">
                    <a href="Display_All_Invoice.aspx">
                        <div class="icon"><i class="entypo-chat"></i></div>
                        <div class="num" data-postfix="" data-duration="1400" data-delay="0">
                            <asp:Label ID="lbl_invoice_count" runat="server" Text="0"></asp:Label>
                        </div>
                        <h3>Display Invoice</h3>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="tile-stats tile-neon-red">
                    <a href="Sales.aspx">
                        <div class="icon"><i class="entypo-chat"></i></div>
                        <div class="num" data-postfix="" data-duration="1400" data-delay="0">
                            <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
                        </div>
                        <h3>Sales</h3>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


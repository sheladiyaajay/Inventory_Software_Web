<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DisplayReport.aspx.cs" Inherits="DisplayReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <div class="invoice">

            <div class="row">
                <div class="col-sm-6 invoice-left">
                    <a href="#">
                        <%--<img src="assets/images/laborator@2x.png" width="185" alt="">--%>
                    </a>

                </div>

                <div class="col-sm-6 invoice-right">

                    <h3>INVOICE NO  :<asp:Label runat="server" ID="lbl_Invoice" CssClass=""></asp:Label></h3>
                    <h4>Trn No      :<asp:Label runat="server" ID="lbl_TrnNo" CssClass=""></asp:Label></h4>
                    <h4>Date        :<asp:Label runat="server" ID="lbl_Date" CssClass=""></asp:Label></h4>
                    <h4>Til Date    :<asp:Label runat="server" ID="lbl_TilDate" CssClass=""></asp:Label></h4>
                    <h4>Mobile      :<asp:Label runat="server" ID="lbl_MobileNo" CssClass=""></asp:Label></h4>

                    <%--<span>31 October 2013</span>--%>
                </div>

            </div>


            <hr class="margin">


            <div class="row">

                <div class="col-sm-3 invoice-left">

                    <h4>Client Name</h4>
                    <%--John Doe
					<br>
                    Mr Nilson Otto
					<br>
                    FoodMaster Ltd--%>
                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_client"></asp:Label>


                </div>
                <div class="col-sm-3 invoice-left">
                </div>

                <%--<div class="col-md-6 invoice-right">
                    <h4>Payment Details:</h4>
                    <strong>V.A.T Reg #:</strong> 542554(DEMO)78
					<br>
                    <strong>Account Name:</strong> FoodMaster Ltd
					<br>
                    <strong>SWIFT code:</strong> 45454DEMO545DEMO
                </div>--%>

            </div>

            <div class="margin"></div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="display: none">ID</th>
                        <th style="background-color: #2A3F54; color: white">SR No</th>
                        <th style="background-color: #2A3F54; color: white">Product</th>
                        <th style="background-color: #2A3F54; color: white">Description</th>
                        <th style="background-color: #2A3F54; color: white">HSN</th>
                        <th style="background-color: #2A3F54; color: white">Qty</th>
                        <th style="background-color: #2A3F54; color: white">Price</th>
                        <th style="background-color: #2A3F54; color: white">Unit Price</th>
                        <th style="display: none">Client Id</th>
                        <th style="display: none">Trn No</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_l" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="display: none"><%#Eval("id")%></td>
                                <td><%#Eval("S_SrNo")%></td>
                                <td><%#Eval("S_Product")%></td>
                                <td><%#Eval("S_Description")%></td>
                                <td><%#Eval("S_HSN")%></td>
                                <td><%#Eval("S_Qty") %></td>
                                <td><%#Eval("S_Price") %></td>
                                <td><%#Eval("S_UnitPrice") %></td>
                                <td style="display: none"><%#Eval("S_ClientId") %></td>
                                <td style="display: none"><%#Eval("S_TrnNo") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="margin"></div>

            <div class="row">

                <div class="col-sm-6">

                    <div class="invoice-left">
                        Address<br />
                        <strong>
                            <asp:Label runat="server" ClientIDMode="Static" ID="lbl_address"></asp:Label></strong>

                        <br />
                        <%--San Francisco, CA 94107
						<br>
                        P: (234) 145-1810
						<br>
                        Full Name
						<br>--%>
                        Mobile<br />
                        <strong>
                            <asp:Label runat="server" ClientIDMode="Static" ID="lbl_mobile"></asp:Label></strong>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="invoice-right">
                        <ul class="list-unstyled">
                            <li>Sub - Total amount: 
								<strong>
                                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_grand_total"></asp:Label></strong>
                            </li>
                            <%--<li>VAT: 
								<strong>12.9%</strong>
                            </li>
                            <li>Discount: 
								-----
                            </li>--%>
                            <li>Grand Total:
								<strong>
                                    <asp:Label runat="server" ClientIDMode="Static" ID="lbl_grand"></asp:Label></strong>
                            </li>
                        </ul>

                        <br>

                        <a href="javascript:window.print();" class="btn btn-primary btn-icon icon-left hidden-print">Print Invoice
							<i class="entypo-doc-text"></i>
                        </a>

                        &nbsp;
						
						<a href="mailbox-compose.html" class="btn btn-success btn-icon icon-left hidden-print">Send Invoice
							<i class="entypo-mail"></i>
                        </a>
                    </div>

                </div>

            </div>

        </div>
    </div>
    <div class="row">
    </div>
</asp:Content>


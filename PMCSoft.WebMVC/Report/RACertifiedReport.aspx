<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.RACertifiedReport" Codebehind="RACertifiedReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -100px;">
                <div class="card"  style="width: 1200px;">
                    <div class="card-body">
                        <h3 class="reallynow">
                            RA Chart</h3>
                        <div class="row"  style="width: 1090px;">
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria; width: 150px;">
                                    Project
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"  >
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnPrint" runat="server" Text="Print Preview" Visible="false" OnClick="btnPrint_Click" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="22">
                                    <asp:Panel ID="Panel1" runat="server" Width="1170px" ScrollBars="Horizontal" Visible="false">
                                        <div class="row"  style="width: 1200px;">
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="23">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill.No
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Period
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Submitted Date
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Certification Date
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Certification Amount
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Service Tax
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Service Tax on Foc
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Mobilization Advance received
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Secured Advance received
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Total
                                                                    </div>
                                                                    <div class="col-lg-4"  colspan="7" style="text-align: center; width: 80px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Deduction
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Receivable
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Receivable Amount
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Net Receivable
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        TDS @2%
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 100px">
                                                                        Retention Money Deductd
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        WCT
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Mobilization Advance Deducted
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Secured Advance Adjusted
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Other Deduction
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Total Deduction
                                                                    </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    <asp:Label ID="RaBillNo" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="Billperiod" runat="server" Width="70px" Text='<%#Bind("Billperiod") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="Billsubmitteddate" runat="server" Width="70px" Text='<%#Bind("Billsubmitteddate") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="BillCertificationDate" runat="server" Width="70px" Text='<%#Bind("BillCertificationDate") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="BillAmount" runat="server" Width="100px" Text='<%#Bind("BillAmount") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="ServiceTex" runat="server" Width="80px" Text='<%#Bind("ServiceTex") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="ServiceTexonFoc" runat="server" Width="80px" Text='<%#Bind("ServiceTexonFoc") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="MobilizationAdvancereceived" runat="server" Width="80px" Text='<%#Bind("MobilizationAdvancereceived") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="SecuredAdvancereceived" runat="server" Width="80px" Text='<%#Bind("SecuredAdvancereceived") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="Total" runat="server" Width="100px" Text='<%#Bind("Total") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="tds" runat="server" Width="80px" Text='<%#Bind("tds") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="RetentionMoneyDeductd" runat="server" Width="80px" Text='<%#Bind("RetentionMoneyDeductd") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="WCT" runat="server" Width="80px" Text='<%#Bind("WCT") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="MobilizationAdvanceDeducted" runat="server" Width="80px" Text='<%#Bind("MobilizationAdvanceDeducted") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="SecuredAdvanceAdjusted" runat="server" Width="80px" Text='<%#Bind("SecuredAdvanceAdjusted") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="OtherDeduction" runat="server" Width="80px" Text='<%#Bind("OtherDeduction") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="TotalDeduction" runat="server" Width="80px" Text='<%#Bind("TotalDeduction") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="Receivable" runat="server" Width="80px" Text='<%#Bind("Receivable") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="Gvcertified" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                                                        EmptyDataText="No Amount Receive"  >
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <%--   <%# Container.DataItemIndex + 1 %>--%>
                                                                                    <asp:HiddenField ID="TransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount Receivable">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="AmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Cheque No./RTGS">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("ChequeNoRTGS") %>'></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Cheque No./RTGS Date">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("ChequeNoRTGSDate") %>'></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                                    <asp:Label ID="NetReceivable" runat="server" Width="100px" Text='<%#Bind("NetReceivable") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                  
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    Total:
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblbillcertifiedamt" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblServiceTaxonFoc" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblmobilizationAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSecuredAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lbltotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lbltds" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblReturntionmoneyDeduced" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblwct" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMobilizationAdvanceDeducted" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSecuredAdvanceAdjust" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblotherduction" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblTotalduction" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblreceivable" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: left;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblamtreceived" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: left;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblNetReceivable" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                    <asp:Label ID="lblNetReceivable3" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

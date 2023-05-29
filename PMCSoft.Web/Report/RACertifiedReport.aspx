<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.RACertifiedReport" Codebehind="RACertifiedReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -100px;">
                <div id="content" style="width: 1200px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            RA Chart</h3>
                        <table style="width: 1090px;">
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria; width: 150px;">
                                    Project
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                    <asp:Button ID="btnPrint" runat="server" Text="Print Preview" Visible="false" OnClick="btnPrint_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="22">
                                    <asp:Panel ID="Panel1" runat="server" Width="1170px" ScrollBars="Horizontal" Visible="false">
                                        <table style="width: 1200px;">
                                            <tr>
                                                <td colspan="23">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill.No
                                                                    </td>
                                                                    <td rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Period
                                                                    </td>
                                                                    <td rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Submitted Date
                                                                    </td>
                                                                    <td rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Certification Date
                                                                    </td>
                                                                    <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Bill Certification Amount
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Service Tax
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Service Tax on Foc
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Mobilization Advance received
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Secured Advance received
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Total
                                                                    </td>
                                                                    <td colspan="7" style="text-align: center; width: 80px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Deduction
                                                                    </td>
                                                                    <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Receivable
                                                                    </td>
                                                                    <td rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Receivable Amount
                                                                    </td>
                                                                    <td rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Net Receivable
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        TDS @2%
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 100px">
                                                                        Retention Money Deductd
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        WCT
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Mobilization Advance Deducted
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Secured Advance Adjusted
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Other Deduction
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 80px">
                                                                        Total Deduction
                                                                    </td>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    <asp:Label ID="RaBillNo" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="Billperiod" runat="server" Width="70px" Text='<%#Bind("Billperiod") %>'></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="Billsubmitteddate" runat="server" Width="70px" Text='<%#Bind("Billsubmitteddate") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="BillCertificationDate" runat="server" Width="70px" Text='<%#Bind("BillCertificationDate") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="BillAmount" runat="server" Width="100px" Text='<%#Bind("BillAmount") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="ServiceTex" runat="server" Width="80px" Text='<%#Bind("ServiceTex") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="ServiceTexonFoc" runat="server" Width="80px" Text='<%#Bind("ServiceTexonFoc") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="MobilizationAdvancereceived" runat="server" Width="80px" Text='<%#Bind("MobilizationAdvancereceived") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="SecuredAdvancereceived" runat="server" Width="80px" Text='<%#Bind("SecuredAdvancereceived") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="Total" runat="server" Width="100px" Text='<%#Bind("Total") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="tds" runat="server" Width="80px" Text='<%#Bind("tds") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="RetentionMoneyDeductd" runat="server" Width="80px" Text='<%#Bind("RetentionMoneyDeductd") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="WCT" runat="server" Width="80px" Text='<%#Bind("WCT") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="MobilizationAdvanceDeducted" runat="server" Width="80px" Text='<%#Bind("MobilizationAdvanceDeducted") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="SecuredAdvanceAdjusted" runat="server" Width="80px" Text='<%#Bind("SecuredAdvanceAdjusted") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="OtherDeduction" runat="server" Width="80px" Text='<%#Bind("OtherDeduction") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="TotalDeduction" runat="server" Width="80px" Text='<%#Bind("TotalDeduction") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: right;">
                                                                    <asp:Label ID="Receivable" runat="server" Width="80px" Text='<%#Bind("Receivable") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:GridView ID="Gvcertified" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                                                        EmptyDataText="No Amount Receive" Width="300px">
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
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: left;">
                                                                    <asp:Label ID="NetReceivable" runat="server" Width="100px" Text='<%#Bind("NetReceivable") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                  
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    Total:
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblbillcertifiedamt" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblServiceTaxonFoc" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblmobilizationAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSecuredAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lbltotal" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lbltds" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblReturntionmoneyDeduced" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblwct" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMobilizationAdvanceDeducted" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSecuredAdvanceAdjust" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblotherduction" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblTotalduction" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblreceivable" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: left;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblamtreceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: left;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblNetReceivable" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                    <asp:Label ID="lblNetReceivable3" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

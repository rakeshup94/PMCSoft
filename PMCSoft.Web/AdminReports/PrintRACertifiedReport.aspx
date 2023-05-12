<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="PMCSoft.Web.AdminReports.PrintRACertifiedReport" Codebehind="PrintRACertifiedReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="content" style="width: 1500px;">
            <div id="rightnow">
                <%--<h3 style="margin-right:80">
                              AHLUWALIA CONTRACTS (INDIA) LTD<br />
                           Work Programme</h3>--%>
                <table style="width: 1400px;" border="0">
                    <tr>
                        <asp:ImageButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="100px" />
                        <td style="text-align: center; font-size: 28px; font-family: Cambria;">
                            Ahluwalia Contracts (India) Ltd.<br />
                            RA. Chart
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <table style="width: 1500px;">
                    <tr>
                        <td style="text-align: center; font-size: 15px; font-family: Cambria; width: 150px;">
                            Project
                        </td>
                        <td>
                            <asp:Label ID="LblProject" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 1500px;">
                                <tr>
                                    <td colspan="23">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                            <HeaderTemplate>
                                                <table style="width: 1500px; border: 1px solid black; border-collapse: collapse;">
                                                    <tr>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Bill.No
                                                        </td>
                                                        <td rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Period
                                                        </td>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Submitted Date
                                                        </td>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Certification Date
                                                        </td>
                                                        <td rowspan="2" style="width:130px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Bill Submitted Amount
                                                        </td>
                                                        <td rowspan="2" style="width: 130px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Bill Certification Amount
                                                        </td>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Service Tax
                                                        </td>
                                                        <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Service Tax on Foc
                                                        </td>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Mobilization Advance received
                                                        </td>
                                                        <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Secured Advance received
                                                        </td>
                                                        <td rowspan="2" style="width: 130px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Total
                                                        </td>
                                                        <td colspan="7" style="text-align: center; width: 100px; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Deduction
                                                        </td>
                                                        <td rowspan="2" style="width: 30px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Receivable
                                                        </td>
                                                        <td rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Receivable Amount
                                                        </td>
                                                        <td rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Net Receivable
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            TDS @2%
                                                        </td>
                                                        <td style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            Retention Money Deductd
                                                        </td>
                                                        <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            WCT
                                                        </td>
                                                        <td style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px;">
                                                            Mobilization Advance Deducted
                                                        </td>
                                                        <td style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 150px;">
                                                            Secured Advance Adjusted
                                                        </td>
                                                        <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 150px;">
                                                            Other Deduction
                                                        </td>
                                                        <td style="text-align: center; width: 100px; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold;">
                                                            Total Deduction
                                                        </td>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="border: 1px solid black; text-align: center;">
                                                        <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                        <asp:Label ID="RaBillNo" runat="server" Font-Size="15px" Text='<%#Bind("RaBillNo") %>'></asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Billperiod" runat="server" Font-Size="15px" Width="70px" Text='<%#Bind("Billperiod") %>'></asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="Billsubmitteddate" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("Billsubmitteddate") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="BillCertificationDate" Font-Size="15px" runat="server" Width="100px"
                                                            Text='<%#Bind("BillCertificationDate") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="BillAmtRABill" runat="server" Width="100px" Text='<%#Bind("BillAmtRABill") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="BillAmount" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("BillAmount") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="ServiceTex" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("ServiceTex") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="ServiceTexonFoc" runat="server" Font-Size="15px" Width="100px" Text='<%#Bind("ServiceTexonFoc") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="MobilizationAdvancereceived" Font-Size="15px" runat="server" Width="100px"
                                                            Text='<%#Bind("MobilizationAdvancereceived") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="SecuredAdvancereceived" Font-Size="15px" runat="server" Width="100px"
                                                            Text='<%#Bind("SecuredAdvancereceived") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Total" runat="server" Font-Size="15px" Width="100px" Text='<%#Bind("Total") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="tds" runat="server" Font-Size="15px" Width="100px" Text='<%#Bind("tds") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="RetentionMoneyDeductd" Font-Size="15px" runat="server" Width="100px"
                                                            Text='<%#Bind("RetentionMoneyDeductd") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="WCT" runat="server" Width="100px" Font-Size="15px" Text='<%#Bind("WCT") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="MobilizationAdvanceDeducted" Font-Size="15px" runat="server" Width="30px"
                                                            Text='<%#Bind("MobilizationAdvanceDeducted") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="SecuredAdvanceAdjusted" Font-Size="15px" runat="server" Width="30px"
                                                            Text='<%#Bind("SecuredAdvanceAdjusted") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="OtherDeduction" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("OtherDeduction") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="TotalDeduction" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("TotalDeduction") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Receivable" Font-Size="15px" runat="server" Width="100px" Text='<%#Bind("Receivable") %>'>
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:GridView ID="Gvcertified" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                                            EmptyDataText="No Amount Receive" Width="300">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No" Visible="false">
                                                                    <ItemTemplate>
                                                                        <%--   <%# Container.DataItemIndex + 1 %>--%>
                                                                        <asp:HiddenField ID="TransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount Receivable">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="AmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="150px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cheque No./RTGS">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("ChequeNoRTGS") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="150px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cheque No./RTGS Date">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("ChequeNoRTGSDate") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="150px" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                    <td style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="NetReceivable" runat="server" Width="120px" Text='<%#Bind("NetReceivable") %>'>
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
                                                        <asp:Label ID="LblBillSubmittedamt" runat="server" Text=""></asp:Label>
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
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

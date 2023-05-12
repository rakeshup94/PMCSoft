<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCReports_PrintMonthyWorkDoneReport" Codebehind="PrintMonthyWorkDoneReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
   
                      <table style="width: 930px;" border="0">
                    <tr>
                     <asp:ImageButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="50px" />
                        <td style="text-align: center; font-size: 18px; font-family: Cambria;">
                            Ahluwalia Contracts (India) Ltd.<br />
                                            Project 
                            <asp:Label ID="LblProject" runat="server" Text="Label"></asp:Label>
                                       Work Done Status The Month 
                            <asp:Label ID="Lblmonth" runat="server" Text="Label"></asp:Label>	
                            Year 
                            <asp:Label ID="LblYear" runat="server" Text="Label"></asp:Label>											

                        </td>
                    </tr>
                </table>
                      
                                    <table style="width: 1220px;">
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table style="border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </td>
                                                                <td rowspan="4" style="width: 220px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </td>
                                                                <td rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </td>
                                                                <td rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </td>
                                                                <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </td>
                                                                <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </td>
                                                                <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Variation (Rs.)
                                                                </td>
                                                                <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                    Balance
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    E
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    F = B - D
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    G = C - E
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    H = (A - D - E)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Bind("WDMParticularId") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblActual" runat="server" Text='<%#Bind("WDMParticularName") %>' Font-Bold="true"
                                                                    Height="15"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label2" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label3" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label4" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label5" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label6" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label7" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label8" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label9" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label10" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Repeater ID="RptSub" runat="server" OnItemDataBound="RptSub_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; border: 1px solid black;">
                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: left; border: 1px solid black;">
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text='<%#Bind("preUnit") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text='<%#Bind("preRate") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text='<%#Bind("preAwardedValue") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text='<%#Bind("variationAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text='<%#Bind("currentMonth") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <%--<tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCVarianceTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblNPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                        </tr>--%>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                               
                   
    </form>
</body>
</html>

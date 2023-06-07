<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.PrintMonthyWorkDoneReport" Codebehind="PrintMonthyWorkDoneReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
   
                      <div class="row"  style="width: 930px;" border="0">
                    <div class="row" >
                     <asp:ImageButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="50px" />
                        <div class="col-lg-4"  style="text-align: center; font-size: 18px; font-family: Cambria;">
                        
                                            Project 
                            <asp:Label ID="LblProject" runat="server" Text="Label"></asp:Label>
                                       Work Done Status The Month 
                            <asp:Label ID="Lblmonth" runat="server" Text="Label"></asp:Label>	
                            Year 
                            <asp:Label ID="LblYear" runat="server" Text="Label"></asp:Label>											

                        </div>
                    </div>
                  </div>
                      
                                    <div class="row"  style="width: 1220px;">
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 220px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Variation (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                    Balance
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    E
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    F = B - D
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    G = C - E
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    H = (A - D - E)
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Bind("WDMParticularId") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblActual" runat="server" Text='<%#Bind("WDMParticularName") %>' Font-Bold="true"
                                                                    Height="15"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label2" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label3" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label4" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label5" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label6" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label7" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label8" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label9" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label10" runat="server" Width="60px" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" >
                                                            <div class="col-lg-4" >
                                                                <asp:Repeater ID="RptSub" runat="server" OnItemDataBound="RptSub_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4" >
                                                                                <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="row" >
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text='<%#Bind("preUnit") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text='<%#Bind("preRate") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text='<%#Bind("preAwardedValue") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text='<%#Bind("variationAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text='<%#Bind("currentMonth") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <%--<tr>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblCVarianceTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblNPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                        </div>--%>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                      </div>
                               
                   
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="PMCSoft.Web.Report.PrintRACertifiedReport" Codebehind="PrintRACertifiedReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
</head>
<body>
    <form id="form1" runat="server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
        <div class="card"  style="width: 1500px;">
            <div class="card-body">
                <%--<h3 style="margin-right:80">
                              AHLUWALIA CONTRACTS (INDIA) LTD<br />
                           Work Programme</div>--%>
                <div class="row"  style="width: 1400px;" border="0">
                    <div class="row" >
                          <asp:LinkButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="100px" />
                      
                    </div>
                  </div>
                <br />
                <br />
                <br />
                <div class="row"  style="width: 1500px;">
                    <div class="row" >
                        <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria; width: 150px;">
                            Project
                        </div>
                        <div class="col-lg-4" >
                            <asp:Label ID="LblProject" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-4"    >
                            <div class="row"  style="width: 1500px;">
                                <div class="row" >
                                    <div class="col-lg-4"  colspan="23">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                            <HeaderTemplate>
                                                <div class="row"  style="width: 1500px; border: 1px solid black; border-collapse: collapse;">
                                                    <div class="row" >
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Bill.No
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 70px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Period
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Submitted Date
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;" visible="false">
                                                            Bill Certification Date
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 130px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Bill Certification Amount
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Service Tax
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Service Tax on Foc
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Mobilization Advance received
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Secured Advance received
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 130px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Total
                                                        </div>
                                                        <div class="col-lg-4"    style="text-align: center; width: 100px; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Deduction
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 30px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Receivable
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Receivable Amount
                                                        </div>
                                                        <div class="col-lg-4"  rowspan="2" style="width: 120px; text-align: center; border: 1px solid black;
                                                            font-weight: bold; background-color: #D8D8D8;">
                                                            Net Receivable
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            TDS @2%
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            Retention Money Deductd
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px">
                                                            WCT
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 100px;">
                                                            Mobilization Advance Deducted
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: left; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 150px;">
                                                            Secured Advance Adjusted
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold; width: 150px;">
                                                            Other Deduction
                                                        </div>
                                                        <div class="col-lg-4"  style="text-align: center;width: 100px; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold;">
                                                            Total Deduction
                                                        </div>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="row" >
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                        <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                        <asp:Label ID="RaBillNo" runat="server"   Text='<%#Bind("RaBillNo") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Billperiod" runat="server"   Text='<%#Bind("Billperiod") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="Billsubmitteddate"   runat="server"   Text='<%#Bind("Billsubmitteddate") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                        <asp:Label ID="BillCertificationDate"   runat="server"  
                                                            Text='<%#Bind("BillCertificationDate") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="BillAmount"   runat="server"   Text='<%#Bind("BillAmount") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align:  right;">
                                                        <asp:Label ID="ServiceTex"   runat="server"   Text='<%#Bind("ServiceTex") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="ServiceTexonFoc" runat="server"     Text='<%#Bind("ServiceTexonFoc") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="MobilizationAdvancereceived"   runat="server"  
                                                            Text='<%#Bind("MobilizationAdvancereceived") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="SecuredAdvancereceived"   runat="server"  
                                                            Text='<%#Bind("SecuredAdvancereceived") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Total" runat="server"     Text='<%#Bind("Total") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="tds" runat="server"     Text='<%#Bind("tds") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="RetentionMoneyDeductd"   runat="server"  
                                                            Text='<%#Bind("RetentionMoneyDeductd") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="WCT" runat="server"     Text='<%#Bind("WCT") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align:  center;">
                                                        <asp:Label ID="MobilizationAdvanceDeducted"   runat="server" Width="30px"
                                                            Text='<%#Bind("MobilizationAdvanceDeducted") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                        <asp:Label ID="SecuredAdvanceAdjusted"   runat="server" Width="30px"
                                                            Text='<%#Bind("SecuredAdvanceAdjusted") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="OtherDeduction"   runat="server"   Text='<%#Bind("OtherDeduction") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="TotalDeduction"   runat="server"   Text='<%#Bind("TotalDeduction") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="Receivable"   runat="server"   Text='<%#Bind("Receivable") %>'>
                                                        </asp:Label>
                                                    </div>
                                                    <div class="col-lg-4" >
                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="Gvcertified" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                                            EmptyDataText="No Amount Receive" Width="300">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No" Visible="false">
                                                                    <ItemTemplate>
                                                                        <%--   <%# Container.DataItemIndex + 1 %>--%>
                                                                        <asp:HiddenField ID="TransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center"   />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount Receivable">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="AmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle   />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cheque No./RTGS">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("ChequeNoRTGS") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle   />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cheque No./RTGS Date">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("ChequeNoRTGSDate") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle   />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="col-lg-4"  style="border: 1px solid black; text-align: right;">
                                                        <asp:Label ID="NetReceivable" runat="server"   Text='<%#Bind("NetReceivable") %>'>
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
                        </div>
                    </div>
                  </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

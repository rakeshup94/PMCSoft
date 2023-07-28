<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Inherits="PMCSoft.Web.AdminReports.PrintRACertifiedReport"
    CodeBehind="PrintRACertifiedReport.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">RA Certified Report</div>
        </div>
        <ol class="breadcrumb page-breadcrumb">
        </ol>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Project :                    
                                <asp:Label ID="LblProject" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">

                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th rowspan="2">Bill.No
                                                </th>
                                                <th rowspan="2">Bill Period
                                                </th>
                                                <th rowspan="2">Bill Submitted Date
                                                </th>
                                                <th rowspan="2">Bill Certification Date
                                                </th>
                                                <th rowspan="2">Bill Submitted Amount
                                                </th>
                                                <th rowspan="2">Bill Certification Amount
                                                </th>
                                                <th rowspan="2">Service Tax
                                                </th>
                                                <th rowspan="2">Service Tax on Foc
                                                </th>
                                                <th rowspan="2">Mobilization Advance received
                                                </th>
                                                <th rowspan="2">Secured Advance received
                                                </th>
                                                <th rowspan="2">Total
                                                </th>
                                                <th>Deduction
                                                </th>
                                                <th rowspan="2">Receivable
                                                </th>
                                                <th rowspan="2">Receivable Amount
                                                </th>
                                                <th rowspan="2">Net Receivable
                                                </th>
                                            </tr>
                                           <tr>
                                                <th>TDS @2%
                                                </th>
                                                <th>Retention Money Deductd
                                                </th>
                                                <th>WCT
                                                </th>
                                                <th>Mobilization Advance Deducted
                                                </th>
                                                <th>Secured Advance Adjusted
                                                </th>
                                                <th>Other Deduction
                                                </th>
                                                <th>Total Deduction
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                <asp:Label ID="RaBillNo" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Billperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Billsubmitteddate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="BillCertificationDate" runat="server"
                                                    Text='<%#Bind("BillCertificationDate") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="BillAmtRABill" runat="server" Text='<%#Bind("BillAmtRABill") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="BillAmount" runat="server" Text='<%#Bind("BillAmount") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="ServiceTex" runat="server" Text='<%#Bind("ServiceTex") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="ServiceTexonFoc" runat="server" Text='<%#Bind("ServiceTexonFoc") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="MobilizationAdvancereceived" runat="server"
                                                    Text='<%#Bind("MobilizationAdvancereceived") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="SecuredAdvancereceived" runat="server"
                                                    Text='<%#Bind("SecuredAdvancereceived") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Total" runat="server" Text='<%#Bind("Total") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="tds" runat="server" Text='<%#Bind("tds") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="RetentionMoneyDeductd" runat="server"
                                                    Text='<%#Bind("RetentionMoneyDeductd") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="WCT" runat="server" Text='<%#Bind("WCT") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="MobilizationAdvanceDeducted" runat="server"
                                                    Text='<%#Bind("MobilizationAdvanceDeducted") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="SecuredAdvanceAdjusted" runat="server"
                                                    Text='<%#Bind("SecuredAdvanceAdjusted") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="OtherDeduction" runat="server" Text='<%#Bind("OtherDeduction") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="TotalDeduction" runat="server" Text='<%#Bind("TotalDeduction") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Receivable" runat="server" Text='<%#Bind("Receivable") %>'>
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="Gvcertified" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                                    EmptyDataText="No Amount Receive">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No" Visible="false">
                                                            <ItemTemplate>
                                                                <%--   <%# Container.DataItemIndex + 1 %>--%>
                                                                <asp:HiddenField ID="TransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount Receivable">
                                                            <ItemTemplate>
                                                                <asp:Label ID="AmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque No./RTGS">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("ChequeNoRTGS") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque No./RTGS Date">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("ChequeNoRTGSDate") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td>
                                                <asp:Label ID="NetReceivable" runat="server" Text='<%#Bind("NetReceivable") %>'>
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                                        <tfoot>
                                                           <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>Total:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LblBillSubmittedamt" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblbillcertifiedamt" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblServiceTaxonFoc" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblmobilizationAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSecuredAdvanceReceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lbltotal" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lbltds" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblReturntionmoneyDeduced" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblwct" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMobilizationAdvanceDeducted" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSecuredAdvanceAdjust" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblotherduction" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblTotalduction" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblreceivable" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblamtreceived" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNetReceivable" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNetReceivable3" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>






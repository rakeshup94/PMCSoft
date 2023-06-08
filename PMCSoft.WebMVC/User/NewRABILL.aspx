<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.NewRABILL" Codebehind="NewRABILL.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Add RA BILL</h3>
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 150px;">
                                    Project
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    Address
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Label ID="Lbladdress" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:Label>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 150px;">
                                    Bill No
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtbillNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                                <div class="col-lg-4" >
                                    Bill Period
                                </div>
                                <div class="col-lg-4" >
                                    <%-- <asp:TextBox CssClass="form-control" ID="txtbillPeriod" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>--%>
                                    <asp:TextBox CssClass="form-control" ID="txtbillPeriod" runat="server" Width="88px" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbillPeriod"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                    To
                                    <asp:TextBox CssClass="form-control" ID="TxtBillperiodto" runat="server" Width="88px" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtBillperiodto"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4" >
                                    Bill Submitted Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="Txtbillsubmitteddate" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtbillsubmitteddate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Bill Amount
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtBillAmt" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TxtBillAmt"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Service Tax
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtServiceTex" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtServiceTex"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Service Tax on Foc
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtServiceTexonFoc" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="TxtServiceTexonFoc"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4" >
                                    Mobilization Advance received
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtMobilizationAdvancereceived" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtMobilizationAdvancereceived"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Secured Advance received
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtSecuredAdvancereceived" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)" OnTextChanged="txtSecuredAdvancereceived_TextChanged"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtSecuredAdvancereceived"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4" >
                                    Total
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtTotal" runat="server"   onkeyup="valid(this)" Enabled="true"
                                        AutoPostBack="true" onblur="valid(this)" OnTextChanged="txtTotal_TextChanged"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtTotal"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                          </div>
                        <div class="row" >
                            <div class="row" >
                                <div class="col-lg-4"  colspan="4">
                                    <h3>
                                        Deduction</h3>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    TDS @2%
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtTDS2" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtTDS2"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Retention Money
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtRetentionMoneyDeductd5" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtRetentionMoneyDeductd5"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4" >
                                    WCT 
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtwct4" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtwct4"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4"  style="width: 150px;">
                                    Mobilization Advance
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtMobilizationAdvanceDeducted" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtMobilizationAdvanceDeducted"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender >
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4"  style="width: 150px;">
                                    Secured Advance Adjusted
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtSecuredAdvanceAdjusted" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtSecuredAdvanceAdjusted"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender >
                                </div>
                                <div class="col-lg-4" >
                                    Other Deduction
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtOtherDeduction" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtOtherDeduction"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender >
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Other Deduction 1
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction1" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="TxtOtherDeduction1"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender > 
                                </div>
                                <div class="col-lg-4" >
                                    Other Deduction 2
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction2" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="TxtOtherDeduction2"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Other Deduction 3
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction3" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" TargetControlID="TxtOtherDeduction3"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Other Deduction 4
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction4" runat="server"   onkeyup="valid(this)"
                                        Enabled="true" AutoPostBack="true" onblur="valid(this)" OnTextChanged="TxtOtherDeduction4_TextChanged"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" TargetControlID="TxtOtherDeduction4"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Total Deduction
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtTotalDeduction" runat="server"   onkeyup="valid(this)"
                                        AutoPostBack="true" Enabled="true" onblur="valid(this)" OnTextChanged="txtTotalDeduction_TextChanged"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" TargetControlID="txtTotalDeduction"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Remarks
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtremarks" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Net Receivable&nbsp;
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxttotalReceivable" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" TargetControlID="TxttotalReceivable"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row"   >
                                <div class="col-lg-4"   >
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" class="button-bg" Text="Submit" OnClick="btnSubmit_Click"
                                         />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnCalculate" runat="server" class="button-bg" Text="Calculate" OnClick="BtnCalculate_Click"
                                         />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                         />
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

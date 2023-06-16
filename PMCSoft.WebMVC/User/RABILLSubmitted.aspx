<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.RABILLDetail"
    CodeBehind="RABILLSubmitted.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Submitted Bill</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GvRAbillSub" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                    OnRowCommand="GvRAbillSub_RowCommand" OnRowDataBound="GvRAbillSub_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkprojectname" runat="server" Text='<%#Bind("ProjectName") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill No">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Lnkrabillno" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Period">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkRabillperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="450px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkRabilldate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Amount">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkRabillamount" runat="server" Text='<%#Bind("NetReceivable") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Certification">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkRabillupdate" runat="server" CommandName="RABILLsub" Text='<%#Bind("SubmittedStatus") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkRabillview" runat="server" CommandName="RABILLView" Text="View"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                    PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                            </div>
                        </div>
                    </div>











                    <asp:Panel ID="Panel1" runat="server">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">RA BILL Detail</h4>


                                </div>

                                <div class="modal-body">

                                    <div class="row">

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Project
                        
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True">
                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Address
                                
                                        <asp:Label ID="Lbladdress" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill No
                                 
                                            <asp:TextBox CssClass="form-control" ID="txtbillNo" runat="server" onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Period
                                  
                                                <asp:TextBox CssClass="form-control" ID="txtbillPeriod" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender22" runat="server" TargetControlID="txtbillPeriod"
                                                    CssClass="cal_Theme1">
                                                </cc1:CalendarExtender>
                                                To
                                                                <asp:TextBox CssClass="form-control" ID="TxtBillperiodto" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtBillperiodto"
                                                    CssClass="cal_Theme1">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Submitted Date
                                            
                                                    <asp:TextBox CssClass="form-control" ID="Txtbillsubmitteddate" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtbillsubmitteddate"
                                                    CssClass="cal_Theme1">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Amount
                                              
                                                        <asp:TextBox CssClass="form-control" ID="TxtBillAmt" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TxtBillAmt"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Certification Date
                                                   
                                                            <asp:TextBox CssClass="form-control" ID="Txtbillcertificationdate" runat="server"
                                                                onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txtbillcertificationdate"
                                                    CssClass="cal_Theme1">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Service Tax
                                                       
                                                                <asp:TextBox CssClass="form-control" ID="txtServiceTex" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" TargetControlID="txtServiceTex"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Service Tax on Foc
                                                             
                                                                    <asp:TextBox CssClass="form-control" ID="TxtServiceTexonFoc" runat="server" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server" TargetControlID="TxtServiceTexonFoc"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Mobilization Advance received
                                                                 
                                                                        <asp:TextBox CssClass="form-control" ID="txtMobilizationAdvancereceived" runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtMobilizationAdvancereceived"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Secured Advance received
                                                                     
                                                                            <asp:TextBox CssClass="form-control" ID="txtSecuredAdvancereceived" runat="server"
                                                                                onkeyup="valid(this)"
                                                                                Enabled="true" AutoPostBack="true" onblur="valid(this)" OnTextChanged="txtSecuredAdvancereceived_TextChanged"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtSecuredAdvancereceived"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Total
                                                                           
                                                                                <asp:TextBox CssClass="form-control" ID="txtTotal" runat="server" onkeyup="valid(this)"
                                                                                    Enabled="true"
                                                                                    AutoPostBack="true" onblur="valid(this)" OnTextChanged="txtTotal_TextChanged"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtTotal"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                    </div>
                                    <h3>Deduction</h3>



                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                TDS @2%
                                                                              
                                                                                    <asp:TextBox CssClass="form-control" ID="txtTDS2" runat="server" onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtTDS2"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Retention Money
                                                                                   
                                                                                        <asp:TextBox CssClass="form-control" ID="txtRetentionMoneyDeductd5" runat="server"
                                                                                            onkeyup="valid(this)"
                                                                                            onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtRetentionMoneyDeductd5"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                WCT
                                                                                    
                                                                                            <asp:TextBox CssClass="form-control" ID="txtwct4" runat="server" onkeyup="valid(this)"
                                                                                                onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtwct4"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Mobilization Advance
                                                                                          
                                                                                                <asp:TextBox CssClass="form-control" ID="txtMobilizationAdvanceDeducted" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtMobilizationAdvanceDeducted"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Secured Advance Adjusted
                                                                                             
                                                                                                    <asp:TextBox CssClass="form-control" ID="txtSecuredAdvanceAdjusted" runat="server"
                                                                                                        onkeyup="valid(this)"
                                                                                                        onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtSecuredAdvanceAdjusted"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction
                                                                                                 
                                                                                                        <asp:TextBox CssClass="form-control" ID="txtOtherDeduction" runat="server" onkeyup="valid(this)"
                                                                                                            Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtOtherDeduction"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 1
                                                                                                      
                                                                                                            <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction1" runat="server" onkeyup="valid(this)"
                                                                                                                Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="TxtOtherDeduction1"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 2
                                                                                                    
                                                                                                                <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction2" runat="server" onkeyup="valid(this)"
                                                                                                                    Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="TxtOtherDeduction2"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 3
                                                                                                           
                                                                                                                    <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction3" runat="server" onkeyup="valid(this)"
                                                                                                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" TargetControlID="TxtOtherDeduction3"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 4
                                                                                                             
                                                                                                                        <asp:TextBox CssClass="form-control" ID="TxtOtherDeduction4" runat="server" onkeyup="valid(this)"
                                                                                                                            Enabled="true" AutoPostBack="true" onblur="valid(this)" OnTextChanged="TxtOtherDeduction4_TextChanged"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" TargetControlID="TxtOtherDeduction4"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Total Deduction
                                                                                                                   
                                                                                                                            <asp:TextBox CssClass="form-control" ID="txtTotalDeduction" runat="server" onkeyup="valid(this)"
                                                                                                                                AutoPostBack="true" Enabled="true" onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" TargetControlID="txtTotalDeduction"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Remarks
                                                                                                                        
                                                                                                                                <asp:TextBox CssClass="form-control" ID="txtremarks" runat="server" onkeyup="valid(this)"
                                                                                                                                    onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Net Receivable 
                                                                                                                          
                                                                                                                                    <asp:TextBox CssClass="form-control" ID="TxttotalReceivable" runat="server" onkeyup="valid(this)"
                                                                                                                                        onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" TargetControlID="TxttotalReceivable"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                                OnClick="btnSubmit_Click" />
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="BtnCalculate" runat="server"
                                                Text="Calculate" OnClick="BtnCalculate_Click" />
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnReset" runat="server" Text="Cancel"
                                                OnClick="btnReset_Click" />
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>





                    </asp:Panel>




                    <asp:Panel ID="Panel2" runat="server">

                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">View RA BILL</h4>


                                </div>

                                <div class="modal-body">


                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Project
                                             
                                                        <asp:Label ID="lblproject" runat="server">
                                                        </asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Address
                            
                                    <asp:Label ID="Lbladdressview" runat="server"
                                        onkeyup="valid(this)" onblur="valid(this)"
                                        ReadOnly="true"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill No
                              
                                        <asp:Label ID="lblbillno" runat="server"
                                            onkeyup="valid(this)" onblur="valid(this)"
                                            ReadOnly="true"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Period
                                  
                                            <asp:Label ID="lblbillperiod" runat="server"
                                                Width="60px" onkeyup="valid(this)" onblur="valid(this)"></asp:Label>
                                                To
                                                                    <asp:Label ID="lblbillperiodTo"
                                                                        runat="server" Width="60px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Submitted Date
                                       
                                                <asp:Label ID="lblbillsubmitteddate" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bill Amount
                                               
                                                    <asp:Label ID="lblbillamt" runat="server"
                                                        onkeyup="valid(this)" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Service Tax
                                                   
                                                        <asp:Label ID="lblservicetex" runat="server"
                                                            onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Service Tax on Foc
                           
                                    <asp:Label ID="lblservicetexonfoc" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Mobilization Advance received
                                  
                                        <asp:Label ID="lblmobilizationAdvancereceived"
                                            runat="server" onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Secured Advance received
                                      
                                            <asp:Label ID="lblSecuredAdvancereceived"
                                                runat="server" onkeyup="valid(this)"
                                                Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Total
                                     
                                                <asp:Label ID="lbltotal" runat="server"
                                                    onkeyup="valid(this)" Enabled="true"
                                                    AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                    <h3>Deduction
                                    </h3>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                TDS @2%
                  
                            <asp:Label ID="lbltds" runat="server" onkeyup="valid(this)"
                                onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Retention Money
                        
                                <asp:Label ID="lblRetentionMoneyDeductd" runat="server"
                                    onkeyup="valid(this)"
                                    onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                WCT
                              
                                    <asp:Label ID="lblwct" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Mobilization Advance
                                 
                                        <asp:Label ID="lblMobilizationAdvanceDeducted"
                                            runat="server" onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Secured Advance Adjusted
                                      
                                            <asp:Label ID="lblSecuredAdvanceAdjusted" runat="server"
                                                onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction
                       
                                    <asp:Label ID="lblotherdeduction" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 1
                               
                                        <asp:Label ID="lblOtherDeduction1" runat="server"
                                            onkeyup="valid(this)"
                                            Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 2
                                      
                                            <asp:Label ID="LblOtherDeduction2" runat="server"
                                                onkeyup="valid(this)"
                                                Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 3
                                       
                                                <asp:Label ID="lblOtherDeduction3" runat="server"
                                                    onkeyup="valid(this)"
                                                    Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Other Deduction 4
                                            
                                                    <asp:Label ID="lblOtherDeduction4" runat="server"
                                                        onkeyup="valid(this)"
                                                        Enabled="true" AutoPostBack="true" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Total Deduction
                                                  
                                                        <asp:Label ID="lblTotalDeduction" runat="server"
                                                            onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Net Receivable
                                                     
                                                            <asp:Label ID="Lblnetreceivable" runat="server"
                                                                onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Remarks
                                                           
                                                                <asp:Label ID="lblremarks" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                    </div>



                                </div>
                                <div class="modal-footer">
                                    <asp:Button CssClass="btn btn-primary btn-square"
                                        ID="BtnLablcan" runat="server"
                                        Text="Cancel" />
                                </div>

                            </div>
                        </div>







                    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.RABILLCertified"
    CodeBehind="RABILLCertified.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="Button4" />
        </Triggers>
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
                                    OnRowCommand="GvRAbillSub_RowCommand" EmptyDataText="No Record Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkProject" runat="server" Text='<%#Bind("ProjectName") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill NO">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Lnkbillno" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Period">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Submitted Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Certified Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Net Certified Bill Amount">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertifiedAmt" runat="server" Text='<%#Bind("TotalReceived") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <%--   <asp:TemplateField HeaderText="Balance Receivable Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAmtReceive" runat="server"  Text='<%#Bind("Receivable") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                              
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                        --%>
                                        <asp:TemplateField HeaderText="Payment">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Lnkview" runat="server" CommandName="RABILLsub" Text="Update"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkCertifiedview" runat="server" CommandName="RaBillView" Text="View"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle />
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


                </div>
            </div>










            <asp:Panel ID="Panel1" runat="server">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">


                        <div class="modal-body">

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Project
                     
                        <asp:Label ID="LblProject" runat="server" AutoPostBack="True">
                        </asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Address
                    
                            <asp:Label ID="Lbladdressview" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                ReadOnly="true"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Bill No
                           
                                <asp:Label ID="txtbillNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Bill Submitted Date
                               
                                    <asp:Label ID="Txtbillsubmitteddate" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Bill Certification Date
                              
                                        <asp:Label ID="Txtbillcertificationdate" runat="server" onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Net Amount
                                        
                                            <asp:Label ID="txtNetReceivable" runat="server" onkeyup="valid(this)"
                                                BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Net Balance Amount
                                    
                                                <asp:Label ID="LblNetBalanceamt" runat="server" onkeyup="valid(this)"
                                                    BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Receviable Amount
                                               
                                                    <asp:TextBox CssClass="form-control" ID="txtAmountReceived" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" OnTextChanged="txtAmountReceived_TextChanged" AutoPostBack="true"
                                                        Enabled="true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmountReceived"
                                            FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Balance Amount
                                                
                                                        <asp:TextBox CssClass="form-control" ID="txtReceivable" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtReceivable"
                                            FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Bank Name
                                                 
                                                            <asp:TextBox CssClass="form-control" ID="TxtBankname" runat="server" onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Cheque No./RTGS
                                                          
                                                                <asp:TextBox CssClass="form-control" ID="txtChequeNoRTGS" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Cheque No./RTGS Date
                                                                    
                                                                        <asp:TextBox CssClass="form-control" ID="txtChequeNoRTGSDate" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtChequeNoRTGSDate"
                                            CssClass="cal_Theme1">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Remarks
                                                                 
                                                                            <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" onkeyup="valid(this)"
                                                                                onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Save"
                                        OnClick="btnSubmit_Click" />

                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">

                            <asp:Button CssClass="btn btn-default btn-square" ID="btnReset" runat="server" Text="Cancel"
                                OnClick="btnReset_Click" />
                        </div>

                    </div>
                </div>












            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server">


                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">


                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GvCertifiedView" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkProject" runat="server" Text='<%#Bind("ProjectName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill NO">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="Lnkbillno" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Period">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Submitted Date">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Certified Date">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Net Bill Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkNetReceivableView" runat="server" Text='<%#Bind("NetReceivable") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance Receivable Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBalanceAmt" runat="server" Text='<%#Bind("BalanceAmt") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount Receive">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button4" runat="server" Text="Cancel"
                                        OnClick="Button4_Click" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>





            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

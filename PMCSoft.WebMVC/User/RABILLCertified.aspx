<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.RABILLCertified" Codebehind="RABILLCertified.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <div class="row" iggers>
            <asp:PostBackTrigger ControlID="Button4" />
        </Triggers>
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Submitted Bill</h3>
                    </div>
                    <div class="row"   >
                        <div class="row"  style="vertical-align: top;">
                            <div class="col-lg-4"  style="vertical-align: top; width: 600px;">
                                <asp:GridView CssClass="table table-striped"  ID="GvRAbillSub" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                    OnRowCommand="GvRAbillSub_RowCommand" EmptyDataText="No Record Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkProject" runat="server" Text='<%#Bind("ProjectName") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="550px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill NO">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Lnkbillno" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle   />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Period">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="350px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Submitted Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle   />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Certified Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle   />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Net Certified Bill Amount">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertifiedAmt" runat="server" Text='<%#Bind("TotalReceived") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle   />
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
                                            <ItemStyle   />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkCertifiedview" runat="server" CommandName="RaBillView" Text="View"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle   />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"  
                                    Enabled="True">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" Width="810px" Height="250px" Style="display: none;
                                    border-color: Maroon; background-color: #F7F8E0;">
                                    <div class="row"  style="width: 810px; vertical-align: top;">
                                        <div class="row" >
                                            <div class="col-lg-4"  style="width: 150px;">
                                                Project
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="LblProject" runat="server" AutoPostBack="True"  >
                                                </asp:Label>
                                            </div>
                                            <div class="col-lg-4" >
                                                Address
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="Lbladdressview" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                    ReadOnly="true"  ></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="width: 150px;">
                                                Bill No
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="txtbillNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                     ></asp:Label>
                                            </div>
                                            <div class="col-lg-4" >
                                                Bill Submitted Date
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="Txtbillsubmitteddate" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Bill Certification Date
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="Txtbillcertificationdate" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row"  style="vertical-align: top;">
                                            <div class="col-lg-4" >
                                                Net Amount
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="txtNetReceivable" runat="server"   onkeyup="valid(this)"
                                                    BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                            </div>
                                            <div class="col-lg-4" >
                                                Net Balance Amount
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="LblNetBalanceamt" runat="server"   onkeyup="valid(this)"
                                                    BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row"  style="vertical-align: top;">
                                            <div class="col-lg-4" >
                                                Receviable Amount
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:TextBox CssClass="form-control" ID="txtAmountReceived" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)" OnTextChanged="txtAmountReceived_TextChanged" AutoPostBack="true"
                                                    Enabled="true"></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmountReceived"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col-lg-4" >
                                                Balance Amount
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:TextBox CssClass="form-control" ID="txtReceivable" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtReceivable"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                        <div class="row"  style="vertical-align: top;">
                                            <div class="col-lg-4" >
                                                Bank Name
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:TextBox CssClass="form-control" ID="TxtBankname" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4" >
                                                Cheque No./RTGS
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:TextBox CssClass="form-control" ID="txtChequeNoRTGS" runat="server"   onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Cheque No./RTGS Date
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtChequeNoRTGSDate" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtChequeNoRTGSDate"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Remarks
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"  style="vertical-align: top;">
                                            <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" class="button-bg" Text="Save" OnClick="btnSubmit_Click"
                                                     />
                                                <asp:Button CssClass="btn btn-primary" ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                                     />
                                            </div>
                                        </div>
                                      </div>
                                </asp:Panel>
                            </div>
                        </div>
                      </div>
                    <div style="display: none">
                        <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Button" />
                    </div>
                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False"  
                        Enabled="True">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="Panel2" runat="server" Width="810px" Height="280px" Style="display: none;
                        border-color: Maroon; background-color: #F7F8E0;">
                        <div class="row"  style="width: 810px; vertical-align: top;">
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <asp:GridView CssClass="table table-striped"  ID="GvCertifiedView" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LnkProject" runat="server" Text='<%#Bind("ProjectName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="550px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill NO">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="Lnkbillno" runat="server" Text='<%#Bind("RaBillNo") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Period">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbillperiod" runat="server" Text='<%#Bind("Billperiod") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="350px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Submitted Date">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnksubdate" runat="server" Text='<%#Bind("Billsubmitteddate") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Certified Date">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Net Bill Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkNetReceivableView" runat="server" Text='<%#Bind("NetReceivable") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance Receivable Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBalanceAmt" runat="server" Text='<%#Bind("BalanceAmt") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount Receive">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle   />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                    <div class="row"  style="vertical-align: top;">
                                        <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                            <asp:Button CssClass="btn btn-primary" ID="Button4" runat="server" class="button-bg" Text="Cancel" OnClick="Button4_Click"
                                                Style="width: auto; text-align: center" />
                                        </div>
                                </div>
                            </div>
                          </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

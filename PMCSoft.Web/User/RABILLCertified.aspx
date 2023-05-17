<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.RABILLCertified" Codebehind="RABILLCertified.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="Button4" />
        </Triggers>
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Submitted Bill</h3>
                    </div>
                    <table style="width: 930px; vertical-align: top;">
                        <tr style="vertical-align: top;">
                            <td style="vertical-align: top; width: 600px;">
                                <asp:GridView ID="GvRAbillSub" runat="server" AutoGenerateColumns="false" GridLines="Both"
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
                                            <ItemStyle Width="200px" />
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
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bill Certified Date">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Net Certified Bill Amount">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkcertifiedAmt" runat="server" Text='<%#Bind("TotalReceived") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <%--   <asp:TemplateField HeaderText="Balance Receivable Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAmtReceive" runat="server"  Text='<%#Bind("Receivable") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                              
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            --%>
                                        <asp:TemplateField HeaderText="Payment">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Lnkview" runat="server" CommandName="RABILLsub" Text="Update"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkCertifiedview" runat="server" CommandName="RaBillView" Text="View"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button ID="Button1" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                    Enabled="True">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" Width="810px" Height="250px" Style="display: none;
                                    border-color: Maroon; background-color: #F7F8E0;">
                                    <table style="width: 810px; vertical-align: top;">
                                        <tr>
                                            <td style="width: 150px;">
                                                Project
                                            </td>
                                            <td>
                                                <asp:Label ID="LblProject" runat="server" AutoPostBack="True" Width="205px">
                                                </asp:Label>
                                            </td>
                                            <td>
                                                Address
                                            </td>
                                            <td>
                                                <asp:Label ID="Lbladdressview" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                    ReadOnly="true" Width="200px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px;">
                                                Bill No
                                            </td>
                                            <td>
                                                <asp:Label ID="txtbillNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                    Width="200px"></asp:Label>
                                            </td>
                                            <td>
                                                Bill Submitted Date
                                            </td>
                                            <td>
                                                <asp:Label ID="Txtbillsubmitteddate" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Bill Certification Date
                                            </td>
                                            <td>
                                                <asp:Label ID="Txtbillcertificationdate" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="vertical-align: top;">
                                            <td>
                                                Net Amount
                                            </td>
                                            <td>
                                                <asp:Label ID="txtNetReceivable" runat="server" Width="200px" onkeyup="valid(this)"
                                                    BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                            </td>
                                            <td>
                                                Net Balance Amount
                                            </td>
                                            <td>
                                                <asp:Label ID="LblNetBalanceamt" runat="server" Width="200px" onkeyup="valid(this)"
                                                    BackColor="AliceBlue" onblur="valid(this)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="vertical-align: top;">
                                            <td>
                                                Receviable Amount
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAmountReceived" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)" OnTextChanged="txtAmountReceived_TextChanged" AutoPostBack="true"
                                                    Enabled="true"></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmountReceived"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td>
                                                Balance Amount
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtReceivable" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtReceivable"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr style="vertical-align: top;">
                                            <td>
                                                Bank Name
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TxtBankname" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </td>
                                            <td>
                                                Cheque No./RTGS
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtChequeNoRTGS" runat="server" Width="200px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </td>
                                            <tr>
                                                <td>
                                                    Cheque No./RTGS Date
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtChequeNoRTGSDate" runat="server" Width="200px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtChequeNoRTGSDate"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td>
                                                    Remarks
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRemarks" runat="server" Width="200px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tr>
                                        <tr style="vertical-align: top;">
                                            <td colspan="4" style="text-align: center;">
                                                <asp:Button ID="btnSubmit" runat="server" class="button-bg" Text="Save" OnClick="btnSubmit_Click"
                                                    Style="width: auto;" />
                                                <asp:Button ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                                    Style="width: auto;" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                    <div style="display: none">
                        <asp:Button ID="Button2" runat="server" Text="Button" />
                    </div>
                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                        Enabled="True">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="Panel2" runat="server" Width="810px" Height="280px" Style="display: none;
                        border-color: Maroon; background-color: #F7F8E0;">
                        <table style="width: 810px; vertical-align: top;">
                            <tr>
                                <td>
                                    <asp:GridView ID="GvCertifiedView" runat="server" AutoGenerateColumns="false" GridLines="Both"
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
                                                <ItemStyle Width="200px" />
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
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill Certified Date">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkcertificationdate" runat="server" Text='<%#Bind("BillCertificationDate") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Net Bill Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkNetReceivableView" runat="server" Text='<%#Bind("NetReceivable") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance Receivable Amount">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBalanceAmt" runat="server" Text='<%#Bind("BalanceAmt") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount Receive">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAmountReceived" runat="server" Text='<%#Bind("AmountReceived") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td colspan="4" style="text-align: center;">
                                    <tr style="vertical-align: top;">
                                        <td colspan="4" style="text-align: center;">
                                            <asp:Button ID="Button4" runat="server" class="button-bg" Text="Cancel" OnClick="Button4_Click"
                                                Style="width: auto; text-align: center" />
                                        </td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

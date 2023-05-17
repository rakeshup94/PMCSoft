<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AdvanceRequisition" Codebehind="AdvanceRequisition.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Advance Requisition</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Project
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="True" Width="200px"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Vender
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList ID="ddlVendor" runat="server" Width="200px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                        onblur="valid(this)" Width="200px" ReadOnly="true" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 930px;">
                            <tr>
                                <td colspan="6">
                                    <asp:GridView ID="GVAdvanceReQuisition" runat="server" AutoGenerateColumns="false"
                                        ShowFooter="true" Width="915px" 
                                        OnRowDataBound="GVAdvanceReQuisition_RowDataBound" 
                                        onrowcommand="GVAdvanceReQuisition_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Type Of Payment">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddltypeofpayment" runat="server" Width="160px">
                                                    </asp:DropDownList>
                                                     <asp:Button ID="btnAdvanceRequisitionAddNew" runat="server" Text="+" CausesValidation="false" CommandName="AdvanceRequisitionAddNew" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="200px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtAmount" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmount"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reason">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtReason" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                   
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Any Security Created">
                                                <ItemTemplate>
                                                    <asp:RadioButtonList ID="rbl" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                        OnSelectedIndexChanged="rbl_SelectedIndexChanged">
                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlSecurity" runat="server" AutoPostBack="True" Enabled="false">
                                                        <asp:ListItem Text="Select Security" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Button ID="btnAdvanceRequisitionAddNewSecurity" runat="server" Text="+" CausesValidation="false" CommandName="AdvanceRequisitionAddNewSecurity" Enabled="false" />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle VerticalAlign="Top" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                     <div style="display: none">
                                                                <asp:Button ID="Button1" runat="server" Text="Button" />
                                                            </div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                                                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                                                             <div id="Div1">
                                                                                <h3 class="reallynow">
                                                                                   Add New Type Of Payment</h3>
                                                                <table style="width: 350px; background-color: #EFFBFB;">
                                                                     <tr>
                                                <td>
                                                   Type Of Payment
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txttypeofadvancerequisition" runat="server" Width="200px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="BtnTypeofAdvanceRequisitonAddNew" runat="server" Text="Submit" 
                                                        onclick="BtnTypeofAdvanceRequisitonAddNew_Click" />
                                                    <asp:Button ID="btnCancelAddNewTypeOfAdvanceRequistion" runat="server" 
                                                        Text="Cancel" onclick="btnCancelAddNewTypeOfAdvanceRequistion_Click"  />
                                                </td>
                                            </tr>
                                                                                 
                                                                                </table>
                                                                 </div>
                                                                       
                                                                      
                                                            </asp:Panel>
                                                             <div style="display: none">
                                                                <asp:Button ID="Button2" runat="server" Text="Button"  />
                                                            </div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                                                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="Panel1" runat="server" Style="display: none;">
                                                                <div id="Div2">
                                        <h3 class="reallynow">
                                            Add Security</h3>
                                        <table style="width: 350px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    Security Advance Requisition
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsecurityadvancereq" runat="server" Width="200px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="BtnSecurityAddNewSave" runat="server" Text="Submit" 
                                                        onclick="BtnSecurityAddNewSave_Click"  />
                                                    <asp:Button ID="BtnCancelSecurityAddNew" runat="server" Text="Cancel" 
                                                        onclick="BtnCancelSecurityAddNew_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                                                       
                                                                      
                                                            </asp:Panel>
                                </td>
                                <tr>
                                    <td colspan="6" style="text-align: center;">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                                    </td>
                                </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

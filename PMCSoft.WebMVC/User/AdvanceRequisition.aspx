<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AdvanceRequisition" Codebehind="AdvanceRequisition.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Advance Requisition</h3>
                        <div class="row"  style="width: 930px; vertical-align: top;">
                            <tr>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Project
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Vender
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                        onblur="valid(this)"   ReadOnly="true" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                          </div>
                        <div class="row"  style="width: 930px;">
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
                                                    <asp:DropDownList CssClass="form-select" ID="ddltypeofpayment" runat="server" Width="160px">
                                                    </asp:DropDownList>
                                                     <asp:Button CssClass="btn btn-primary" ID="btnAdvanceRequisitionAddNew" runat="server" Text="+" CausesValidation="false" CommandName="AdvanceRequisitionAddNew" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmount"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reason">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtReason" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                   
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
                                                    <asp:DropDownList CssClass="form-select" ID="ddlSecurity" runat="server" AutoPostBack="True" Enabled="false">
                                                        <asp:ListItem Text="Select Security" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Button CssClass="btn btn-primary" ID="btnAdvanceRequisitionAddNewSecurity" runat="server" Text="+" CausesValidation="false" CommandName="AdvanceRequisitionAddNewSecurity" Enabled="false" />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button CssClass="btn btn-primary" ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle VerticalAlign="Top" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                     <div style="display: none">
                                                                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                                            </div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                                                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                                                             <div id="Div1">
                                                                                <h3 class="reallynow">
                                                                                   Add New Type Of Payment</h3>
                                                                <div class="row"  style="width: 350px; background-color: #EFFBFB;">
                                                                     <tr>
                                                <td>
                                                   Type Of Payment
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txttypeofadvancerequisition" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="BtnTypeofAdvanceRequisitonAddNew" runat="server" Text="Submit" 
                                                        onclick="BtnTypeofAdvanceRequisitonAddNew_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancelAddNewTypeOfAdvanceRequistion" runat="server" 
                                                        Text="Cancel" onclick="btnCancelAddNewTypeOfAdvanceRequistion_Click"  />
                                                </td>
                                            </tr>
                                                                                 
                                                                                  </div>
                                                                 </div>
                                                                       
                                                                      
                                                            </asp:Panel>
                                                             <div style="display: none">
                                                                <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Button"  />
                                                            </div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                                                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="Panel1" runat="server" Style="display: none;">
                                                                <div id="Div2">
                                        <h3 class="reallynow">
                                            Add Security</h3>
                                        <div class="row"  style="width: 350px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    Security Advance Requisition
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtsecurityadvancereq" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="BtnSecurityAddNewSave" runat="server" Text="Submit" 
                                                        onclick="BtnSecurityAddNewSave_Click"  />
                                                    <asp:Button CssClass="btn btn-primary" ID="BtnCancelSecurityAddNew" runat="server" Text="Cancel" 
                                                        onclick="BtnCancelSecurityAddNew_Click" />
                                                </td>
                                            </tr>
                                          </div>
                                    </div>
                                                                       
                                                                      
                                                            </asp:Panel>
                                </td>
                                <tr>
                                    <td colspan="6" style="text-align: center;">
                                        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                                    </td>
                                </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

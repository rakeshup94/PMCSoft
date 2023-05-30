<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.ChangePassword" Codebehind="ChangePassword.aspx.cs" %>

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
                            Change Password</h3>
                        <div class="row"  style="width: 930px">
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Old Password:*
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtOldPassword">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    New Password:*
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtNewPassword">
                                    </cc1:FilteredTextBoxExtender>
                                    <br></br>
                                    At least one digit, one character, one special characters, and 8-20 characters in
                                    length in password. </br>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Re-Type Password:*
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtReType" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtReType">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="2">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSave" runat="server" Class="button-bg"  Text="Submit"
                                        OnClick="btnSave_Click" />
                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Class="button-bg" Style="width: auto;"
                                        Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

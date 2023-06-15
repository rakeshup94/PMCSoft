<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ChangePassword"
    CodeBehind="ChangePassword.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Change Password</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Old Password:*
                           
                                    <asp:TextBox CssClass="form-control" ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtOldPassword">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    New Password:*
                            
                                    <asp:TextBox CssClass="form-control" ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtNewPassword">
                                    </cc1:FilteredTextBoxExtender>




                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Re-Type Password:*
                        
                                    <asp:TextBox CssClass="form-control" ID="txtReType" runat="server" TextMode="Password"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterMode="InvalidChars"
                                        InvalidChars="&lt;&gt;" TargetControlID="txtReType">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-lg-6">
                                <div class="alert alert-danger mtm">
                                    <a href="#" class="alert-link">At least one digit, one character, one special characters,
                                        and 8-20 characters in
                                    length in password.!
                                            </a>

                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSave" runat="server" Text="Submit"
                                    OnClick="btnSave_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

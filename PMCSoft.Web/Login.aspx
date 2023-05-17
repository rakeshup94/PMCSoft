<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.Login" Codebehind="Login.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login Form</title>
    <link href="css/stylelogin.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".username").focus(function() {
                $(".user-icon").css("left", "-48px");
            });
            $(".username").blur(function() {
                $(".user-icon").css("left", "0px");
            });

            $(".password").focus(function() {
                $(".pass-icon").css("left", "-48px");
            });
            $(".password").blur(function() {
                $(".pass-icon").css("left", "0px");
            });
        });
    </script>

</head>
<body>
    <div style="text-align: center; margin-top: 100px; font-size: 25px; color: White;">
        Demo Client (India) Ltd.</div>
    <div id="wrapper">
        <div class="user-icon">
        </div>
        <div class="pass-icon">
        </div>
        <form id="form1" runat="server" class="login-form" action="" method="post">
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.png" Width="110px" />
        </div>
        <div style="color: Gray; margin-left: 62px; margin-top: -10px;">
            <asp:Label ID="lblN" runat="server" Text="Demo PROJECT MANAGEMENT" Font-Size="12px"></asp:Label>
        </div>
        <div class="content" style="margin-top: 10px;">
            <asp:TextBox ID="txtUserID" runat="server" CssClass="input username" onfocus="this.value=''"
                placeholder="Username"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserID"
                    runat="server" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtUserID"
                    runat="server" ErrorMessage="*" ValidationGroup="Forget"></asp:RequiredFieldValidator>

            <asp:TextBox ID="txtPassword" runat="server" CssClass="input password" onfocus="this.value=''"
                placeholder="Password" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" ControlToValidate="txtPassword" 
                runat="server" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
        </div>
        <div class="footer">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" ValidationGroup="Login" OnClick="btnLogin_Click" />
        </div>
        <div class="footer11">
            <asp:LinkButton ID="lnkForgotPassword" ValidationGroup="Forget" runat="server" Text="Forgot Password?" Font-Size="11px"
                OnClick="lnkForgotPassword_Click" ></asp:LinkButton>
            <br />
        
            <asp:Label ID="lblMsg" runat="server" Font-Size="11px" ForeColor="Red" BackColor="Silver"></asp:Label>
        </div>
        </form>
    </div>
</body>
</html>

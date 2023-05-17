<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddUser" Codebehind="AddUser.aspx.cs" %>

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
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            User Detail</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr>
                                <td style="width: 150px;">
                                    First Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    Last Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Employee ID
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmployeeID" runat="server" Width="200px" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </td>
                                <td>
                                    Employee Type
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlEmployeeType" runat="server" Width="205px">
                                        <asp:ListItem Selected="True" Text="Permanent" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Retainership" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Contractual" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Department
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                        Width="205px">
                                    </asp:DropDownList>
                                    <asp:Button ID="LnkAddNewDept" runat="server" OnClick="LnkAddNewDept_Click" Text="+">
                                    </asp:Button>
                                    <div style="display: none">
                                        <asp:Button ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Department</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Department
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtDepartment" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnDeptSave" runat="server" Text="Submit" OnClick="BtnDeptSave_Click" />
                                                                    <asp:Button ID="btndepcancel" runat="server" Text="Cancel" OnClick="btndepcancel_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td>
                                    Designation
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDesignation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged"
                                        Width="205px">
                                    </asp:DropDownList>
                                    <asp:Button ID="LnkAddNewDesignation" runat="server" Text="+" OnClick="LnkAddNewDesignation_Click">
                                    </asp:Button>
                                    <div style="display: none">
                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" Style="display: none; border-color: Maroon;
                                        width: 290">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Add Designation</h3>
                                                        <table style="width: 290px; vertical-align: top; background-color: #EFFBFB;">
                                                            <tr>
                                                                <td>
                                                                    Department
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlNewDept" runat="server" Width="200px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Designation
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtDesignation" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnAddnewDesignation" runat="server" Text="Submit" OnClick="BtnAddnewDesignation_Click" />
                                                                    <asp:Button ID="btnAddNewDesignationCancel" runat="server" Text="Cancel" OnClick="btnAddNewDesignationCancel_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td>
                                    Reporting To
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlReportingTo" runat="server" Width="205px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    Mobile No.
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" Width="200px"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Date of Joining
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDOJ" runat="server" Width="200px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOJ"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    Date of Birth
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateOfBirth" runat="server" Width="200px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtDateOfBirth"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td>
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Style="width: 205px;"
                                        onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </td>
                                <td>
                                    Country
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                                        Width="205px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td>
                                    State
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"
                                        Width="205px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    City
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCity" runat="server" Width="205px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td style="width: 150px;">
                                    ZIP Code
                                </td>
                                <td>
                                    <asp:TextBox ID="txtZipCode" runat="server" MaxLength="6" Width="200px" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtZipCode"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                                <td style="width: 150px;">
                                    Project Name
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/Images/DropDownList.png" />
                                    <asp:Panel ID="pnlCustomers" runat="server" CssClass="bgdesign" Style="display: none;">
                                        <asp:GridView ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            ShowHeader="false">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSW" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>' Font-Size="14px">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("PRJID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="ImageButton1"
                                        PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-16">
                                    </cc1:PopupControlExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    E-mail
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Text="" Value="" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    Alt. Email
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAltEmail" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td>
                                    Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Value="" Width="200px"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                                <td>
                                    Confirm Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Value=""
                                        Width="200px"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtConfirmPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr style="vertical-align: top;">
                                <td colspan="4" style="text-align: center;">
                                    <asp:Button ID="btnSubmit" runat="server" class="button-bg" Text="Submit" OnClick="btnSubmit_Click"
                                        Style="width: auto;" />
                                    <asp:Button ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                        Style="width: auto;" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="Admin_ViewUser" Codebehind="ViewUser.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

    <script type="text/javascript">
function Confirm()
{
if (confirm("Are you want to delete selected records ?")==true)
   return true;
else
   return false;
}
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
                                <td>
                                    Project
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" Width="300px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="913px"
                                        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpID" runat="server" Text='<%#Bind("OfficialEmpID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%#Bind("ProjectID") %>' />
                                                    <asp:HiddenField ID="hdnEmpID" runat="server" Value='<%#Bind("EmpID") %>' />
                                                    <asp:HiddenField ID="hdnFName" runat="server" Value='<%#Bind("FName") %>' />
                                                    <asp:HiddenField ID="hdnLName" runat="server" Value='<%#Bind("LName") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnAddress1" runat="server" Value='<%#Bind("Address1") %>' />
                                                    <asp:HiddenField ID="hdnCountry" runat="server" Value='<%#Bind("Country") %>' />
                                                    <asp:HiddenField ID="hdnState" runat="server" Value='<%#Bind("State") %>' />
                                                    <asp:HiddenField ID="hdnCity" runat="server" Value='<%#Bind("City") %>' />
                                                    <asp:HiddenField ID="hdnZipCode" runat="server" Value='<%#Bind("ZipCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="D.O.J">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDOJ" runat="server" Text='<%#Bind("DOJ") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnAccountType" runat="server" Value='<%#Bind("AccountType") %>' />
                                                    <asp:HiddenField ID="hdnDOB" runat="server" Value='<%#Bind("DOB") %>' />
                                                    <asp:HiddenField ID="hdnAltEmail" runat="server" Value='<%#Bind("AltEmail") %>' />
                                                    <asp:HiddenField ID="hdnReportingTo" runat="server" Value='<%#Bind("ReportingTo") %>' />
                                                    <asp:HiddenField ID="hdnReportingToName" runat="server" Value='<%#Bind("ReportingToName") %>' />
                                                    <asp:HiddenField ID="hdnCreatedBy" runat="server" Value='<%#Bind("CreatedBy") %>' />
                                                    <asp:HiddenField ID="hdnCreatedDate" runat="server" Value='<%#Bind("CreatedDate") %>' />
                                                    <asp:HiddenField ID="hdnDeptID" runat="server" Value='<%#Bind("DeptID") %>' />
                                                    <asp:HiddenField ID="hdnDesgID" runat="server" Value='<%#Bind("DesgID") %>' />
                                                    <asp:HiddenField ID="hdnEmpType" runat="server" Value='<%#Bind("EmpType") %>' />
                                                    <asp:HiddenField ID="hdnStatus" runat="server" Value='<%#Bind("Status") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEmpEdit" runat="server" Text="Edit" CommandName="EmpEdit"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEmpDelete" runat="server" Text="Delete" CommandName="EmpDelete"
                                                        OnClientClick="return Confirm()">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle ForeColor="#202020" BackColor="#D9EAED" />
                                    </asp:GridView>
                                    <div style="display: none">
                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                                        <table style="width: 650px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            User Detail</h3>
                                                        <table style="width: 630px;">
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
                                                                    <asp:HiddenField ID="hdnEmployeeID" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 150px;">
                                                                    Employee ID
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEmployeeID" runat="server" Width="200px" Enabled="False" ReadOnly="True"></asp:TextBox>
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
                                                                </td>
                                                                <td>
                                                                    Designation
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlDesignation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged"
                                                                        Width="205px">
                                                                    </asp:DropDownList>
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
                                                            <tr>
                                                                <td>
                                                                    E-mail
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEmail" runat="server" Text="" Value="" Width="200px" Enabled="False"
                                                                        ReadOnly="True"></asp:TextBox>
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
                                                                    <asp:TextBox ID="txtZipCode" runat="server" MaxLength="6" Width="200px"></asp:TextBox>
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
                                                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>' Font-Size="14px"></asp:Label>
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
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

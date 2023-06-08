<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ViewStaff" Codebehind="ViewStaff.aspx.cs" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Staff Detail</h3>
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Project
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="2">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false" Width="913px"
                                        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%#Bind("OfficialEmpID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnFName" runat="server" Value='<%#Bind("FName") %>' />
                                                    <asp:HiddenField ID="hdnLName" runat="server" Value='<%#Bind("LName") %>' />
                                                    <asp:HiddenField ID="hdnEmpID" runat="server" Value='<%#Bind("EmpID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="D.O.J">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDOJ" runat="server" Text='<%#Bind("DOJ") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnDOB" runat="server" Value='<%#Bind("DateOfBirth") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeType" runat="server" Text='<%#Bind("EmployeeType") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnStatus" runat="server" Value='<%#Bind("Status") %>' />
                                                    <asp:HiddenField ID="hdnDeptID" runat="server" Value='<%#Bind("DeptID") %>' />
                                                    <asp:HiddenField ID="hdnDepartmentName" runat="server" Value='<%#Bind("DepartmentName") %>' />
                                                    <asp:HiddenField ID="hdnDesgID" runat="server" Value='<%#Bind("DesgID") %>' />
                                                    <asp:HiddenField ID="hdnDesignation" runat="server" Value='<%#Bind("Designation") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDesignation" runat="server" Text='<%#Bind("Designation") %>'></asp:Label>
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
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none;   ">
                                        <div class="row"  style="width: 650px; background-color: #EFFBFB;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div id="Div1">
                                                        <h3 class="reallynow">
                                                            User Detail</h3>
                                                        <div class="row"  style="width: 630px;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="width: 150px; vertical-align: top;">
                                                                    First Name
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtFName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                                         ></asp:TextBox>
                                                                    <asp:HiddenField ID="hdnEmployeeID" runat="server" />
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    Last Name
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtLName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                                         ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    Employee ID
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtEmployeeID" runat="server"   Enabled="false" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    Employee Type
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlEmployeeType" runat="server"  >
                                                                        <asp:ListItem Selected="True" Text="Permanent" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Retainership" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Contractual" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row"   >
                                                                <div class="col-lg-4"   >
                                                                    Department
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                                                         >
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    Designation
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged"
                                                                         >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row"   >
                                                                <div class="col-lg-4"  style="width: 150px; vertical-align: top;">
                                                                    Date of Joining
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 250px;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtDOJ" runat="server"  ></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOJ"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 150px; vertical-align: top;">
                                                                    Date of Birth
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server"  ></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtDateOfBirth"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    Mobile No.
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"   Enabled="false"
                                                                        ReadOnly="true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    Project Name
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/Images/DropDownList.png" />
                                                                    <asp:Panel ID="pnlCustomers" runat="server" CssClass="bgdesign" Style="display: none;">
                                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
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
                                                                </div>
                                                            </div>
                                                            <div class="row"   >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" class="button-bg" Text="Submit" OnClick="btnSubmit_Click"
                                                                         />
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                                                         />
                                                                </div>
                                                            </div>
                                                          </div>
                                                    </div>
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddUser" Codebehind="AddUser.aspx.cs" %>

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
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            User Detail</h3>
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 150px;">
                                    First Name
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtFName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                                <div class="col-lg-4" >
                                    Last Name
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtLName" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 150px;">
                                    Employee ID
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtEmployeeID" runat="server"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                                <div class="col-lg-4" >
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
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Department
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                    <asp:Button CssClass="btn btn-primary" ID="LnkAddNewDept" runat="server" OnClick="LnkAddNewDept_Click" Text="+">
                                    </asp:Button>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                                        <div class="row"  style="width: 300px; background-color: #EFFBFB;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div class="card-body">
                                                        <h3 class="reallynow">
                                                            Department</h3>
                                                        <div class="row"  style="width: 390px; vertical-align: top;">
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Department
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtDepartment" runat="server"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"    >
                                                                    <asp:Button CssClass="btn btn-primary" ID="BtnDeptSave" runat="server" Text="Submit" OnClick="BtnDeptSave_Click" />
                                                                    <asp:Button CssClass="btn btn-primary" ID="btndepcancel" runat="server" Text="Cancel" OnClick="btndepcancel_Click" />
                                                                </div>
                                                            </div>
                                                          </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                                <div class="col-lg-4" >
                                    Designation
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                    <asp:Button CssClass="btn btn-primary" ID="LnkAddNewDesignation" runat="server" Text="+" OnClick="LnkAddNewDesignation_Click">
                                    </asp:Button>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" Style="display: none; border-color: Maroon;
                                        width: 290">
                                        <div class="row"  style="width: 300px; background-color: #EFFBFB;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div class="card-body">
                                                        <h3 class="reallynow">
                                                            Add Designation</h3>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Department
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlNewDept" runat="server"  >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Designation
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtDesignation" runat="server"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"    >
                                                                    <asp:Button CssClass="btn btn-primary" ID="BtnAddnewDesignation" runat="server" Text="Submit" OnClick="BtnAddnewDesignation_Click" />
                                                                    <asp:Button CssClass="btn btn-primary" ID="btnAddNewDesignationCancel" runat="server" Text="Cancel" OnClick="btnAddNewDesignationCancel_Click" />
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
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4" >
                                    Reporting To
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlReportingTo" runat="server"  >
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    Mobile No.
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"  ></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Date of Joining
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtDOJ" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOJ"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Date of Birth
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtDateOfBirth"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4" >
                                    Address
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" Style="width: 205px;"
                                        onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                                <div class="col-lg-4" >
                                    Country
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4" >
                                    State
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    City
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlCity" runat="server"  >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4"  style="width: 150px;">
                                    ZIP Code
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtZipCode" runat="server" MaxLength="6"   onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtZipCode"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4"  style="width: 150px;">
                                    Project Name
                                </div>
                                <div class="col-lg-4" >
                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/Images/DropDownList.png" />
                                    <asp:Panel ID="pnlCustomers" runat="server" CssClass="bgdesign" Style="display: none;">
                                        <asp:GridView CssClass="table table-striped"  ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
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
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    E-mail
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" Text="" Value=""  ></asp:TextBox>
                                </div>
                                <div class="col-lg-4" >
                                    Alt. Email
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtAltEmail" runat="server"  ></asp:TextBox>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4" >
                                    Password
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password" Value=""  ></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-4" >
                                    Confirm Password
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtConfirmPassword" runat="server" TextMode="Password" Value=""
                                         ></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtConfirmPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" class="button-bg" Text="Submit" OnClick="btnSubmit_Click"
                                         />
                                    <asp:Button CssClass="btn btn-primary" ID="btnReset" runat="server" class="button-bg" Text="Cancel" OnClick="btnReset_Click"
                                         />
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

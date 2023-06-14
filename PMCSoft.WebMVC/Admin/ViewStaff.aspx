<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ViewStaff"
    CodeBehind="ViewStaff.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

    <script type="text/javascript">
        function Confirm() {
            if (confirm("Are you want to delete selected records ?") == true)
                return true;
            else
                return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Staff Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">

                            <div class="col-lg-4 offset-sm-4">
                                <div class="mb-3">
                                    Project
                            
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>


                        </div>

                        <div class="row">

                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GridView1" runat="server" AutoGenerateColumns="false"
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
                                                <asp:LinkButton CssClass="btn btn-default btn-xs" ID="lnkEmpEdit" runat="server"
                                                    Text="Edit" CommandName="EmpEdit"><i class='fa fa-edit mediumtxt'></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton CssClass="btn btn-default btn-xs" ID="lnkEmpDelete" runat="server"
                                                    Text="Delete" CommandName="EmpDelete"
                                                    OnClientClick="return Confirm()"><i class='fa fa-trash-o mediumtxt'></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                            </div>



                        </div>




                    </div>
                </div>
            </div>





            <asp:Panel ID="Panel1" runat="server" Style="display: none;">



                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">User Detail</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        First Name
                       
                
                                <asp:TextBox CssClass="form-control" ID="txtFName" runat="server" onkeyup="valid(this)"
                                    onblur="valid(this)"></asp:TextBox>
                                        <asp:HiddenField ID="hdnEmployeeID" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Last Name
                         
                            
                                    <asp:TextBox CssClass="form-control" ID="txtLName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Employee ID
                        
                                <asp:TextBox CssClass="form-control" ID="txtEmployeeID" runat="server" Enabled="false"
                                    ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Employee Type
                       
                                <asp:DropDownList CssClass="form-select" ID="ddlEmployeeType" runat="server">
                                    <asp:ListItem Selected="True" Text="Permanent" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Retainership" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Contractual" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                    </div>
                                </div>


                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Department
                         
                                <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Designation
                        
                                <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged">
                                </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Date of Joining
                     
                                <asp:TextBox CssClass="form-control" ID="txtDOJ" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOJ"
                                            CssClass="cal_Theme1">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Date of Birth
                         
                                <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtDateOfBirth"
                                            CssClass="cal_Theme1">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Mobile No.
                        
                                <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"
                                    Enabled="false"
                                    ReadOnly="true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                            FilterType="Custom, Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Project Name
                  
                                <asp:LinkButton ID="lnkBtnProject" runat="server" OnClick="lnkBtnProject_Click"><i class="fa fa-check-square"></i></asp:LinkButton>

                                        <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="lnkBtnProject"
                                            PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-16">
                                        </cc1:PopupControlExtender>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary
                btn-square"
                                        ID="btnSubmit" runat="server" Text="Submit"
                                        OnClick="btnSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnReset" runat="server" Text="Cancel"
                                        OnClick="btnReset_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>













            </asp:Panel>

            <asp:Panel ID="pnlCustomers" runat="server" Style="display: none;">
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                            ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
                            ShowHeader="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSW" runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("PRJID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

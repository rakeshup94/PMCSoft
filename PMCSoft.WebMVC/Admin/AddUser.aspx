<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddUser"
    CodeBehind="AddUser.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">User Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    First Name                            
                           
                                    <asp:TextBox CssClass="form-control" ID="txtFName" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Last Name
                              
                                        <asp:TextBox CssClass="form-control" ID="txtLName" runat="server"
                                            onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Employee ID
                                 
                                        <asp:TextBox CssClass="form-control" ID="txtEmployeeID"
                                            runat="server" onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Employee Type
                                 
                                        <asp:DropDownList CssClass="form-select" ID="ddlEmployeeType"
                                            runat="server">
                                            <asp:ListItem Selected="True" Text="Permanent" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Retainership" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Contractual" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Department
                                    <div class="input-group">
                                        <asp:DropDownList CssClass="form-select" ID="ddlDepartment"
                                            runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <div class="input-group-addon">

                                            <asp:Button CssClass="btn btn-primary btn-square" ID="LnkAddNewDept"
                                                runat="server"
                                                OnClick="LnkAddNewDept_Click" Text="+"></asp:Button>
                                            <div style="display: none">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="Button2"
                                                    runat="server" Text="Button" />
                                            </div>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"
                                                Enabled="True">
                                            </cc1:ModalPopupExtender>
                                        </div>
                                    </div>



                                </div>
                            </div>
                            <div class="col-lg-4">

                                <div class="mb-3">
                                    Designation

                                    <div class="input-group">
                                        <asp:DropDownList CssClass="form-select" ID="ddlDesignation"
                                            runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="input-group-addon">



                                            <asp:Button CssClass="btn btn-primary btn-square" ID="LnkAddNewDesignation"
                                                runat="server"
                                                Text="+" OnClick="LnkAddNewDesignation_Click"></asp:Button>
                                            <div style="display: none">
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="Button1" runat="server" Text="Button" />
                                            </div>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                                PopupControlID="Panel2" TargetControlID="Button1"
                                                EnableViewState="False"
                                                Enabled="True">
                                            </cc1:ModalPopupExtender>


                                        </div>
                                    </div>



                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Reporting To
                            
                                        <asp:DropDownList CssClass="form-select" ID="ddlReportingTo"
                                            runat="server">
                                        </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Mobile No.
                               
                                        <asp:TextBox CssClass="form-control" ID="txtMobileNo"
                                            runat="server" MaxLength="10"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                        runat="server" TargetControlID="txtMobileNo"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
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
                               
                                        <asp:TextBox CssClass="form-control" ID="txtDateOfBirth"
                                            runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender8" runat="server"
                                        TargetControlID="txtDateOfBirth"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Address
                                 
                                        <asp:TextBox CssClass="form-control" ID="txtAddress"
                                            runat="server" TextMode="MultiLine"
                                             
                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Country
                              
                                        <asp:DropDownList CssClass="form-select" ID="ddlCountry"
                                            runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                        </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    State
                             
                                        <asp:DropDownList CssClass="form-select" ID="ddlState"
                                            runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                        </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    City
                               
                                        <asp:DropDownList CssClass="form-select" ID="ddlCity"
                                            runat="server">
                                        </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    ZIP Code
                                
                                        <asp:TextBox CssClass="form-control" ID="txtZipCode"
                                            runat="server" MaxLength="6"
                                            onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                                        runat="server" TargetControlID="txtZipCode"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project Name 

                                          <asp:LinkButton ID="lnkBtnProject" runat="server" OnClick="lnkBtnProject_Click"><i class="fa fa-square-o mediumtxt"></i></asp:LinkButton>
                                    <cc1:PopupControlExtender ID="PopupControlExtender1"
                                        runat="server" TargetControlID="lnkBtnProject"
                                        PopupControlID="pnlCustomers" Position="Bottom"
                                        OffsetY="-16">
                                    </cc1:PopupControlExtender>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    E-mail
                               
                                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"
                                            Text="" Value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Alt. Email
                               
                                        <asp:TextBox CssClass="form-control" ID="txtAltEmail"
                                            runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Password
                         
                        
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server"
                                        TextMode="Password"
                                        Value=""></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3"
                                        runat="server" TargetControlID="txtPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Confirm Password
                           
                                
                                    <asp:TextBox CssClass="form-control" ID="txtConfirmPassword"
                                        runat="server" TextMode="Password"
                                        Value=""></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4"
                                        runat="server" TargetControlID="txtConfirmPassword"
                                        FilterMode="InvalidChars" InvalidChars="&lt;&gt;">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit"
                                    runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnReset"
                                    runat="server" Text="Cancel"
                                    OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="pnlCustomers" runat="server" Style="display: none;">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped
                table-bordered table-advanced tablesorter mbn"
                                    ID="GVProject" runat="server" AutoGenerateColumns="false"
                                    GridLines="None"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSW" runat="server" />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectName" runat="server"
                                                    Text='<%#Bind("ProjectName") %>'>
                                                </asp:Label>
                                                <asp:HiddenField ID="hdnPRJID" runat="server"
                                                    Value='<%#Eval("PRJID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Designation</h4>


                        </div>

                        <div class="modal-body">
                            <div class="card">

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                Department
           
                        <asp:DropDownList CssClass="form-select"
                            ID="ddlNewDept" runat="server">
                        </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                Designation
                 
                        <asp:TextBox CssClass="form-control"
                            ID="txtDesignation" runat="server" onkeyup="valid(this)"
                            onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Button CssClass="btn btn-primary
                btn-square"
                                                ID="BtnAddnewDesignation" runat="server"
                                                Text="Submit" OnClick="BtnAddnewDesignation_Click" />
                                            <asp:Button CssClass="btn btn-primary
                btn-square"
                                                ID="btnAddNewDesignationCancel"
                                                runat="server" Text="Cancel"
                                                OnClick="btnAddNewDesignationCancel_Click" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>

            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server" Style="display: none;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Department</h4>


                        </div>

                        <div class="modal-body">
                            <div class="card">

                                <div class="card-body">


                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                Department
                            
                                    <asp:TextBox CssClass="form-control"
                                        ID="txtDepartment" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <asp:Button CssClass="btn
                btn-primary btn-square"
                                                ID="BtnDeptSave" runat="server"
                                                Text="Submit" OnClick="BtnDeptSave_Click" />
                                            <asp:Button CssClass="btn
                btn-primary btn-square"
                                                ID="btndepcancel" runat="server"
                                                Text="Cancel" OnClick="btndepcancel_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>






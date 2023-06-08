<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddGeneralUser"
    CodeBehind="AddGeneralUser.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">

    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Staff Detail</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    First Name
                                            
                                                        <asp:TextBox CssClass="form-control" ID="txtFName" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
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
                                                 
                                                        <asp:TextBox CssClass="form-control" ID="txtEmployeeID" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
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

                                <div class="row">
                                    <div class="col-lg-10 col-10 pe-0">

                                        <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>


                                    <div class="col-lg-2 col-2 ps-0">

                                        <asp:Button CssClass="btn btn-danger btn-xs mbs rounded-0 rounded-end" ID="LnkAddNewDept"
                                            runat="server" OnClick="LnkAddNewDept_Click"
                                            Text="+"></asp:Button>
                                        <div style="display: none">
                                            <asp:Button btn btn-primary btn-square ID="Button2" runat="server" Text="Button" />
                                        </div>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                            PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" Enabled="True">
                                        </cc1:ModalPopupExtender>

                                    </div>
                                </div>
                                </div>
                            </div>



                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Designation
                                                <div class="row">
                                                    <div class="col-xl-10 col-10 pe-0">
                                                        <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged">
                                                        </asp:DropDownList>

                                                    </div>
                                                    <div class="col-xl-2 col-2 ps-0">
                                                        <asp:Button btn btn-primary btn-square ID="LnkAddNewDesignation" runat="server" Text="+"
                                                            OnClick="LnkAddNewDesignation_Click"></asp:Button>
                                                        <div style="display: none">
                                                            <asp:Button btn btn-primary btn-square ID="Button1" runat="server" Text="Button" />
                                                        </div>
                                                        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                                            PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                                                            Enabled="True">
                                                        </cc1:ModalPopupExtender>
                                                    </div>
                                                </div>



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
                                                
                                                        <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                        FilterType="Custom, Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project Name     
   
                                    <asp:LinkButton runat="server" ID="btnProject" OnClick="btnRun_Click"><i class='fa fa-refresh'></i></asp:LinkButton>




                                </div>
                            </div>

                            <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="btnProject"
                                PopupControlID="pnlCustomers" Position="Center">
                            </cc1:PopupControlExtender>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button btn btn-primary btn-square ID="btnSubmit" runat="server" class="button-bg"
                                    Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button btn btn-primary btn-square ID="btnReset" runat="server" class="button-bg"
                                    Text="Cancel" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlCustomers" runat="server" Style="display: none;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Choose Project</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-12" style="max-height: 200px; overflow: auto;">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn" ID="GVProject" runat="server" AutoGenerateColumns="false"
                                            GridLines="None"
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
                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("PRJID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            </div>

                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Designation</h4>

                                <asp:Button CssClass="btn-close" ID="btnAddNewDesignationCancel"
                                    runat="server"
                                    OnClick="btnAddNewDesignationCancel_Click" />



                            </div>
                            <div class="modal-body">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Department
                                                                                   
                                                                                        <asp:DropDownList CssClass="form-select" ID="ddlNewDept"
                                                                                            runat="server">
                                                                                        </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Designation
                                                                                 
                                                                                        <asp:TextBox CssClass="form-control" ID="txtDesignation"
                                                                                            runat="server" onkeyup="valid(this)"
                                                                                            onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-lg-12">
                                                <asp:Button btn btn-primary btn-square ID="BtnAddnewDesignation"
                                                    runat="server" Text="Submit"
                                                    OnClick="BtnAddnewDesignation_Click" />

                                            </div>





                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">


                                <asp:Button CssClass="btn btn-danger" ID="Button3"
                                    runat="server" Text="Close"
                                    OnClick="btnAddNewDesignationCancel_Click" />
                            </div>

                        </div>


                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" Style="display: none;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Department</h4>
                                <asp:Button CssClass="btn-close" ID="btndepcancel" runat="server"
                                    OnClick="btndepcancel_Click" />
                            </div>
                            <div class="modal-body">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <asp:TextBox CssClass="form-control" ID="txtDepartment" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:Button btn btn-primary btn-square ID="BtnDeptSave" runat="server" Text="Submit"
                                                    OnClick="BtnDeptSave_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <asp:Button CssClass="btn btn-danger" ID="Button4" runat="server" Text="Close"
                                    OnClick="btndepcancel_Click" />
                            </div>





                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>



        <!-- The Modal -->







    </div>
</asp:Content>

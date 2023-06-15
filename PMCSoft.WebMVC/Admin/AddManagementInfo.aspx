<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddManagementInfo"
    CodeBehind="AddManagementInfo.aspx.cs" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function Confirm() {
            if (confirm("Do you want to delete this record ?") == true)
                return true;
            else
                return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Add Notification</div>
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
                            Department


                               <div class="input-group">


                                   <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="true"
                                       OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                   </asp:DropDownList>

                                   <div class="input-group-addon">
                                       <asp:LinkButton runat="server" ID="LnkAddNewDept" Text="<i class='fa fa-plus text-green'></i>"
                                           OnClick="LnkAddNewDept_Click" CssClass="mediumtxt ps-3" />


                                       <div style="display: none">
                                           <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
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
                                       runat="server">
                                   </asp:DropDownList>

                                   <div class="input-group-addon">
                                       <asp:LinkButton runat="server" ID="LnkAddNewDesignation" Text="<i class='fa fa-plus text-green'></i>"
                                           OnClick="LnkAddNewDesignation_Click" CssClass="mediumtxt ps-3" />



                                       <div style="display: none">
                                           <asp:Button CssClass="btn btn-primary btn-square" ID="Button1"
                                               runat="server" Text="Button" />
                                       </div>
                                       <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                            
                                           PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                                           Enabled="True">
                                       </cc1:ModalPopupExtender>
                                   </div>
                               </div>

















                        </div>
                    </div>



                    <div class="col-lg-4">
                        <div class="mb-3">
                            Subject
                         
                                    <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Circular No.
                                
                                 
                                        <asp:TextBox CssClass="form-control" ID="txtCircularNo"
                                            runat="server"
                                            onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Attachment
                                      
                                         
                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Description
                                      
                                    
                                            <asp:TextBox CssClass="form-control" ID="txtDescription"
                                                runat="server" TextMode="MultiLine"
                                                onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                        </div>
                    </div>

                </div>



                <div class="row">
                    <div class="col-lg-12">
                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server"
                            Text="Submit"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel"
                            runat="server" Text="Cancel"
                            OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>

        </div>

        <div class="card">
            <div class="card-header">Updated Notifications </div>


            <div class="card-body">

                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView CssClass="table table-hover table-striped
    table-bordered table-advanced tablesorter mbn"
                            ID="GridView1" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No
    Record Found">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")
    %>'></asp:Label>
                                        <asp:HiddenField ID="hdnTransID" runat="server"
                                            Value='<%#Bind("TransID") %>' />
                                        <asp:HiddenField ID="hdnStatus" runat="server"
                                            Value='<%#Bind("Status") %>' />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitle" runat="server"
                                            Text='<%#Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Circular No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCircularNo" runat="server"
                                            Text='<%#Bind("CircularNo") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server"
                                            Text='<%#Bind("Description") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDepartment" runat="server"
                                            Text='<%#Bind("DepartmentName") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server"
                                            Text='<%#Bind("Designation") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Attachment">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkAttachment" runat="server"
                                            Text='<%#Bind("FileNameOriginal") %>'
                                            CommandName="FileNameO">
                                        </asp:LinkButton>
                                        <asp:HiddenField ID="hdnAttachment" runat="server"
                                            Value='<%#Bind("FileName") %>'></asp:HiddenField>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate")
    %>'></asp:Label></span>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDeleteInfo" runat="server"
                                            Text="Delete" CommandName="DeleteInfo"
                                            Font-Underline="true" OnClientClick="return
    Confirm()">
                                        </asp:LinkButton>
                                        <asp:Label ID="lblD" runat="server" Text="Delete">
                                        </asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>








    <asp:Panel ID="Panel1" runat="server"  >


        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Department</h4>


                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                Department
                           
                                    <asp:TextBox CssClass="form-control" ID="txtDepartment" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Button CssClass="btn btn-primary btn-square" ID="BtnDeptSave" runat="server"
                                Text="Submit"
                                OnClick="BtnDeptSave_Click" />

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-danger btn-square" ID="btndepcancel" runat="server"
                        Text="Cancel"
                        OnClick="btndepcancel_Click" />
                </div>










            </div>


        </div>


    </asp:Panel>


    <asp:Panel ID="Panel2" runat="server"  >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Designation</h4>
                </div>

                <div class="modal-body">

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
                            <asp:Button CssClass="btn
    btn-primary btn-square"
                                ID="BtnAddnewDesignation" runat="server"
                                Text="Submit"
                                OnClick="BtnAddnewDesignation_Click" />

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-danger btn-square"
                        ID="btnAddNewDesignationCancel"
                        runat="server"
                        Text="Cancel"
                        OnClick="btnAddNewDesignationCancel_Click" />
                </div>
            </div>
        </div>
    </asp:Panel>




</asp:Content>

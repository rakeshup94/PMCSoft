<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddVendor"
    CodeBehind="AddVendor.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">









    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Party / Vendor Detail</div>
        </div>
        <ol class="breadcrumb page-breadcrumb">
        </ol>
        <div class="clearfix"></div>
    </div>


    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">


                            <div class="col-lg-4 offset-sm-4">
                                <div class="mb-3">
                                    Project
                           
                                <asp:DropDownList CssClass="form-select" ID="ddlP" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlP_SelectedIndexChanged">
                                </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">

                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GridView1" runat="server" Width="640px" AutoGenerateColumns="false"
                                    EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("VendorID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle   HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Party / Vendor Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblVendorName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Vendor Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblVendorType" runat="server" Text='<%#Bind("VendorType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEditVendor" runat="server" Text="Edit" CommandName="EditVendor">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                            </div>
                        </div>

                    </div>

                    <div class="card-header">
                        Add Party / Vendor
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Name
                           
                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Address
                               
                                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"
                                            onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Country
                                      
                                            <asp:DropDownList CssClass="form-select" ID="ddlCountry" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                            </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    State
                                         
                                                <asp:DropDownList CssClass="form-select" ID="ddlState" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    City
                                         
                                                    <asp:DropDownList CssClass="form-select" ID="ddlCity" runat="server">
                                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Mobile No.
                                             
                                                        <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Email
                                                  
                                                            <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    PAN No
                                                         
                                                                <asp:TextBox CssClass="form-control" ID="TxtPanNo" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    TIN
                                                              
                                                                    <asp:TextBox CssClass="form-control" ID="TxtTinNo" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    ECC No
                                                               
                                                                        <asp:TextBox CssClass="form-control" ID="TxtEccNo" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    VAT
                                                               
                                                                            <asp:TextBox CssClass="form-control" ID="TxtVat" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Party / Vendor Type
                                 
                                      
                                  

                                    <div class="input-group">
                                        <asp:DropDownList CssClass="form-select" ID="ddlVendorType" runat="server">
                                        </asp:DropDownList>

                                        <div class="input-group-addon">
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="+"
                                                OnClick="btnAdd_Click" />
                                            <div style="display: none">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                            </div>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                                PopupControlID="Panel3" TargetControlID="Button2" EnableViewState="False"
                                                Enabled="True">
                                            </cc1:ModalPopupExtender>

                                        </div>
                                    </div>


                                </div>
                            </div>


                            <div class="col-lg-4">
                                Project Name
                               
                                        <asp:LinkButton ID="ImageButton1" runat="server" OnClick="lnkBtnProject_Click"><i class="fa fa-check-square"></i></asp:LinkButton>
                                <asp:Panel ID="pnlCustomers" runat="server">
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
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="lnkBtnProject"
                                    PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-16">
                                </cc1:PopupControlExtender>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <asp:Panel ID="Panel1" runat="server">




                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Party / Vendor Detail</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">


                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Name
                                       
                                                <asp:TextBox CssClass="form-control" ID="txtEName" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField2" runat="server" />
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Address
                                           
                                                    <asp:TextBox CssClass="form-control" ID="txtEAddress" runat="server" TextMode="MultiLine"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Country
                                                
                                                        <asp:DropDownList CssClass="form-select" ID="ddlECountry" runat="server" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlECountry_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        State
                                                 
                                                            <asp:DropDownList CssClass="form-select" ID="ddlEState" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlEState_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        City
                                                          
                                                                <asp:DropDownList CssClass="form-select" ID="ddlECity" runat="server">
                                                                </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Mobile No.
                                                              
                                                                    <asp:Label ID="txtEMobileNo" runat="server" MaxLength="10"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Email
                                                            
                                                                        <asp:TextBox CssClass="form-control" ID="txtEEmail" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Party / Vendor Type
                                                                   
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlEVendorType" runat="server">
                                                                            </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Project Name
                                                                      
                                                                                <asp:LinkButton ID="lnkBtnProject" runat="server" OnClick="ImageButton2_Click"><i class="fa fa-check-square"></i></asp:LinkButton>
                                        <asp:Panel ID="Panel2" runat="server">
                                            <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None"
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
                                                            <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <cc1:PopupControlExtender ID="PopupControlExtender2" runat="server" TargetControlID="lnkBtnProject"
                                            PopupControlID="Panel2" Position="Bottom" OffsetY="-16">
                                        </cc1:PopupControlExtender>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnESubmit" runat="server"
                                        Text="Submit" OnClick="btnESubmit_Click" />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <asp:Button CssClass="btn btn-default btn-square" ID="btnECancel" runat="server"
                                Text="Cancel" OnClick="btnECancel_Click" />
                        </div>

                    </div>
                </div>












            </asp:Panel>



            <asp:Panel ID="Panel3" runat="server">









                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Party / Vendor Type</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        Type
                                    
                                                <asp:TextBox CssClass="form-control" ID="txtVendorType" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSave" runat="server" OnClick="btnSave_Click"
                                        Text="Submit" />

                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">




                            <asp:Button CssClass="btn btn-default btn-square" ID="btnClose" runat="server" OnClick="btnClose_Click"
                                Text="Cancel" />
                        </div>

                    </div>
                </div>




            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AdvanceRequisition"
    CodeBehind="AdvanceRequisition.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Advance Requisition</div>
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
                                    Project
                                   
                            
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Vender
                             
                     
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Address
                                  
                           
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server"
                                        TextMode="MultiLine"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)" ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped
            table-bordered table-advanced tablesorter mbn"
                                    ID="GVAdvanceReQuisition" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true"
                                    OnRowDataBound="GVAdvanceReQuisition_RowDataBound"
                                    OnRowCommand="GVAdvanceReQuisition_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")
                %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Type Of Payment">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select"
                                                    ID="ddltypeofpayment" runat="server">
                                                </asp:DropDownList>
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="btnAdvanceRequisitionAddNew"
                                                    runat="server" Text="+" CausesValidation="false"
                                                    CommandName="AdvanceRequisitionAddNew" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtAmount"
                                                    runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                                    runat="server" TargetControlID="txtAmount"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>

                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reason">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtReason"
                                                    runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Any Security Created">
                                            <ItemTemplate>
                                                <asp:RadioButtonList ID="rbl" runat="server"
                                                    AutoPostBack="true" RepeatDirection="Horizontal"
                                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged">
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select"
                                                    ID="ddlSecurity" runat="server" AutoPostBack="True"
                                                    Enabled="false">
                                                    <asp:ListItem Text="Select Security"
                                                        Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="btnAdvanceRequisitionAddNewSecurity"
                                                    runat="server" Text="+" CausesValidation="false"
                                                    CommandName="AdvanceRequisitionAddNewSecurity"
                                                    Enabled="false" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="btnAddMore" runat="server"
                                                    OnClick="btnAddMore_Click" Text="Add
            More" />
                                            </FooterTemplate>


                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button1"
                                        runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                    PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button2"
                                        runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                    PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>
                            </div>
                        </div>





                        <div class="row">
                            <div class="col-lg-4" colspan="6">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit"
                                    runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel"
                                    runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <asp:Panel ID="Panel2" runat="server">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add New Type Of Payment</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        Type Of Payment
                                        
                                                <asp:TextBox CssClass="form-control"
                                                    ID="txttypeofadvancerequisition" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary
            btn-square"
                                        ID="BtnTypeofAdvanceRequisitonAddNew"
                                        runat="server" Text="Submit"
                                        OnClick="BtnTypeofAdvanceRequisitonAddNew_Click" />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">




                            <asp:Button CssClass="btn btn-primary
            btn-square"
                                ID="btnCancelAddNewTypeOfAdvanceRequistion"
                                runat="server"
                                Text="Cancel" OnClick="btnCancelAddNewTypeOfAdvanceRequistion_Click" />
                        </div>

                    </div>
                </div>




            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Security</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        Security Advance Requisition
                                    
                                                <asp:TextBox CssClass="form-control"
                                                    ID="txtsecurityadvancereq" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary
            btn-square"
                                        ID="BtnSecurityAddNewSave" runat="server"
                                        Text="Submit"
                                        OnClick="BtnSecurityAddNewSave_Click" />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button CssClass="btn btn-primary
            btn-square"
                                ID="BtnCancelSecurityAddNew" runat="server"
                                Text="Cancel"
                                OnClick="BtnCancelSecurityAddNew_Click" />
                        </div>

                    </div>
                </div>
                <div class="card-header">
                </div>



            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

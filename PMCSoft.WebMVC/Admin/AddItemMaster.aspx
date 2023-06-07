﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddItemMaster"
    CodeBehind="AddItemMaster.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">

    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Add Item</div>
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
                        Group Name
                                    <asp:DropDownList CssClass="form-select" ID="ddlitemGropgrid"
                                        runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlitemGropgrid_SelectedIndexChanged">
                                    </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">

                        <asp:GridView CssClass="table table-striped"  ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped"
                            EmptyDataText="No Record Found"
                            OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemStyle Width="30px" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                    <asp:HiddenField ID="hdnTransID" runat="server"
                                                        Value='<%#Bind("TransID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Trans id" Visible="false">
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Group Name" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName")
                %>'></asp:Label>
                                        <asp:HiddenField ID="hdnItemGroupID" runat="server"
                                            Value='<%#Bind("ItemGroupID") %>' />
                                        <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID")
                %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName")
                %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnit" runat="server" Text='<%#Bind("UnitName")
                %>'></asp:Label>
                                        <asp:HiddenField ID="hdnUnitID" runat="server" Value='<%#Bind("UnitID")
                %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Make">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMake" runat="server" Text='<%#Bind("Make")
                %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Part No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPartNo" runat="server" Text='<%#Bind("PartNo")
                %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEmpEdit" runat="server" Text="Edit"
                                            CommandName="EditDetail"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                        </asp:GridView>
                    </div>
                </div>
            </div>





            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Group Name
                             <div class="row">
                                 <div class="col-xl-10 col-10 pe-0">
                                     <asp:DropDownList CssClass="form-select" ID="ddlGroup" runat="server">
                                     </asp:DropDownList>
                                 </div>
                                 <div class="col-xl-2 col-2 ps-0">
                                     <asp:Button CssClass="btn btn-primary" ID="LnkAddNewGroupName" runat="server"
                                         Text="+"
                                         OnClick="LnkAddNewGroupName_Click"></asp:Button>
                                 </div>
                             </div>





                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Item Name
                          
                                <asp:TextBox CssClass="form-control" ID="txtItemName" runat="server"
                                    onkeyup="valid(this)"
                                    onblur="valid(this)"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Unit
                                 <div class="row">
                                    <div class="col-xl-10 col-10 pe-0">
                                             <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server">
                                </asp:DropDownList>
                                    </div>
                                    <div class="col-xl-2 col-2 ps-0">
                                         <asp:Button CssClass="btn btn-primary" ID="LnkAddNewUnit" runat="server"
                                Text="+"
                                OnClick="LnkAddNewUnit_Click"></asp:Button>
                                    </div>
                                </div>
                       
                        

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Make
                       
                                <asp:TextBox CssClass="form-control" ID="txtItemMake" runat="server"
                                    onblur="valid(this)"
                                    onkeyup="valid(this)"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Part No.
                         
                                <asp:TextBox CssClass="form-control" ID="txtItemPartNo" runat="server"
                                    onblur="valid(this)"
                                    onkeyup="valid(this)"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server"
                            Text="Submit"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server"
                            Text="Cancel"
                            OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>




        </div>
    </div>



    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="display: none">

                <asp:Button CssClass="btn btn-primary" ID="Button3" runat="server" />
            </div>
            <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="popUpStyle"
                PopupControlID="Panel3" TargetControlID="Button3" EnableViewState="False"
                Enabled="True">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel3" runat="server" Style="display: none;">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Unit</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Name
                           
                                    <asp:TextBox CssClass="form-control" ID="txtaddnewUnitName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Code
                              
                                    <asp:TextBox CssClass="form-control" ID="txtaddnewUnitcode" runat="server" MaxLength="6"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary" ID="btnAddNewsave" runat="server" Text="Submit"
                                        OnClick="btnAddNewsave_Click" />
                                    <asp:Button CssClass="btn btn-primary" ID="BtnAddNewCancel" runat="server" Text="Cancel"
                                        OnClick="BtnAddNewCancel_Click" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </asp:Panel>





            <div style="display: none">

                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" />
            </div>
            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                Enabled="True">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Item Group</h4>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Code
                            
                                    <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" MaxLength="6" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Name
                                    </div>

                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary" ID="btnAddNewGroupname" runat="server" Text="Submit"
                                        OnClick="btnAddNewGroupname_Click" />
                                    <asp:Button CssClass="btn btn-primary" ID="BtnCancelAddNewGroupName" runat="server"
                                        Text="Cancel" OnClick="BtnCancelAddNewGroupName_Click" />
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
                            <h4 class="modal-title">>Edit Item</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Group
                                      
                                            <asp:Label ID="LblEditGroup" runat="server">
                                            </asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Item Name
                                     
                                            <asp:TextBox CssClass="form-control" ID="TxtEditItem" runat="server" onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Unit
                                     
                                            <asp:Label ID="lblEditUnit" runat="server">
                                            </asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Make
                                   
                                            <asp:Label ID="lblEditMake" runat="server" onblur="valid(this)" onkeyup="valid(this)"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Part No.
                                   
                                            <asp:TextBox CssClass="form-control" ID="txtEditPartNo" runat="server" onblur="valid(this)"
                                                onkeyup="valid(this)"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary" ID="EditSubmit" runat="server" Text="Submit"
                                        OnClick="EditSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary" ID="EditCancel" runat="server" Text="Cancel"
                                        OnClick="EditCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                </div>



            </asp:Panel>
            <div style="display: none">
                <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" />

            </div>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"
                Enabled="True">
            </cc1:ModalPopupExtender>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

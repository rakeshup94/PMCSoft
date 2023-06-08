<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddItemMaster"
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
                        <div class="mb-3">
                            Group Name

                        <div class="input-group">
                            <asp:DropDownList CssClass="form-select" ID="ddlGroup" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlitemGropgrid_SelectedIndexChanged">
                            </asp:DropDownList>

                            <div class="input-group-addon">
                                <asp:LinkButton runat="server" ID="btnRun" Text="<i class='fa fa-plus text-green'></i>"
                                    OnClick="LnkAddNewGroupName_Click" CssClass="mediumtxt ps-3" />


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

                        <div class="input-group">
                            <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server">
                            </asp:DropDownList>

                            <div class="input-group-addon">
                                <asp:LinkButton runat="server" ID="LnkAddNewUnit" Text="<i class='fa fa-plus text-green'></i>"
                                    OnClick="LnkAddNewUnit_Click" CssClass="mediumtxt ps-3" />


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
                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server"
                            Text="Submit"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server"
                            Text="Cancel"
                            OnClick="btnCancel_Click" />
                    </div>
                </div>


            </div>




        </div>






        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">

                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                            ID="GridView1" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Record Found"
                            OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">

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
                                        <asp:LinkButton CssClass="btn btn-default btn-xs" ID="lnkEmpEdit" runat="server"
                                            CommandName="EditDetail"><i class='fa fa-edit'></i> Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>





    </div>



    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <div style="display: none">

                <asp:Button CssClass="btn btn-primary btn-square" ID="Button3" runat="server" />
            </div>
            <cc1:modalpopupextender id="ModalPopupExtender3" runat="server" backgroundcssclass="popUpStyle"
                popupcontrolid="Panel3" targetcontrolid="Button3" enableviewstate="False"
                enabled="True">
            </cc1:modalpopupextender>
            <asp:Panel ID="Panel3" runat="server" Style="display: none;">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Unit</h4>


                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        Name
                           
                                    <asp:TextBox CssClass="form-control" ID="txtaddnewUnitName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-6">
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
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewsave" runat="server"
                                        Text="Submit"
                                        OnClick="btnAddNewsave_Click" />

                                </div>
                            </div>
                        </div>


                        <div class="modal-footer">

                            <asp:Button CssClass="btn btn-danger btn-square" ID="BtnAddNewCancel" runat="server"
                                Text="Cancel"
                                OnClick="BtnAddNewCancel_Click" />
                        </div>

                    </div>
                </div>

            </asp:Panel>





            <div style="display: none">

                <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" />
            </div>
            <cc1:modalpopupextender id="ModalPopupExtender2" runat="server" backgroundcssclass="popUpStyle"
                popupcontrolid="Panel2" targetcontrolid="Button1" enableviewstate="False"
                enabled="True">
            </cc1:modalpopupextender>
            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Item Group</h4>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        Code
                            
                                    <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" MaxLength="6" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        Name
                                  

                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)">
                                    </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewGroupname" runat="server"
                                        Text="Submit"
                                        OnClick="btnAddNewGroupname_Click" />

                                </div>
                            </div>



                        </div>






                        <div class="modal-footer">

                            <asp:Button CssClass="btn btn-danger btn-square" ID="BtnCancelAddNewGroupName" runat="server"
                                Text="Cancel"
                                OnClick="BtnCancelAddNewGroupName_Click" />
                        </div>











                    </div>
                </div>
            </asp:Panel>


























            <asp:Panel ID="Panel1" runat="server" Style="display: none;">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Item</h4>


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
                                        Item Name
                                     
                                            <asp:TextBox CssClass="form-control" ID="TxtEditItem" runat="server" onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
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
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="EditSubmit" runat="server"
                                        Text="Submit"
                                        OnClick="EditSubmit_Click" />

                                </div>
                            </div>
                        </div>






                        <div class="modal-footer">

                            <asp:Button CssClass="btn btn-danger btn-square" ID="EditCancel" runat="server" Text="Cancel"
                                OnClick="EditCancel_Click" />
                        </div>










                    </div>


                </div>




            </asp:Panel>
            <div style="display: none">
                <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" />

            </div>
            <cc1:modalpopupextender id="ModalPopupExtender1" runat="server" backgroundcssclass="popUpStyle"
                popupcontrolid="Panel1" targetcontrolid="Button2" enableviewstate="False"
                enabled="True">
            </cc1:modalpopupextender>


        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

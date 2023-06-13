<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddItemMaster" Codebehind="AddItemMaster.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Item Detail</div>
                        <div class="row"   >
                            <div class="row"   >
                                <div class="col-lg-4" >
                                    Group Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList CssClass="form-select" ID="ddlitemGropgrid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlitemGropgrid_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false"  
                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trans id" Visible="false">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnItemGroupID" runat="server" Value='<%#Bind("ItemGroupID") %>' />
                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnit" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnUnitID" runat="server" Value='<%#Bind("UnitID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Make">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMake" runat="server" Text='<%#Bind("Make") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Part No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPartNo" runat="server" Text='<%#Bind("PartNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEmpEdit" runat="server" Text="Edit" CommandName="EditDetail"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"    >
                                    <div class="card-body">
                                        <div class="card-header">
                                            Add Item</div>
                                        <div class="row"    >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <br />
                                                    Group Name
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlGroup" runat="server"  >
                                                    </asp:DropDownList>
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="LnkAddNewGroupName" runat="server" Text="+" OnClick="LnkAddNewGroupName_Click">
                                                    </asp:Button>
                                                    <div style="display: none">
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  
                                                        PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"  
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel2" runat="server" Style="display: none;   ">
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    <div id="Div1">
                                                                        <div class="card-header">
                                                                            Add Item Group</div>
                                                                        <div class="row"    >
                                                                            <div class="row" >
                                                                                <div class="col-lg-4" >
                                                                                    Code
                                                                                </div>
                                                                                <div class="col-lg-4" >
                                                                                    <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" MaxLength="6"   onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row" >
                                                                                <div class="col-lg-4" >
                                                                                    Name
                                                                                </div>
                                                                                <div class="col-lg-4" >
                                                                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server"   onkeyup="valid(this)" onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row" >
                                                                                <div class="col-lg-4"    >
                                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewGroupname" runat="server" Text="Submit" OnClick="btnAddNewGroupname_Click" />
                                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnCancelAddNewGroupName" runat="server" Text="Cancel" OnClick="BtnCancelAddNewGroupName_Click" />
                                                                                </div>
                                                                            </div>
                                                                          </div>
                                                          </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Item Name
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtItemName" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Unit
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server"  >
                                                    </asp:DropDownList>
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="LnkAddNewUnit" runat="server" Text="+" 
                                                        onclick="LnkAddNewUnit_Click"></asp:Button>
                                                    <div style="display: none">
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button3" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"  
                                                        PopupControlID="Panel3" TargetControlID="Button3" EnableViewState="False"  
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel3" runat="server" Style="display: none;   ">
                                                        <div class="card-body">
                                                            <div class="card-header">
                                                                Add Unit</div>
                                                            <div class="row"   >
                                                                <div class="row" >
                                                                    <div class="col-lg-4" >
                                                                        Name
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        <asp:TextBox CssClass="form-control" ID="txtaddnewUnitName" runat="server"   onkeyup="valid(this)" onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4" >
                                                                        Code
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        <asp:TextBox CssClass="form-control" ID="txtaddnewUnitcode" runat="server" MaxLength="6"   onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"    >
                                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewsave" runat="server" Text="Submit" 
                                                                            onclick="btnAddNewsave_Click"/>
                                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="BtnAddNewCancel" runat="server" Text="Cancel" 
                                                                            onclick="BtnAddNewCancel_Click" />
                                                                    </div>
                                                                </div>
                                                              </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Make
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtItemMake" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                         ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Part No.
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtItemPartNo" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                         ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
                                            </div>
                                          </div>
                                    </div>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
            <div style="display: none">
                <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
            </div>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"  
                Enabled="True">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" Style="display: none;   ">
                <div class="row"   >
                    <div class="row" >
                        <div class="col-lg-4" >
                            <div class="card-body">
                                <div class="card-header">
                                    Edit Item</div>
                                <div class="row"    >
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Group
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:Label ID="LblEditGroup" runat="server"  >
                                            </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Item Name
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:TextBox CssClass="form-control" ID="TxtEditItem" runat="server"   onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Unit
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:Label ID="lblEditUnit" runat="server"  >
                                            </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Make
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:Label ID="lblEditMake" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                 ></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Part No.
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:TextBox CssClass="form-control" ID="txtEditPartNo" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                 ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"    >
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="EditSubmit" runat="server" Text="Submit" OnClick="EditSubmit_Click" />
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="EditCancel" runat="server" Text="Cancel" OnClick="EditCancel_Click" />
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

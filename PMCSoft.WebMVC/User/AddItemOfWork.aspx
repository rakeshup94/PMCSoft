<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddItemOfWork"
    CodeBehind="AddItemOfWork.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Item Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-header">
                        Add Item
                    </div>
                    <div class="card-body">

                        <div class="row">

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Item Of Work
                           
                                    <asp:TextBox CssClass="form-control" ID="txtItemName" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-8 mt-4">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>

                        <div class="row mtm">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GridView1" runat="server" AutoGenerateColumns="false"
                                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                                    OnRowUpdating="GridView1_RowUpdating" EmptyDataText="No Record Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("ItemID") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Of Work">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'
                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:CommandField UpdateText="<i class='fa fa-save text-green mediumtxt'></i>" CancelText="<i class='fa fa-times text-red mediumtxt'></i>"
                                            ShowEditButton="true" EditText="<i class='fa fa-edit mediumtxt'></i>" />
                                    </Columns>

                                </asp:GridView>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

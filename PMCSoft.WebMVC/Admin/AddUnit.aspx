<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddUnit"
    CodeBehind="AddUnit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Unit Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-header">
                        Add Unit
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Name
                                       
                                                <asp:TextBox CssClass="form-control" ID="txtName" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)">
                                                </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Code
                                        
                                                <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" MaxLength="6" onkeyup="valid(this)"
                                                    onblur="valid(this)">
                                                </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button btn btn-primary btn-square ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button btn btn-primary btn-square ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>










                <div class="card">
                    <div class="card-body">

                        <div class="row">

                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn" ID="GVUnit" runat="server" AutoGenerateColumns="false"
                                    GridLines="Both"
                                    OnRowCancelingEdit="GVUnit_RowCancelingEdit" OnRowEditing="GVUnit_RowEditing"
                                    OnRowUpdating="GVUnit_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUnitName" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtUnitName" runat="server" Text='<%#Bind("UnitName") %>'
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUnitCode" runat="server" Text='<%#Bind("UnitCode") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtUnitCode" runat="server" Text='<%#Bind("UnitCode") %>'
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemStyle Width="250px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Button" ShowEditButton="true" />
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

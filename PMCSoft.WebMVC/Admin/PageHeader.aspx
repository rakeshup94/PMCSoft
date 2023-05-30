<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.PageHeader" Title="Untitled Page" Codebehind="PageHeader.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Unit Detail</h3>
                        <div class="row"   >
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4"  style="vertical-align: top; width: 600px;">
                                    <asp:GridView CssClass="table table-striped"  ID="GVPage" runat="server" AutoGenerateColumns="false" GridLines="Both">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Page Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPageName" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                </ItemTemplate>
                                              
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("UnitCode") %>'></asp:Label>
                                                </ItemTemplate>
                                               
                                                <ItemStyle Width="250px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"    >
                                    <div class="card-body">
                                        <h3 class="reallynow">
                                            Add Page</h3>
                                        <div class="row"    >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Menu Header
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server"   onkeyup="valid(this)" onblur="valid(this)">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" 
                                                        onclick="btnSubmit_Click"  />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" 
                                                        onclick="btnCancel_Click" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


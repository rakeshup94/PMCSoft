<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Inventory.ViewOpeningStockDetail" Codebehind="ViewOpeningStockDetail.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Stock Opening</div>
                        <div class="row"  style="width: 920px;">
                         
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 100px; text-align: center;">
                                    Project:
                                </div>
                                <div class="col-lg-4"  style="width: 260px;">
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    &nbsp;
                                </div>
                            </div>
                          </div>
                        <div class="row"    >
                            <div class="row" >
                                <div class="col-lg-4"  colspan="9">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVOpeningStock" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                        Width="920" EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Group">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="140px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnitName" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Make">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMake" runat="server" Text='<%#Bind("Make") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Part No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPartNo" runat="server" Text='<%#Bind("PartNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQty" runat="server" Text='<%#Bind("Qty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opening Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastOpeningDate" runat="server" Text='<%#Bind("LastOpeningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top"   HorizontalAlign="Center" />
                                            </asp:TemplateField>
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

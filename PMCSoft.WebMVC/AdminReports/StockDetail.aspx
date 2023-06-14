<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.StockDetail" Codebehind="StockDetail.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Stock Detail</div>
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4"  style="font-weight: bold;">
                                    Project:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblProj" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"    >
                                 <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView5" runat="server" AutoGenerateColumns="false" Width="900px">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Item Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName") %>'>
                                                                        </asp:Label>
                                                                        <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                       <%-- <asp:HiddenField ID="hdnItemGroupID" runat="server" Value='<%#Bind("ItemGroupID") %>' />--%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Today Receive">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTodayReceive" runat="server" Text='<%#Bind("MR") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total Receive">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTotalStock" runat="server" Text='<%#Bind("SQ") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                           
                                                        </asp:GridView>
                                </div>
                            </div>
                          </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

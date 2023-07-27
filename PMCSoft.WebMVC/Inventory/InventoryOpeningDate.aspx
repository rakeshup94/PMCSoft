<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Inventory.InventoryOpeningDate"
    CodeBehind="InventoryOpeningDate.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Inventory Opening Date</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GvStockOpeningDate" runat="server" AutoGenerateColumns="false"
                                    EmptyDataText="No Record Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">

                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>. 
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="ProjectName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>' Width="200"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Opening date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOpeningdate" runat="server" Text='<%#Bind("Openingdate") %>' Width="200"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="card-header">
                            Add Opening Date
                        </div>



                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project
                                        
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server">
                                                </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">

                                <div class="mb-3">
                                    Store Opening Date
                                        
                                                <asp:TextBox CssClass="form-control" ID="txtOpeningDate" runat="server" Width="200"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOpeningDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true"></cc1:CalendarExtender>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

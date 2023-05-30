<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Inventory.InventoryOpeningDate" Codebehind="InventoryOpeningDate.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Inventory Opening Date</h3>
                            
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4"  style="vertical-align: top; width: 520px;">
                                    <asp:GridView CssClass="table table-striped"  ID="GvStockOpeningDate" runat="server" AutoGenerateColumns="false" Width="510px"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                         <asp:TemplateField HeaderText="S.No">
                                                <ItemStyle Width="30px" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
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
                                <div class="col-lg-4"  style="vertical-align: top; width: 400px;">
                                    <div class="card-body">
                                        <h3 class="reallynow">
                                            Add Opening Date</h3>
                                        <div class="row"  style="width: 390px; vertical-align: top;">
                                            <div class="row" >
                                                <div class="col-lg-4"  style="width: 150px; text-align: center;">
                                                    Project
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="width: 150px; text-align: center;">
                                                    Store Opening Date
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtOpeningDate" runat="server" Width="200"></asp:TextBox>
                                                       <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOpeningDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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

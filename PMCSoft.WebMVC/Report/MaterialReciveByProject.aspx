﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.MaterialReciveByProject" CodeBehind="MaterialReciveByProject.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Matrial Recive Project Wise</div>
                </div>
                <ol class="breadcrumb page-breadcrumb">
                </ol>
                <div class="clearfix"></div>
            </div>


            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->


            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-4 offset-sm-4">
                                <div class="mb-3">
                                    Project                               
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn" ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                        EmptyDataText="No Records Found" OnPageIndexChanging="GVMaterialReceive_PageIndexChanging"
                                        PageSize="50">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">

                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>. 
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gate Entry No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGateentoryno" runat="server" Text='<%#Bind("Gate_Entry_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Po No" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpono" runat="server" Text='<%#Bind("PO_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Po date" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblPodate" runat="server" Text='<%#Bind("Podate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Lblprojectname" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvendor" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbladdress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill/Challan No">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBillChallanNo" runat="server" Text='<%#Bind("Bill_Challan_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBillChallanDate" runat="server" Text='<%#Bind("Bill_Challan_Date") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Code" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitemcode" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitemname" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblunit" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQty" runat="server" Text='<%#Bind("Item_Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Item_Rate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Recived By">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblrecivedBy" runat="server" Text='<%#Bind("recivedby") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblreciveddate" runat="server" Text='<%#Bind("Received_Date") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                        </Columns>


                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

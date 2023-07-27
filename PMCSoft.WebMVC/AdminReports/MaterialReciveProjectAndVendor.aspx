﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.MaterialReciveProjectAndVendor"
    CodeBehind="MaterialReciveProjectAndVendor.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Matrial Recive Vendor Wise</div>
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
                            <div class="col-lg-3">
                                <div class="mb-3">
                                    Project
                               
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="mb-3">
                                    Vender
                              
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="col-lg-3">
                                <div class="mb-3">
                                    From Date
                           
                        
                                    <asp:TextBox CssClass="form-control" ID="Txtfrom" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtfrom"
                                        CssClass="cal_Theme1"></cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="mb-3">
                                    To Date
                           
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1"></cc1:CalendarExtender>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="View Detail"
                                    OnClick="BtnReport_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                    EmptyDataText="No Records Found">
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
                                        <asp:TemplateField HeaderText="P.O No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpono" runat="server" Text='<%#Bind("PO_No") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="LblPodate" runat="server" Text='<%#Bind("Podate") %>'></asp:Label>
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
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
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
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
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
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
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

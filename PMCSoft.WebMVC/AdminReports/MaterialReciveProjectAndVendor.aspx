﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.MaterialReciveProjectAndVendor" Codebehind="MaterialReciveProjectAndVendor.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -80px;">
                <div class="card"  style="width: 1100px;">
                    <div class="card-body">
                        <div class="card-header">
                            Matrial Recive Vendor Wise</div>
                        <div class="row"  style="width: 1090px;">
                            <%--<tr>
                                <div class="col-lg-4"  colspan="9" style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Ahluwalia Contracts (India) Ltd.
                                </div>
                            </div>--%>
                            <div class="row" >
                                <div class="col-lg-4"   >
                                    Project
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    Vender
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                    TO Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                    From Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="Txtfrom" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtfrom"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="View Detail" OnClick="BtnReport_Click" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="9">
                                    <div class="row"  style="width: 1080px;">
                                        <div class="row" >
                                            <div class="col-lg-4"  colspan="10">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                                    Width="1070px" EmptyDataText="No Records Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Gate Entry No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGateentoryno" runat="server" Text='<%#Bind("Gate_Entry_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Project" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Lblprojectname" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="250px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendor">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblvendor" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Address" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbladdress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="P.O No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblpono" runat="server" Text='<%#Bind("PO_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblPodate" runat="server" Text='<%#Bind("Podate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bill/Challan No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblBillChallanNo" runat="server" Text='<%#Bind("Bill_Challan_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBillChallanDate" runat="server" Text='<%#Bind("Bill_Challan_Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Item Code" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblitemcode" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Item Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblitemname" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Unit">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblunit" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quantity">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblQty" runat="server" Text='<%#Bind("Item_Quantity") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Item_Rate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Recived By">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblrecivedBy" runat="server" Text='<%#Bind("recivedby") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblreciveddate" runat="server" Text='<%#Bind("Received_Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                   
                                                    <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                </asp:GridView>
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
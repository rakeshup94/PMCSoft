<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.MaterialReciveByPONo" Codebehind="MaterialReciveByPONo.aspx.cs" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"  style="width: 1000px;">
                    <div class="card-body">
                        <div class="card-header">
                            Matrial Recive By Project</div>
                        <div class="row"  style="width: 950px;">
                            <div class="row" >
                               
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true" 
                                        Width="140px" onselectedindexchanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    Vender
                                
                                 <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server" Width="140px" AutoPostBack="true" onselectedindexchanged="ddlVendor_SelectedIndexChanged"
                                        >
                                        <asp:ListItem Text="Select Vendor" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    PO.No
                                    <asp:DropDownList CssClass="form-select" ID="ddlpono" runat="server" Width="120px" AutoPostBack="true"
                                        >
                                        <asp:ListItem Text="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                      TO Date
                                     <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                    From Date
                                     <asp:TextBox CssClass="form-control" ID="Txtfrom" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtfrom"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                    Report
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="Report" 
                                        onclick="BtnReport_Click" />
                                </div>
                                 
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"  style="width: 950px;">
                                        <div class="row" >
                                            <div class="col-lg-4"  colspan="10">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                       Width="100%"  EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemStyle Width="20px" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Project" Visible="false" >
                                                <ItemTemplate>
                                                    <asp:Label ID="Lblprojectname" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="250px"/>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvendor" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"/>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbladdress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Gate Entery No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGateentoryno" runat="server" Text='<%#Bind("Gate_Entry_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Po No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpono" runat="server" Text='<%#Bind("PO_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Po date">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblPodate" runat="server" Text='<%#Bind("Podate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Recived Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblreciveddate" runat="server" Text='<%#Bind("Received_Date") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Recived By">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblrecivedBy" runat="server" Text='<%#Bind("recivedby") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Bill/Challan No">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBillChallanNo" runat="server" Text='<%#Bind("Bill_Challan_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Bill/Challan Date.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBillChallanDate" runat="server" Text='<%#Bind("Bill_Challan_Date") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitemcode" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                   <asp:Label ID="lblitemname" runat="server"  Text='<%#Bind("ItemName") %>'></asp:Label>
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
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                       <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Item_Rate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
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


<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.MaterialReciveProjectAndVendor" Codebehind="MaterialReciveProjectAndVendor.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -80px;">
                <div id="content" style="width: 1100px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Matrial Recive Vendor Wise</h3>
                        <table style="width: 1090px;">
                            <%--<tr>
                                <td colspan="9" style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Ahluwalia Contracts (India) Ltd.
                                </td>
                            </tr>--%>
                            <tr>
                                <td style="font-size: 15px; font-family: Cambria;">
                                    Project
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true" Width="200px"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    Vender
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlVendor" runat="server" Width="205px" AutoPostBack="true">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                   From  Date
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                     TO Date
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtfrom" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txtfrom"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Button ID="BtnReport" runat="server" Text="View Detail" OnClick="BtnReport_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9">
                                    <table style="width: 1080px;">
                                        <tr>
                                            <td colspan="10">
                                                <asp:GridView ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="false"
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
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
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
                                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="200px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Address" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbladdress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="P.O No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblpono" runat="server" Text='<%#Bind("PO_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
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
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
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
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Item Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblitemname" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Unit">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblunit" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
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
                                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Recived By">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblrecivedBy" runat="server" Text='<%#Bind("recivedby") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblreciveddate" runat="server" Text='<%#Bind("Received_Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                    <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

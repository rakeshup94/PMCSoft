<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Inventory_ViewOpeningStockDetail" Codebehind="ViewOpeningStockDetail.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Stock Opening</h3>
                        <table style="width: 920px;">
                            <tr>
                                <td colspan="18" style="text-align: center; font-size: 30px; font-family: Cambria;">
                                    Ahluwalia Contracts (India) Ltd.
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: center;">
                                    Project:
                                </td>
                                <td style="width: 260px;">
                                    <asp:DropDownList ID="ddlProject" runat="server" Width="250px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table style="width: 940px;">
                            <tr>
                                <td colspan="9">
                                    <asp:GridView ID="GVOpeningStock" runat="server" AutoGenerateColumns="false" ShowFooter="false"
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
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
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
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Make">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMake" runat="server" Text='<%#Bind("Make") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Part No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPartNo" runat="server" Text='<%#Bind("PartNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQty" runat="server" Text='<%#Bind("Qty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="200px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opening Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastOpeningDate" runat="server" Text='<%#Bind("LastOpeningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="100px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

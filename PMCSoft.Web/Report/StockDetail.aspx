<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Report_StockDetail" Codebehind="StockDetail.aspx.cs" %>

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
                            Stock Detail</h3>
                        <table style="width: 930px">
                            <tr>
                                <td style="font-weight: bold;">
                                    Project:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblProj" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" Width="900px">
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
                                                            <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                        </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

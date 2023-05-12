<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="Admin_BOQItems" Codebehind="BOQItems.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset style="border-width: 2px;">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                    <HeaderTemplate>
                                        BOQ Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Item Name
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCategory" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <%--Item No.--%>
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox ID="txtBOQItemNo" runat="server" Width="200px"></asp:TextBox>--%>
                                                </td>
                                                <td style="width: 400px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Description of Item
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlUnit" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="height: 20px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                    <HeaderTemplate>
                                        BOQ Sub-Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategory" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Sub-Items
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubCategory" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td style="width: 400px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Description of Item
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubDescription" runat="server" TextMode="MultiLine" Width="200px">
                                                    </asp:TextBox>
                                                </td>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubUnit" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="height: 20px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnSubSubmit" runat="server" Text="Submit" OnClick="btnSubSubmit_Click" />
                                                    <asp:Button ID="btnSubCancel" runat="server" Text="Cancel" OnClick="btnSubCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab3" runat="server" TabIndex="2">
                                    <HeaderTemplate>
                                        BOQ Sub-Items Part</HeaderTemplate>
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPartCategory" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Sub-Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPartSubCategory" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 300px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Sub-Items Part
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPart" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Description of Sub-Item Part
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPartDescription" runat="server" TextMode="MultiLine" Width="200px">
                                                    </asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPartUnit" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="height: 20px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnPartSubmit" runat="server" Text="Submit" OnClick="btnPartSubmit_Click" />
                                                    <asp:Button ID="btnPartCancel" runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

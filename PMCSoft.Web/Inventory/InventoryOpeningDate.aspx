<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="Inventory_InventoryOpeningDate" Codebehind="InventoryOpeningDate.aspx.cs" %>

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
                            Inventory Opening Date</h3>
                            
                        <table style="width: 930px; vertical-align: top;">
                            <tr>
                                <td style="vertical-align: top; width: 520px;">
                                    <asp:GridView ID="GvStockOpeningDate" runat="server" AutoGenerateColumns="false" Width="510px"
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
                                </td>
                                <td style="vertical-align: top; width: 400px;">
                                    <div id="rightnow">
                                        <h3 class="reallynow">
                                            Add Opening Date</h3>
                                        <table style="width: 390px; vertical-align: top;">
                                            <tr>
                                                <td style="width: 150px; text-align: center;">
                                                    Project
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlProject" runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 150px; text-align: center;">
                                                    Store Opening Date
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOpeningDate" runat="server" Width="200"></asp:TextBox>
                                                       <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOpeningDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

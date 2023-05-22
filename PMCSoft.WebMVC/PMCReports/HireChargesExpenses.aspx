<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.HireChargesExpenses" Codebehind="HireChargesExpenses.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 950px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            HIRE CHARGES EXPENSES</h3>
                        <table style="width: 950px;">
                    
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                                        Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    HIRE CHARGES EXPENSES REPORT FOR THE MONTH OF --&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 950px;">
                                        <tr>
                                            <td colspan="8">
                                                <asp:GridView ID="GvHireChargesExpenses" runat="server" AutoGenerateColumns="false"
                                                    ShowFooter="true" Width="500" OnRowDataBound="GvHireChargesExpenses_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DESCRIPTION">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtDESCRIPTION" Width="100px" TextMode="MultiLine" runat="server"
                                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="MODEL">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtMODEL" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="VENDOR`S NAME">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="ddlVendor" runat="server" Width="150px" AutoPostBack="true">
                                                                    <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date of Installation">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtDateofInstallation" Width="100px" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateofInstallation"
                                                                    CssClass="cal_Theme1">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="QTY.">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtQTY" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQTY"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AMOUNT">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtAMOUNT" runat="server" Width="100px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAMOUNT"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="180px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature / Purpose of work for which the equipment is  on Hire">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtNature" Width="180px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                                <asp:Button ID="btnAddMore" runat="server" Text="Add More" OnClick="btnAddMore_Click" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle VerticalAlign="Top" Width="200px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                    <FooterStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                                    onclick="btnCancel_Click" />
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

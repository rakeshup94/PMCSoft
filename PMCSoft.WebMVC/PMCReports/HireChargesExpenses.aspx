<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.HireChargesExpenses" Codebehind="HireChargesExpenses.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 950px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            HIRE CHARGES EXPENSES</h3>
                        <div class="row"  style="width: 950px;">
                    
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    HIRE CHARGES EXPENSES REPORT FOR THE MONTH OF --&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row"  style="width: 950px;">
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
                                                                <asp:TextBox CssClass="form-control" ID="txtDESCRIPTION" Width="100px" TextMode="MultiLine" runat="server"
                                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="MODEL">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtMODEL" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="VENDOR`S NAME">
                                                            <ItemTemplate>
                                                                <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true">
                                                                    <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date of Installation">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtDateofInstallation" Width="100px" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateofInstallation"
                                                                    CssClass="cal_Theme1">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="QTY.">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtQTY" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQTY"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AMOUNT">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAMOUNT" runat="server" Width="100px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAMOUNT"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="180px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature / Purpose of work for which the equipment is  on Hire">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtNature" Width="180px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                                <asp:Button CssClass="btn btn-primary" ID="btnAddMore" runat="server" Text="Add More" OnClick="btnAddMore_Click" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                    <FooterStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" 
                                                    onclick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                      </div>
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="User_MaterialReceive" Title="Material Receive" Codebehind="MaterialReceive.aspx.cs" %>

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
                            Material Receive</h3>
                        <table style="width: 940px; vertical-align: top;">
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Project
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="True" Width="205px"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Vender
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList ID="ddlVendor" runat="server" Width="205px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                        onblur="valid(this)" Width="205px" ReadOnly="true" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Gate Entry No
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtGateEntryNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    PO.No
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtPoNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    PO.Date
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtPOdate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtPOdate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Received.Date
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtReceivedDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtReceivedDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Received By
                                </td>
                                <td>
                                    <asp:DropDownList ID="DdlReceivedBy" runat="server" AutoPostBack="True" Width="205px"
                                        OnSelectedIndexChanged="DdlReceivedBy_SelectedIndexChanged">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan No.
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtBillChallanNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan Date.
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtBillChallanDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtBillChallanDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 940px;">
                            <tr>
                                <td colspan="6">
                                    <asp:GridView ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                        Width="925" OnRowDataBound="GVMaterialReceive_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Group">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlItemCode" runat="server" Width="150px" OnSelectedIndexChanged="ddlItemCode_SelectedIndexChanged"
                                                        AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlItemName" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlUnit" runat="server" Width="100px" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtQuantity" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQuantity"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRate" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRemarks" Width="200px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle VerticalAlign="Top" Width="200px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                                <tr>
                                    <td colspan="6" style="text-align: center;">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </td>
                                </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

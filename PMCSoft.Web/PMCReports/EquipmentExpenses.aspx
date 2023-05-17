<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCReports_EquipmentExpenses" Codebehind="EquipmentExpenses.aspx.cs" %>

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
                            EQUIPMENT EXPENSES</h3>
                        <table style="width: 930px;">
                          
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged" Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Equipment Expenses Report As On&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <table style="width: 920px; border: 1px solid black; border-collapse: collapse;">
                                                <tr>
                                                    <td rowspan="2" style="width: 40px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        S.No
                                                    </td>
                                                    <td rowspan="2" style="width: 200px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Equipment Detail
                                                    </td>
                                                    <td colspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Upto Previous Months
                                                        <asp:TextBox ID="txtPreviousMonth" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPreviousMonth"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                    <td colspan="2" style="width: 220px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Current Months
                                                        <asp:TextBox ID="txtCurrentMonth" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtCurrentMonth"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                    <td colspan="2" style="width: 200px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Up To Date
                                                        <asp:TextBox ID="txtUpToDate" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtUpToDate"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 125px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </td>
                                                    <td style="width: 125px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </td>
                                                    <td style="width: 110px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </td>
                                                    <td style="width: 110px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </td>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtEquipmentDetail" runat="server" Text='<%#Bind("EquipmentDetail") %>'
                                                        onkeyup="valid(this)" onblur="valid(this)" Width="175px">
                                                    </asp:TextBox>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtPMRepairs" runat="server" Text='<%#Bind("PMRepairs") %>' Width="100px">
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPMRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtPMFuel" runat="server" Text='<%#Bind("PMFuel") %>' Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtPMFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtCMRepairs" runat="server" Text='<%#Bind("CMRepairs") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCMRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtCMFuel" runat="server" Text='<%#Bind("CMFuel") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtCMFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtUTRepairs" runat="server" Text='<%#Bind("UTRepairs") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtUTRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtUTFuel" runat="server" Text='<%#Bind("UTFuel") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtUTFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <tr>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                </td>
                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                                                </td>
                                            </tr>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                        onclick="btnSubmit_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                        onclick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

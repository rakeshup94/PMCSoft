<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyVWD" Codebehind="MonthlyVWD.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            MONTHLY VWD (FORMAT No. C)</h3>
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
                                    Status of Work Done / Plan As On&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDate" runat="server"
                                        Width="100px" Enabled="false" ReadOnly="true"></asp:TextBox>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                        <HeaderTemplate>
                                            <table style="width: 920px; border: 1px solid black; border-collapse: collapse;">
                                                <tr>
                                                    <td rowspan="3" style="width: 40px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        S.No
                                                    </td>
                                                    <td rowspan="3" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Month
                                                    </td>
                                                    <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Plan (Rs.)
                                                    </td>
                                                    <td colspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Actual (Rs.)
                                                    </td>
                                                    <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Variation (Rs.)
                                                    </td>
                                                    <td rowspan="3" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Remarks
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        VWD
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Escl.
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Extra Item
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Total
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        A
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        B
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        C
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        D
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        E = (B + C + D)
                                                    </td>
                                                    <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        F = (A - B)
                                                    </td>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("Periods") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:HiddenField ID="hdnDates" runat="server" Value='<%#Bind("Dates") %>' />
                                                    <asp:HiddenField ID="hdnMonths" runat="server" Value='<%#Bind("Months") %>' />
                                                    <asp:HiddenField ID="hdnYears" runat="server" Value='<%#Bind("Years") %>' />
                                                    <asp:Label ID="lblFiscMonths" runat="server" Text='<%#Bind("FiscMonths") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtPlan" runat="server" Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPlan"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtActualVWD" runat="server" Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtActualVWD"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtActualEscl" runat="server" Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtActualEscl"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtExtraItem" runat="server" Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtExtraItem"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtTotal" runat="server" Width="80px" ReadOnly="true" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtVariation" runat="server" Width="80px" ReadOnly="true" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <tr>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    GRAND TOTAL
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblPlan" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualVWD" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualEscl" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualExtraItem" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualTotal" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblVariation" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Button ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" Text="Calculate"
                                                        BackColor="#33ccff" BorderColor="Navy" />
                                                </td>
                                            </tr>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">
                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

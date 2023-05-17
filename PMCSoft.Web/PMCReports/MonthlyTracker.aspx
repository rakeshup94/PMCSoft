<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCReports_MonthlyTracker" Codebehind="MonthlyTracker.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -100px;">
                <div id="content" style="width: 1750px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            FINANCIAL COMPARISION OF PLAN vis-à-vis ACTUAL													
                           </h3>
                        <table>
                       
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    <table style="width: 910px;">
                                        <tr>
                                            <td>
                                                Project
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlProject" runat="server" Width="200px" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                Form Month
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" Style="width: auto;">
                                                    <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                                    <asp:ListItem Text="February" Value="02"></asp:ListItem>
                                                    <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                                    <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                                    <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                                    <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                                    <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                                    <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                                    <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                                    <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                    <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlSDaysYear" runat="server" AutoPostBack="true" Style="width: auto;">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                To Month
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDlToMonth" runat="server" AutoPostBack="true" Style="width: auto;">
                                                    <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                                    <asp:ListItem Text="February" Value="02"></asp:ListItem>
                                                    <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                                    <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                                    <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                                    <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                                    <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                                    <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                                    <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                                    <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                    <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="DDLTOYear" runat="server" AutoPostBack="true" Style="width: auto;">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button ID="BtnReport" runat="server" Text="Report" OnClick="BtnReport_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPrint" runat="server" Text="Print Preview" OnClick="btnPrint_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Monthly Tracker / Comparision of Plan / Actual
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="1700" Visible="false">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td rowspan="3" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        <asp:Label ID="Label5" runat="server" Text=" Particulars" Width="200" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Previous Month
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        C = A - B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl1" runat="server" Text="INCOME" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" Width="200px"  runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text="Total Income" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumincomeValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumincomesumParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumIncomeActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumIncomeActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumIncomeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumIncomeVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="Repeater2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Previous Month
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 50px; font-weight: bold;">
                                                                        C = A - B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl11" runat="server" Text="" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumEVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="Repeater3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Current  Month
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </td>
                                                                    <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        C = A - B
                                                                    </td>
                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl1" runat="server" Text="" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                               <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblSumCVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="RptExpenditure1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="EXPENDITURE" Width="200" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label2" runat="server" Text="PURCHASE/CONSUMPTION" Width="2" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEAVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label5" runat="server" Text="" Width="200" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptExpenditure2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label4" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtEBVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                  <asp:Label ID="Label1" runat="server" Text="" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptExpenditure3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label4" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="60px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="50px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="100px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                  <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="RptCon1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="CONSUMBLES" Width="7" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCAVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptCon2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtCBVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                 <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptCon3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="60px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="50px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="100px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="RptDirectExp1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="DIRECTEXPENSES" Width="20" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200px" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtDAVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptDirectExp2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text=""  Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptDirectExp3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                
                                                                 <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                 <asp:Label ID="Label7" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                 <asp:Label ID="Label8" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="RptHire1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="HIRECHARGES" Width="2" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200px" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtHAVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptHire2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptHire3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="RptIndirect1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="INDIRECTEXPENSES" Width="2" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: left; border: 1px solid black;">
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtIDAVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDPP" runat="server" Text="TOTAL EXPENSES" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>
                                                                
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                
                                                                     <asp:Label ID="Label11" runat="server" Width="200" Text="PROFIT/LOSS (A-B)" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                 
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptIndirect2" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>
                                                                
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text="" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                
                                                                 
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                                <td>
                                                    <asp:Repeater ID="RptIndirect3" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <tr>
                                                                    <td style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </td>
                                                                    <td colspan="14" style="border: 1px solid black;">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan" runat="server" Width="100px" Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtPPlan1" runat="server" Width="50px" Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual" runat="server" Width="100px" Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtActual1" runat="server" Width="50px" Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance" runat="server" Width="100px" Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right; border: 1px solid black;">
                                                                    <asp:Label ID="txtVariance1" runat="server" Width="50px" Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                 <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>
                                                                
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                                 <tr>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text="" Height="15"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                     <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </td>
                                                                
                                                                 
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                          
                                            <tr>
                                                <td  colspan="7" style="text-align: center;">
                                                
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                                        onclick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

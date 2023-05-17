<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCReports_MonthlyWorkDoneReport" Codebehind="MonthlyWorkDoneReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -150px;">
                <div id="content" style="width: 1250px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            MONTHLY WORK DONE</h3>
                        <table style="width: 1240px;">
                        
                            <td>
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
                                            Month
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" Style="width: auto;">
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
                                            <asp:DropDownList ID="ddlSDaysYear" runat="server" AutoPostBack="True" Style="width: 400;">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <td>
                                                <asp:Button ID="BtnReport" runat="server" Text="View" OnClick="BtnReport_Click" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPrint" runat="server" Text="Print Preview" OnClick="btnPrint_Click" />
                                            </td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%--<tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Monthly Work Done Status For The Month Of&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtMonth" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <table style="width: 1220px;">
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table style="border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </td>
                                                                <td rowspan="4" style="width: 220px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </td>
                                                                <td rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </td>
                                                                <td rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </td>
                                                                <td rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </td>
                                                                <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </td>
                                                                <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Variation (Rs.)
                                                                </td>
                                                                <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                    Balance
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td colspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    E
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    F = B - D
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    G = C - E
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    H = (A - D - E)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Bind("WDMParticularId") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblActual" runat="server" Text='<%#Bind("WDMParticularName") %>' Font-Bold="true"
                                                                    Height="15"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label2" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label3" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label4" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label5" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label6" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label7" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label8" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label9" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="Label10" runat="server" Width="60px" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Repeater ID="RptSub" runat="server" OnItemDataBound="RptSub_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; border: 1px solid black;">
                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text=""></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: left; border: 1px solid black;">
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text='<%#Bind("CurrUnit") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text='<%#Bind("CurrRate") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text='<%#Bind("CurrAwardedValue") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text='<%#Bind("CurrentvariationAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                    
                                                                                    
                                                                                </asp:Repeater>
                                                                                
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                    
                                                                </asp:Repeater>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
<tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                             
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server" Text="Grand Total"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label2220" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                               <asp:Label ID="Label21" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                 <asp:Label ID="Label23" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                  <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                  <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                 <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label30" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                  <asp:Label ID="Label31" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Label ID="Label32" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <%--<asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: left; border: 1px solid black;">
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtUnit" runat="server" Width="60px" Text='<%#Bind("CurrUnit") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtRate" runat="server" Width="60px" Text='<%#Bind("CurrRate") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAwardedValue" runat="server" Width="60px" Text='<%#Bind("CurrAwardedValue") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtQty" runat="server" Width="60px" Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="txtAmt" runat="server" Width="60px" Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label12" runat="server" Width="60px" Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label13" runat="server" Width="60px" Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label14" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label15" runat="server" Width="60px" Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label16" runat="server" Width="60px" Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label17" runat="server" Width="60px" Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label18" runat="server" Width="60px" Text='<%#Bind("CurrentvariationAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td style="text-align: right; border: 1px solid black;">
                                                                                                <asp:Label ID="Label19" runat="server" Width="60px" Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>--%>
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

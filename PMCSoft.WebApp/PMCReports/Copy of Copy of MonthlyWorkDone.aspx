<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCReports_MonthlyWorkDone" Codebehind="Copy of Copy of MonthlyWorkDone.aspx.cs" %>

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
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Ahluwalia Contracts (India) Ltd.
                                </td>
                            </tr>
                             <tr>
                                            <td>
                                                <table style="width: 910px;">
                                                    <tr>
                                                        <td>
                                                            Project
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlProjectA" runat="server" Width="200px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            Month
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlMonthA" runat="server" AutoPostBack="True" Style="width: auto;">
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
                                                            <asp:DropDownList ID="ddlSDaysYearA" runat="server" AutoPostBack="True" Style="width: 400;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <td>
                                                                <asp:Button ID="BtnReportA" runat="server" Text="View"  />
                                                            </td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                           
                            <tr>
                                <td>
                                    <table style="width: 1220px;">
                                        <tr>
                                            <td>
                                            
                                                <asp:Repeater ID="RptActualMaster" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </td>
                                                                <td rowspan="4" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </td>
                                                                <td rowspan="4" style="width: 50px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </td>
                                                                <td rowspan="4" style="width: 60px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </td>
                                                                <td rowspan="2" style="width: 60px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </td>
                                                                <td colspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </td>
                                                                <td colspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </td>
                                                              
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                     Months
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
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
                                                              
                                                            </tr>
                                                            
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                      <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" 
                                                                Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text='<%#Bind("PPlan") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan1" runat="server" Width="60px" Text='<%#Bind("PPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtActual" runat="server" Width="60px" Text='<%#Bind("PActual") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtActual1" runat="server" Width="60px" Text='<%#Bind("PActual1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtVariance" runat="server" Width="60px" Text='<%#Bind("PVariance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtVariance1" runat="server" Width="60px" Text='<%#Bind("PVariance1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtCPlan" runat="server" Width="60px" Text='<%#Bind("CPlan") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtCPlan1" runat="server" Width="60px" Text='<%#Bind("CPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                        
                                                        </tr>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
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

<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.AddNewActual" Codebehind="AddNewActual.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 970px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Financial Comparision Of Plan</h3>
                            
                        <table style="width: 970px;">
                            
                          
                            <tr>
                                <td>
                                    <table style="width: 910px;">
                                       
                                        <tr>
                                            <td>
                                                Project
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlProject" runat="server" Width="200px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 80px;">
                                                Date
                                            </td>
                                            <td>
                                           <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                               
                                            </td>
                                           <td>Month</td>
                                           <td>
                                      <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" 
                                        Style="width: auto;">
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
                                           <asp:DropDownList ID="ddlSDaysYear" runat="server" AutoPostBack="true" 
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                          </td>
                                        </tr>
                              
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                      <table style="width: 930px;">
                                        <tr>
                                            <td>
                                            
                                                <asp:Repeater ID="RptIncome" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="3" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </td>
                                                                <td colspan="6" style="width: 360px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Previous Month
                                                                </td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    Plan
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    Actual
                                                                </td>
                                                               
                                                              
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    A
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    %
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    B
                                                                </td>
                                                                
                                                                
                                                               
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 200px; font-weight: bold;">
                                                                    INCOME
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black; width: 50px;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIncomeTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblParticualName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtPPlan" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                 <asp:HiddenField ID="HdnSumInComeValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtPPlan1" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtActual" runat="server" Width="200px" Text=""
                                                                  ></asp:TextBox>
                                                            </td>
                                                           
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server" Width="50px"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server" Width="50px"></asp:Label>
                                                            </td>
                                                            
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptExpenditure" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 150px; font-weight: bold;">
                                                                    PURCHASE / CONSUMPTION
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
                                                                 <asp:Label ID="lblExpTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnExpParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblExpName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtExpPPlan" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                     <asp:HiddenField ID="HdnSumExpValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                                </asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtExpPPlan1" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtExpActualValue" runat="server" Width="200px" Text=""
                                                                   ></asp:TextBox>
                                                            </td>
                                                            
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Purchase
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                          
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptConsumbles" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                  <asp:Label ID="lblCONSUMBLESTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblCONSUMBLESName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                           <td style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtCONSUMBLESPPlan" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                 <asp:HiddenField ID="HdnCunsumblesSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtCONSUMBLESPlan1" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtCONSUMBLESActual" runat="server" Width="200px" Text=""
                                                                   ></asp:TextBox>
                                                            </td>
                                                          
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Direct Expense
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                           
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptDirectExpenses" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    DIRECT EXPENSES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                  <asp:Label ID="lblDIRECTTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                           <td style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtDIRECTPlanValue" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                <asp:HiddenField ID="HdnDirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtDIRECTPlanParcentage" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtDIRECTActualValue" runat="server" Width="200px" Text=""
                                                                   ></asp:TextBox>
                                                            </td>
                                                            
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Direct Expense
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblDIRECTPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPDIRECTTotal" runat="server"></asp:Label>
                                                            </td>
                                                           
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                 <asp:Label ID="lblHIRETransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHIREParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHIREName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                           <td style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtHIREPPlanValue" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                      <asp:HiddenField ID="HdnHireSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtHIREValueParcentage" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtHIREActualValue" runat="server" Width="200px" Text=""
                                                                   ></asp:TextBox>
                                                            </td>
                                                            
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Hire Charges
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblHIREPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblHIREPActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                          
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptIndirectExpenses" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    INDIRECT EXPENSES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                           <td style="text-align: left; border: 1px solid black;">
                                                                 <asp:Label ID="lblINDIRECTTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnINDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblINDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                           <td style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtINDIRECTPPlan" runat="server" Width="200px" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                    <asp:HiddenField ID="HdnIndirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtINDIRECTan1" runat="server" Width="200px" Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtINDIRECTActualValue" runat="server" Width="200px" Text=""
                                                                   ></asp:TextBox>
                                                            </td>
                                                            
                                                           
                                                            
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Indirect Expense
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblINDIRECTPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblINDIRECTPActualTotal" runat="server"></asp:Label>
                                                            </td>
                                                            
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="Repeater6" runat="server" >
                                                    <FooterTemplate>
                                                        <table style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    Total Expenses
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold; width: 200px;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;">
                                                <asp:Button ID="btnCalculate" runat="server" Text="Calculate"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                                    onclick="btnSubmit_Click" />
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel"/>
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


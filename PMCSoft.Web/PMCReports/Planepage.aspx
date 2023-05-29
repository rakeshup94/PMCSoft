<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.Planepage" Codebehind="Planepage.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -150px;">
                <div id="content" style="width: 1250px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            MONTHLY PLAN</h3>
                             <table style="width: 1240px;">
                                       
                                        <tr>
                                            <td>
                                                Project
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlProject1" runat="server" Width="200px" AutoPostBack="True"
                                                   >
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 80px;">
                                                Date
                                            </td>
                                            <td>
                                           <asp:TextBox ID="txtDate1" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate1"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                               
                                            </td>
                                           <td>Month</td>
                                           <td>
                                      <asp:DropDownList ID="ddlMonth1" runat="server" AutoPostBack="true" 
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
                                           <asp:DropDownList ID="ddlSDaysYear1" runat="server" AutoPostBack="true" 
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                          </td>
                                          <td>
                                           <asp:Button ID="ViewReport1" runat="server" Text="View" 
                                                  onclick="ViewReport1_Click" />
                                          </td>
                                         
                                        </tr>
                              
                                    </table>
                        <table style="width: 1240px;">
                            
                            <tr>
                                <td>
                                    <table style="width: 1220px;">
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="RptIncome1" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="3" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </td>
                                                                <td colspan="6" style="width: 360px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                     Month
                                                                </td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Plan
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Actual
                                                                </td>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Variance
                                                                </td>
                                                               
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C = A - B
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </td>
                                                                
                                                              
                                                            </tr>
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
                                                                 <asp:Label ID="lblIncomeTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                               <asp:TextBox ID="txtpincomeValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtpincomeValue1"
                                                                      FilterType="Custom, Numbers" ValidChars=".">
                                                                 </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIncimePlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtIncomeActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIncomeActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIncomeVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIncomeVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                          
                                                        </tr>
                                                    </ItemTemplate>
                                                  
                                                </asp:Repeater>
                                           <asp:Repeater ID="RptExpenditure1" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    PURCHASE / CONSUMPTION
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblExpTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnExpParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblExpParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpExpValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                               <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtExpPlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtExpActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtExpActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtExpVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtExpVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                 
                                                </asp:Repeater>
                                                      <asp:Repeater ID="RptConsumbles1" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                           
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblConSumblesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnConSumblesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblConSumblesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpConSumblesValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                               <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtConSumblesPlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtConSumblesActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtConSumblesActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtConSumblesVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtConSumblesVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                  
                                                </asp:Repeater>
                                                   <asp:Repeater ID="RptDirectExpenses1" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                   DIRECT EXPENSES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblDirectExpensesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDirectExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblDirectExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpDirectExpensesValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                               <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtDirectExpensesPlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtDirectExpensesActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtDirectExpensesActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtDirectExpensesVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtDirectExpensesVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges1" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblDirectExpensesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHireChargesExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHireChargesExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpHireChargesExpensesValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                               <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtHireChargesExpensesPlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtHireChargesExpensesActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtHireChargesExpensesActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtHireChargesExpensesVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtHireChargesExpensesVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                                 <asp:Repeater ID="RptIndirectExpenses1" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    INDIRECT EXPENSES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIndirectExpensesTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIndirectExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHireIndirectExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpIndirectExpensesValue1" runat="server" Width="150px"  Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                               <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIndirectExpensesPlanParcentage1" runat="server" Width="150px" Text=""
                                                                   ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtIndirectExpensesActualValue1" runat="server" Width="150px" Text=""
                                                                    ></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIndirectExpensesActualParcentage1" runat="server" Width="150px" Text=""
                                                               ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIndirectExpensesVariance1" runat="server" Width="150px" 
                                                                    ></asp:Label>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtIndirectExpensesVarianceParcentage1" runat="server" Width="150px" Text=""
                                                                 ></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                     
                                        <tr>
                                            <td colspan="7" style="text-align: center;" >
                                            
                                            <asp:Button ID="btnCalculate1" runat="server" Text="Calculate"  Visible="false"
                                                    onclick="btnCalculate1_Click"/>
                                                <asp:Button ID="btnSubmit1" runat="server" Text="Submit"  Visible="false"
                                                    onclick="btnSubmit1_Click" />
                                                <asp:Button ID="btnCancel1" runat="server" Text="Cancel"  Visible="false"/>
                                                 
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


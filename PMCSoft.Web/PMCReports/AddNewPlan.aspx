<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.AddNewPlan" Codebehind="AddNewPlan.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left:-100px">
                <div id="content" style="width: 1200px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Financial Comparision Of Plan</h3>
                         <table style="width: 1200px">
                            <tr>
                                <td>
                            
                                
                                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1185px">
                                        <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                            <HeaderTemplate>
                                                Add Plan</HeaderTemplate>
                                            <ContentTemplate>
                                             <table style="width: 930px;">
                           
                          
                            <tr>
                                <td>
                                    <table style="width: 1185px;">
                                       
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
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1" Enabled="True">
                                    </cc1:CalendarExtender>
                                               
                                            </td>
                                           <td>Month</td>
                                           <td>
                                      <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" 
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
                                           <asp:DropDownList ID="ddlSDaysYear" runat="server" AutoPostBack="True" 
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                          </td>
                                        </tr>
                              
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 1185px;">
                                        <tr>
                                            <td>
                                            
                                            
                                             <asp:Repeater ID="RptIncome" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="3" style="width: 435px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                  
                                                                </td>
                                                                <td colspan="6" style="width: 3200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                     
                                                                </td>
                                                               
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Plan
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    
                                                                </td>
                                                              </tr>
                                                            <tr >
                                                                <td  style="border: 1px solid black; width: 200px; font-weight: bold;">
                                                                    INCOME
                                                                </td>
                                                             
                                                                          
                                                              
                                                    
                                                                <td colspan="14" style="border: 1px solid black; width: 50px;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtpincome" runat="server" Width="200px" Text="">
                                                                   
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtpincome"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                          
                                         </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                              <asp:Button ID="BtnAddNewIncome" runat="server" Text="Add New" OnClick="BtnAddNewIncome_Click" />
                                                            </td>
                                                            <td  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                
                                                            </td>
                                                            
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                            
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptExpenditure" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 20px; font-weight: bold;">
                                                                    PURCHASE/CONSUMPTION
                                                                </td>
                                                                <td colspan="2" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblExpenditure" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnEXPENDITUREParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPexpenditure" runat="server" Width="200px" Text="">
                                                                </asp:TextBox>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtPexpenditure"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                          
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold; width:"200">
                                                                 <asp:Button ID="BtnAddNewExpenditure" runat="server" Text="Add New" OnClick="BtnAddNewExpenditure_Click" />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                          
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptConsumbles" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblCONSUMBLES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                               
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPCONSUMBLES" runat="server" Width="200px" Text="">
                                                                </asp:TextBox>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtPCONSUMBLES"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                           
                                                       </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Button ID="BtnAddNewCONSUMBLES" runat="server" Text="Add New" OnClick="BtnAddNewCONSUMBLES_Click" />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptDirectExpenses" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    DIRECT EXPENSES
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                               
                                                                 <asp:Label ID="lblDIRECTEXPENSES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDIRECTEXPENSESParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPDIRECTEXPENSES" runat="server" Width="200px" Text="">
                                                                </asp:TextBox>
                                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPDIRECTEXPENSES"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                               
                                                                 <asp:Button ID="BtnAddNewDirectExpense" runat="server" Text="Add New" OnClick="BtnAddNewDirectExpense_Click" />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                           
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                              <asp:Label ID="lblHireCharge" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHIRECHARGESParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPHireCharge" runat="server" Width="200px" Text=""
                                                                   >
                                                                </asp:TextBox>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtPHireCharge"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                          
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                               
                                                                 <asp:Button ID="BtnAddNewHireCharges" runat="server" Text="Add New" OnClick="BtnAddNewHireCharges_Click" />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </td>
                                                         
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptIndirectExpenses" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                             
                                                                    INDIRECT EXPENSES                                                
                                                                </td>
                                                                <td colspan="14" style="border: 1px solid black;">
                                                                </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: left; border: 1px solid black;">
                                                            <asp:Label ID="lblIndirctExpenses" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPIndirctExpenses" runat="server" Width="200px" Text="">
                                                                </asp:TextBox>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtPIndirctExpenses"
                                        FilterType="Custom, Numbers" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                   <asp:Button ID="BtnAddNewINDIRECTEXPENSES" runat="server" Text="Add New" OnClick="BtnAddNewINDIRECTEXPENSES_Click" />
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
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
                                                    onclick="btnSubmit_Click"/>
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                                    onclick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                     <div style="display: none">
                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div1">
                                                        <h3 class="reallynow">
                                                            Add Particulars Income</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtIncomeParticulars" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnIncomeSave" runat="server" Text="Submit" 
                                                                        onclick="BtnIncomeSave_Click" />
                                                                    <asp:Button ID="btnIncomeCancel" runat="server" Text="Cancel" 
                                                                        onclick="btnIncomeCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                      <div style="display: none">
                                        <asp:Button ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div2">
                                                        <h3 class="reallynow">
                                                            Add Particulars Expenditure</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TxtExpenditure" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnExpenditure" runat="server" Text="Submit" 
                                                                        onclick="BtnExpenditure_Click" />
                                                                    <asp:Button ID="BtnExpenditureCancel" runat="server" Text="Cancel" 
                                                                        onclick="BtnExpenditureCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                      <div style="display: none">
                                        <asp:Button ID="BtnCunsumable" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtenderConsumable" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="PnlConsumable" TargetControlID="BtnCunsumable" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="PnlConsumable" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div6">
                                                        <h3 class="reallynow">
                                                            Add Particulars Consumable Expenses</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TxtConsumable" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnConsumable" runat="server" Text="Submit" 
                                                                        onclick="BtnConsumable_Click" />
                                                                    <asp:Button ID="BtnConsumableCancel" runat="server" Text="Cancel" 
                                                                        onclick="BtnConsumableCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                     <div style="display: none">
                                        <asp:Button ID="BtnDirectExpenses" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="PnlDirectExpenses" TargetControlID="BtnDirectExpenses" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="PnlDirectExpenses" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div3">
                                                        <h3 class="reallynow">
                                                            Add Particulars Direct Expenses</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TxtDirectExpenses" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnDirectExpensesSave" runat="server" Text="Submit" 
                                                                        onclick="BtnDirectExpensesSave_Click" />
                                                                    <asp:Button ID="BtnDirectExpensesCancel" runat="server" Text="Cancel" 
                                                                        onclick="BtnDirectExpensesCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                        <div style="display: none">
                                        <asp:Button ID="BtnHireCharges" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender4" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="PnlHireCharges" TargetControlID="BtnHireCharges" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="PnlHireCharges" runat="server" Style="display:none; border-color: Maroon;">
                                     <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div4">
                                                        <h3 class="reallynow">
                                                            Add Particulars Hire Charges</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TxtHireCharges" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnHireChargesSave" runat="server" Text="Submit" 
                                                                        onclick="BtnHireChargesSave_Click" />
                                                                    <asp:Button ID="btnHireChargesCancel" runat="server" Text="Cancel" 
                                                                        onclick="btnHireChargesCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                     <div style="display: none">
                                        <asp:Button ID="BtnIndirectExpenses" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender5" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="PnlIndirectExpenses" TargetControlID="BtnIndirectExpenses" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="PnlIndirectExpenses" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div5">
                                                        <h3 class="reallynow">
                                                            Add Particulars Indirect Expenses</h3>
                                                        <table style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TxtIndirectExpenses" runat="server" Width="200px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="BtnIndirectExpensesSave" runat="server" Text="Submit" 
                                                                        onclick="BtnIndirectExpensesSave_Click" />
                                                                    <asp:Button ID="btnIndirectExpensesCancel" runat="server" Text="Cancel" 
                                                                        onclick="btnIndirectExpensesCancel_Click"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>

                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1" Width="1185px">
                                            <HeaderTemplate>
                                                Add Actual</HeaderTemplate>
                                            <ContentTemplate>
                                               <table style="width: 1100px;">
                                       
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
                        <table style="width: 1100px;">
                            
                            <tr>
                                <td>
                                    <table style="width: 1100px;">
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="RptIncome1" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                                        <table style="width: 1100px; border: 1px solid black; border-collapse: collapse;">
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
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


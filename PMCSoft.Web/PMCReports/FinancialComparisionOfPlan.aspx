<%@Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.FinancialComparisionOfPlan " Codebehind="FinancialComparisionOfPlan.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -150px;">
                <div id="content" style="width: 1250px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            MONTHLY TRACKER</h3>
                        <table style="width: 1240px;">
                      
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged" Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Monthly Tracker / Comparision of Plan / Actual
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 1220px;">
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="RptIncome" runat="server" >
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <tr>
                                                                <td rowspan="3" style="width: 435px; text-align: center; border: 1px solid black;
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
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                   
                                                                </asp:TextBox>
                                                            </td>
                                                   
                                                           
                                                           
                                                            
                                                          
                                                          
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </td>
                                                            <td  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Button ID="Button1" runat="server" Text="Add New" />
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
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                                <asp:HiddenField ID="hdnEXPENDITUREParticularID" runat="server" Value='<%#Bind("TransId") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text=""
                                                                   >
                                                                </asp:TextBox>
                                                            </td>
                                                          
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold; width:"200">
                                                                Total Purchase
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
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                                <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                               
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
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
                                                           
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptDirectExpenses" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                                <asp:HiddenField ID="hdnDIRECTEXPENSESParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
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
                                                           
                                                            
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges" runat="server">
                                                    <HeaderTemplate>
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text=""
                                                                   >
                                                                </asp:TextBox>
                                                            </td>
                                                           
                                                          
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Hire Charges
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
                                                        <table style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
                                                            </td>
                                                           
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Indirect Expense
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
                                            <td style="text-align: right;">
                                                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:Button ID="btnSubmit" runat="server"  />
                                                <asp:Button ID="btnCancel" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                     <div style="display: none">
                                        <asp:Button ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display:none; border-color: Maroon;">
                                        <table style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div1">
                                                        <h3 class="reallynow">
                                                          Add Particulars</h3>
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
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


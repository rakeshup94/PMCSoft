<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.Planepage" Codebehind="Planepage.aspx.cs" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"    >
                <div class="card"     >
                    <div class="card-body">
                        <div class="card-header">
                            MONTHLY PLAN</div>
                             <div class="row"   >
                                       
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Project
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject1" runat="server"   AutoPostBack="True"
                                                   >
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4"   >
                                                Date
                                            </div>
                                            <div class="col-lg-4" >
                                           <asp:TextBox CssClass="form-control" ID="txtDate1" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate1"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                               
                                            </div>
                                           <div class="col-lg-4" >Month</div>
                                           <div class="col-lg-4" >
                                      <asp:DropDownList CssClass="form-select" ID="ddlMonth1" runat="server" AutoPostBack="true" 
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
                                           <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear1" runat="server" AutoPostBack="true" 
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                          </div>
                                          <div class="col-lg-4" >
                                           <asp:Button CssClass="btn btn-primary btn-square" ID="ViewReport1" runat="server" Text="View" 
                                                  onclick="ViewReport1_Click" />
                                          </div>
                                         
                                        </div>
                              
                                      </div>
                        <div class="row"   >
                            
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"   >
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <asp:Repeater ID="RptIncome1" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="3" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4"  colspan="6" style="width: 360px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                     Month
                                                                </div>
                                                                
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Plan
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Actual
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Variance
                                                                </div>
                                                               
                                                                
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C = A - B
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    %
                                                                </div>
                                                                
                                                              
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 200px; font-weight: bold;">
                                                                    INCOME
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black; width: 50px;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                 <asp:Label ID="lblIncomeTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                               <asp:TextBox CssClass="form-control" ID="txtpincomeValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtpincomeValue1"
                                                                      FilterType="Custom, Numbers" ValidChars=".">
                                                                 </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIncimePlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtIncomeActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIncomeActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIncomeVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIncomeVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                          
                                                        </div>
                                                    </ItemTemplate>
                                                  
                                                </asp:Repeater>
                                           <asp:Repeater ID="RptExpenditure1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    PURCHASE / CONSUMPTION
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblExpTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnExpParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblExpParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtpExpValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                               <div class="col-lg-4"   >
                                                                <asp:Label ID="txtExpPlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtExpActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtExpActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtExpVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtExpVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                 
                                                </asp:Repeater>
                                                      <asp:Repeater ID="RptConsumbles1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                           
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblConSumblesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnConSumblesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblConSumblesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtpConSumblesValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                               <div class="col-lg-4"   >
                                                                <asp:Label ID="txtConSumblesPlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtConSumblesActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtConSumblesActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtConSumblesVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtConSumblesVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                  
                                                </asp:Repeater>
                                                   <asp:Repeater ID="RptDirectExpenses1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                   DIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblDirectExpensesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDirectExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblDirectExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtpDirectExpensesValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                               <div class="col-lg-4"   >
                                                                <asp:Label ID="txtDirectExpensesPlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtDirectExpensesActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtDirectExpensesActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtDirectExpensesVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtDirectExpensesVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblDirectExpensesTransid1" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHireChargesExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHireChargesExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtpHireChargesExpensesValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                               <div class="col-lg-4"   >
                                                                <asp:Label ID="txtHireChargesExpensesPlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtHireChargesExpensesActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtHireChargesExpensesActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtHireChargesExpensesVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtHireChargesExpensesVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                                 <asp:Repeater ID="RptIndirectExpenses1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 210px; font-weight: bold;">
                                                                    INDIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblIndirectExpensesTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIndirectExpensesParticularID1" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHireIndirectExpensesParticualName1" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtpIndirectExpensesValue1" runat="server"    Text='<%#Bind("PlanValue") %>'>
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                               <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIndirectExpensesPlanParcentage1" runat="server"   Text=""
                                                                   ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtIndirectExpensesActualValue1" runat="server"   Text=""
                                                                    ></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIndirectExpensesActualParcentage1" runat="server"   Text=""
                                                               ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIndirectExpensesVariance1" runat="server"   
                                                                    ></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtIndirectExpensesVarianceParcentage1" runat="server"   Text=""
                                                                 ></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                     
                                        <div class="row" >
                                            <div class="col-lg-4"      >
                                            
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate1" runat="server" Text="Calculate"  Visible="false"
                                                    onclick="btnCalculate1_Click"/>
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit1" runat="server" Text="Submit"  Visible="false"
                                                    onclick="btnSubmit1_Click" />
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel1" runat="server" Text="Cancel"  Visible="false"/>
                                                 
                                            </div>
                                        </div>
                                       
                                      </div>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


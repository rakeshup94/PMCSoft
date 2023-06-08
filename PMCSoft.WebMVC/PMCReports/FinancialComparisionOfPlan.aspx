<%@Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.FinancialComparisionOfPlan " Codebehind="FinancialComparisionOfPlan.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"    >
                <div class="card"     >
                    <div class="card-body">
                        <h3 class="reallynow">
                            MONTHLY TRACKER</h3>
                        <div class="row"  style="width: 1240px;">
                      
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;<asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"  >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Monthly Tracker / Comparision of Plan / Actual
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"  style="width: 1220px;">
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <asp:Repeater ID="RptIncome" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="3" style="width: 435px; text-align: center; border: 1px solid black;
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
                                                                
                                                                
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"      style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    
                                                                </div>
                                                              </div>
                                                            <div class="row"  >
                                                                <div class="col-lg-4"   style="border: 1px solid black; width: 200px; font-weight: bold;">
                                                                    INCOME
                                                                </div>
                                                             
                                                                          
                                                              
                                                    
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black; width: 50px;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                   
                                                                </asp:TextBox>
                                                            </div>
                                                   
                                                           
                                                           
                                                            
                                                          
                                                          
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </div>
                                                            <div class="col-lg-4"   style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Add New" />
                                                            </div>
                                                            
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            
                                                           
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptExpenditure" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 20px; font-weight: bold;">
                                                                    PURCHASE/CONSUMPTION
                                                                </div>
                                                                <div class="col-lg-4"     style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblExpenditure" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnEXPENDITUREParticularID" runat="server" Value='<%#Bind("TransId") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text=""
                                                                   >
                                                                </asp:TextBox>
                                                            </div>
                                                          
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold; width:"200">
                                                                Total Purchase
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                          
                                                           
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptConsumbles" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblCONSUMBLES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                               
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
                                                            </div>
                                                           
                                                           
                                                       </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Direct Expense
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                           
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptDirectExpenses" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    DIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                               
                                                                 <asp:Label ID="lblDIRECTEXPENSES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDIRECTEXPENSESParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
                                                            </div>
                                                           
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Direct Expense
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                              <asp:Label ID="lblHireCharge" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHIRECHARGESParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text=""
                                                                   >
                                                                </asp:TextBox>
                                                            </div>
                                                           
                                                          
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Hire Charges
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                         
                                                           
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptIndirectExpenses" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 435px; font-weight: bold;">
                                                                    INDIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                            <asp:Label ID="lblIndirctExpenses" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text="">
                                                                </asp:TextBox>
                                                            </div>
                                                           
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Indirect Expense
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            
                                                          
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                
                                                
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="text-align: right;">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate" runat="server" Text="Calculate" />
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="text-align: center;">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server"  />
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" />
                                            </div>
                                        </div>
                                      </div>
                                     <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display:none;   ">
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div id="Div1">
                                                        <h3 class="reallynow">
                                                          Add Particulars</h3>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtIncomeParticulars" runat="server"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"    >
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnIncomeSave" runat="server" Text="Submit" 
                                                                        onclick="BtnIncomeSave_Click" />
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnIncomeCancel" runat="server" Text="Cancel" 
                                                                        onclick="btnIncomeCancel_Click"/>
                                                                </div>
                                                            </div>
                                                          </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


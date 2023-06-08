<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.AddNewActual" Codebehind="AddNewActual.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"  style="width: 970px;">
                    <div class="card-body">
                        <h3 class="reallynow">
                            Financial Comparision Of Plan</h3>
                            
                        <div class="row"  style="width: 970px;">
                            
                          
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"  style="width: 910px;">
                                       
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Project
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4"  style="width: 80px;">
                                                Date
                                            </div>
                                            <div class="col-lg-4" >
                                           <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                               
                                            </div>
                                           <div class="col-lg-4" >Month</div>
                                           <div class="col-lg-4" >
                                      <asp:DropDownList CssClass="form-select" ID="ddlMonth" runat="server" AutoPostBack="true" 
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
                                           <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="true" 
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                          </div>
                                        </div>
                              
                                      </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                      <div class="row"  style="width: 930px;">
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                            
                                                <asp:Repeater ID="RptIncome" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="3" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4"  colspan="6" style="width: 360px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Previous Month
                                                                </div>
                                                                
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    Plan
                                                                </div>
                                                                <div class="col-lg-4"  colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    Actual
                                                                </div>
                                                               
                                                              
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    A
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    %
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 200px; font-weight: bold;">
                                                                    B
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
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                <asp:Label ID="lblIncomeTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblParticualName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                 <asp:HiddenField ID="HdnSumInComeValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:Label ID="txtPPlan1" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtActual" runat="server"   Text=""
                                                                  ></asp:TextBox>
                                                            </div>
                                                           
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Income
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server" Width="50px"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server" Width="50px"></asp:Label>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptExpenditure" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    EXPENDITURE
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 150px; font-weight: bold;">
                                                                    PURCHASE / CONSUMPTION
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                            
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                 <asp:Label ID="lblExpTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnExpParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblExpName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtExpPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                     <asp:HiddenField ID="HdnSumExpValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtExpPPlan1" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtExpActualValue" runat="server"   Text=""
                                                                   ></asp:TextBox>
                                                            </div>
                                                            
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Purchase
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                          
                                                           
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptConsumbles" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    CONSUMBLES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                  <asp:Label ID="lblCONSUMBLESTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblCONSUMBLESName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                           <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtCONSUMBLESPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                 <asp:HiddenField ID="HdnCunsumblesSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtCONSUMBLESPlan1" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtCONSUMBLESActual" runat="server"   Text=""
                                                                   ></asp:TextBox>
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
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptDirectExpenses" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    DIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                  <asp:Label ID="lblDIRECTTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                           <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtDIRECTPlanValue" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                <asp:HiddenField ID="HdnDirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtDIRECTPlanParcentage" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtDIRECTActualValue" runat="server"   Text=""
                                                                   ></asp:TextBox>
                                                            </div>
                                                            
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Direct Expense
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblDIRECTPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblPDIRECTTotal" runat="server"></asp:Label>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptHirecharges" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    HIRE CHARGES (Item-Wise)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                 <asp:Label ID="lblHIRETransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnHIREParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblHIREName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                           <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtHIREPPlanValue" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                      <asp:HiddenField ID="HdnHireSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtHIREValueParcentage" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtHIREActualValue" runat="server"   Text=""
                                                                   ></asp:TextBox>
                                                            </div>
                                                            
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Hire Charges
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblHIREPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblHIREPActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                          
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="RptIndirectExpenses" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    INDIRECT EXPENSES
                                                                </div>
                                                                <div class="col-lg-4"  colspan="14" style="border: 1px solid black;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                           <div class="col-lg-4"  style="text-align: left; border: 1px solid black;">
                                                                 <asp:Label ID="lblINDIRECTTransid" runat="server"  Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnINDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                                   <asp:Label ID="LblINDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </div>
                                                           <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                  <asp:Label ID="txtINDIRECTPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                                    <asp:HiddenField ID="HdnIndirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                             <asp:Label ID="txtINDIRECTan1" runat="server"   Text='<%#Bind("PlanParcent") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtINDIRECTActualValue" runat="server"   Text=""
                                                                   ></asp:TextBox>
                                                            </div>
                                                            
                                                           
                                                            
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                Total Indirect Expense
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblINDIRECTPPlanTotal" runat="server"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                            </div>
                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                <asp:Label ID="lblINDIRECTPActualTotal" runat="server"></asp:Label>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="Repeater6" runat="server" >
                                                    <FooterTemplate>
                                                        <div class="row"  style="width: 930px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; width: 225px; font-weight: bold;">
                                                                    Total Expenses
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold; width: 200px;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; font-weight: bold;">
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                
                                                                
                                                            </div>
                                                            </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                             
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="text-align: right;">
                                                <asp:Button btn btn-primary btn-square ID="btnCalculate" runat="server" Text="Calculate"  />
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="text-align: center;">
                                                <asp:Button btn btn-primary btn-square ID="btnSubmit" runat="server" Text="Submit" 
                                                    onclick="btnSubmit_Click" />
                                                <asp:Button btn btn-primary btn-square ID="btnCancel" runat="server" Text="Cancel"/>
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


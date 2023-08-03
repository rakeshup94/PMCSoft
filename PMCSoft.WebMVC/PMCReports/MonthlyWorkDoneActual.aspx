<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyWorkDoneActual" Title="Untitled Page" Codebehind="MonthlyWorkDoneActual.aspx.cs" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"    >
                <div class="card"     >
                    <div class="card-body">
                        <div class="card-header">
                            MONTHLY WORK DONE</div>
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1250px">
                            <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                <HeaderTemplate>
                                    Add Monthly WorkDone Plan</HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row"   >
                                 
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <div class="row"   >
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Project
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            Month
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlMonth" runat="server" AutoPostBack="True" Style="width: auto;">
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
                                                            <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="True" Style="width: 400;">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <div class="col-lg-4" >
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="View" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <div class="row"   >
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            <asp:Repeater ID="Repeater1" runat="server" >
                                                                <HeaderTemplate>
                                                                    <div class="row"   >
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"  rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                S.No
                                                                            </div>
                                                                            <div class="col-lg-4"  rowspan="4" style="width: 200px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Particulars
                                                                            </div>
                                                                            <div class="col-lg-4"  rowspan="4" style="width: 50px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Unit
                                                                            </div>
                                                                            <div class="col-lg-4"  rowspan="4" style="width: 60px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Rate
                                                                            </div>
                                                                            <div class="col-lg-4"  rowspan="2" style="width: 60px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Awarded value of work (Rs.)
                                                                            </div>
                                                                            <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Work Done (Plan)
                                                                            </div>
                                                                              <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </div>
                                                                        </div>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 100px; font-weight: bold;">
                                                                                Current Months
                                                                            </div>
                                                                             <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                        </div>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 50px; font-weight: bold;">
                                                                                A
                                                                            </div>
                                                                            <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 50px; font-weight: bold;">
                                                                                B
                                                                            </div>
                                                                             <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
                                                                </div>
                                                                        </div>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 50px; font-weight: bold;">
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 50px; font-weight: bold;">
                                                                                Qty.
                                                                            </div>
                                                                            <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 50px; font-weight: bold;">
                                                                                Amt. (Rs.)
                                                                            </div>
                                                                               <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                        </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="row" >
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("WDName") %>' Font-Bold="true"
                                                                                Height="15"></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="txtUnit" runat="server"   Text=""></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="txtRate" runat="server"   Text=""></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="txtAwardedValue" runat="server"   Text=""></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="txtQty" runat="server"   Text=""></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-4"   >
                                                                            <asp:Label ID="txtAmt" runat="server"   Text=""></asp:Label>
                                                                        </div>
                                                                          <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan" runat="server"   Text='<%#Bind("CPlan") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan1" runat="server"   Text='<%#Bind("CPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                                    </div>
                                                                    <div class="row" >
                                                                        <div class="col-lg-4" >
                                                                            <asp:Repeater ID="RptSub" runat="server" >
                                                                                <ItemTemplate>
                                                                                    <div class="row" >
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button" runat="server" Text="+" CommandArgument='<%# Eval("TransId") %>' />
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="txtUnit" runat="server"   Text=""></asp:Label>
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="txtRate" runat="server"   Text=""></asp:Label>
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="txtAwardedValue" runat="server"   Text=""></asp:Label>
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="txtQty" runat="server"   Text=""></asp:Label>
                                                                                        </div>
                                                                                        <div class="col-lg-4"   >
                                                                                            <asp:Label ID="txtAmt" runat="server"   Text=""></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row" >
                                                                                        <div class="col-lg-4" >
                                                                                            <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                                <ItemTemplate>
                                                                                                    <div class="row" >
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:Label ID="LblSWDDId" runat="server" Text='<%#Bind("TransId") %>' Visible="false"></asp:Label>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:Label ID="LBLPD" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtUnit" runat="server"   Text=""></asp:TextBox>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtRate" runat="server"   Text=""></asp:TextBox>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtAwardedValue" runat="server"   Text=""></asp:TextBox>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtQty" runat="server"   Text=""></asp:TextBox>
                                                                                                        </div>
                                                                                                        <div class="col-lg-4"   >
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtAmt" runat="server"   Text=""></asp:TextBox>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </ItemTemplate>
                                                                                            </asp:Repeater>
                                                                                        </div>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <div class="row" >
                                                    <div class="col-lg-4"    >
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="BtnWorkdonePlanSave" runat="server" Text="Submit"  />
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnWorkDonePlanancel" runat="server" Text="Cancel" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      </div>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" 
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none;   ">
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div id="Div2">
                                                        <div class="card-header">
                                                            Add Particulars Of Item</div>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="TxtExpenditure" runat="server"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"    >
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnAddNew" runat="server" Text="Submit" 
                                                                        CommandArgument='<%# Eval("TransId") %>' />
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnAddNewCancle" runat="server" Text="Cancel" 
                                                                        CommandArgument='<%# Eval("TransId") %>' />
                                                                </div>
                                                            </div>
                                                          </div>
                                          </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1" Width="1185px">
                                <HeaderTemplate>
                                    Add Monthly WorkDone Actual</HeaderTemplate>
                             <ContentTemplate>
            <div id="Div1"    >
                <div id="Div3"    >
                    <div id="Div4">
                        <div class="card-header">
                            MONTHLY WORK DONE</div>
                        <div class="row"   >
                            <div class="row" >
                            <div class="col-lg-4" >
                             <div class="row"   >
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Project
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProjectA" runat="server"   AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            Month
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlMonthA" runat="server" AutoPostBack="True" Style="width: auto;">
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
                                                            <asp:DropDownList CssClass="form-select" ID="ddlSDaysYearA" runat="server" AutoPostBack="True" Style="width: 400;">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <div class="col-lg-4" >
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReportA" runat="server" Text="View" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                  </div>
                              </div>
                              <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"   >
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                            
                                                <asp:Repeater ID="RptMonthlyWorkDoneActualMaster" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 200px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 50px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 60px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 60px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </div>
                                                               
                                                            </div>
                                                            <div class="row" >
                                                               
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                              
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                               
                                                                
                                                               
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </div>
                                                                
                                                           
                                                               
                                                               
                                                              
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                              
                                                            </div>
                                                          
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                      <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnIncomeParticularID" runat="server" 
                                                                Value='<%#Bind("ParticularID") %>' />
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server"   Text='<%#Bind("PPlan") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan1" runat="server"   Text='<%#Bind("PPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtActual" runat="server"   Text='<%#Bind("PActual") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtActual1" runat="server"   Text='<%#Bind("PActual1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtVariance" runat="server"   Text='<%#Bind("PVariance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtVariance1" runat="server"   Text='<%#Bind("PVariance1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan" runat="server"   Text='<%#Bind("CPlan") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan1" runat="server"   Text='<%#Bind("CPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                           
                                                        </div>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
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
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


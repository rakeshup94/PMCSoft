<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyWorkDoneActual" Title="Untitled Page" Codebehind="MonthlyWorkDoneActual.aspx.cs" %>
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
                            MONTHLY WORK DONE</h3>
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1250px">
                            <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                <HeaderTemplate>
                                    Add Monthly WorkDone Plan</HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row"  style="width: 970px;">
                                 
                                        <tr>
                                            <td>
                                                <div class="row"  style="width: 910px;">
                                                    <tr>
                                                        <td>
                                                            Project
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            Month
                                                        </td>
                                                        <td>
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
                                                        </td>
                                                        <td>
                                                            <td>
                                                                <asp:Button CssClass="btn btn-primary" ID="BtnReport" runat="server" Text="View" />
                                                            </td>
                                                        </td>
                                                    </tr>
                                                  </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="row"  style="width: 1220px;">
                                                    <tr>
                                                        <td>
                                                            <asp:Repeater ID="Repeater1" runat="server" >
                                                                <HeaderTemplate>
                                                                    <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                                            <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                                background-color: #D8D8D8; font-weight: bold;">
                                                                                Work Done (Plan)
                                                                            </td>
                                                                              <td colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                                width: 100px; font-weight: bold;">
                                                                                Current Months
                                                                            </td>
                                                                             <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
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
                                                                <td colspan="2" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
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
                                                                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: left; border: 1px solid black;">
                                                                            <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("WDName") %>' Font-Bold="true"
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
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan" runat="server" Width="60px" Text='<%#Bind("CPlan") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan1" runat="server" Width="60px" Text='<%#Bind("CPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Repeater ID="RptSub" runat="server" >
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                            <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                                        </td>
                                                                                        <td style="text-align: left; border: 1px solid black;">
                                                                                            <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                                            <asp:Button CssClass="btn btn-primary" ID="Button" runat="server" Text="+" CommandArgument='<%# Eval("TransId") %>' />
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
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                                <ItemTemplate>
                                                                                                    <tr>
                                                                                                        <td style="text-align: left; border: 1px solid black;">
                                                                                                            <asp:Label ID="LblSWDDId" runat="server" Text='<%#Bind("TransId") %>' Visible="false"></asp:Label>
                                                                                                        </td>
                                                                                                        <td style="text-align: left; border: 1px solid black;">
                                                                                                            <asp:Label ID="LBLPD" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                                                        </td>
                                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtUnit" runat="server"   Text=""></asp:TextBox>
                                                                                                        </td>
                                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtRate" runat="server"   Text=""></asp:TextBox>
                                                                                                        </td>
                                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtAwardedValue" runat="server"   Text=""></asp:TextBox>
                                                                                                        </td>
                                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtQty" runat="server"   Text=""></asp:TextBox>
                                                                                                        </td>
                                                                                                        <td style="text-align: right; border: 1px solid black;">
                                                                                                            <asp:TextBox CssClass="form-control" ID="txtAmt" runat="server"   Text=""></asp:TextBox>
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
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                  </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <tr>
                                                    <td colspan="2" style="text-align: center;">
                                                        <asp:Button CssClass="btn btn-primary" ID="BtnWorkdonePlanSave" runat="server" Text="Submit"  />
                                                        <asp:Button CssClass="btn btn-primary" ID="btnWorkDonePlanancel" runat="server" Text="Cancel" />
                                                    </td>
                                                </tr>
                                            </td>
                                        </tr>
                                      </div>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" 
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                                        <div class="row"  style="width: 300px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="Div2">
                                                        <h3 class="reallynow">
                                                            Add Particulars Of Item</h3>
                                                        <div class="row"  style="width: 390px; vertical-align: top;">
                                                            <tr>
                                                                <td>
                                                                    Particulars
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox CssClass="form-control" ID="TxtExpenditure" runat="server"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button CssClass="btn btn-primary" ID="BtnAddNew" runat="server" Text="Submit" 
                                                                        CommandArgument='<%# Eval("TransId") %>' />
                                                                    <asp:Button CssClass="btn btn-primary" ID="BtnAddNewCancle" runat="server" Text="Cancel" 
                                                                        CommandArgument='<%# Eval("TransId") %>' />
                                                                </td>
                                                            </tr>
                                                          </div>
                                          </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1" Width="1185px">
                                <HeaderTemplate>
                                    Add Monthly WorkDone Actual</HeaderTemplate>
                             <ContentTemplate>
            <div id="Div1" style="margin-left: -150px;">
                <div id="Div3" style="width: 1250px;">
                    <div id="Div4">
                        <h3 class="reallynow">
                            MONTHLY WORK DONE</h3>
                        <div class="row"  style="width: 1240px;">
                            <tr>
                            <td>
                             <div class="row"  style="width: 910px;">
                                                    <tr>
                                                        <td>
                                                            Project
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProjectA" runat="server"   AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            Month
                                                        </td>
                                                        <td>
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
                                                        </td>
                                                        <td>
                                                            <td>
                                                                <asp:Button CssClass="btn btn-primary" ID="BtnReportA" runat="server" Text="View" />
                                                            </td>
                                                        </td>
                                                    </tr>
                                                  </div>
                              </td>
                              <tr>
                                <td>
                                    <div class="row"  style="width: 1220px;">
                                        <tr>
                                            <td>
                                            
                                                <asp:Repeater ID="RptMonthlyWorkDoneActualMaster" runat="server" >
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 1220px; border: 1px solid black; border-collapse: collapse;">
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
                                                                    Current Month
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
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Width="60px" Text='<%#Bind("PPlan") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtPPlan1" runat="server" Width="60px" Text='<%#Bind("PPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtActual" runat="server" Width="60px" Text='<%#Bind("PActual") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtActual1" runat="server" Width="60px" Text='<%#Bind("PActual1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtVariance" runat="server" Width="60px" Text='<%#Bind("PVariance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtVariance1" runat="server" Width="60px" Text='<%#Bind("PVariance1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan" runat="server" Width="60px" Text='<%#Bind("CPlan") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right; border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtCPlan1" runat="server" Width="60px" Text='<%#Bind("CPlan1") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:TextBox>
                                                            </td>
                                                           
                                                        </tr>
                                                    </ItemTemplate>
                                                    
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                      </div>
                                </td>
                            </tr>
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


<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyTracker" Codebehind="MonthlyTracker.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -100px;">
                <div class="card"  style="width: 1750px;">
                    <div class="card-body">
                        <div class="card-header">
                            FINANCIAL COMPARISION OF PLAN vis-à-vis ACTUAL													
                           </div>
                        <div class="row" >
                       
                            <div class="row" >
                                <div class="col-lg-4"   >
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
                                                Form Month
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlMonth" runat="server" AutoPostBack="true" Style="width: auto;">
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
                                                <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="true" Style="width: auto;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4" >
                                                To Month
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="DDlToMonth" runat="server" AutoPostBack="true" Style="width: auto;">
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
                                                <asp:DropDownList CssClass="form-select" ID="DDLTOYear" runat="server" AutoPostBack="true" Style="width: auto;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="Report" OnClick="BtnReport_Click" />
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnPrint" runat="server" Text="Print Preview" OnClick="btnPrint_Click" />
                                            </div>
                                        </div>
                                      </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"   >
                                    Monthly Tracker / Comparision of Plan / Actual
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="1700" Visible="false">
                                        <div class="row" >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  rowspan="3" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        <asp:Label ID="Label5" runat="server" Text=" Particulars" Width="200" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"  colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Previous Month
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        C = A - B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl1" runat="server" Text="INCOME" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName"    runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text="Total Income" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumincomeValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumincomesumParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumIncomeActualValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumIncomeActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumIncomeVarianceA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumIncomeVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="Repeater2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Previous Month
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        width: 50px; font-weight: bold;">
                                                                        C = A - B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl11" runat="server" Text="" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEActualValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEeVarianceA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumEVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="Repeater3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  colspan="6" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Current  Month
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Plan
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Actual
                                                                    </div>
                                                                    <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        Variance
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        A
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        C = A - B
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                        font-weight: bold;">
                                                                        %
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Lbl1" runat="server" Text="" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                               <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCActualValueA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCeVarianceA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblSumCVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptExpenditure1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="EXPENDITURE" Width="200" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label2" runat="server" Text="PURCHASE/CONSUMPTION" Width="2" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEAVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label5" runat="server" Text="" Width="200" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptExpenditure2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label4" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtEBVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                  <asp:Label ID="Label1" runat="server" Text="" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptExpenditure3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label4" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"   Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"  Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"   Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                  <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptCon1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="CONSUMBLES" Width="7" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCAVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptCon2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtCBVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                 <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptCon3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"   Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"  Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"   Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptDirectExp1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="DIRECTEXPENSES" Width="20" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server"   Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtDAVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptDirectExp2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text=""  Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptDirectExp3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                
                                                                 <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                 <asp:Label ID="Label7" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                 <asp:Label ID="Label8" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptHire1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="HIRECHARGES" Width="2" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server"   Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtHAVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptHire2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptHire3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="Label1" runat="server" Text=" " Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptIndirect1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -2px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label1" runat="server" Text="INDIRECTEXPENSES" Width="2" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="lblIncomeParticularsName" runat="server" Width="200" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtIDAVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDPP" runat="server" Text="TOTAL EXPENSES" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </div>
                                                                
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                             <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                
                                                                     <asp:Label ID="Label11" runat="server" Width="200" Text="PROFIT/LOSS (A-B)" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                 
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptIndirect2" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </div>
                                                                
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text="" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                
                                                                 
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Repeater ID="RptIndirect3" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="margin-left: -10px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="border: 1px solid black; font-weight: bold;">
                                                                        <asp:Label ID="Label3" runat="server" Text="" Width="10" Height="15"></asp:Label>
                                                                    </div>
                                                                    <div class="col-lg-4"   >
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan" runat="server"   Text='<%#Bind("PlanValue") %>'
                                                                        Enabled="false" ReadOnly="true">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtPPlan1" runat="server"  Text='<%#Bind("PlanParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual" runat="server"   Text='<%#Bind("ActualValue") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtActual1" runat="server"  Text='<%#Bind("ActualParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance" runat="server"   Text='<%#Bind("Variance") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="txtVariance1" runat="server"  Text='<%#Bind("VarianceParcentage") %>'
                                                                        Enabled="false" ReadOnly="true"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                 <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </div>
                                                                
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                                 <div class="row" >
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label1" runat="server" Width="100" Text="" Height="15"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                     <asp:Label ID="Label2" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label3" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label4" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                <asp:Label ID="Label5" runat="server" Width="100" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"   >
                                                                   <asp:Label ID="Label6" runat="server" Width="50" Text=""></asp:Label>
                                                                </div>
                                                                
                                                                 
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                          
                                            <div class="row" >
                                                <div class="col-lg-4"      >
                                                
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" 
                                                        onclick="btnCancel_Click" />
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

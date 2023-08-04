<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyTracker"
    CodeBehind="MonthlyTracker.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">FINANCIAL COMPARISION OF PLAN vis-à-vis ACTUAL		</div>
                </div>
                <ol class="breadcrumb page-breadcrumb">
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project
                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True">
                                            </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Form Month
                                    
                                            <asp:DropDownList CssClass="form-select" ID="ddlMonth" runat="server" AutoPostBack="true">
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
                                    <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    To Month
                             
                                            <asp:DropDownList CssClass="form-select" ID="DDlToMonth" runat="server" AutoPostBack="true">
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
                                    <asp:DropDownList CssClass="form-select" ID="DDLTOYear" runat="server" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mtm">

                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="Report"
                                    OnClick="BtnReport_Click" />

                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnPrint" runat="server" Text="Print Preview"
                                    OnClick="btnPrint_Click" />
                            </div>
                        </div>
                        <div class="card-header">
                            Monthly Tracker / Comparision of Plan / Actual
                        </div>
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Visible="false">
                            <div class="row mtm">


                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">





                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th rowspan="3">
                                                                    <asp:Label ID="Label5" runat="server" Text=" Particulars"></asp:Label>
                                                                </th>
                                                                <th colspan="6">Previous Month
                                                                </th>
                                                            </tr>

                                                            <tr>
                                                                <th>Plan
                                                                </th>
                                                                <th>Actual
                                                                </th>
                                                                <th>Variance
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>A
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>C = A - B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Lbl1" runat="server" Text="INCOME"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text="Total Income"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumincomeValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumincomesumParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumIncomeActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumIncomeActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumIncomeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumIncomeVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="Repeater2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th colspan="6">Previous Month
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>Plan
                                                                </th>
                                                                <th>Actual
                                                                </th>
                                                                <th>Variance
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>A
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>C = A - B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Lbl11" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtEPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSumEValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumEParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumEActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumEActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumEeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumEVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="Repeater3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th colspan="6">Current  Month
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>Plan
                                                                </th>
                                                                <th>Actual
                                                                </th>
                                                                <th>Variance
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>A
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                                <th>C = A - B
                                                                </th>
                                                                <th>%
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Lbl1" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtCPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSumCValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumCParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumCActualValueA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumCActualValueParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumCeVarianceA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumCVarianceParcentageA" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptExpenditure1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label1" runat="server" Text="EXPENDITURE"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label2" runat="server" Text="PURCHASE/CONSUMPTION"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEAVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptExpenditure2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtEBPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEBPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEBActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEBActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEBVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtEBVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptExpenditure3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptCon1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label1" runat="server" Text="CONSUMBLES" Width="7"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCAPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCAPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCAActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCAActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="txtCAVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </div>
                                                            <td>
                                                                <asp:Label ID="txtCAVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptCon2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtCBPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCBPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCBActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCBActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCBVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtCBVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptCon3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptDirectExp1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label1" runat="server" Text="DIRECTEXPENSES" Width="20"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDAVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptDirectExp2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptDirectExp3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>

                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label7" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label8" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptHire1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label1" runat="server" Text="HIRECHARGES"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtHAVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptHire2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                            <tr>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptHire3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblPVarianceTotal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptIndirect1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label1" runat="server" Text="INDIRECTEXPENSES"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIncomeParticularsName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtIDAVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelIDPP" runat="server" Text="TOTAL EXPENSES"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>

                                                                <td>
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>

                                                                    <asp:Label ID="Label11" runat="server" Text="PROFIT/LOSS (A-B)"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                                                </td>

                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptIndirect2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                            <tr>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>

                                                                <td>
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:Repeater ID="RptIndirect3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead>

                                                            <tr>
                                                                <th>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                                    Enabled="false" ReadOnly="true">
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual" runat="server" Text='<%#Bind("ActualValue") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtActual1" runat="server" Text='<%#Bind("ActualParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance" runat="server" Text='<%#Bind("Variance") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtVariance1" runat="server" Text='<%#Bind("VarianceParcentage") %>'
                                                                    Enabled="false" ReadOnly="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody><tfoot>

                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVA" runat="server"></asp:Label>
                                                                </td>

                                                                <td>
                                                                    <asp:Label ID="LabelIDPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDAPA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVVA" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelIDVPA" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>


                                    </table>
                                </div>

                            </div>
                            <div class="row mtm">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                        OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </asp:Panel>

                    </div>
                </div>
            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

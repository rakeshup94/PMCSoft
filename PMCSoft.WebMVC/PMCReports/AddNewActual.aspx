<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.AddNewActual"
    CodeBehind="AddNewActual.aspx.cs" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Financial Comparision Of Plan</div>
                </div>
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
                                     
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Date
                                       
                                                <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1"></cc1:CalendarExtender>

                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Month
                                           <div class="row">
                                               <div class="col-lg-6">
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
                                               </div>
                                               <div class="col-lg-6">
                                                   <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="true">
                                                   </asp:DropDownList>
                                               </div>
                                           </div>



                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">

                                        <asp:Repeater ID="RptIncome" runat="server">
                                            <HeaderTemplate>





                                                <thead>
                                                    <tr>
                                                        <th>Particulars
                                                        </th>
                                                        <th>Previous Month
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th>Plan
                                                        </th>
                                                        <th>Actual
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th>A
                                                        </th>
                                                        <th>%
                                                        </th>
                                                        <th>B
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th>INCOME
                                                        </th>
                                                        <th colspan="14"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblIncomeTransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblParticualName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="HdnSumInComeValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtPPlan1" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtActual" runat="server" Text=""></asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>Total Income
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                </td>

                                            </tr>
                                        </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptExpenditure" runat="server">
                                            <HeaderTemplate>

                                                <tr>
                                                    <th class="col-lg-4">EXPENDITURE
                                                    </th>
                                                    <th class="col-lg-4"></th>
                                                </tr>
                                                <tr>
                                                    <th class="col-lg-4">PURCHASE / CONSUMPTION
                                                    </th>
                                                    <th class="col-lg-4"></th>
                                                </tr>
                                                <tr>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblExpTransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnExpParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblExpName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtExpPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                            <asp:HiddenField ID="HdnSumExpValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtExpPPlan1" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtExpActualValue" runat="server" Text=""></asp:TextBox>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>Total Purchase
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                    </td>


                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptConsumbles" runat="server">
                                            <HeaderTemplate>

                                                <tr>
                                                    <td>CONSUMBLES
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCONSUMBLESTransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblCONSUMBLESName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtCONSUMBLESPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="HdnCunsumblesSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtCONSUMBLESPlan1" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtCONSUMBLESActual" runat="server" Text=""></asp:TextBox>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>Total Direct Expense
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptDirectExpenses" runat="server">
                                            <HeaderTemplate>

                                                <tr>
                                                    <td>DIRECT EXPENSES
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDIRECTTransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtDIRECTPlanValue" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="HdnDirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtDIRECTPlanParcentage" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtDIRECTActualValue" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>Total Direct Expense
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDIRECTPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblPDIRECTTotal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptHirecharges" runat="server">
                                            <HeaderTemplate>

                                                <tr>
                                                    <td>HIRE CHARGES (Item-Wise)
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblHIRETransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnHIREParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblHIREName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtHIREPPlanValue" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="HdnHireSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtHIREValueParcentage" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtHIREActualValue" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>Total Hire Charges
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblHIREPPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblHIREPActualTotal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptIndirectExpenses" runat="server">
                                            <HeaderTemplate>

                                                <tr>
                                                    <td>INDIRECT EXPENSES
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblINDIRECTTransid" runat="server" Visible="false" Text='<%#Bind("Tranid") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnINDIRECTParticularID" runat="server" Value='<%#Bind("ParticularsId") %>' />
                                                        <asp:Label ID="LblINDIRECTName" runat="server" Text='<%#Bind("ParticularsName") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtINDIRECTPPlan" runat="server" Text='<%#Bind("PlanValue") %>'
                                                            Enabled="false" ReadOnly="true">
                                                        </asp:Label>
                                                        <asp:HiddenField ID="HdnIndirectSumValue" runat="server" Value='<%#Bind("SumPlanValue") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtINDIRECTan1" runat="server" Text='<%#Bind("PlanParcent") %>'
                                                            Enabled="false" ReadOnly="true"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtINDIRECTActualValue" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>Total Indirect Expense
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblINDIRECTPPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblINDIRECTPActualTotal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater6" runat="server">
                                            <FooterTemplate>
                                                <tr>

                                                    <td>Total Expenses
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Label ID="lblPActualTotal" runat="server"></asp:Label>
                                                    </td>

                                                </tr>

                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate" runat="server"
                                    Text="Calculate" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


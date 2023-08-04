<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.FinancialComparisionOfPlan "
    CodeBehind="FinancialComparisionOfPlan.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">MONTHLY TRACKER</div>
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
                            <div class="col-lg-4 offset-sm-4">
                                <div class="mb-3">
                                    Project

        <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
        </asp:DropDownList>
                                </div>
                            </div>









                        </div>
                    </div>
                    <div class="card-title">Monthly Tracker / Comparision of Plan / Actual</div>

                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-12">

                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">

                                        <asp:Repeater ID="RptIncome" runat="server">
                                            <HeaderTemplate>
                                                <thead>

                                                    <tr>
                                                        <th rowspan="3">Particulars
                                                                  
                                                        </th>
                                                        <th colspan="6">Month
                                                        </th>

                                                    </tr>
                                                    <tr>
                                                        <th>Plan
                                                        </th>


                                                    </tr>
                                                    <tr>
                                                        <th></th>
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
                                                        <asp:Label ID="lblIncome" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                                   
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody><tfoot>
                                                    <tr>
                                                        <td>Total Income
                                                        </td>
                                                        <td>
                                                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Add New" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptExpenditure" runat="server">
                                            <HeaderTemplate>
                                                <thead class="row">
                                                    <tr>
                                                        <th>EXPENDITURE
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                    <tr>
                                                        <th>PURCHASE/CONSUMPTION
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblExpenditure" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnEXPENDITUREParticularID" runat="server" Value='<%#Bind("TransId") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody><tfoot>
                                                    <tr>
                                                        <td>Total Purchase
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>


                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptConsumbles" runat="server">
                                            <HeaderTemplate>
                                                <thead class="row">
                                                    <tr>
                                                        <th>CONSUMBLES
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCONSUMBLES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnCONSUMBLESParticularID" runat="server" Value='<%#Bind("TransID") %>' />

                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody><tfoot>
                                                    <tr>
                                                        <td>Total Direct Expense
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>

                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptDirectExpenses" runat="server">
                                            <HeaderTemplate>


                                                <thead class="row">
                                                    <tr>
                                                        <th>DIRECT EXPENSES
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>

                                                        <asp:Label ID="lblDIRECTEXPENSES" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnDIRECTEXPENSESParticularID" runat="server" Value='<%#Bind("TransID") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody><tfoot>
                                                    <tr>
                                                        <td>Total Direct Expense
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>


                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptHirecharges" runat="server">
                                            <HeaderTemplate>

                                                <thead class="row">
                                                    <tr>
                                                        <th>HIRE CHARGES (Item-Wise)
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblHireCharge" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnHIRECHARGESParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody><tfoot>

                                                    <tr>
                                                        <td>Total Hire Charges
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>


                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RptIndirectExpenses" runat="server">
                                            <HeaderTemplate>
                                                <thead class="row">
                                                    <tr>
                                                        <th>INDIRECT EXPENSES
                                                        </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblIndirctExpenses" runat="server" Text='<%#Bind("Particular") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnIncomeParticularID" runat="server" Value='<%#Bind("ParticularID") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPPlan" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td>Total Indirect Expense
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPPlanTotal" runat="server"></asp:Label>
                                                        </td>


                                                    </tr>
                                                </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row mtm">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate" runat="server"
                                    Text="Calculate" />
                            </div>
                        </div>
                        <div class="row mtm">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" Text="Save" runat="server" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" />
                            </div>
                        </div>









                    </div>
                </div>
            </div>





            <div style="display: none">
                <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
            </div>

            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"
                Enabled="True">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" Style="display: none;">



                <div tabindex="-1" role="dialog" aria-labelledby="modal-default-label"
                    aria-hidden="true" class="modal fade">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Particulars</h4>
                                <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                    class="close">
                                    &times;
                                </button>

                            </div>

                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            Particulars
                                                      
                                                   
                                                                <asp:TextBox CssClass="form-control" ID="txtIncomeParticulars" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="BtnIncomeSave" runat="server"
                                            Text="Submit"
                                            OnClick="BtnIncomeSave_Click" />
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnIncomeCancel" runat="server"
                                            Text="Cancel"
                                            OnClick="btnIncomeCancel_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="button" data-bs-dismiss="modal" class="btn btn-lg btn-red">
                                    <i class="fa fa-times"></i>Close</button>
                            </div>

                        </div>
                    </div>
                </div>

            </asp:Panel>
            </div>






        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


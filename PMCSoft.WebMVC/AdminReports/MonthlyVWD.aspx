<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.MonthlyVWD"
    CodeBehind="MonthlyVWD.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">MONTHLY VWD (FORMAT No. C)</div>
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
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    Project  
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="mb-3">
                                    Status of Work Done / Plan As On  
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"
                                        ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th rowspan="3">S.No</th>
                                                        <th rowspan="3">Month</th>
                                                        <th rowspan="2">Plan (Rs.)</th>
                                                        <th colspan="4">Actual (Rs.)</th>
                                                        <th rowspan="2">Variation (Rs.)</th>
                                                        <th rowspan="3">Remarks</th>
                                                    </tr>
                                                    <tr>
                                                        <th>VWD</th>
                                                        <th>Escl.</th>
                                                        <th>Extra Item</th>
                                                        <th>Total</th>
                                                    </tr>
                                                    <tr>
                                                        <th>A</th>
                                                        <th>B</th>
                                                        <th>C</th>
                                                        <th>D</th>
                                                        <th>E = (B + C + D)</th>
                                                        <th>F = (A - B)</th>
                                                    </tr>
                                                    <tbody>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>




                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label></td>
                                                    <td>
                                                        <asp:HiddenField ID="hdnMonths" runat="server" Value='<%#Bind("Months") %>' />
                                                        <asp:HiddenField ID="hdnYears" runat="server" Value='<%#Bind("Years") %>' />
                                                        <asp:Label ID="lblFiscMonths" runat="server" Text='<%#Bind("FiscMonths") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPlan" runat="server" Enabled="false"
                                                            ReadOnly="true"
                                                            Text='<%#Bind("PlanRs") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPlan"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtActualVWD" runat="server" Enabled="false"
                                                            ReadOnly="true"
                                                            Text='<%#Bind("ActualVWD") %>'>
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtActualVWD"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtActualEscl" runat="server" Enabled="false"
                                                            ReadOnly="true"
                                                            Text='<%#Bind("ActualEscl") %>'>
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtActualEscl"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtExtraItem" runat="server" Enabled="false"
                                                            ReadOnly="true"
                                                            Text='<%#Bind("ActualExtraItem") %>'>
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtExtraItem"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtTotal" runat="server" ReadOnly="true"
                                                            Enabled="false"
                                                            Text='<%#Bind("ActualTotal") %>'></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtVariation" runat="server" ReadOnly="true"
                                                            Enabled="false"
                                                            Text='<%#Bind("Variation") %>'>
                                                        </asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" TextMode="MultiLine"
                                                            onkeyup="valid(this)"
                                                            onblur="valid(this)" Enabled="false" ReadOnly="true" Text='<%#Bind("Remarks") %>'></asp:TextBox>
                                                    </td>

                                                </tr>


                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>

                                            <tfoot>



                                                <tr>
                                                    <td></td>
                                                    <td>GRAND TOTAL</td>
                                                    <td>
                                                        <asp:Label ID="lblPlan" runat="server" Text=""></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblActualVWD" runat="server" Text=""></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblActualEscl" runat="server" Text=""></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblActualExtraItem" runat="server" Text=""></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblActualTotal" runat="server" Text=""></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblVariation" runat="server" Text=""></asp:Label></td>
                                                    <td></td>
                                                </tr>


                                            </tfoot>

                                                </div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

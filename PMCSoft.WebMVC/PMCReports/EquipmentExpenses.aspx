<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.EquipmentExpenses"
    CodeBehind="EquipmentExpenses.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">EQUIPMENT EXPENSES</div>
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
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Equipment Expenses Report As On   
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1"></cc1:CalendarExtender>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <HeaderTemplate>

                                                <tr class="row">
                                                    <th rowspan="2">S.No
                                                    </th>
                                                    <th rowspan="2">Equipment Detail
                                                    </th>
                                                    <th>Amt. Upto Previous Months
                                                        <asp:TextBox CssClass="form-control" ID="txtPreviousMonth" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPreviousMonth"
                                                            CssClass="cal_Theme1"></cc1:CalendarExtender>
                                                    </th>
                                                    <th>Amt. Current Months
                                                        <asp:TextBox CssClass="form-control" ID="txtCurrentMonth" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtCurrentMonth"
                                                            CssClass="cal_Theme1"></cc1:CalendarExtender>
                                                    </th>
                                                    <th>Amt. Up To Date
                                                        <asp:TextBox CssClass="form-control" ID="txtUpToDate" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtUpToDate"
                                                            CssClass="cal_Theme1"></cc1:CalendarExtender>
                                                    </th>
                                                </tr>
                                                <tr class="row">
                                                    <th>Repairs
                                                    </th>
                                                    <th>Fuel
                                                    </th>
                                                    <th>Repairs
                                                    </th>
                                                    <th>Fuel
                                                    </th>
                                                    <th>Repairs
                                                    </th>
                                                    <th>Fuel
                                                    </th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="row">
                                                    <td>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtEquipmentDetail" runat="server" Text='<%#Bind("EquipmentDetail") %>'
                                                            onkeyup="valid(this)" onblur="valid(this)">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPMRepairs" runat="server" Text='<%#Bind("PMRepairs") %>'>
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPMRepairs"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtPMFuel" runat="server" Text='<%#Bind("PMFuel") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtPMFuel"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtCMRepairs" runat="server" Text='<%#Bind("CMRepairs") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCMRepairs"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtCMFuel" runat="server" Text='<%#Bind("CMFuel") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtCMFuel"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtUTRepairs" runat="server" Text='<%#Bind("UTRepairs") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtUTRepairs"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtUTFuel" runat="server" Text='<%#Bind("UTFuel") %>'></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtUTFuel"
                                                            FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr class="row">
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="Add Item"
                                                            OnClick="btnAdd_Click" />
                                                    </td>
                                                </tr>
                                                </div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

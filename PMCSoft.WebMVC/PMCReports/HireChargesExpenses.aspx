<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.HireChargesExpenses"
    CodeBehind="HireChargesExpenses.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">HIRE CHARGES EXPENSES</div>
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
                                Project   
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                            </div>

                            <div class="col-lg-4">
                                HIRE CHARGES EXPENSES REPORT FOR THE MONTH OF --   
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                    CssClass="cal_Theme1"></cc1:CalendarExtender>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">   <div class="table-responsive">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GvHireChargesExpenses" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true" OnRowDataBound="GvHireChargesExpenses_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DESCRIPTION">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtDESCRIPTION" TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MODEL">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtMODEL" TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="VENDOR`S NAME">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server" AutoPostBack="true">
                                                    <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date of Installation">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtDateofInstallation" runat="server" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateofInstallation"
                                                    CssClass="cal_Theme1"></cc1:CalendarExtender>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="QTY.">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtQTY" TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQTY"
                                                    FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AMOUNT">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtAMOUNT" runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAMOUNT"
                                                    FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                             
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nature / Purpose of work for which the equipment is  on Hire">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtNature" TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddMore" runat="server"
                                                    Text="Add More" OnClick="btnAddMore_Click" />
                                            </FooterTemplate>

                                        
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>  </div>
                        </div>
                        <div class="row mtm">
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
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

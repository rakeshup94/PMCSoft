﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.PDCRequisition" CodeBehind="PDCRequisition.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">PDC</div>
                </div>
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
                        <div class="row mtm">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn" ID="GridView1" runat="server" AutoGenerateColumns="false"
                                        EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IssueID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssueID" runat="server" Text='<%#Bind("IssueID") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendor" runat="server" Text='<%#Bind("Vendor") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChequeNo" runat="server" Text='<%#Bind("ChequeNo") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Issue Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssueDate" runat="server" Text='<%#Bind("IssueDate") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                        </Columns>

                                    </asp:GridView>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.PDCRequisition" Codebehind="PDCRequisition.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            PDC</h3>
                        <div class="row"  style="width: 930px;">
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 100px; text-align: center;">
                                    Project :
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="2">
                                    <asp:GridView CssClass="table table-striped"  ID="GridView1" runat="server" Width="910px" AutoGenerateColumns="false"
                                        EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IssueID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssueID" runat="server" Text='<%#Bind("IssueID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendor" runat="server" Text='<%#Bind("Vendor") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChequeNo" runat="server" Text='<%#Bind("ChequeNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="80px" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Issue Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssueDate" runat="server" Text='<%#Bind("IssueDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
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

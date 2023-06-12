<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.PaymentReceipt" Codebehind="PaymentReceipt.aspx.cs" %>

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
                            Payment Receipt</h3>
                        <div class="row"  style="width: 930px;">
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 100px; text-align: center;">
                                    Project
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"    >
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server"    AutoGenerateColumns="false"
                                        EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Receipt ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiptID" runat="server" Text='<%#Bind("ReceiptID") %>'></asp:Label>
                                                </ItemTemplate>
                                              
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="R A Bill No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRABillNo" runat="server" Text='<%#Bind("RABillNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                  
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentType" runat="server" Text='<%#Bind("PaymentType") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTypeID" runat="server" Value='<%#Bind("TypeID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChequeNo" runat="server" Text='<%#Bind("ChequeNo") %>'></asp:Label>
                                                </ItemTemplate>
                                              
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle   HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Created Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label>
                                                </ItemTemplate>
                                           
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

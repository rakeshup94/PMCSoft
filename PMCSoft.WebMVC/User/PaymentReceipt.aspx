<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.PaymentReceipt" Codebehind="PaymentReceipt.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Payment Receipt</div>
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
                                <div class="col-lg-4"  style="width: 100px; text-align: center;">
                                    R.A Bill No.
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtRABillNo" runat="server" Text="" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                                <div class="col-lg-4"  style="text-align: center;">
                                    Date
                                </div>
                                <div class="col-lg-4"  style="width: 120px; text-align: left;">
                                    <asp:Label ID="lblDate1" runat="server" Font-Size="11px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="6">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false"   
                                        ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                           
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Type">
                                                <ItemTemplate>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPaymentType" runat="server"  >
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtBankName" runat="server" Text=""   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque No">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtCheckNo" runat="server" Text="" onkeyup="valid(this)" onblur="valid(this)">
                                                    </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" Text=""></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmount"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddMore" runat="server" Text="Add More" OnClick="btnAddMore_Click" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="6" style="text-align: center;">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

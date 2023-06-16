<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.PaymentReceipt"
    CodeBehind="PaymentReceipt.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Payment Receipt</div>
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
                                    R.A Bill No.
                                 
                                    <asp:TextBox CssClass="form-control" ID="txtRABillNo" runat="server" Text="" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Date   <asp:Label ID="lblDate1" class="form-control" runat="server"></asp:Label>
                 
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GridView1" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Type">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlPaymentType" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Name">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtBankName" runat="server" Text="" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque No">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtCheckNo" runat="server" Text="" onkeyup="valid(this)"
                                                    onblur="valid(this)">
                                                </asp:TextBox>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" Text=""></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmount"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddMore" runat="server"
                                                    Text="+ Add More" OnClick="btnAddMore_Click" />
                                            </FooterTemplate>


                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

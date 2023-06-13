<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddPaymentType" Codebehind="AddPaymentType.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Payment Type Detail</div>
                        <div class="row"  style="width: 930px;">
                            <div class="row" >
                                <div class="col-lg-4"   >
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server"   AutoGenerateColumns="false"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                                        OnRowUpdating="GridView1_RowUpdating" EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("TypeID") %>' />
                                                </ItemTemplate>
                                             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentType" runat="server" Text='<%#Bind("PaymentType") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtPaymentType" runat="server" Width="250px" Text='<%#Bind("PaymentType") %>'
                                                        onkeyup="valid(this)" onblur="valid(this)">
                                                    </asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                       
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"   >
                                    <div class="card-body">
                                        <div class="card-header">
                                            Add Payment Type</div>
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Payment Type
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtPaymentType" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
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

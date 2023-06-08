﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.TypeOfAdvanceRequisition" Codebehind="TypeOfAdvanceRequisition.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Type</h3>
                        <div class="row"  style="width: 500px">
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 550px; vertical-align: top;">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GvTypeofAdvanceRequisition" runat="server" Width="540px" AutoGenerateColumns="false"
                                        EmptyDataText="No Record Found" OnRowCancelingEdit="GvTypeofAdvanceRequisition_RowCancelingEdit"
                                        OnRowEditing="GvTypeofAdvanceRequisition_RowEditing" OnRowUpdating="GvTypeofAdvanceRequisition_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemStyle Width="30px" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TransId" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTransid" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" runat="server" Text='<%#Bind("Type") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtType" runat="server" Width="250px" onkeyup="valid(this)" onblur="valid(this)"
                                                        Text='<%#Bind("Type") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"  style="width: 380px;">
                                    <div class="card-body">
                                        <h3 class="reallynow">
                                            Add Type</h3>
                                        <div class="row"  style="width: 350px; vertical-align: top;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Type Of Advance Requisition
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txttypeofadvancerequisition" runat="server"   onkeyup="valid(this)"
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

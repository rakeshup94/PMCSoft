﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Department" Codebehind="Department.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Department Detail</h3>
                        <div class="row"   >
                            <div class="row"  style="vertical-align: top;">
                                <div class="col-lg-4"  style="vertical-align: top; width: 520px;">
                                    <asp:GridView CssClass="table table-striped"  ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="510px"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="Hiddenfield1" runat="server" Value='<%#Bind("DeptID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDepartment" runat="server" Text='<%#Bind("DepartmentName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtEditDepartment" runat="server" Text='<%#Bind("DepartmentName") %>'
                                                          onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"  style="vertical-align: top; width: 400px;">
                                    <div class="card-body">
                                        <h3 class="reallynow">
                                            Add Department</h3>
                                        <div class="row"  style="width: 390px; vertical-align: top;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Department
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtDepartment" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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

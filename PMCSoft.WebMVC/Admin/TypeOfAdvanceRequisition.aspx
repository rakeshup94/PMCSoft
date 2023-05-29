﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.TypeOfAdvanceRequisition" Codebehind="TypeOfAdvanceRequisition.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Type</h3>
                        <div class="row"  style="width: 500px">
                            <tr>
                                <td style="width: 550px; vertical-align: top;">
                                    <asp:GridView ID="GvTypeofAdvanceRequisition" runat="server" Width="540px" AutoGenerateColumns="false"
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
                                </td>
                                <td style="width: 380px;">
                                    <div id="rightnow">
                                        <h3 class="reallynow">
                                            Add Type</h3>
                                        <div class="row"  style="width: 350px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    Type Of Advance Requisition
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txttypeofadvancerequisition" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                          </div>
                                    </div>
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

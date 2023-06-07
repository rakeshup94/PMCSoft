<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.SecurityForAdvanceRequisition" Codebehind="SecurityForAdvanceRequisition.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Advance Requisition Security</h3>
                        <table style="width: 930px">
                            <tr>
                                <td style="width: 550px; vertical-align: top;">
                                    <asp:GridView ID="GvAdvancePaymentSecurity" runat="server" Width="540px" AutoGenerateColumns="false"
                                        EmptyDataText="No Record Found" OnRowCancelingEdit="GvAdvancePaymentSecurity_RowCancelingEdit"
                                        OnRowEditing="GvAdvancePaymentSecurity_RowEditing" OnRowUpdating="GvAdvancePaymentSecurity_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemStyle Width="30px" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="S.No" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTransId" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Security">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentSecurity" runat="server" Text='<%#Bind("PaymentSecurity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPaymentSecurity" runat="server" Width="250px" onkeyup="valid(this)"
                                                        onblur="valid(this)" Text='<%#Bind("PaymentSecurity") %>'></asp:TextBox>
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
                                            Add Security</h3>
                                        <table style="width: 350px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    Security Advance Requisition
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsecurityadvancereq" runat="server" Width="200px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Report_PaymentReceipt" Codebehind="PaymentReceipt.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Payment Receipt</h3>
                        <table style="width: 930px;">
                            <tr>
                                <td style="width: 100px; text-align: center;">
                                    Project
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" Width="200px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" Width="910px" AutoGenerateColumns="false"
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
                                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="R A Bill No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRABillNo" runat="server" Text='<%#Bind("RABillNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentType" runat="server" Text='<%#Bind("PaymentType") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTypeID" runat="server" Value='<%#Bind("TypeID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="200px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="200px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChequeNo" runat="server" Text='<%#Bind("ChequeNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Created Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

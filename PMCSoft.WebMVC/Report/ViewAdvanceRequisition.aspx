<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.ViewAdvanceRequisition" Codebehind="ViewAdvanceRequisition.aspx.cs" %>

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
                            Advance Requisition</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr>
                                <td style="width: 100px; text-align: center; vertical-align: top;">
                                    Project
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="True" Width="200px"
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
                                            <asp:TemplateField HeaderText="Req. ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblARId" runat="server" Text='<%#Bind("ARId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendor" runat="server" Text='<%#Bind("Vendor") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Req. Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" runat="server" Text='<%#Bind("Type") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Security">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAnysecurityCreated" runat="server" Text='<%#Bind("AnysecurityCreated") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Security Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentSecurity" runat="server" Text='<%#Bind("PaymentSecurity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reason">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReasion" runat="server" Text='<%#Bind("Reasion") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Center" />
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

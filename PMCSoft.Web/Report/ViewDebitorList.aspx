<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Report_ViewDebitorList" Codebehind="ViewDebitorList.aspx.cs" %>

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
                            Creditor List</h3>
                        <table style="width: 930px">
                            <tr>
                                <td style="text-align: center;">
                                    Project Name
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject1" runat="server" Width="200px" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    Approval Type
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="Select Type" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Approved" Value="A"></asp:ListItem>
                                        <asp:ListItem Text="Suggest Amount" Value="S"></asp:ListItem>
                                        <asp:ListItem Text="Disapproved" Value="D"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="E"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="920px"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnListID" runat="server" Value='<%#Bind("ListID") %>' />
                                                    <asp:HiddenField ID="hdnApproveListID" runat="server" Value='<%#Bind("ApproveListID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Party / Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnVendorID" runat="server" Value='<%#Bind("VendorID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("ApprovalRemarks") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Suggest Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSuggestAmount" runat="server" Text='<%#Bind("SuggestAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Created Date">
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

<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Inventory_EnterStockDetails" Codebehind="EnterStockDetails.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -80px;">
                <div id="content" style="width: 1090px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Stock Opening</h3>
                        <table style="width: 1060px;">
                            <tr>
                              
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: center;">
                                    Project:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" Width="250px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                                <td style="width: 450px;">
                                </td>
                                <td style="width: 60px;">
                                    <asp:Label ID="lblDate1" runat="server" Text="Date:" Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDate" runat="server" Width="200px" Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <table style="width: 940px;">
                                <tr>
                                    <td colspan="9">
                                        <asp:GridView ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                            Width="925" OnRowDataBound="GVMaterialReceive_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Group">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlItemCode" runat="server" Width="150px" OnSelectedIndexChanged="ddlItemCode_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="150px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Name">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlItemName" runat="server" Width="140px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="140px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlUnit" runat="server" Width="100px" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Make">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TxtItemMake" runat="server" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Part No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TxtpartNo" runat="server" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Width="100px"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQuantity"
                                                            FilterType="Custom, Numbers" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rate">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRate" runat="server" Width="100px"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                                            FilterType="Custom, Numbers" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRemarks" Width="180px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle VerticalAlign="Top" Width="200px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                            <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        </asp:GridView>
                                    </td>
                                    <tr>
                                        <td colspan="6" style="text-align: center;">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        </td>
                                    </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

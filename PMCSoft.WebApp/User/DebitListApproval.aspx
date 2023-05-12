<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="User_DebitListApproval" Codebehind="DebitListApproval.aspx.cs" %>

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
                            Debitors List For Approval</h3>
                        <table style="width: 930px;">
                            <tr>
                                <td style="width: 120px; text-align: center;">
                                    Project Name
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                                        Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    Forward To
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="915px"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Party / Vendor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendorName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnVendorID" runat="server" Value='<%#Bind("VendorID") %>' />
                                                    <asp:HiddenField ID="hdnListID" runat="server" Value='<%#Bind("ListID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("Remarks") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Forward By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblForwardBy" runat="server" Text='<%#Bind("ForwardBy") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnCreatedBy" runat="server" Value='<%#Bind("CreatedBy") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:RadioButtonList ID="rbl" runat="server" AutoPostBack="true" RepeatDirection="Vertical"
                                                        Width="120px" OnSelectedIndexChanged="rbl_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True" Text="Approved" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Suggest Amount" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disapproved" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </ItemTemplate>
                                                <ItemStyle Width="130px" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="150px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Suggest Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtSuggestAmount" runat="server" Width="100px" Enabled="false" ReadOnly="true"
                                                        BorderColor="Gray" BackColor="LightGray">
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                        TargetControlID="txtSuggestAmount" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Middle" Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: center;">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.DebitListApproval" Codebehind="DebitListApproval.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Debitors List For Approval</h3>
                        <div class="row"  style="width: 930px;">
                            <tr>
                                <td style="width: 120px; text-align: center;">
                                    Project Name
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    Forward To
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="form-select" ID="ddlEmployee" runat="server" AutoPostBack="True"  >
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
                                                <ItemStyle   VerticalAlign="Top" />
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
                                                    <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" TextMode="MultiLine"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle   VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Suggest Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtSuggestAmount" runat="server" Width="100px" Enabled="false" ReadOnly="true"
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
                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

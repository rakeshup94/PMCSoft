<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="Admin_AddBOQ" Codebehind="AddBOQ.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
	function preventBack(){window.history.forward();}
	setTimeout("preventBack()", 0);
	window.onunload=function(){null};
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset style="border-width: 2px;">
                <table style="width: 100%; vertical-align: top;">
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Text="Mannual Entry" Value="0"></asp:ListItem>
                                <asp:ListItem Text="BOQ Upload" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server">
                                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                    <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                        <HeaderTemplate>
                                            Category
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 150px;">
                                                        Project Name
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlProject" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 450px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Item No.
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtBOQItemNo" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Category
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCategory" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Description of Item
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Unit
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlUnit" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Quantity
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Rate
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRate" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 20px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: center;">
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                        <HeaderTemplate>
                                            Sub-Category
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 150px;">
                                                        Project Name
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlProjectSub" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 450px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Category
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCategory" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        Sub-Category
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubCategory" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Description of Item
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubDescription" runat="server" TextMode="MultiLine" Width="200px">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Unit
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlSubUnit" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Quantity
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubQuantity" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Rate
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubRate" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 20px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: center;">
                                                        <asp:Button ID="btnSubSubmit" runat="server" Text="Submit" OnClick="btnSubSubmit_Click" />
                                                        <asp:Button ID="btnSubCancel" runat="server" Text="Cancel" OnClick="btnSubCancel_Click" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="Tab3" runat="server" TabIndex="2">
                                        <HeaderTemplate>
                                            Sub-Category Part</HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 150px;">
                                                        Project Name
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlProjectSubPart" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 450px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Category
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlPartCategory" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        Sub-Category
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlPartSubCategory" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Sub Part
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPart" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Description of Item
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPartDescription" runat="server" TextMode="MultiLine" Width="200px">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Unit
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlPartUnit" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        Quantity
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPartQuantity" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Rate
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPartRate" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 20px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: center;">
                                                        <asp:Button ID="btnPartSubmit" runat="server" Text="Submit" OnClick="btnPartSubmit_Click" />
                                                        <asp:Button ID="btnPartCancel" runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="Tab4" runat="server" TabIndex="3">
                                        <HeaderTemplate>
                                            BOQ Upload</HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 1050px">
                                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                                        <asp:Button ID="btnBOQUpload" runat="server" Text="Upload" OnClick="btnBOQUpload_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 1050px">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

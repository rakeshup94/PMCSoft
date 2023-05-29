<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.BOQItems" Codebehind="BOQItems.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset style="border-width: 2px;">
                <div class="row"  style="width: 100%;">
                    <tr>
                        <td>
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                    <HeaderTemplate>
                                        BOQ Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Item Name
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server"  ></asp:TextBox>
                                                </td>
                                                <td>
                                                    <%--Item No.--%>
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox CssClass="form-control" ID="txtBOQItemNo" runat="server"  ></asp:TextBox>--%>
                                                </td>
                                                <td style="width: 400px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Description of Item
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"  ></asp:TextBox>
                                                </td>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server"  >
                                                    </asp:DropDownList>
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
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                    <HeaderTemplate>
                                        BOQ Sub-Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Sub-Items
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtSubCategory" runat="server"  ></asp:TextBox>
                                                </td>
                                                <td style="width: 400px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Description of Item
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtSubDescription" runat="server" TextMode="MultiLine"  >
                                                    </asp:TextBox>
                                                </td>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlSubUnit" runat="server"  >
                                                    </asp:DropDownList>
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
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubSubmit" runat="server" Text="Submit" OnClick="btnSubSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubCancel" runat="server" Text="Cancel" OnClick="btnSubCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab3" runat="server" TabIndex="2">
                                    <HeaderTemplate>
                                        BOQ Sub-Items Part</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <tr>
                                                <td>
                                                    Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Sub-Items
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 300px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Sub-Items Part
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtPart" runat="server"  ></asp:TextBox>
                                                </td>
                                                <td>
                                                    Description of Sub-Item Part
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtPartDescription" runat="server" TextMode="MultiLine"  >
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
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartUnit" runat="server"  >
                                                    </asp:DropDownList>
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
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartSubmit" runat="server" Text="Submit" OnClick="btnPartSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartCancel" runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </td>
                    </tr>
                  </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

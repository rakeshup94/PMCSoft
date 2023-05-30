<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.BOQItems" Codebehind="BOQItems.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset style="border-width: 2px;">
                <div class="row"  style="width: 100%;">
                    <div class="row" >
                        <div class="col-lg-4" >
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                    <HeaderTemplate>
                                        BOQ Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Item Name
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server"  ></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <%--Item No.--%>
                                                </div>
                                                <div class="col-lg-4" >
                                                    <%--<asp:TextBox CssClass="form-control" ID="txtBOQItemNo" runat="server"  ></asp:TextBox>--%>
                                                </div>
                                                <div class="col-lg-4"  style="width: 400px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Description of Item
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"  ></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Unit
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="5" style="height: 20px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                    <HeaderTemplate>
                                        BOQ Sub-Items
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Items
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Sub-Items
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtSubCategory" runat="server"  ></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4"  style="width: 400px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Description of Item
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtSubDescription" runat="server" TextMode="MultiLine"  >
                                                    </asp:TextBox>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Unit
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlSubUnit" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="5" style="height: 20px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubSubmit" runat="server" Text="Submit" OnClick="btnSubSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubCancel" runat="server" Text="Cancel" OnClick="btnSubCancel_Click" />
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab3" runat="server" TabIndex="2">
                                    <HeaderTemplate>
                                        BOQ Sub-Items Part</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row"  style="width: 100%;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Items
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Sub-Items
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4"  style="width: 300px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Sub-Items Part
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtPart" runat="server"  ></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4" >
                                                    Description of Sub-Item Part
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtPartDescription" runat="server" TextMode="MultiLine"  >
                                                    </asp:TextBox>
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Unit
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartUnit" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="5" style="height: 20px;">
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="4" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartSubmit" runat="server" Text="Submit" OnClick="btnPartSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartCancel" runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                          </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>
                  </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

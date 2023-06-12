<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Inventory.EnterStockDetails" Codebehind="EnterStockDetails.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -80px;">
                <div class="card"  style="width: 1090px;">
                    <div class="card-body">
                        <h3 class="reallynow">
                            Stock Opening</h3>
                        <div class="row"  style="width: 1060px;">
                            <div class="row" >
                              
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 100px; text-align: center;">
                                    Project:
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" Width="250px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                </div>
                                <div class="col-lg-4"  style="width: 450px;">
                                </div>
                                <div class="col-lg-4"  style="width: 60px;">
                                    <asp:Label ID="lblDate1" runat="server" Text="Date:" Visible="false"></asp:Label>
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Label ID="lblDate" runat="server"   Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                          </div>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div class="row"    >
                                <div class="row" >
                                    <div class="col-lg-4"  colspan="9">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false" ShowFooter="true"
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
                                                        <asp:DropDownList CssClass="form-select" ID="ddlItemCode" runat="server"   OnSelectedIndexChanged="ddlItemCode_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Name">
                                                    <ItemTemplate>
                                                        <asp:DropDownList CssClass="form-select" ID="ddlItemName" runat="server" Width="140px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="140px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit">
                                                    <ItemTemplate>
                                                        <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server"   AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Make">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TxtItemMake" runat="server"  ></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Part No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TxtpartNo" runat="server"  ></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server"  ></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQuantity"
                                                            FilterType="Custom, Numbers" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rate">
                                                    <ItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtRate" runat="server"  ></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                                            FilterType="Custom, Numbers" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtRemarks"   TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle VerticalAlign="Top"   />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                            <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        </asp:GridView>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"  colspan="6" style="text-align: center;">
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
                              </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

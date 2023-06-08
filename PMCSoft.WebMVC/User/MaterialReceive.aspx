<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.MaterialReceive" Title="Material Receive" Codebehind="MaterialReceive.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"  style="width: 950px;">
                    <div class="card-body">
                        <h3 class="reallynow">
                            Material Receive</h3>
                        <div class="row"  style="width: 940px; vertical-align: top;">
                            <div class="row" >
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Project
                                </div>
                                <div class="col-lg-4"   >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Vender
                                </div>
                                <div class="col-lg-4"   >
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Address
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                        onblur="valid(this)"   ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    Gate Entry No
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtGateEntryNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    PO.No
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtPoNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    PO.Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtPOdate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtPOdate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    Received.Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtReceivedDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtReceivedDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    Received By
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="DdlReceivedBy" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="DdlReceivedBy_SelectedIndexChanged">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan No.
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtBillChallanNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan Date.
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="TxtBillChallanDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtBillChallanDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                </div>
                                <div class="col-lg-4" >
                                </div>
                                <div class="col-lg-4" >
                                </div>
                                <div class="col-lg-4" >
                                </div>
                            </div>
                          </div>
                        <div class="row"    >
                            <div class="row" >
                                <div class="col-lg-4"  colspan="6">
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
                                                    <asp:DropDownList CssClass="form-select" ID="ddlItemName" runat="server"   AutoPostBack="true" OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server" Width="100px" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQuantity"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtRate" runat="server" Width="100px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
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
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.MaterialReceive" Title="Material Receive" Codebehind="MaterialReceive.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 950px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Material Receive</h3>
                        <div class="row"  style="width: 940px; vertical-align: top;">
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Project
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Vender
                                </td>
                                <td style="vertical-align: top;">
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top; width: 100px;">
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                        onblur="valid(this)"   ReadOnly="true" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Gate Entry No
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtGateEntryNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    PO.No
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtPoNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    PO.Date
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtPOdate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtPOdate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Received.Date
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtReceivedDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtReceivedDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Received By
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="form-select" ID="DdlReceivedBy" runat="server" AutoPostBack="True"  
                                        OnSelectedIndexChanged="DdlReceivedBy_SelectedIndexChanged">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan No.
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtBillChallanNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                         ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: auto; text-align: center; vertical-align: top;">
                                    Bill/Challan Date.
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="TxtBillChallanDate" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                        Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TxtBillChallanDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                          </div>
                        <div class="row"  style="width: 940px;">
                            <tr>
                                <td colspan="6">
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
                                                    <asp:Button CssClass="btn btn-primary" ID="btnAddMore" runat="server" OnClick="btnAddMore_Click" Text="Add More" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle VerticalAlign="Top"   />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                                <tr>
                                    <td colspan="6" style="text-align: center;">
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

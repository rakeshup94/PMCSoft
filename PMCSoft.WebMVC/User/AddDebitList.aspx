﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddDebitList" Codebehind="AddDebitList.aspx.cs" %>

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
                            Creditor List</h3>
                        <div class="row"  style="width: 930px">
                            <tr>
                                <td>
                                
                                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="920px">
                                        <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                            <HeaderTemplate>
                                                Add Creditor List</HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row"  style="width: 900px;">
                                                    <tr>
                                                        <td style="text-align: center;">
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
                                                            <asp:Panel ID="Panel1" runat="server" Visible="False" Width="880px">
                                                                <div class="row"  style="width: 900px; vertical-align: top;">
                                                                    <tr style="vertical-align: top;">
                                                                        <td style="vertical-align: top;">
                                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="870px"
                                                                                OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting"
                                                                                OnRowCommand="GridView1_RowCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="S.No">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="40px" HorizontalAlign="Center" VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Party / Vendor Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"  >
                                                                                            </asp:DropDownList>
                                                                                            <asp:Button CssClass="btn btn-primary" ID="btnAddVendor" runat="server" Text="+" CausesValidation="false" CommandName="AddVendor" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="250px" HorizontalAlign="Center" VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Amount">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" Width="100px"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                                                                TargetControlID="txtAmount" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Payment Type">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlPaymentType" runat="server"  >
                                                                                            </asp:DropDownList>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                                        <FooterTemplate>
                                                                                            <asp:Button CssClass="btn btn-primary" ID="btnAddMore" runat="server" Text="Add More" OnClick="btnAddMore_Click" />
                                                                                        </FooterTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" TextMode="MultiLine" Width="250px" onkeyup="valid(this)"
                                                                                                onblur="valid(this)">
                                                                                            </asp:TextBox>
                                                                                        </ItemTemplate>
                                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                                        <ItemStyle Width="250px" HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:CommandField ShowDeleteButton="True" />
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                                                <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center;">
                                                                            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                                            <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                                        </td>
                                                                    </tr>
                                                                  </div>
                                                            </asp:Panel>
                                                            <div style="display: none">
                                                                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                                            </div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                                                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                                                                <div class="row"  style="width: 350px; background-color: #EFFBFB;">
                                                                    <tr>
                                                                        <td>
                                                                            <div id="rightnow">
                                                                                <h3 class="reallynow">
                                                                                    Party / Vendor Detail</h3>
                                                                                <div class="row"  style="width: 325px; vertical-align: top;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            Name
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtName" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            Address
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"   onkeyup="valid(this)"
                                                                                                onblur="valid(this)"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            Country
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlCountry" runat="server" AutoPostBack="True"  
                                                                                                OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            State
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlState" runat="server" AutoPostBack="True"  
                                                                                                OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            City
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlCity" runat="server"  >
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            Mobile No.
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server"   MaxLength="10"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            Email
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"  ></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            PAN No
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="TxtPanNo" runat="server"  ></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            TIN
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="TxtTinNo" runat="server"  ></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            ECC No
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="TxtEccNo" runat="server"  ></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            VAT
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="TxtVat" runat="server"  ></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            Party / Vendor Type
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlVendorType" runat="server" Width="185px">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2" style="text-align: center;">
                                                                                            <asp:Button CssClass="btn btn-primary" ID="btnVSubmit" runat="server" Text="Submit" OnClick="btnVSubmit_Click" />
                                                                                            <asp:Button CssClass="btn btn-primary" ID="btnVCancel" runat="server" Text="Cancel" OnClick="btnVCancel_Click" />
                                                                                        </td>
                                                                                    </tr>
                                                                                  </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                  </div>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                  </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                            <HeaderTemplate>
                                                View Creditor List</HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row"  style="width: 900px">
                                                    <tr>
                                                        <td style="text-align: center;">
                                                            Project Name
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProject1" runat="server"   AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlProject1_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            Approval Type
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList CssClass="form-select" ID="ddlType" runat="server" AutoPostBack="true"   OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                                <asp:ListItem Selected="True" Text="Select Type" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Text="Approved" Value="A"></asp:ListItem>
                                                                <asp:ListItem Text="Suggest Amount" Value="S"></asp:ListItem>
                                                                <asp:ListItem Text="Disapproved" Value="D"></asp:ListItem>
                                                                <asp:ListItem Text="Pending" Value="E"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: center; width: 80px;">
                                                            Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                                                CssClass="cal_Theme1">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: center; width: 60px;">
                                                            <asp:Button CssClass="btn btn-primary" ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="7">
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="880px"
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
                                                                    <asp:TemplateField HeaderText="Payment Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPaymentType" runat="server" Text='<%#Bind("PaymentType") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("ApprovalRemarks") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Suggested Amt.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSuggestAmount" runat="server" Text='<%#Bind("SuggestAmount") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Bal. Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBalanceAmount" runat="server" Text='<%#Bind("BalanceAmount") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="100px" HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                  </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

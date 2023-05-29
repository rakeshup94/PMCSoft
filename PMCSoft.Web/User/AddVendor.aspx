<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddVendor" Codebehind="AddVendor.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -30px;">
                <div id="content" style="width: 1000px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Party / Vendor Detail</h3>
                        <table style="width: 990px">
                            <tr>
                                <td style="width: 650px; vertical-align: top;">
                                    &nbsp;&nbsp;Project Name&nbsp;&nbsp;<asp:DropDownList ID="ddlP" runat="server" AutoPostBack="true"
                                        Width="200px" OnSelectedIndexChanged="ddlP_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server" Width="640px" AutoGenerateColumns="false"
                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("VendorID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Party / Vendor Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendorName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendorType" runat="server" Text='<%#Bind("VendorType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEditVendor" runat="server" Text="Edit" CommandName="EditVendor">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                    <div style="display: none">
                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Style="display: none;">
                                        <table style="width: 350px; background-color: #EFFBFB;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Party / Vendor Detail</h3>
                                                        <table style="width: 330px;">
                                                            <tr>
                                                                <td>
                                                                    Name
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEName" runat="server" Width="200px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Address
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEAddress" runat="server" TextMode="MultiLine" Width="205px" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Country
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlECountry" runat="server" AutoPostBack="True" Width="205px"
                                                                        OnSelectedIndexChanged="ddlECountry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    State
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlEState" runat="server" AutoPostBack="True" Width="205px"
                                                                        OnSelectedIndexChanged="ddlEState_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    City
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlECity" runat="server" Width="205px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Mobile No.
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="txtEMobileNo" runat="server" MaxLength="10"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Email
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEEmail" runat="server" Width="200px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Party / Vendor Type
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlEVendorType" runat="server" Width="205px">
                                                                        <%--<asp:ListItem Selected="True" Text="Select Vendor Type" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="PRW" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Shuttering" Value="3"></asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Project Name
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ImageUrl="~/Images/DropDownList.png" />
                                                                    <asp:Panel ID="Panel2" runat="server" CssClass="bgdesign" Style="display: none;">
                                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                                            ShowHeader="false">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSW" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="10" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>' Font-Size="14px"></asp:Label>
                                                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                    <cc1:PopupControlExtender ID="PopupControlExtender2" runat="server" TargetControlID="ImageButton2"
                                                                        PopupControlID="Panel2" Position="Bottom" OffsetY="-16">
                                                                    </cc1:PopupControlExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="btnESubmit" runat="server" Text="Submit" OnClick="btnESubmit_Click" />
                                                                    <asp:Button ID="btnECancel" runat="server" Text="Cancel" OnClick="btnECancel_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td style="width: 330px;">
                                    <div id="rightnow">
                                        <h3 class="reallynow">
                                            Add Party / Vendor</h3>
                                        <table style="width: 325px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    Name
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtName" runat="server" Width="200px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Address
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="205px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Country
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" Width="205px"
                                                        OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    State
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" Width="205px"
                                                        OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    City
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCity" runat="server" Width="205px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Mobile No.
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMobileNo" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Email
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    PAN No
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TxtPanNo" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    TIN
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TxtTinNo" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    ECC No
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TxtEccNo" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    VAT
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TxtVat" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Party / Vendor Type
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlVendorType" runat="server" Width="185px">
                                                        <%--<asp:ListItem Selected="True" Text="Select Vendor Type" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="PRW" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Shuttering" Value="3"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:Button ID="btnAdd" runat="server" Text="+" OnClick="btnAdd_Click" />
                                                    <div style="display: none">
                                                        <asp:Button ID="Button2" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                                        PopupControlID="Panel3" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel3" runat="server" Style="display: none;">
                                                        <table style="width: 350px; background-color: #EFFBFB;">
                                                            <tr>
                                                                <td>
                                                                    <div id="Div1">
                                                                        <h3 class="reallynow">
                                                                            Party / Vendor Type</h3>
                                                                        <table style="width: 330px;">
                                                                            <tr>
                                                                                <td style="width: 100px;">
                                                                                    Type
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtVendorType" runat="server" Width="200px" onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: center;">
                                                                                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" />
                                                                                    <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Cancel" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Project Name
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="~/Images/DropDownList.png" />
                                                    <asp:Panel ID="pnlCustomers" runat="server" CssClass="bgdesign" Style="display: none;">
                                                        <asp:GridView ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                            ShowHeader="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSW" runat="server" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>' Font-Size="14px"></asp:Label>
                                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                    <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="ImageButton1"
                                                        PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-16">
                                                    </cc1:PopupControlExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

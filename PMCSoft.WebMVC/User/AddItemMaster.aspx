<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddItemMaster" Codebehind="AddItemMaster.aspx.cs" %>

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
                            Item Detail</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr style="vertical-align: top;">
                                <td>
                                    Group Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlitemGropgrid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlitemGropgrid_SelectedIndexChanged"
                                        Width="200px">
                                    </asp:DropDownList>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="590px"
                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemStyle Width="30px" />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>.&nbsp;
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trans id" Visible="false">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnItemGroupID" runat="server" Value='<%#Bind("ItemGroupID") %>' />
                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnit" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnUnitID" runat="server" Value='<%#Bind("UnitID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Make">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMake" runat="server" Text='<%#Bind("Make") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Part No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPartNo" runat="server" Text='<%#Bind("PartNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEmpEdit" runat="server" Text="Edit" CommandName="EditDetail"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                                <td style="vertical-align: top; width: 300px;">
                                    <div id="rightnow">
                                        <h3 class="reallynow">
                                            Add Item</h3>
                                        <table style="width: 290px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    <br />
                                                    Group Name
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlGroup" runat="server" Width="180px">
                                                    </asp:DropDownList>
                                                    <asp:Button ID="LnkAddNewGroupName" runat="server" Text="+" OnClick="LnkAddNewGroupName_Click">
                                                    </asp:Button>
                                                    <div style="display: none">
                                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                                        PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel2" runat="server" Style="display: none; border-color: Maroon;">
                                                        <table style="width: 300px; background-color: #EFFBFB;">
                                                            <tr>
                                                                <td>
                                                                    <div id="Div1">
                                                                        <h3 class="reallynow">
                                                                            Add Item Group</h3>
                                                                        <table style="width: 290px; vertical-align: top;">
                                                                            <tr>
                                                                                <td>
                                                                                    Code
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtCode" runat="server" MaxLength="6" Width="200px" onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    Name
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtName" runat="server" Width="200px" onkeyup="valid(this)" onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: center;">
                                                                                    <asp:Button ID="btnAddNewGroupname" runat="server" Text="Submit" OnClick="btnAddNewGroupname_Click" />
                                                                                    <asp:Button ID="BtnCancelAddNewGroupName" runat="server" Text="Cancel" OnClick="BtnCancelAddNewGroupName_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Item Name
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemName" runat="server" Width="200px" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Unit
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlUnit" runat="server" Width="180px">
                                                    </asp:DropDownList>
                                                    <asp:Button ID="LnkAddNewUnit" runat="server" Text="+" 
                                                        onclick="LnkAddNewUnit_Click"></asp:Button>
                                                    <div style="display: none">
                                                        <asp:Button ID="Button3" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="popUpStyle"
                                                        PopupControlID="Panel3" TargetControlID="Button3" EnableViewState="False" DynamicServicePath=""
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel3" runat="server" Style="display: none; border-color: Maroon;">
                                                        <div id="rightnow">
                                                            <h3 class="reallynow">
                                                                Add Unit</h3>
                                                            <table style="width: 290px; vertical-align: top; background-color: #EFFBFB;">
                                                                <tr>
                                                                    <td>
                                                                        Name
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtaddnewUnitName" runat="server" Width="200px" onkeyup="valid(this)" onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Code
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtaddnewUnitcode" runat="server" MaxLength="6" Width="200px" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" style="text-align: center;">
                                                                        <asp:Button ID="btnAddNewsave" runat="server" Text="Submit" 
                                                                            onclick="btnAddNewsave_Click"/>
                                                                        <asp:Button ID="BtnAddNewCancel" runat="server" Text="Cancel" 
                                                                            onclick="BtnAddNewCancel_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Make
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemMake" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                        Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Part No.
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemPartNo" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                        Width="200px"></asp:TextBox>
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
            <div style="display: none">
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </div>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                Enabled="True">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                <table style="width: 300px; background-color: #EFFBFB;">
                    <tr>
                        <td>
                            <div id="rightnow">
                                <h3 class="reallynow">
                                    Edit Item</h3>
                                <table style="width: 290px; vertical-align: top;">
                                    <tr>
                                        <td>
                                            Group
                                        </td>
                                        <td>
                                            <asp:Label ID="LblEditGroup" runat="server" Width="200px">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Item Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TxtEditItem" runat="server" Width="200px" onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Unit
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEditUnit" runat="server" Width="200px">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Make
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEditMake" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                Width="200px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Part No.
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditPartNo" runat="server" onblur="valid(this)" onkeyup="valid(this)"
                                                Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <asp:Button ID="EditSubmit" runat="server" Text="Submit" OnClick="EditSubmit_Click" />
                                            <asp:Button ID="EditCancel" runat="server" Text="Cancel" OnClick="EditCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddItemGroupMaster" Codebehind="AddItemGroupMaster.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Item Group Detail</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr style="vertical-align: top;">
                            
                                <td style="vertical-align: top; width: 600px;">
                                    <asp:GridView ID="GVGroup" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                        OnRowCancelingEdit="GVGroup_RowCancelingEdit" OnRowEditing="GVGroup_RowEditing"
                                        OnRowUpdating="GVGroup_RowUpdating" EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupCode" runat="server" Text='<%#Bind("GroupCode") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtGroupCode" runat="server" Text='<%#Bind("GroupCode") %>' onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtGroupName" runat="server" Text='<%#Bind("GroupName") %>' onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="250px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                <td style="vertical-align: top; width: 300px;">
                                    <div id="rightnow">
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

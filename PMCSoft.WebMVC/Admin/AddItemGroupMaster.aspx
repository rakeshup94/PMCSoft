<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddItemGroupMaster" Codebehind="AddItemGroupMaster.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Item Group Detail</h3>
                        <div class="row"  style="width: 930px; vertical-align: top;">
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
                                                    <asp:TextBox CssClass="form-control" ID="txtGroupCode" runat="server" Text='<%#Bind("GroupCode") %>' onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#Bind("GroupName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtGroupName" runat="server" Text='<%#Bind("GroupName") %>' onkeyup="valid(this)"
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
                                        <div class="row"  style="width: 290px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    Code
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" MaxLength="6"   onkeyup="valid(this)"
                                                        onblur="valid(this)">
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Name
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server"   onkeyup="valid(this)" onblur="valid(this)">
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                          </div>
                                    </div>
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

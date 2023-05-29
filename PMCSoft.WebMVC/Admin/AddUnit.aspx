<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddUnit" Codebehind="AddUnit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Unit Detail</h3>
                        <div class="row"  style="width: 930px; vertical-align: top;">
                            <tr style="vertical-align: top;">
                                <td style="vertical-align: top; width: 600px;">
                                    <asp:GridView ID="GVUnit" runat="server" AutoGenerateColumns="false" GridLines="Both"
                                        OnRowCancelingEdit="GVUnit_RowCancelingEdit" OnRowEditing="GVUnit_RowEditing"
                                        OnRowUpdating="GVUnit_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnitName" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtUnitName" runat="server" Text='<%#Bind("UnitName") %>' onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUnitCode" runat="server" Text='<%#Bind("UnitCode") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtUnitCode" runat="server" Text='<%#Bind("UnitCode") %>' onkeyup="valid(this)"
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
                                            Add Unit</h3>
                                        <div class="row"  style="width: 290px; vertical-align: top;">
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

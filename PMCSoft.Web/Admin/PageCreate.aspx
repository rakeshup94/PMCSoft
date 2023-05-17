﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.PageCreate" Codebehind="PageCreate.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Unit Detail</h3>
                        <table style="width: 930px; vertical-align: top;">
                            <tr style="vertical-align: top;">
                                <td style="vertical-align: top; width: 600px;">
                                    <asp:GridView ID="GVPage" runat="server" AutoGenerateColumns="false" GridLines="Both">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Page Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPageName" runat="server" Text='<%#Bind("UnitName") %>'></asp:Label>
                                                </ItemTemplate>
                                              
                                                <ItemStyle Width="250px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("UnitCode") %>'></asp:Label>
                                                </ItemTemplate>
                                               
                                                <ItemStyle Width="250px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                <td style="vertical-align: top; width: 300px;">
                                    <div id="rightnow">
                                        <h3 class="reallynow">
                                            Add Page</h3>
                                         <table style="width: 290px; vertical-align: top;">
                                            <tr>
                                                <td>
                                                    Menu Header
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMenu" runat="server" Width="200px">
                                                    </asp:DropDownList>
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
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                                        onclick="btnSubmit_Click"  />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                                        onclick="btnCancel_Click" />
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


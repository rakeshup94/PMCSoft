<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls_ucmenu" CodeBehind="ucmenu.ascx.cs" %>

<asp:Menu ID="menu" runat="server" DataSourceID="xmlDataSource" CssClass="nav" Orientation="Vertical">
    <DataBindings>
        <asp:MenuItemBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text" />
    </DataBindings>
    <LevelMenuItemStyles>
        <asp:MenuItemStyle CssClass="nav" />
    </LevelMenuItemStyles>
    <LevelSelectedStyles>
        <asp:MenuItemStyle CssClass="nav nav-second-level" />
    </LevelSelectedStyles>
    <StaticSelectedStyle CssClass="active" />
</asp:Menu>
<asp:XmlDataSource ID="xmlDataSource" TransformFile="~/TransformXSLT.xslt" XPath="MenuItems/MenuItem"
    runat="server" />







﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VerticleMenu.ascx.cs"
    Inherits="PMCSoft.Web.UserControls.VerticleMenu" %>
<ul id="side-menu" class="nav">
    <li class="user-panel">
        <div class="thumb">
            <img src="<%= Page.ResolveUrl("~/images/profile.jpg")%>" alt="" class="img-circle">
        </div>
        <div class="info">
            <p>John Doe</p>
            <ul class="list-inline list-unstyled">
                <li><a href="#" data-hover="tooltip" title="Profile"><i class="fa fa-user"></i></a>
                </li>
                <li><a href="#" data-hover="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>
                </li>
                <li><a href="#" data-hover="tooltip" title="Setting" data-toggle="modal" data-target="#modal-config">
                    <i class="fa fa-cog"></i></a></li>
                <li><a href="#" data-hover="tooltip" title="Logout"><i class="fa fa-sign-out"></i></a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </li>
    <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptMenu_OnItemBound">
        <ItemTemplate>
            <li>
                <a href="<%# this.GetItemUrl(Eval("NavigateURL") as string)%>">
                    
             
                    
                    <i class="<%# Eval("MenuIcon") %>"><div class="icon-bg bg-dark"></div></i>
                    
                    <span class="menu-title">
                    <%# 
                        
                        (Convert.ToBoolean(Eval("IsAction")) ? Eval("MenuName").ToString().ToUpper() : Eval("MenuName").ToString().ToUpper() +"<i class='fa arrow'></i>")




                            
                        
                        
                        
                        
                        
                    %>
                    </span>



                   
                </a>
                <asp:Literal ID="ltrlSubMenu" runat="server"></asp:Literal>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>

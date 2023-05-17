<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.RSS.UpdateRSS" Codebehind="UpdateRSS.ascx.cs" %>
<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://www.ndtv.com/convergence/ndtv/rssnat.asp"
    XPath="rss/channel/item [position()<=100]"></asp:XmlDataSource>
<div style="padding-top: 0px; padding-bottom: 0px; height: 120px; background-color: #ECF5F8"
    id="Feeds">
    <marquee id="mrqImages" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="1"
        scrolldelay="5" direction="up" height="120px">
<div style=" background-color:#ECF5F8;border:none ; border:0px solid #ffffff">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1" 
      GridLines="Vertical"  BorderStyle="None" Height="120px">
            <ItemTemplate>
                <span style="color:#005480 ;"><font style="color:#a52c29 ; vertical-align:middle ; font-weight:bold">»&nbsp;</font><%#XPath("title")%></span>
                <span style="color:#888888 ;text-shadow: 1px 1px 1px #cccccc; "><%#XPath("pubDate")%></span><br />
               <font style=" font-weight:700"><%#XPath("author")%></font><br />
                <span style="color:#666666 ;"><%#XPath("description")%></span>
                <br /><br />
            </ItemTemplate>
                 <ItemStyle BackColor="#ECF5F8" ForeColor="#333333"  HorizontalAlign="Justify" BorderStyle="None"/>
               <%--  <AlternatingItemStyle BackColor="#e" ForeColor="#333333" Height="165px"/>
        --%>    <HeaderStyle BackColor="#ECF5F8" ForeColor="Black" Font-Bold="true" />
        </asp:DataList>
        </div>
</marquee>

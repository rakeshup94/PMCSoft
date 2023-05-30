<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.Home" Codebehind="Home.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/RSS/UpdateRSS.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        
    <div id="wrapper" style="margin-left: -150px;">
        <div class="card"  style="width: 1250px;">
            <div class="row"  style="width: 1240px;">
                <div class="row" >
                    <div class="col-lg-4" >
                        <div id="rightnow" style="width: 1230px;">
                            <h3 class="reallynow">
                                <span>Right Now</span>
                                <br />
                            </h3>
                            <p class="youhave">
                                You have
                                <asp:Label ID="lblP" runat="server" Text=""></asp:Label>
                                new projects
                            </p>
                        </div>
                        <div id="infobox" style="width: 455px; height: 192px;">
                            <h3>
                                Today&#39;s Labour Strength  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  
                                <asp:LinkButton ID="Lnktodaylabour" runat="server" Text="See More" 
                                    ForeColor="Blue" 
                                    onclick="Lnktodaylabour_Click" ></asp:LinkButton></h3>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:GridView CssClass="table table-striped"  ID="GridView1" runat="server" AutoGenerateColumns="false" Width="445px"
                                        AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                                        OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" CausesValidation="false" ForeColor="Blue" Font-Underline="true"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSK" runat="server" Text='<%#Bind("SK") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SEMI">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSEMI" runat="server" Text='<%#Bind("SEMI") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UNSK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUNSK" runat="server" Text='<%#Bind("UNSK") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOT" runat="server" Text='<%#Bind("OT") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                     
                                </ContentTemplate>
                            </asp:UpdatePanel>
                           
                        </div>
                        <div id="infobox" class="margin-left" style="width: 455px; height: 192px;">
                            <h3>
                                Staffs Attendance&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  <asp:LinkButton ID="LnkStaffatt" runat="server" Text="See More" CommandName="StaffattSeeMore" ForeColor="Blue" ></asp:LinkButton></h3>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:GridView CssClass="table table-striped"  ID="GridView2" runat="server" AutoGenerateColumns="false" Width="445px"
                                        AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5"
                                        OnRowCommand="GridView2_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name"  Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" ForeColor="Blue" Font-Underline="true"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Staff">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblECount" runat="server" Text='<%#Bind("ECount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Present Staff">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblECount1" runat="server" Text='<%#Bind("ECount1") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 305px; height: 192px;">
                            <h3>
                                Notifications</h3>
                            <div class="row"  style="width: 295px;">
                                <div class="row" >
                                    <div class="col-lg-4"  style="height: 150px;">
                                        <div style="padding-top: 0px; padding-bottom: 0px; height: 150px; background-color: #ECF5F8"
                                            id="Feeds">
                                            <marquee id="mrqImages" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="1"
                                                scrolldelay="1" direction="up" height="140px">
<div style=" background-color:#ECF5F8;border:none ; border:0px solid #ffffff">
                                                        <asp:DataList ID="DataList1" runat="server" GridLines="Vertical" BorderStyle="None"
                                                            Height="140px" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
                                                            <ItemTemplate>
                                                                <span style="color: #005480;">
                                                                    <asp:Label ID="lblTitle" runat="server" Text='<%#Bind("Title") %>'></asp:Label></span>
                                                                    <br />
                                                                <span style="color: #007480;">
                                                                    <asp:Label ID="lblCircularNo" runat="server" Text='<%#Bind("CircularNo") %>'>
                                                                    </asp:Label></span>
                                                                    <br />
                                                                <span style="color: #888888;">
                                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label></span>
                                                                    <br />
                                                                <span style="color: #666666;">
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'></asp:Label></span>
                                                                <br />
                                                                <asp:LinkButton ID="lnkAttachment" runat="server" Text='<%#Bind("FileNameOriginal") %>' Font-Size="10px" ForeColor="Blue" Font-Underline="true" CommandName="FileNameO">
                                                                </asp:LinkButton>
                                                                <asp:HiddenField ID="hdnAttachment" runat="server" Value='<%#Bind("FileName") %>'>
                                                                </asp:HiddenField>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        </div></marquee>
                                        </div>
                                    </div>
                                </div>
                              </div>
                        </div>
                        <div id="infobox" style="width: 455px; height: 172px;">
                              <h3>
                                 Total Labour Strength
                              &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  <asp:LinkButton ID="lnktotalLabour" runat="server" Text="See More" CommandName="TotalLabourSeeMore" ForeColor="Blue" ></asp:LinkButton></h3>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel8" runat="server" Height="145px" ScrollBars="Horizontal">
                                       <asp:GridView CssClass="table table-striped"  ID="GvTotalLaber" runat="server" AutoGenerateColumns="false" Width="440px"
                                        AllowPaging="True" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                   <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name"  Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" CausesValidation="false" ForeColor="Blue" Font-Underline="true"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSK" runat="server" Text='<%#Bind("SK") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="45px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SEMI">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSEMI" runat="server" Text='<%#Bind("SEMI") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="45px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UNSK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUNSK" runat="server" Text='<%#Bind("UNSK") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="45px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOT" runat="server" Text='<%#Bind("OT") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="45px" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Grant Total">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text='<%#Bind("Total") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 455px; height: 172px;">
                            <h3>
                                  Raw Material Receive 
                                   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  
                                  <asp:LinkButton ID="LinkButton1" runat="server" Text="See More" 
                                      CommandName="MatrielSeeMore" ForeColor="Blue" onclick="LinkButton1_Click" ></asp:LinkButton></h3>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                       <asp:Panel ID="Panel1" runat="server" Height="145px" ScrollBars="Horizontal">
                                       
                                                        <asp:GridView CssClass="table table-striped"  ID="GridView5" runat="server" AutoGenerateColumns="false" Width="445px">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Item Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("ItemName") %>'>
                                                                        </asp:Label>
                                                                        <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                       <%-- <asp:HiddenField ID="hdnItemGroupID" runat="server" Value='<%#Bind("ItemGroupID") %>' />--%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Today Receive">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTodayReceive" runat="server" Text='<%#Bind("MR") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total Receive">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTotalStock" runat="server" Text='<%#Bind("SQ") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                        </asp:GridView>
                                                  </asp:Panel>  
                                     </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 305px; height: 172px;">
                            <h3>Projects
                           &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  
                                <asp:LinkButton ID="Lnkprojectdetail" runat="server" Text="Detail" 
                                    ForeColor="Blue" 
                                    onclick="Lnkprojectdetail_Click" ></asp:LinkButton></h3>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                 <asp:GridView CssClass="table table-striped"  ID="GridView3" runat="server" AutoGenerateColumns="false" Width="290px"
                                        AllowPaging="True" OnPageIndexChanging="GridView3_PageIndexChanging" PageSize="4"
                                        OnRowCommand="GridView3_RowCommand" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CausesValidation="false" CommandName="Project" ForeColor="Blue" Font-Underline="true"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Cost (In Crore)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalCost" runat="server" Text='<%#Bind("OriginalContractValue") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="80px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStartDate" runat="server" Text='<%#Bind("StartDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndDate" runat="server" Text='<%#Bind("EndDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
              </div>
        </div>
    </div>
</asp:Content>

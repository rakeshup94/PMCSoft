<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Home" Codebehind="Home.aspx.cs" %>

 
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/RSS/UpdateRSS.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <div id="wrapper"    >
        <div class="card"     >
            <div class="row"  style="width: 1240px;">
                <div class="row" >
                    <div class="col-lg-4" >
                        <div id="rightnow" style="width: 1230px;">
                            <div class="card-header">
                                <span>Right Now</span>
                                <br />
                            </div>
                            <p class="youhave">
                                You have
                                <asp:Label ID="lblP" runat="server" Text=""></asp:Label>
                                new projects
                            </p>
                        </div>
                        <div id="infobox" style="width: 455px; height: 192px;">
                            <h3>
                                Today&#39;s Labour Strength</div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                <asp:Panel ID="Panel44" runat="server" Height="145px" Width="445px" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false" Width="445px"
                                        AllowPaging="True" 
                                        OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                           
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" CausesValidation="false"  ></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSK" runat="server" Text='<%#Bind("SK") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SEMI">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSEMI" runat="server" Text='<%#Bind("SEMI") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UNSK">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUNSK" runat="server" Text='<%#Bind("UNSK") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOT" runat="server" Text='<%#Bind("OT") %>'></asp:Label>
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 455px; height: 192px;">
                            <h3>
                                Staffs Attendance</div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                <asp:Panel ID="Panel4" runat="server" Height="145px" Width="445px" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView2" runat="server" AutoGenerateColumns="false" Width="445px"
                                        AllowPaging="True" 
                                        OnRowCommand="GridView2_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                           
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project"  ></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Staff">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblECount" runat="server" Text='<%#Bind("ECount") %>'></asp:Label>
                                                </ItemTemplate>
                                             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Present Staff">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblECount1" runat="server" Text='<%#Bind("ECount1") %>'></asp:Label>
                                                </ItemTemplate>
                                             
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                               
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 305px; height: 192px;">
                            <h3>
                                Notifications</div>
                            <%--<asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>--%>
                            <div class="row"  style="width: 295px;">
                                <div class="row" >
                                    <div class="col-lg-4"  style="text-align: right;">
                                          <asp:LinkButton ID="ImgAdd" runat="server" ImageUrl="~/img/icons/add.png" Width="12px"
                                            OnClick="ImgAdd_Click" />
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="col-lg-4"  style="height: 130px;">
                                        <div style="padding-top: 0px; padding-bottom: 0px; height: 120px; background-color: #ECF5F8"
                                            id="Feeds">
                                            <marquee id="mrqImages" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="1"
                                                scrolldelay="5" direction="up" height="120px">
<div style=" background-color:#ECF5F8;border:none ; border:0px solid #ffffff">
                                                        <asp:DataList ID="DataList1" runat="server" GridLines="Vertical" BorderStyle="None"
                                                            Height="120px" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
                                                            <ItemTemplate>
                                                                <span style="color: #005480;">
                                                                    <asp:Label ID="lblTitle" runat="server" Text='<%#Bind("Title") %>'></asp:Label></span>
                                                                    <br />
                                                                <span style="color: #007480;">
                                                                    <asp:Label ID="lblCircularNo" runat="server" Text='<%#Bind("CircularNo") %>'>
                                                                    </asp:Label></span>
                                                                    <br />
                                                                <span style="color: #888888;">
                                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label>
                                                                    </span>
                                                                    <br />
                                                                <span style="color: #666666;">
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'>
                                                                    </asp:Label></span>
                                                                <br />
                                                                <asp:LinkButton ID="lnkAttachment" runat="server" Text='<%#Bind("FileNameOriginal") %>' Font-Size="10px"   CommandName="FileNameO">
                                                                </asp:LinkButton>
                                                                <asp:HiddenField ID="hdnAttachment" runat="server" Value='<%#Bind("FileName") %>'>
                                                                </asp:HiddenField>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        </div></marquee>
                                        </div>
                                        <%--<My:UserInfoBoxControl ID="UIBC" runat="server" />--%>
                                    </div>
                                </div>
                              </div>
                            <%--</ContentTemplate>
                                    </asp:UpdatePanel>--%>
                        </div>
                        <div id="infobox" style="width: 455px; height: 172px;">
                            <h3>
                                 Total Labour Strength
                               </div>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel8" runat="server" Height="145px" ScrollBars="Both">
                                       <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GvTotalLaber" runat="server" AutoGenerateColumns="false" Width="440px"
                                        >
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                   <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                           
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" CausesValidation="false"  ></asp:LinkButton>
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
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 455px; height: 172px;">
                            <h3>
                                 Raw Material Receive</div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                 <asp:Panel ID="Panel2" runat="server" Height="145px" ScrollBars="Both">
                                      <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView4" runat="server" AutoGenerateColumns="false" Width="440px"
                                            OnRowCommand="GridView4_RowCommand">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkOpen" runat="server" Text="[+]" CausesValidation="false" CommandName="Open"
                                                            ForeColor="Blue"></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkClose" runat="server" Text="[-]" CausesValidation="false"
                                                            CommandName="Close" ForeColor="Blue" Visible="false"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Project Name">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                            CommandName="Project" CausesValidation="false"  >
                                                        </asp:LinkButton>
                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView5" runat="server" AutoGenerateColumns="false" Width="410px">
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
                                                           
                                                        </asp:GridView>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                           
                                        </asp:GridView>
                                       </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="infobox" class="margin-left" style="width: 305px; height: 172px;">
                            <h3>
                            Projects
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                 <asp:Panel ID="Panel3" runat="server" Height="145px" ScrollBars="Both">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView3" runat="server" AutoGenerateColumns="false"   
                                        AllowPaging="True"
                                        OnRowCommand="GridView3_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                           
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CausesValidation="false" CommandName="Project"  ></asp:LinkButton>
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
                                             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndDate" runat="server" Text='<%#Bind("EndDate") %>'></asp:Label>
                                                </ItemTemplate>
                                             
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                        <PagerStyle BackColor="#D9EAED" ForeColor="#202020" Font-Underline="true" />
                                    </asp:GridView>
                                 </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
              </div>
        </div>
    </div>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div style="display: none">
        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
    </div>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"  
        Enabled="True">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="display: none;   ">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <div class="row" iggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
            <ContentTemplate>
                <div class="row"  style="width: 410px; background-color: #EFFBFB;">
                    <div class="row" >
                        <div class="col-lg-4" >
                            <div class="card-body">
                                <div class="card-header">
                                    Add Notification</div>
                                <div class="row"  style="width: 400px;">
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Department
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                                 >
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Designation
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server"  >
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Subject
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Circular No.
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:TextBox CssClass="form-control" ID="txtCircularNo" runat="server"   onkeyup="valid(this)"
                                                onblur="valid(this)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Description
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine" Width="305px"
                                                onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Attachment
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"    >
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                  </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

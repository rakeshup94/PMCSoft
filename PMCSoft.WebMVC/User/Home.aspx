<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.Home"
    CodeBehind="Home.aspx.cs" %>


<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/RSS/UpdateRSS.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Home</div>
        </div>
        <ol class="breadcrumb page-breadcrumb">
        </ol>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="card">
                    <div class="card-header">
                        Right Now  You have
                        <asp:Label ID="lblP" runat="server"></asp:Label>
                        new projects        
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Today&#39;s Labour Strength                                                                       
                                <asp:LinkButton ID="Lnktodaylabour" runat="server" Text="See More"
                                    ForeColor="Blue"
                                    OnClick="Lnktodaylabour_Click"></asp:LinkButton>
                                </div>
                                <div class="card-body">


                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                ID="GridView1" runat="server" AutoGenerateColumns="false"
                                                AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5"
                                                OnRowCommand="GridView1_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                                CommandName="Project" CausesValidation="false"></asp:LinkButton>
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
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Staffs Attendance                                                                    
                            <asp:LinkButton ID="LnkStaffatt" runat="server" Text="See More" CommandName="StaffattSeeMore"
                                ForeColor="Blue"></asp:LinkButton>
                                </div>
                                <div class="card-body">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView2" runat="server" AutoGenerateColumns="false"
                                        AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5"
                                        OnRowCommand="GridView2_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project"></asp:LinkButton>
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
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Notifications
                                </div>
                                <div class="card-body">
                                    <asp:DataList ID="DataList1" runat="server" GridLines="Vertical" BorderStyle="None"
                                        OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
                                        <ItemTemplate>
                                            <p>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%#Bind("Title") %>'></asp:Label></span>
                                            </p>
                                            <p>
                                                <asp:Label ID="lblCircularNo" runat="server" Text='<%#Bind("CircularNo") %>'>
                                                </asp:Label>
                                            </p>
                                            <p>
                                                <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label></span>
                                            </p>
                                            <p>
                                                <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'></asp:Label></span>
                                            </p>
                                            <p>
                                                <asp:LinkButton ID="lnkAttachment" runat="server" Text='<%#Bind("FileNameOriginal") %>'
                                                    CommandName="FileNameO">
                                                </asp:LinkButton>
                                                <asp:HiddenField ID="hdnAttachment" runat="server" Value='<%#Bind("FileName") %>'>
                                                </asp:HiddenField>
                                            </p>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Total Labour Strength
                                                                                                   <asp:LinkButton ID="lnktotalLabour" runat="server" Text="See More" CommandName="TotalLabourSeeMore"
                                                                                                       ForeColor="Blue"></asp:LinkButton>
                                </div>
                                <div class="card-body">
                                    <asp:Panel ID="Panel8" runat="server" ScrollBars="Horizontal">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                            ID="GvTotalLaber" runat="server" AutoGenerateColumns="false"
                                            AllowPaging="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex+1 %>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                            CommandName="Project" CausesValidation="false"></asp:LinkButton>
                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SK">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSK" runat="server" Text='<%#Bind("SK") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SEMI">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSEMI" runat="server" Text='<%#Bind("SEMI") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="UNSK">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUNSK" runat="server" Text='<%#Bind("UNSK") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="OT">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOT" runat="server" Text='<%#Bind("OT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Grant Total">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text='<%#Bind("Total") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Raw Material Receive                                                                                                         
                                  <asp:LinkButton ID="LinkButton1" runat="server" Text="See More"
                                      CommandName="MatrielSeeMore" ForeColor="Blue" OnClick="LinkButton1_Click"></asp:LinkButton>
                                </div>
                                <div class="card-body">
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                            ID="GridView5" runat="server" AutoGenerateColumns="false">
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
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card-header">
                                    Projects
                        <asp:LinkButton ID="Lnkprojectdetail" runat="server" Text="Detail"
                            ForeColor="Blue"
                            OnClick="Lnkprojectdetail_Click"></asp:LinkButton>
                                </div>
                                <div class="card-body">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView3" runat="server" AutoGenerateColumns="false" Width="290px"
                                        AllowPaging="True" OnPageIndexChanging="GridView3_PageIndexChanging" PageSize="4"
                                        OnRowCommand="GridView3_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CausesValidation="false" CommandName="Project"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Cost (In Crore)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalCost" runat="server" Text='<%#Bind("OriginalContractValue") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
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
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

















</asp:Content>

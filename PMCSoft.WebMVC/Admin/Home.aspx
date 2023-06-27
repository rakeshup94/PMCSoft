<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Home"
    CodeBehind="Home.aspx.cs" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Home</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">


        <div class="card">

            <div class="card-header">
                <span>Right Now</span>


                You have
                                <asp:Label ID="lblP" runat="server" Text=""></asp:Label>
                new projects
                        



             

            </div>
            <div class="card-body">

                <div class="card-title">
                    <h3>Today&#39;s Labour Strength
                    </h3>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel44" runat="server" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="True"
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
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>



            <div class="card-body">
                <div class="card-title">
                    <h3>Staffs Attendance
                    </h3>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel4" runat="server">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView2" runat="server" AutoGenerateColumns="false"
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
                                </asp:Panel>
                            </ContentTemplate>

                        </asp:UpdatePanel>
                    </div>

                </div>


            </div>




            <div class="card-body">

                <div class="card-title">
                    <h3>Notifications
                    </h3>

                    <asp:LinkButton runat="server" ID="ltnAdd" Text="<i class='fa fa-plus text-green'></i>"
                        OnClick="ImgAdd_Click" CssClass="mediumtxt ps-3" />
                </div>

                <div class="row">

                    <div class="col-lg-6">
                        <asp:DataList ID="DataList1" runat="server" GridLines="Vertical" BorderStyle="None"
                            OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>

                                <asp:Label ID="lblTitle" runat="server" Text='<%#Bind("Title") %>'></asp:Label>

                                <asp:Label ID="lblCircularNo" runat="server" Text='<%#Bind("CircularNo") %>'>
                                </asp:Label>


                                <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate") %>'></asp:Label>



                                <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>'>
                                </asp:Label>

                                <asp:LinkButton ID="lnkAttachment" runat="server" Text='<%#Bind("FileNameOriginal") %>'
                                    CommandName="FileNameO">
                                </asp:LinkButton>
                                <asp:HiddenField ID="hdnAttachment" runat="server" Value='<%#Bind("FileName") %>'>
                                </asp:HiddenField>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                </div>


            </div>







            <div class="card-body">
                <div class="card-title">
                    <h3>Total Labour Strength
                    </h3>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel8" runat="server" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GvTotalLaber" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
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
                                    </asp:GridView>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>


            </div>


            <div class="card-body">
                <div class="card-title">
                    <h3>Raw Material Receive
                    </h3>
                </div>

                <div class="row">

                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel2" runat="server" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView4" runat="server" AutoGenerateColumns="false"
                                        OnRowCommand="GridView4_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOpen" runat="server" Text="[+]" CausesValidation="false" CommandName="Open"
                                                        ForeColor="Blue"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkClose" runat="server" Text="[-]" CausesValidation="false"
                                                        CommandName="Close" ForeColor="Blue" Visible="false"></asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Project Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        CommandName="Project" CausesValidation="false">
                                                    </asp:LinkButton>
                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                        ID="GridView5" runat="server" AutoGenerateColumns="false" Width="410px">
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

                </div>
            </div>





            <div class="card-body">
                <div class="card-title">
                    <h3>Projects
                    </h3>
                </div>

                <div class="row">

                    <div class="col-lg-6">

                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel3" runat="server" ScrollBars="Both">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                        ID="GridView3" runat="server" AutoGenerateColumns="false"
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
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>





        </div>







    </div>


































    <div style="display: none">
        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
    </div>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
        Enabled="True">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="display: none;">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">

            <ContentTemplate>
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Notification</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    Department
                                </div>
                                <div class="col-lg-6">
                                    <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    Designation
                                </div>
                                <div class="col-lg-6">
                                    <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    Subject
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    Circular No.
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox CssClass="form-control" ID="txtCircularNo" runat="server" onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    Description
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"
                                        onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    Attachment
                                </div>
                                <div class="col-lg-6">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                        OnClick="btnSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                        OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" data-bs-dismiss="modal" class="btn btn-lg btn-red">
                                <i class="fa fa-times"></i>Close</button>
                        </div>

                    </div>
                </div>


            </ContentTemplate>

            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>




        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

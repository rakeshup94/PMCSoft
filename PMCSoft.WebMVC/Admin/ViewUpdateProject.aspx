<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ViewUpdateProject"
    CodeBehind="ViewUpdateProject.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Project Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">

                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                    ID="GridView1" runat="server" AutoGenerateColumns="false"
                                    OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            </ItemTemplate>
                                           
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartDate" runat="server" Text='<%#Bind("StartDate") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndDate" runat="server" Text='<%#Bind("EndDate") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnFinalStatus" runat="server" Value='<%#Bind("FinalStatus") %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton CssClass="btn btn-default btn-xs"  ID="lnkUpdate" runat="server" CausesValidation="false" CommandName="DetailUpdate"
                                                    Text="Update"><i class='fa fa-edit mediumtxt'></i></asp:LinkButton>
                                           
                                                <asp:LinkButton CssClass="btn btn-default btn-xs"  ID="lnkView" runat="server" CausesValidation="false" CommandName="DetailView"
                                                    Text="View"><i class='fa fa-eye text-green mediumtxt mrs'></i></asp:LinkButton>
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
</asp:Content>

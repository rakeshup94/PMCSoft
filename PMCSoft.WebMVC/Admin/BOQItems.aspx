<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.BOQItems"
    CodeBehind="BOQItems.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">BOQ</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-12 d-block d-sm-none">
                                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                    <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-BOQItems"
                                        type="button" role="tab">
                                        BOQ Items
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-BOQSubItems"
                                        type="button" role="tab">
                                        BOQ Sub-Items
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-BOQPart"
                                        type="button" role="tab">
                                        BOQ Sub-Items Part
                                    </button>
                                </div>
                            </div>

                            <div class="col-lg-9 pe-sm-0">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade show active" id="v-pills-BOQItems" role="tabpanel">
                                        <div class="row">

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Item Name
                                
                                                <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server"></asp:TextBox>
                                                </div>

                                            </div>

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Description of Item
                                        
                                                <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Unit
                                   
                                                <asp:DropDownList CssClass="form-select" ID="ddlUnit" runat="server">
                                                </asp:DropDownList>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                                    OnClick="btnSubmit_Click" />
                                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                                    OnClick="btnCancel_Click" />
                                            </div>

                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="v-pills-BOQSubItems" role="tabpanel">
                                        <div class="row">

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Items
                                     
                                                <asp:DropDownList CssClass="form-select" ID="ddlCategory" runat="server">
                                                </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Sub-Items
                                    
                                                <asp:TextBox CssClass="form-control" ID="txtSubCategory" runat="server"></asp:TextBox>
                                                </div>
                                            </div>



                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Description of Item
                                   
                                                <asp:TextBox CssClass="form-control" ID="txtSubDescription" runat="server" TextMode="MultiLine">
                                                </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Unit
                                       
                                                <asp:DropDownList CssClass="form-select" ID="ddlSubUnit" runat="server">
                                                </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubSubmit" runat="server"
                                                    Text="Submit" OnClick="btnSubSubmit_Click" />
                                                <asp:Button CssClass="btn btn-default btn-square" ID="btnSubCancel" runat="server"
                                                    Text="Cancel" OnClick="btnSubCancel_Click" />
                                            </div>

                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-BOQPart" role="tabpanel">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Items
                                           
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Sub-Items
                                              
                                                        <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory" runat="server">
                                                        </asp:DropDownList>
                                                </div>
                                            </div>


                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Sub-Items Part
                                                 
                                                            <asp:TextBox CssClass="form-control" ID="txtPart" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Description of Sub-Item Part
                                                      
                                                                <asp:TextBox CssClass="form-control" ID="txtPartDescription" runat="server" TextMode="MultiLine">
                                                                </asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Unit
                                                          
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartUnit" runat="server">
                                                                    </asp:DropDownList>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnPartSubmit" runat="server"
                                                    Text="Submit" OnClick="btnPartSubmit_Click" />
                                                <asp:Button CssClass="btn btn-default btn-square" ID="btnPartCancel" runat="server"
                                                    Text="Cancel" OnClick="btnPartCancel_Click" />
                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                    <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-BOQItems"
                                        type="button" role="tab">
                                        BOQ Items
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-BOQSubItems"
                                        type="button" role="tab">
                                        BOQ Sub-Items
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-BOQPart"
                                        type="button" role="tab">
                                        BOQ Sub-Items Part
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>





        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

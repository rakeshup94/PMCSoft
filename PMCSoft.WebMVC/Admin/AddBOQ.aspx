<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddBOQ"
    CodeBehind="AddBOQ.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Add BOQ</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="card">
                    <div class="card-header">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Text="Mannual Entry" Value="0"></asp:ListItem>
                            <asp:ListItem Text="BOQ Upload" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>



                    <div class="card-body">



                        <asp:Panel ID="Panel1" runat="server">

                            <div class="row">
                                <div class="col-12 d-block d-sm-none">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#tab-0"
                                            type="button">
                                            Category</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-1" type="button">
                                            Sub-Category</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-2" type="button">
                                            Sub-Category Part</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-3" type="button">
                                            BOQ Upload</button>
                                    </div>
                                </div>
                                <div class="col-lg-9 pe-sm-0">
                                    <div class="tab-content" id="v-pills-tabContent" style="min-height: 277px">
                                        <div class="tab-pane fade show active" id="tab-0" role="tabpanel" aria-labelledby="tab-0-tab">


                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Project Name
                                  
                                        <asp:DropDownList ID="ddlProject" CssClass="form-select" runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Item No.
                                        
                                                <asp:TextBox CssClass="form-control" ID="txtBOQItemNo" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Category
                                       
                                                <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Unit
                                        <asp:DropDownList ID="ddlUnit" CssClass="form-select" runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Quantity
                                    
                                                <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Rate
                                             
                                                    <asp:TextBox CssClass="form-control" ID="txtRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Description of Item
                                            
                                                    <asp:TextBox CssClass="form-control" ID="txtDescription"
                                                        runat="server" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mtm">
                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server"
                                                        Text="Submit"
                                                        OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server"
                                                        Text="Cancel"
                                                        OnClick="btnCancel_Click" />
                                                </div>

                                            </div>


                                        </div>
                                        <div class="tab-pane fade" id="tab-1" role="tabpanel" aria-labelledby="tab-1-tab">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Project Name
                                        <asp:DropDownList CssClass="form-select" ID="ddlProjectSub"
                                            runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Category
                               
                                            <asp:DropDownList CssClass="form-select" ID="ddlCategory"
                                                runat="server">
                                            </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Sub-Category
                                  
                                            <asp:TextBox CssClass="form-control" ID="txtSubCategory"
                                                runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Unit
                                 
                                            <asp:DropDownList CssClass="form-select" ID="ddlSubUnit" runat="server">
                                            </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Quantity
                                                    <asp:TextBox CssClass="form-control" ID="txtSubQuantity"
                                                        runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Rate
                                                
                                                        <asp:TextBox CssClass="form-control" ID="txtSubRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Description of Item
                             
                                            <asp:TextBox CssClass="form-control" ID="txtSubDescription"
                                                runat="server" TextMode="MultiLine">
                                            </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mtm">



                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubSubmit" runat="server"
                                                        Text="Submit"
                                                        OnClick="btnSubSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-default btn-square" ID="btnSubCancel" runat="server"
                                                        Text="Cancel"
                                                        OnClick="btnSubCancel_Click" />
                                                </div>

                                            </div>



                                        </div>

                                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2-tab">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Project Name
                               
                                        <asp:DropDownList CssClass="form-select" ID="ddlProjectSubPart"
                                            runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Category
                                            
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory"
                                                        runat="server">
                                                    </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Sub-Category
                                               
                                                        <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory"
                                                            runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>




                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Sub Part
                                                   
                                                                <asp:TextBox CssClass="form-control" ID="txtPart" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Unit
                                                                  
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlPartUnit"
                                                                                runat="server">
                                                                            </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Quantity
                                                                  
                                                                                <asp:TextBox CssClass="form-control" ID="txtPartQuantity"
                                                                                    runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-3">
                                                        Rate
                                                                            
                                                                                        <asp:TextBox CssClass="form-control" ID="txtPartRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>



                                                <div class="col-lg-4">

                                                    <div class="mb-3">
                                                        Description of Item
                                       
                                                                    <asp:TextBox CssClass="form-control" ID="txtPartDescription"
                                                                        runat="server" TextMode="MultiLine">
                                                                    </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mtm">
                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnPartSubmit"
                                                        runat="server" Text="Submit"
                                                        OnClick="btnPartSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-default btn-square" ID="btnPartCancel"
                                                        runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3-tab">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnBOQUpload" runat="server"
                                                            Text="Upload"
                                                            OnClick="btnBOQUpload_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                                    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                        <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#tab-0"
                                            type="button">
                                            Category</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-1" type="button">
                                            Sub-Category</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-2" type="button">
                                            Sub-Category Part</button>
                                        <button class="nav-link text-start" data-bs-toggle="pill"
                                            data-bs-target="#tab-3" type="button">
                                            BOQ Upload</button>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnUpload" runat="server" Text="Upload"
                                            OnClick="btnUpload_Click" />
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>

                    </div>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

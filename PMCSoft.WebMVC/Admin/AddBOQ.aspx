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
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                        OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="Mannual Entry" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="BOQ Upload" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <asp:Panel ID="Panel1" runat="server">
                            <cc1:TabContainer ID="TabContainer1" runat="server" CssClass="fancy-green" ActiveTabIndex="0">
                                <cc1:TabPanel ID="Tab1" runat="server" TabIndex="0">
                                    <HeaderTemplate>
                                        <div class="card-header">
                                            <h5 class="mtn mbn">
                                                <strong>Category
                       
                                                </strong>
                                            </h5>
                                        </div>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Project Name
                                  
                                        <asp:DropDownList ID="ddlProject" runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Item No.
                                        
                                                <asp:TextBox CssClass="form-control" ID="txtBOQItemNo" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Category
                                       
                                                <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Unit
                                        <asp:DropDownList ID="ddlUnit" runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Quantity
                                    
                                                <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Rate
                                             
                                                    <asp:TextBox CssClass="form-control" ID="txtRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Description of Item
                                            
                                                    <asp:TextBox CssClass="form-control" ID="txtDescription"
                                                        runat="server" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mtm">
                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server"
                                                        Text="Submit"
                                                        OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server"
                                                        Text="Cancel"
                                                        OnClick="btnCancel_Click" />
                                                </div>

                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab2" runat="server" TabIndex="1">
                                    <HeaderTemplate>

                                        <div class="card-header">
                                            <h5 class="mtn mbn">
                                                <strong>Sub-Category
                       
                                                </strong>
                                            </h5>
                                        </div>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Project Name
                                        <asp:DropDownList ID="ddlProjectSub"
                                            runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Category
                               
                                            <asp:DropDownList ID="ddlCategory"
                                                runat="server">
                                            </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Sub-Category
                                  
                                            <asp:TextBox CssClass="form-control" ID="txtSubCategory"
                                                runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Unit
                                 
                                            <asp:DropDownList CssClass="form-select" ID="ddlSubUnit" runat="server">
                                            </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Quantity
                                                    <asp:TextBox CssClass="form-control" ID="txtSubQuantity"
                                                        runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Rate
                                                
                                                        <asp:TextBox CssClass="form-control" ID="txtSubRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Description of Item
                             
                                            <asp:TextBox CssClass="form-control" ID="txtSubDescription"
                                                runat="server" TextMode="MultiLine">
                                            </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mtm">



                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubSubmit" runat="server"
                                                        Text="Submit"
                                                        OnClick="btnSubSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubCancel" runat="server"
                                                        Text="Cancel"
                                                        OnClick="btnSubCancel_Click" />
                                                </div>

                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab3" runat="server" TabIndex="2">
                                    <HeaderTemplate>

                                        <div class="card-header">
                                            <h5 class="mtn mbn">
                                                <strong>Sub-Category Part
                                                </strong>
                                            </h5>
                                        </div>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Project Name
                               
                                        <asp:DropDownList CssClass="form-select" ID="ddlProjectSubPart"
                                            runat="server">
                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Category
                                            
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory"
                                                        runat="server">
                                                    </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Sub-Category
                                               
                                                        <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory"
                                                            runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>




                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Sub Part
                                                   
                                                                <asp:TextBox CssClass="form-control" ID="txtPart" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Unit
                                                                  
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlPartUnit"
                                                                                runat="server">
                                                                            </asp:DropDownList>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Quantity
                                                                  
                                                                                <asp:TextBox CssClass="form-control" ID="txtPartQuantity"
                                                                                    runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        Rate
                                                                            
                                                                                        <asp:TextBox CssClass="form-control" ID="txtPartRate" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>



                                                <div class="col-lg-4">

                                                    <div class="form-group">
                                                        Description of Item
                                       
                                                                    <asp:TextBox CssClass="form-control" ID="txtPartDescription"
                                                                        runat="server" TextMode="MultiLine">
                                                                    </asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>



                                            <div class="row mtm">
                                                <div class="col-lg-12">
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartSubmit"
                                                        runat="server" Text="Submit"
                                                        OnClick="btnPartSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary" ID="btnPartCancel"
                                                        runat="server" Text="Cancel" OnClick="btnPartCancel_Click" />
                                                </div>

                                            </div>

                                        </div>



                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="Tab4" runat="server" TabIndex="3">
                                    <HeaderTemplate>


                                        <div class="card-header">
                                            <h5 class="mtn mbn">
                                                <strong>BOQ Upload
                                                </strong>
                                            </h5>
                                        </div>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                                        <asp:Button CssClass="btn btn-primary" ID="btnBOQUpload" runat="server"
                                                            Text="Upload"
                                                            OnClick="btnBOQUpload_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Button CssClass="btn btn-primary" ID="btnUpload" runat="server" Text="Upload"
                                                OnClick="btnUpload_Click" />
                                        </div>
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

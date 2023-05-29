<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddBOQ"
    CodeBehind="AddBOQ.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .fancy-green .ajax__tab_header {
            background: url(green_bg_Tab.gif) repeat-x;
            cursor: pointer;
        }

        .fancy-green .ajax__tab_hover .ajax__tab_outer, .fancy-green .ajax__tab_active .ajax__tab_outer {
            background: url(green_left_Tab.gif) no-repeat left top;
        }

        .fancy-green .ajax__tab_hover .ajax__tab_inner, .fancy-green .ajax__tab_active .ajax__tab_inner {
            background: url(green_right_Tab.gif) no-repeat right top;
        }

        .fancy .ajax__tab_header {
            font-size: 13px;
            font-weight: bold;
            color: #000;
            font-family: sans-serif;
        }

            .fancy .ajax__tab_active .ajax__tab_outer, .fancy .ajax__tab_header .ajax__tab_outer, .fancy .ajax__tab_hover .ajax__tab_outer {
                height: 46px;
            }

            .fancy .ajax__tab_active .ajax__tab_inner, .fancy .ajax__tab_header .ajax__tab_inner, .fancy .ajax__tab_hover .ajax__tab_inner {
                height: 46px;
                margin-left: 16px; /* offset the width of the left image */
            }

            .fancy .ajax__tab_active .ajax__tab_tab, .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_header .ajax__tab_tab {
                margin: 16px 16px 0px 0px;
            }

        .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_active .ajax__tab_tab {
            color: #fff;
        }

        .fancy .ajax__tab_body {
            font-family: Arial;
            font-size: 10pt;
            border-top: 0;
            border: 1px solid #999999;
            padding: 8px;
            background-color: #ffffff;
        }
    </style>


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
        <ol class="breadcrumb page-breadcrumb">
        </ol>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
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
                                  
                                        <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-select">
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
                                        <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-select">
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
                                            
                                                    <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mtm">
                                        <div class="col-lg-12">
                                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-green" Text="Submit"
                                                OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" Text="Cancel"
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
                                        <asp:DropDownList ID="ddlProjectSub" CssClass="form-select" runat="server">
                                        </asp:DropDownList>
                                            </div>
                                        </div>


                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                Category
                               
                                            <asp:DropDownList ID="ddlCategory" CssClass="form-select" runat="server">
                                            </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                Sub-Category
                                  
                                            <asp:TextBox CssClass="form-control" ID="txtSubCategory" runat="server"></asp:TextBox>
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
                                                    <asp:TextBox CssClass="form-control" ID="txtSubQuantity" runat="server"></asp:TextBox>
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
                             
                                            <asp:TextBox CssClass="form-control" ID="txtSubDescription" runat="server" TextMode="MultiLine">
                                            </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mtm">



                                        <div class="col-lg-12">
                                            <asp:Button ID="btnSubSubmit" runat="server" CssClass="btn btn-primary" Text="Submit"
                                                OnClick="btnSubSubmit_Click" />
                                            <asp:Button ID="btnSubCancel" runat="server" CssClass="btn btn-green" Text="Cancel"
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
                               
                                        <asp:DropDownList CssClass="form-select" ID="ddlProjectSubPart" runat="server">
                                        </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                Category
                                            
                                                    <asp:DropDownList CssClass="form-select" ID="ddlPartCategory" runat="server">
                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                Sub-Category
                                               
                                                        <asp:DropDownList CssClass="form-select" ID="ddlPartSubCategory" runat="server">
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
                                                                  
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlPartUnit" runat="server">
                                                                            </asp:DropDownList>
                                            </div>
                                        </div>


                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                Quantity
                                                                  
                                                                                <asp:TextBox CssClass="form-control" ID="txtPartQuantity" runat="server"></asp:TextBox>
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
                                       
                                                                    <asp:TextBox CssClass="form-control" ID="txtPartDescription" runat="server" TextMode="MultiLine">
                                                                    </asp:TextBox>
                                            </div>
                                        </div>

                                    </div>



                                    <div class="row mtm">
                                        <div class="col-lg-12">
                                            <asp:Button ID="btnPartSubmit" CssClass="btn btn-primary" runat="server" Text="Submit"
                                                OnClick="btnPartSubmit_Click" />
                                            <asp:Button ID="btnPartCancel" CssClass="btn btn-green"
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
                                                <asp:Button ID="btnBOQUpload" runat="server" CssClass="btn btn-primary" Text="Upload"
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
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary"
                                        OnClick="btnUpload_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>





            </div>


        </div>


    </div>




</asp:Content>

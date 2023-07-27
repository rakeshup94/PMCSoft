<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Inventory.ItemIssue"
    CodeBehind="ItemIssue.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Stock Opening</div>
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
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project:
                          
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Issue Date:
                               
                                    <asp:TextBox CssClass="form-control" ID="TxtIssueDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtIssueDate"
                                        CssClass="cal_Theme1"></cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Issue For Tower
                              
                                    <asp:TextBox CssClass="form-control" ID="TxtIssueFoetower" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered
                table-advanced tablesorter mbn"
                                    ID="GVItemIssue" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true"
                                    Width="930" OnRowDataBound="GVItemIssue_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")
                %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Group">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlItemCode"
                                                    runat="server" OnSelectedIndexChanged="ddlItemCode_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlItemName"
                                                    runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlUnit"
                                                    runat="server" OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Make">
                                            <ItemTemplate>
                                                <asp:Label ID="TxtItemMake" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Part No">
                                            <ItemTemplate>
                                                <asp:Label ID="TxtpartNo" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Available Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="txtAbQuantity" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Issue Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtIssueQty"
                                                    runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                                                    runat="server" TargetControlID="txtIssueQty"
                                                    FilterType="Custom, Numbers" ValidChars="."></cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtRemarks"
                                                    TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="btnAddMore" runat="server"
                                                    OnClick="btnAddMore_Click" Text="Add More" />
                                            </FooterTemplate>

                                            <ItemStyle VerticalAlign="Top" />
                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit"
                                    runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel"
                                    runat="server" Text="Cancel" />
                            </div>
                        </div>

                    </div>

                </div>
            </div>



















        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

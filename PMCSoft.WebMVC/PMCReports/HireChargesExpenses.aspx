<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.HireChargesExpenses" Codebehind="HireChargesExpenses.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"  style="width: 950px;">
                    <div class="card-body">
                        <h3 class="reallynow">
                            HIRE CHARGES EXPENSES</h3>
                        <div class="row"  style="width: 950px;">
                    
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"
                                         >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    HIRE CHARGES EXPENSES REPORT FOR THE MONTH OF --&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"  style="width: 950px;">
                                        <div class="row" >
                                            <div class="col-lg-4"  colspan="8">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GvHireChargesExpenses" runat="server" AutoGenerateColumns="false"
                                                    ShowFooter="true" Width="500" OnRowDataBound="GvHireChargesExpenses_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DESCRIPTION">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtDESCRIPTION" Width="100px" TextMode="MultiLine" runat="server"
                                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="MODEL">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtMODEL" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="VENDOR`S NAME">
                                                            <ItemTemplate>
                                                                <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"   AutoPostBack="true">
                                                                    <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date of Installation">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtDateofInstallation" Width="100px" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateofInstallation"
                                                                    CssClass="cal_Theme1">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="QTY.">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtQTY" Width="100px" TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQTY"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AMOUNT">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAMOUNT" runat="server" Width="100px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAMOUNT"
                                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature / Purpose of work for which the equipment is  on Hire">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtNature"   TextMode="MultiLine" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                                                <asp:Button btn btn-primary btn-square ID="btnAddMore" runat="server" Text="Add More" OnClick="btnAddMore_Click" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle VerticalAlign="Top"   />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                    <FooterStyle BackColor="#D8D8D8" ForeColor="#202020" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  style="text-align: center;">
                                                <asp:Button btn btn-primary btn-square ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                <asp:Button btn btn-primary btn-square ID="btnCancel" runat="server" Text="Cancel" 
                                                    onclick="btnCancel_Click" />
                                            </div>
                                        </div>
                                      </div>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

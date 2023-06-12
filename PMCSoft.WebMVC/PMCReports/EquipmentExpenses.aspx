<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.EquipmentExpenses" Codebehind="EquipmentExpenses.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            EQUIPMENT EXPENSES</h3>
                        <div class="row"  style="width: 930px;">
                          
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;<asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"  >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Equipment Expenses Report As On&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"  ></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <div class="row"  style="width: 920px; border: 1px solid black; border-collapse: collapse;">
                                                <div class="row" >
                                                    <div class="col-lg-4"  rowspan="2" style="width: 40px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        S.No
                                                    </div>
                                                    <div class="col-lg-4"  rowspan="2" style="width: 200px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Equipment Detail
                                                    </div>
                                                    <div class="col-lg-4"     style="width: 250px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Upto Previous Months
                                                        <asp:TextBox CssClass="form-control" ID="txtPreviousMonth" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPreviousMonth"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </div>
                                                    <div class="col-lg-4"     style="width: 220px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Current Months
                                                        <asp:TextBox CssClass="form-control" ID="txtCurrentMonth" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtCurrentMonth"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </div>
                                                    <div class="col-lg-4"     style="width: 200px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Amt. Up To Date
                                                        <asp:TextBox CssClass="form-control" ID="txtUpToDate" runat="server" Width="80px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtUpToDate"
                                                            CssClass="cal_Theme1">
                                                        </cc1:CalendarExtender>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <div class="col-lg-4"  style="width: 125px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 125px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 110px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 110px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Repairs
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Fuel
                                                    </div>
                                                </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtEquipmentDetail" runat="server" Text='<%#Bind("EquipmentDetail") %>'
                                                        onkeyup="valid(this)" onblur="valid(this)"   >
                                                    </asp:TextBox>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtPMRepairs" runat="server" Text='<%#Bind("PMRepairs") %>'  >
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPMRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtPMFuel" runat="server" Text='<%#Bind("PMFuel") %>'  ></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtPMFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtCMRepairs" runat="server" Text='<%#Bind("CMRepairs") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCMRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtCMFuel" runat="server" Text='<%#Bind("CMFuel") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtCMFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtUTRepairs" runat="server" Text='<%#Bind("UTRepairs") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtUTRepairs"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtUTFuel" runat="server" Text='<%#Bind("UTFuel") %>' Width="80px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtUTFuel"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                </div>
                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                                                </div>
                                            </div>
                                              </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center;">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" 
                                        onclick="btnSubmit_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" 
                                        onclick="btnCancel_Click" />
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.MorningReport" Codebehind="MorningReport.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            Morning Report</div>
                        <div class="row"   >
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center;">
                                    Project Name
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"  >
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4"  style="text-align: center;">
                                    Date
                                </div>
                                <div class="col-lg-4" >
                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                     <asp:Button CssClass="btn btn-primary btn-square" ID="btnPrint" runat="server" Text="Print Preview" Visible="false" OnClick="btnPrint_Click" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="5" style="text-align: center;">
                                    <asp:Panel ID="Panel1" runat="server"    Visible="false">
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                    WP Date:
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server"   Font-Size="12px"></asp:Label>
                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4" >
                                                    Created By
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                    No.:
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Label ID="lblNumber" runat="server"  ></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                    ENG. In Charge:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblEngInCharge" runat="server"  ></asp:Label>
                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                </div>
                                                <div class="col-lg-4"  style="width: 60px;">
                                                    Block:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="6">
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="width: 900px; border: 1px solid black; border-collapse: collapse;">
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 50px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        S.No
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Item Of Work
                                                                    </div>
                                                                    <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Area
                                                                    </div>
                                                                    <div class="col-lg-4"  colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Work Programme
                                                                    </div>
                                                                    <div class="col-lg-4"  colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Actual Labour
                                                                    </div>
                                                                </div>
                                                                <div class="row" >
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SK
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SEMI
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        UNSK
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        O.T
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        Total
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SK
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SEMI
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        UNSK
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        O.T
                                                                    </div>
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        Total
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: left">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSK" runat="server" Width="60px" Text='<%#Bind("LabourSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSEMI" runat="server" Width="60px" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblUNSK" runat="server" Width="60px" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblOT" runat="server" Width="60px" Text='<%#Bind("LabourOT") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblWPTotal" runat="server" Width="60px" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblASK" runat="server" Width="60px" Text='<%#Bind("ALabourSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblASEMI" runat="server" Width="60px" Text='<%#Bind("ALabourSEMI") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblAUNSK" runat="server" Width="60px" Text='<%#Bind("ALabourUNSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblAOT" runat="server" Width="60px" Text='<%#Bind("ALabourOT") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblMRTotal" runat="server" Width="60px" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                    Total:
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMSumSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMSumSEMI" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMSumUNSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMSumOT" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                    font-weight: bold;">
                                                                    <asp:Label ID="lblMGTotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                              </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Supervisor:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                </div>
                                                <div class="col-lg-4" >
                                                    Foreman:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                </div>
                                                <div class="col-lg-4" >
                                                    Engineer:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"
    Inherits="PMCSoft.Web.AdminReports.PrintWorkProgramme" CodeBehind="PrintWorkProgramme.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">




    <!--BEGIN PAGE WRAPPER-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Work Programme</div>
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
                            Project Name:
                                      <asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Date
                       <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Created By:
                                      <asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Work Programme No:
         
                <asp:Label ID="lblNumber" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Eng. In Charge:
                                         <asp:Label ID="lblEngInCharge" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="mb-3">
                            Block:
          
                <asp:Label ID="lblBlock" runat="server" Text=""></asp:Label>
                        </div>

                    </div>

                </div>


                <asp:Panel ID="Panel1" runat="server" Visible="false">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                               <tr>
                                                    <th rowspan="2">S.No
                                                    </th>
                                                    <th rowspan="2">Item Of Work
                                                    </th>
                                                    <th rowspan="2">Area
                                                    </th>
                                                    <th colspan="4">Work Programme
                                                    </th>
                                                    <th rowspan="2">Total
                                                    </th>
                                                </tr>
                                               <tr>
                                                    <th>SK
                                                    </th>
                                                    <th>SEMI
                                                    </th>
                                                    <th>UNSK
                                                    </th>
                                                    <th>O.T
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                           <tr>
                                                <td>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSK" runat="server" Text='<%#Bind("LabourSK") %>'>
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSEMI" runat="server" Text='<%#Bind("LabourSEMI") %>'>
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblUNSK" runat="server" Text='<%#Bind("LabourUNSK") %>'>
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblOT" runat="server" Text='<%#Bind("LabourOT") %>'>
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblTotal" runat="server">
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Total:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </tfoot>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="mb-3">
                                Supervisor:    
                                                <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnSupervisor" runat="server" />
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Foreman:   
                                                <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnForeman" runat="server" />
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Engineer:   
                                                <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnEngineer" runat="server" />
                            </div>
                        </div>

                    </div>


                </asp:Panel>


            </div>
        </div>
    </div>















</asp:Content>











﻿<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="PMCSoft.Web.Report.PrintMorningReport" Codebehind="PrintMorningReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
        <div class="card"    >
            <div class="card-body">
                <%--<h3 style="margin-right:80">
                              AHLUWALIA CONTRACTS (INDIA) LTD<br />
                           Work Programme</div>--%>
                <div class="row"    border="0">
                    <div class="row" >
                       <asp:LinkButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="50px" />
                      
                    </div>
                  </div>
                <br />
                <br />
                <br />
                <div class="row"   >
                    <div class="row" >
                        <div class="col-lg-4"  style="font-size: 15px; font-family: Cambria; color: Black">
                            Project Name:        <asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </div>
                        <div class="col-lg-4"   >
                        </div>
                        <div class="col-lg-4" >
                            Morning Report Date
                        </div>
                        <div class="col-lg-4" >
                            <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server"     ></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-4"   >
                            Created By:        <asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
                        </div>
                        <div class="col-lg-4"  style="text-align: left;">
                             
                        </div>
                        <div class="col-lg-4" >
                            Work Programme No:
                        </div>
                        <div class="col-lg-4" >
                            <asp:Label ID="lblNumber" runat="server"     ></asp:Label>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-4"   >
                            Eng. In Charge:        
                            <asp:Label ID="lblEngInCharge" runat="server"  ></asp:Label>
                                   <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                        </div>
                        <div class="col-lg-4" >
                             
                        </div>
                        <div class="col-lg-4" >
                            Block:
                        </div>
                        <div class="col-lg-4" >
                            <asp:Label ID="lblBlock" runat="server" Text=""  ></asp:Label>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-4"   >
                            <asp:Panel ID="Panel1" runat="server"    Visible="false">
                                <div class="row"   >
                                    <div class="row" >
                                        <div class="col-lg-4"   >
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"  style="white-space: nowrap;">
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
                                                            <div class="col-lg-4"   style="text-align: center; width: 400px; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                Work Programme
                                                            </div>
                                                            <div class="col-lg-4"   style="text-align: center; width: 400px; border: 1px solid black;
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
                                                            <asp:Label ID="lblSK" runat="server"   Text='<%#Bind("LabourSK") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblSEMI" runat="server"   Text='<%#Bind("LabourSEMI") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblUNSK" runat="server"   Text='<%#Bind("LabourUNSK") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblOT" runat="server"   Text='<%#Bind("LabourOT") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblWPTotal" runat="server"   Text="">
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblASK" runat="server"   Text='<%#Bind("ALabourSK") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblASEMI" runat="server"   Text='<%#Bind("ALabourSEMI") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblAUNSK" runat="server"   Text='<%#Bind("ALabourUNSK") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblAOT" runat="server"   Text='<%#Bind("ALabourOT") %>'>
                                                            </asp:Label>
                                                        </div>
                                                        <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblMRTotal" runat="server"   Text="">
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
                                        <div class="col-lg-4"   style="height: 50px;">
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"  style="text-align: left;">
                                            Supervisor:    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                        </div>
                                        <div class="col-lg-4" >
                                            Foreman:    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnForeman" runat="server" />
                                        </div>
                                        <div class="col-lg-4"   >
                                        </div>
                                        <div class="col-lg-4" >
                                            Engineer:    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnEngineer" runat="server" />
                                        </div>
                                        <div class="col-lg-4"  style="text-align: left;">
                                        </div>
                                    </div>
                                     <div class="row" >
                                    <div class="col-lg-4"   style="text-align: center; font-size: 18px;  ">
                                        Created By Sun Integrated Technologies & Application
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
    </form>
</body>
</html>

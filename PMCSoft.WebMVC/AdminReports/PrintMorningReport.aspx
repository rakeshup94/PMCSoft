<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="PMCSoft.Web.AdminReports.PrintMorningReport" Codebehind="PrintMorningReport.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="content" style="width: 940px;">
            <div id="rightnow">
           
                <div class="row"  style="width: 930px;" border="0">
                    <tr>
                     <asp:ImageButton ID="ImgImage" runat="server" ImageUrl="~/Images/logo.png" Height="50px" />
                   
                    </tr>
                  </div>
                <br />
                <br />
                <br />
                <div class="row"  style="width: 930px">
                    <tr>
                        <td style="font-size: 15px; font-family: Cambria; color: Black">
                            Project Name: &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </td>
                        <td style="font-size: 15px; font-family: Cambria;">
                        </td>
                        <td>
                            Morning Report Date
                        </td>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="14px"></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 15px; font-family: Cambria;">
                            Created By: &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
                        </td>
                        <td style="text-align: left;">
                            &nbsp;
                        </td>
                        <td>
                            Work Programme No:
                        </td>
                        <td>
                            <asp:Label ID="lblNumber" runat="server" Width="100px" Font-Size="14px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 15px; font-family: Cambria;">
                            Eng. In Charge: &nbsp; &nbsp; &nbsp; &nbsp;
                            <asp:Label ID="lblEngInCharge" runat="server" Width="300px"></asp:Label>
                            &nbsp; &nbsp; &nbsp; &nbsp;<asp:HiddenField ID="hdnEngInCharge" runat="server" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Block:
                        </td>
                        <td>
                            <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;">
                            <asp:Panel ID="Panel1" runat="server" Width="910px" Visible="false">
                                <div class="row"  style="width: 900px;">
                                    <tr>
                                        <td style="font-size: 15px; font-family: Cambria;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="white-space: nowrap;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate>
                                                    <div class="row"  style="width: 900px; border: 1px solid black; border-collapse: collapse;">
                                                        <tr>
                                                            <td rowspan="2" style="width: 50px; text-align: center; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                S.No
                                                            </td>
                                                            <td rowspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                Item Of Work
                                                            </td>
                                                            <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                Area
                                                            </td>
                                                            <td colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                Work Programme
                                                            </td>
                                                            <td colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                background-color: #D8D8D8;">
                                                                Actual Labour
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                SK
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                SEMI
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                UNSK
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                O.T
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                Total
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                SK
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                SEMI
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                UNSK
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                O.T
                                                            </td>
                                                            <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                Total
                                                            </td>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: left;">
                                                            <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: left">
                                                            <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblSK" runat="server" Width="60px" Text='<%#Bind("LabourSK") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblSEMI" runat="server" Width="60px" Text='<%#Bind("LabourSEMI") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblUNSK" runat="server" Width="60px" Text='<%#Bind("LabourUNSK") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblOT" runat="server" Width="60px" Text='<%#Bind("LabourOT") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                            <asp:Label ID="lblWPTotal" runat="server" Width="60px" Text="">
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblASK" runat="server" Width="60px" Text='<%#Bind("ALabourSK") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblASEMI" runat="server" Width="60px" Text='<%#Bind("ALabourSEMI") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblAUNSK" runat="server" Width="60px" Text='<%#Bind("ALabourUNSK") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblAOT" runat="server" Width="60px" Text='<%#Bind("ALabourOT") %>'>
                                                            </asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; text-align: center;">
                                                            <asp:Label ID="lblMRTotal" runat="server" Width="60px" Text="">
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                        </td>
                                                        <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                            font-weight: bold;">
                                                            Total:
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblMSumSK" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblMSumSEMI" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblMSumUNSK" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblMSumOT" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                            font-weight: bold;">
                                                            <asp:Label ID="lblMGTotal" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                      </div>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="height: 50px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            Supervisor: &nbsp; &nbsp;<asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                        </td>
                                        <td>
                                            Foreman: &nbsp; &nbsp;<asp:Label ID="lblForeman" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnForeman" runat="server" />
                                        </td>
                                        <td style="text-align: center;">
                                        </td>
                                        <td>
                                            Engineer: &nbsp; &nbsp;<asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdnEngineer" runat="server" />
                                        </td>
                                        <td style="text-align: left;">
                                        </td>
                                    </tr>
                                    <tr>
                                    <td colspan="5" style="text-align: center; font-size: 18px;  ">
                                        Created By Sun Integrated Technologies & Application
                                    </td>
                                </tr>
                                  </div>
                            </asp:Panel>
                        </td>
                    </tr>
                  </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

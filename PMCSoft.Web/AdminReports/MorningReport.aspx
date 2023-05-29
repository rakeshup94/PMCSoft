<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.MorningReport" Codebehind="MorningReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Morning Report</h3>
                        <table style="width: 930px">
                            <tr>
                                <td style="text-align: center;">
                                    Project Name
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="True" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    Date
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                        CssClass="cal_Theme1">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                     <asp:Button ID="btnPrint" runat="server" Text="Print Preview" Visible="false" OnClick="btnPrint_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align: center;">
                                    <asp:Panel ID="Panel1" runat="server" Width="910px" Visible="false">
                                        <table style="width: 900px;">
                                            <tr>
                                                <td style="white-space: nowrap;">
                                                    WP Date:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="12px"></asp:Label>
                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    Created By
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblCreatedBy" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap;">
                                                    No.:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblNumber" runat="server" Width="100px"></asp:Label>
                                                </td>
                                                <td style="white-space: nowrap;">
                                                    ENG. In Charge:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblEngInCharge" runat="server" Width="300px"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                </td>
                                                <td style="width: 60px;">
                                                    Block:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <HeaderTemplate>
                                                            <table style="width: 900px; border: 1px solid black; border-collapse: collapse;">
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
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Supervisor:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                </td>
                                                <td>
                                                    Foreman:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                </td>
                                                <td>
                                                    Engineer:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

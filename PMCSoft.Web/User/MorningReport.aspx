<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="Admin_MorningReport" Codebehind="MorningReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
	function preventBack(){window.history.forward();}
	setTimeout("preventBack()", 0);
	window.onunload=function(){null};
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -40px;">
                <div id="content" style="width: 1000px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            MORNING REPORT</h3>
                        <table style="width: 990px;">
                     
                            <tr>
                                <td>
                                    Project:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProject" runat="server" Width="250px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                                <td style="width: 510px;">
                                </td>
                                <td style="width: 60px; font-weight: bold;">
                                    Date:
                                </td>
                                <td style="font-weight: bold;">
                                    <asp:Label ID="lblDate" runat="server" Width="200px" Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Panel ID="Panel1" runat="server" Width="970px" Visible="false">
                                        <table style="width: 960px;">
                                            <tr>
                                                <td style="white-space: nowrap; font-weight: bold;">
                                                    WP Date:
                                                </td>
                                                <td style="font-weight: bold;">
                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="12px"></asp:Label>
                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td style="width: 60px;">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap; font-weight: bold;">
                                                    No.:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblNumber" runat="server" Width="100px"></asp:Label>
                                                </td>
                                                <td style="white-space: nowrap; font-weight: bold;">
                                                    ENG. In Charge:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEngInCharge" runat="server" Width="300px"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                </td>
                                                <td style="width: 60px; font-weight: bold;">
                                                    Block:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table style="width: 960px; border: 1px solid black; border-collapse: collapse;">
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
                                                                <td style="border: 1px solid black;">
                                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black;">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSK" runat="server" Width="50px" Text='<%#Bind("LabourSK") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSEMI" runat="server" Width="50px" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblUNSK" runat="server" Width="50px" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblOT" runat="server" Width="50px" Text='<%#Bind("LabourOT") %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblWPTotal" runat="server" Width="50px" Text="">
                                                                    </asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox ID="txtSK" runat="server" Width="70px" Text='<%#Bind("LabourSK") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox ID="txtSEMI" runat="server" Width="70px" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox ID="txtUNSK" runat="server" Width="70px" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox ID="txtOT" runat="server" Width="70px" Text='<%#Bind("LabourOT") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblMRTotal" runat="server" Width="50px" Text="">
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
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    Total:
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #FFEBCD; text-align: center;">
                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblWPGTotal" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumSEMI" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumUNSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumOT" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRGTotal" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </td>
                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" BackColor="#33ccff"
                                                                        BorderColor="Navy" OnClick="btnCalculate_Click" />
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight: bold;">
                                                    Supervisor:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                </td>
                                                <td style="font-weight: bold;">
                                                    Foreman:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                </td>
                                                <td style="font-weight: bold;">
                                                    Engineer:
                                                </td>
                                                <td style="text-align: left;">
                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="text-align: center;">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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

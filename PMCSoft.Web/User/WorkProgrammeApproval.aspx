<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="User_WorkProgrammeApproval" Codebehind="WorkProgrammeApproval.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            WORK PROGRAMME APPROVAL</h3>
                        <table style="width: 920px;">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: 30px; font-family: Cambria;">
                                    Ahluwalia Contracts (India) Ltd.
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 60px;">
                                    Date:
                                </td>
                                <td>
                                    <asp:Label ID="lblDate" runat="server" Width="200px" Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
                                        Width="910px" ShowHeader="false">
                                        <HeaderTemplate>
                                            <table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="background-color: #D9EAED; color: #202020;">
                                                    Project &nbsp;&nbsp;<asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        Font-Bold="true"></asp:Label>
                                                    <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%#Bind("ProjectID") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="890px"
                                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPID1" runat="server" Value='<%#Bind("WPID") %>' />
                                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Work Programme Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWPDate" runat="server" Text='<%#Bind("WPDate") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPDate1" runat="server" Value='<%#Bind("WPDate1") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Work Programme Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWPNumber" runat="server" Text='<%#Bind("WPNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="160px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Block">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBlock" runat="server" Text='<%#Bind("Block") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Forwarded By">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblForwardedBy" runat="server" Text='<%#Bind("ForwardedBy") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkView" runat="server" CommandName="WPView" Text="View" Font-Underline="true"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:DataList>
                                    <div style="display: none">
                                        <asp:Button ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Width="810px" Height="500px" Style="display: none;
                                        border-color: Maroon; background-color: #F7F8E0;" ScrollBars="Horizontal">
                                        <table style="width: 800px; background-color: #F7F8E0;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Work Programme Detail</h3>
                                                        <table style="width: 790px;">
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
                                                                <td style="width: 60px;">
                                                                </td>
                                                                <td>
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
                                                                <td>
                                                                    <asp:Label ID="lblEngInCharge" runat="server" Width="200px"></asp:Label>
                                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                                </td>
                                                                <td style="width: 60px;">
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
                                                                            <table style="width: 780px; border: 1px solid black; border-collapse: collapse;">
                                                                                <tr>
                                                                                    <td rowspan="2" style="width: 40px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        S.No
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Item Of Work
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Area
                                                                                    </td>
                                                                                    <td colspan="4" style="text-align: center; width: 200px; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Work Programme
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Total
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
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblSK" runat="server" Width="50px" Text='<%#Bind("LabourSK") %>'>
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblSEMI" runat="server" Width="50px" Text='<%#Bind("LabourSEMI") %>'>
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblUNSK" runat="server" Width="50px" Text='<%#Bind("LabourUNSK") %>'>
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblOT" runat="server" Width="50px" Text='<%#Bind("LabourOT") %>'>
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblTotal" runat="server" Width="50px" Text="">
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
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
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
                                                            <tr>
                                                                <td colspan="6" style="text-align: center;">
                                                                    <asp:Button ID="btnSubmit" runat="server" Text="Approved" OnClick="btnSubmit_Click" />
                                                                    <asp:Button ID="btnCancel" runat="server" Text="Dis Approved" OnClick="btnCancel_Click" />
                                                                    <asp:Button ID="btnClose" runat="server" Text="Cancel" OnClick="btnClose_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <div style="display: none">
                                        <asp:Button ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" Style="display: none; border-color: Maroon;">
                                        <table style="width: 400px; background-color: #F7F8E0;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Work Programme Approval</h3>
                                                        <table style="width: 390;">
                                                            <tr>
                                                                <td>
                                                                    Remark
                                                                    <asp:HiddenField ID="hdnWPIDApproved" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="btnApproved" runat="server" Text="Submit" OnClick="btnApproved_Click" />
                                                                    <asp:Button ID="btnApprovedCancel" runat="server" Text="Cancel" OnClick="btnApprovedCancel_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <div style="display: none">
                                        <asp:Button ID="Button3" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel3" TargetControlID="Button3" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel3" runat="server" Style="display: none; border-color: Maroon;">
                                        <table style="width: 400px; background-color: #F7F8E0;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Work Programme Dis Approval</h3>
                                                        <table style="width: 390;">
                                                            <tr>
                                                                <td>
                                                                    Remark
                                                                    <asp:HiddenField ID="hdnWPIDDisApproved" runat="server" />
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRemarkDisApproved" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center;">
                                                                    <asp:Button ID="btnDisApproved" runat="server" Text="Submit" OnClick="btnDisApproved_Click" />
                                                                    <asp:Button ID="btnCancelDisApproved" runat="server" Text="Cancel" OnClick="btnCancelDisApproved_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
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

<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddWorkProgramme" Codebehind="AddWorkProgramme.aspx.cs" %>

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
                            WORK PROGRAMME</h3>
                        <table style="width: 930px;">
                      
                            <tr>
                                <td colspan="4">
                                    <table style="width: 910px;">
                                        <tr>
                                            <td>
                                                No.
                                            </td>
                                            <td>
                                                <asp:Label ID="lblNumber" runat="server" Width="150px"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 60px;">
                                                Date
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDate" runat="server" Width="150px" Font-Size="12px"></asp:Label>
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Project
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlProject" runat="server" Width="200px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="white-space: nowrap;">
                                             Employee
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlEngInCharge" runat="server" Width="215px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                Block
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBlock" runat="server" Text="" Width="240px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Forward To
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlForwardTo" runat="server" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="white-space: nowrap;">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <table style="width: 910px;">
                                        <tr>
                                            <td colspan="6">
                                                <asp:Repeater ID="Repeater1" runat="server" 
                                                    OnItemDataBound="Repeater1_ItemDataBound" onitemcommand="Repeater1_ItemCommand">
                                                    <HeaderTemplate>
                                                        <table style="width: 895px; border: 1px solid black; border-collapse: collapse;">
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
                                                                <td colspan="4" style="text-align: center; width: 400px; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Labour
                                                                </td>
                                                                <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Total
                                                                </td>
                                                                 <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Delete
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
                                                            </td>
                                                            <td style="border: 1px solid black;">
                                                                <asp:DropDownList ID="ddlItemOfWork" runat="server" Width="200px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="border: 1px solid black;">
                                                                <asp:TextBox ID="txtArea" runat="server" Width="150px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </td>
                                                            <td style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox ID="txtSK" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox ID="txtSEMI" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox ID="txtUNSK" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox ID="txtOT" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="border: 1px solid black; text-align: left;">
                                                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteWp" CommandArgument='<%#Bind("SNo") %>'>Delete</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                font-weight: bold;">
                                                                Total:
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTSK" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTSEMI" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTUNSK" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTOT" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                <asp:Button ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                                                            </td>
                                                            <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
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
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td style="text-align: center;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Supervisor
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlSupervisor" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                Foreman
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlForeman" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                Engineer
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlEngineer" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" style="text-align: center;">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

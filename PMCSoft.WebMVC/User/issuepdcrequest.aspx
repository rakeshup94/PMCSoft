<%@ Page Language="C#" MasterPageFile="~/ProjectMasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.issuepdcrequest" Codebehind="issuepdcrequest.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="wrapper">
        <div id="content" style="width: 940px;">
            <div id="rightnow">
                <h3 class="reallynow">
                    PDC</h3>
                <table style="width: 930px;">
                    <tr>
                        <td>
                            Project :
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlP" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="ddlP_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Forwarded To :
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" Width="206px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="vertical-align: top;">
                            <asp:GridView ID="grvProjectDetails" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                                ForeColor="#333333" GridLines="None" OnRowDataBound="grvProjectDetails_RowDataBound"
                                Width="915px" OnRowCommand="grvProjectDetails_RowCommand">
                                <Columns>
                                    <%-- <asp:BoundField DataField="RowNumber" HeaderText="SNo" />--%>
                                    <asp:TemplateField HeaderText="Vendor">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlVendor" runat="server">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlBank" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnAddNewBank" runat="server" Text="+" CausesValidation="false" CommandName="AddNewBank" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlBranch" runat="server" Width="200px" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnAddNewBranch" runat="server" Text="+" CausesValidation="false"
                                                CommandName="AddNewBranch" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque No">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtChequeNo" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                Width="80px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtAmount" runat="server" Width="80px"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                TargetControlID="txtAmount" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Issue Date">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtIssueDate" runat="server" Width="80px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtIssueDate" runat="server"
                                                CssClass="cal_Theme1">
                                            </cc1:CalendarExtender>
                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                            <asp:Button ID="ButtonAdd" runat="server" Text="Add More" OnClick="ButtonAdd_Click" />
                                            <%--OnClick="ButtonAdd_Click" />--%>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#D9EAED" Font-Bold="True" ForeColor="#202020" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <div style="display: none">
                                <asp:Button ID="Button1" runat="server" Text="Button" />
                            </div>
                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                Enabled="True">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="Panel2" runat="server" Style="display: none;">
                                <div id="Div1">
                                    <h3 class="reallynow">
                                       Add Bank</h3>
                                    <table style="width: 350px; background-color: #EFFBFB;">
                                     <tr>
                                                            <td style="width: 100px;">
                                                                Bank Name
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtbankname" runat="server" Width="200px" onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align: center;">
                                                                <asp:Button ID="btnAddNewBankSave" runat="server"  Text="Submit"
                                                                    onclick="btnAddNewBankSave_Click" />
                                                                <asp:Button ID="BtnAddNewBankCancel" runat="server"  Text="Cancle"
                                                                    CausesValidation="False" onclick="BtnAddNewBankCancel_Click" />
                                                            </td>
                                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <div style="display: none">
                                <asp:Button ID="Button2" runat="server" Text="Button" />
                            </div>
                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                PopupControlID="PanelBranch" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                Enabled="True">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="PanelBranch" runat="server" Style="display: none;">
                                <div id="Div2">
                                    <h3 class="reallynow">
                                       Add Branch</h3>
                                    <table style="width: 350px; background-color: #EFFBFB;">
                                     <tr>
                                                        <td style="width: 100px;">
                                                            Bank
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlbank" runat="server" Width="205px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Branch
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtBranch" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                                Width="200px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Address
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtadress" runat="server" TextMode="MultiLine" Width="205px" onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Country
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcountry" runat="server" Width="205px" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Satate
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlsatete" runat="server" Width="205px" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlsatete_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            City
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCity" runat="server" Width="205px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            ZipCode
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtZipcode" runat="server" MaxLength="6" Width="200px"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                                TargetControlID="txtZipcode">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Button ID="btnbranchsave" runat="server" OnClick="btnbranchsave_Click" Text="Save"
                                                                Width="70px" />
                                                            <asp:Button ID="btnbranchcancle" runat="server" CausesValidation="false" OnClick="btnbranchcancle_Click"
                                                                Text="Cancel" Width="70px" />
                                                        </td>
                                                    </tr>
                                     </table>
                                     </div>
                                     </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="75px" OnClick="btnsubmit_Click" />
                            <asp:Button ID="btncancle" runat="server" Text="Cancel" Width="70px" OnClick="btncancle_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

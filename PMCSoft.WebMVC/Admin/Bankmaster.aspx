<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Bankmaster" Codebehind="Bankmaster.aspx.cs" %>

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
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                        <cc1:TabPanel ID="TabPanel1" runat="server" TabIndex="0">
                            <HeaderTemplate>
                                Bank
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div id="rightnow">
                                    <h3 class="reallynow">
                                        Bank Detail</h3>
                                    <table style="width: 910px;">
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="540px"
                                                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                                                    OnRowUpdating="GridView1_RowUpdating">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnBankID" runat="server" Value='<%#Bind("BankID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bank Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemStyle Width="410px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:CommandField ShowEditButton="True" CausesValidation="False">
                                                            <HeaderStyle Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="reallynow" />
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 390px; vertical-align: top;">
                                                <div id="rightnow">
                                                    <h3 class="reallynow">
                                                        Add Bank</h3>
                                                    <table style="width: 380;">
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
                                                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" />
                                                                <asp:Button ID="btnCancle" runat="server" OnClick="btnCancle_Click" Text="Cancle"
                                                                    CausesValidation="False" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="1">
                            <HeaderTemplate>
                                Branch</HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 900px;">
                                    <tr>
                                        <td>
                                            <div id="rightnow">
                                                <h3 class="reallynow">
                                                    Add Branch</h3>
                                                <table style="width: 330px;">
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
                                                                Text="Cancle" Width="70px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top;">
                                            <div id="rightnow">
                                                <h3 class="reallynow">
                                                    Branch Detail</h3>
                                                <table style="width: 900px;">
                                                    <tr>
                                                        <td style="vertical-align: top;">
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="880px"
                                                                OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing"
                                                                OnRowUpdating="GridView2_RowUpdating">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                            <asp:HiddenField ID="hdnBranchID" runat="server" Value='<%#Bind("BranchID") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="40px" HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Bank Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="150px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="150px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemStyle Width="150px" HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Country">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCountry" runat="server" Text='<%#Bind("CnName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="150px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="State">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblState" runat="server" Text='<%#Bind("StateName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="150px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="City">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCity" runat="server" Text='<%#Bind("CityName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="150px" />
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField ShowEditButton="True" CausesValidation="False">
                                                                        <HeaderStyle Width="30px" />
                                                                    </asp:CommandField>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                        </td>
                                        </div>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

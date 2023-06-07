<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Permission" Codebehind="Permission.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function CheckRow(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //Change the gridview row color when checkbox checked change
                row.style.backgroundColor = "#5CADFF";
            }
            else {
                //If checkbox not checked change default row color
                if (row.rowIndex % 2 == 0) {
                    //Alternating Row Color
                    row.style.backgroundColor = "#AED6FF";
                }
                else {
                    row.style.backgroundColor = "white";
                }
            }

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;

        }

        function checkAllRow(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "#5CADFF";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            row.style.backgroundColor = "#AED6FF";
                        }
                        else {
                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
        <ContentTemplate>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="wrapper">
                        <div id="content" style="width: 940px;">
                            <div id="rightnow">
                                <h3 class="reallynow">
                                    Permission
                                </h3>
                                <table style="width: 930px; vertical-align: top;">
                                    <tr>
                                        <td style="font-size: 15px; font-family: Cambria;">
                                            Project
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProject" runat="server" AutoPostBack="true" Width="200px"
                                                OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            User
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddluser" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="ddluser_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr style="vertical-align: top;">
                                        <td style="vertical-align: top; width: 1000px;" colspan="2">
                                            <asp:Panel ID="Panel2" runat="server" Height="900px" ScrollBars="Horizontal">
                                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" Width="900px"
                                                    OnRowDataBound="GridView4_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="Chckheader" runat="server" AutoPostBack="true" OnCheckedChanged="Chckheader_CheckedChanged" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="20px" HorizontalAlign="Left" VerticalAlign="Top" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Main Menu">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkMenuHeadername" runat="server" Text='<%#Bind("MenuHeaderName") %>'
                                                                    CommandName="Project" CausesValidation="false" ForeColor="Blue" Font-Underline="true"
                                                                    Font-Size="15px">
                                                                </asp:LinkButton>
                                                                <asp:HiddenField ID="hdnHeaderTransId" runat="server" Value='<%#Bind("TransId") %>' />
                                                                <asp:GridView ID="GVPermission" runat="server" AutoGenerateColumns="false" DataKeyNames="TransID"
                                                                    GridLines="Both" AllowPaging="false">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkSelectAll" runat="server" TextAlign="Left" onclick="checkAllRow(this);" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectRow" runat="server" TextAlign="Left" onclick="CheckRow(this);" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Menu">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPageName" runat="server" Text='<%#Bind("PageName") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="250px" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                                </asp:GridView>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" HorizontalAlign="Left" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Permission"
    CodeBehind="Permission.aspx.cs" %>

 
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
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Permission</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
        <ContentTemplate>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>

                    <!--END TITLE & BREADCRUMB PAGE-->
                    <!--BEGIN CONTENT-->
                    <div class="page-content">
                        <div class="card">
                            <div class="card-body">


                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            Project

                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            User
                                   
                                            <asp:DropDownList CssClass="form-select" ID="ddluser" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddluser_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                            ID="GridView4" runat="server" AutoGenerateColumns="false"
                                            OnRowDataBound="GridView4_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <strong>
                                                            <asp:CheckBox ID="Chckheader" runat="server" AutoPostBack="true" OnCheckedChanged="Chckheader_CheckedChanged" />

                                                            <asp:LinkButton ID="lnkMenuHeadername" runat="server" Text='<%#Bind("MenuHeaderName") %>'
                                                                CommandName="Project" CausesValidation="false">
                                                            </asp:LinkButton></strong>
                                                        <asp:HiddenField ID="hdnHeaderTransId" runat="server" Value='<%#Bind("TransId") %>' />
                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                            ID="GVPermission" runat="server" AutoGenerateColumns="false" DataKeyNames="TransID"
                                                            GridLines="Both" AllowPaging="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <%#Eval("MenuHeaderName") %>
                                                                        <asp:CheckBox ID="chkSelectAll" runat="server" onclick="checkAllRow(this);" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>

                                                                        <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                        <asp:CheckBox ID="chkSelectRow" runat="server" onclick="CheckRow(this);" />

                                                                        <asp:Label ID="lblPageName" runat="server" Text='<%#Bind("PageName") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                            </Columns>

                                                        </asp:GridView>



                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                            OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

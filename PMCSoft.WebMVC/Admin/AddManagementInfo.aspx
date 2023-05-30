<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.AddManagementInfo"
    CodeBehind="AddManagementInfo.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function Confirm() {
            if (confirm("Do you want to delete this record ?") == true)
                return true;
            else
                return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Add BOQ</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
        <div class="card">
            <div class="card-body">
                <h3 class="reallynow">Add Notification</h3>
                <div class="row">
                    <div class="row">
                        <div class="col-lg-4">
                            Department
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList CssClass="form-select" ID="ddlDepartment" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Button CssClass="btn btn-primary" ID="LnkAddNewDept" runat="server" OnClick="LnkAddNewDept_Click"
                                Text="+"></asp:Button>
                            <div style="display: none">
                                <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Button" />
                            </div>
                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                PopupControlID="Panel1" TargetControlID="Button2" EnableViewState="False"
                                Enabled="True">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="Panel1" runat="server" Style="display: none; border-color: Maroon;">
                                <div class="row" style="width: 300px; background-color: #EFFBFB;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div id="Div1">
                                                <h3 class="reallynow">Department</h3>
                                                <div class="row" style="width: 390px; vertical-align: top;">
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            Department
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox CssClass="form-control" ID="txtDepartment" runat="server" onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4"   >
                                                            <asp:Button CssClass="btn btn-primary" ID="BtnDeptSave" runat="server" Text="Submit"
                                                                OnClick="BtnDeptSave_Click" />
                                                            <asp:Button CssClass="btn btn-primary" ID="btndepcancel" runat="server" Text="Cancel"
                                                                OnClick="btndepcancel_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                        <div class="col-lg-4">
                            Designation
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList CssClass="form-select" ID="ddlDesignation" runat="server">
                            </asp:DropDownList>
                            <asp:Button CssClass="btn btn-primary" ID="LnkAddNewDesignation" runat="server"
                                OnClick="LnkAddNewDesignation_Click" Text="+"></asp:Button>
                            <div style="display: none">
                                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                            </div>
                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                                Enabled="True">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="Panel2" runat="server" Style="display: none; border-color: Maroon;">
                                <div class="row" style="width: 300px; background-color: #EFFBFB;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card-body">
                                                <h3 class="reallynow">Add Designation</h3>
                                                <div class="row">
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            Department
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:DropDownList CssClass="form-select" ID="ddlNewDept" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            Designation
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox CssClass="form-control" ID="txtDesignation" runat="server" onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4"   >
                                                            <asp:Button CssClass="btn btn-primary" ID="BtnAddnewDesignation" runat="server" Text="Submit"
                                                                OnClick="BtnAddnewDesignation_Click" />
                                                            <asp:Button CssClass="btn btn-primary" ID="btnAddNewDesignationCancel" runat="server"
                                                                Text="Cancel"
                                                                OnClick="btnAddNewDesignationCancel_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4" style="width: 100px;">
                            Subject
                        </div>
                        <div class="col-lg-4" style="width: 350px;">
                            <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server" Width="300px" onkeyup="valid(this)"
                                onblur="valid(this)"></asp:TextBox>
                        </div>
                        <div class="col-lg-4" style="width: 100px;">
                            Circular No.
                        </div>
                        <div class="col-lg-4">
                            <asp:TextBox CssClass="form-control" ID="txtCircularNo" runat="server" Width="195px"
                                onkeyup="valid(this)"
                                onblur="valid(this)"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            Description
                        </div>
                        <div class="col-lg-4">
                            <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"
                                Width="305px"
                                onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                        </div>
                        <div class="col-lg-4">
                            Attachment
                        </div>
                        <div class="col-lg-4">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4" colspan="4" style="text-align: center;">
                            <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel"
                                OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
                <h3 class="reallynow">Updated Notifications</h3>
                <div class="row">
                    <div class="row">
                        <div class="col-lg-4" style="vertical-align: top;">
                            <asp:GridView CssClass="table table-striped"  ID="GridView1" runat="server" AutoGenerateColumns="false" Width="910px"
                                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No Record Found">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                            <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                            <asp:HiddenField ID="hdnStatus" runat="server" Value='<%#Bind("Status") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTitle" runat="server" Text='<%#Bind("Title") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Circular No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCircularNo" runat="server" Text='<%#Bind("CircularNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Bind("Description") %>' ForeColor="#666666"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%#Bind("DepartmentName") %>'
                                                ForeColor="#666666"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%#Bind("Designation") %>' ForeColor="#666666"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Attachment">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkAttachment" runat="server" Text='<%#Bind("FileNameOriginal") %>'
                                                Font-Size="10px" Font-Underline="true" CommandName="FileNameO">
                                            </asp:LinkButton>
                                            <asp:HiddenField ID="hdnAttachment" runat="server" Value='<%#Bind("FileName") %>'>
                                            </asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%#Bind("CreatedDate") %>' ForeColor="#888888"></asp:Label></span>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDeleteInfo" runat="server" Text="Delete" CommandName="DeleteInfo"
                                                Font-Underline="true" OnClientClick="return Confirm()">
                                            </asp:LinkButton>
                                            <asp:Label ID="lblD" runat="server" Text="Delete">
                                            </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

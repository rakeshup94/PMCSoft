<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Designation" Codebehind="Designation.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <div class="card-body">
                        <h3 class="reallynow">
                            Designation Detail</h3>
                        <div class="row"   >
                            <div class="row"   >
                                <div class="col-lg-4"  style="vertical-align: top; width: 600px;">
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="590px"
                                        EmptyDataText="No Record Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="Hiddenfield1" runat="server" Value='<%#Bind("DeptID") %>' />
                                                    <asp:HiddenField ID="Hiddenfield2" runat="server" Value='<%#Bind("DesgID") %>' />
                                                </ItemTemplate>
                                             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDepartment" runat="server" Text='<%#Bind("DepartmentName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Desgination">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDesignation" runat="server" Text='<%#Bind("Designation") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox CssClass="form-control" ID="txtEditDesignation" runat="server" Text='<%#Bind("Designation") %>'
                                                          onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" />
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-4"    >
                                    <div class="card-body">
                                        <h3 class="reallynow">
                                            Add Designation</h3>
                                        <div class="row"    >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Department
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlDept" runat="server"  >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Designation
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtDesignation" runat="server"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
                                            </div>
                                          </div>
                                    </div>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

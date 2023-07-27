<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.PrintStaffAttendance"
    MasterPageFile="~/Site.Master" CodeBehind="PrintStaffAttendance.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Staff Attendance</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="page-content">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Project Name:       
                    <asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Date
                
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                            ID="GridView1" runat="server" AutoGenerateColumns="False"
                            EmptyDataText="No Records Found">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeID" runat="server" Text='<%#Bind("OfficialEMPID") %>'></asp:Label>
                                        <asp:HiddenField ID="hdnEmpID" runat="server" Value='<%#Bind("EmpID") %>' />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpName" runat="server" Text='<%#Bind("EmpName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbDesignation" runat="server" Text='<%#Bind("Designation") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Of Joining">
                                    <ItemTemplate>
                                        <asp:Label ID="lbDOJ" runat="server" Text='<%#Bind("DOJ") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lbEmployeeType" runat="server" Text='<%#Bind("EmployeeType") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTime" runat="server" Text='<%#Bind("AttendanceTime") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>











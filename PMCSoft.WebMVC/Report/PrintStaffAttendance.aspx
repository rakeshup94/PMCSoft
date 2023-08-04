<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.PrintStaffAttendance" Codebehind="PrintStaffAttendance.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="row"    border="0">
                    <div class="row" >
                        <div class="col-lg-4"  style="text-align: center; font-size: 18px; font-family: Cambria;">
                       
                           Staff Attendance
                        </div>
                    </div>
                  </div>
                <br />
                <br />
                <br />
      <div class="row"   >
                            <div class="row" >
                                 <div class="col-lg-4"  style="font-size: 15px; font-family: Cambria; color: Black">
                            Project Name:        <asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </div>
                        <div class="col-lg-4"   >
                        </div>
                        <div class="col-lg-4" >
                            Date
                        </div>
                        <div class="col-lg-4" >
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server"     ></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </div>
                                
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  >
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="False"   
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
    </form>
</body>
</html>

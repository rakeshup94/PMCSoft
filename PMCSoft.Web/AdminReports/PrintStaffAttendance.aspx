<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMCSoft.Web.AdminReports.PrintStaffAttendance" Codebehind="PrintStaffAttendance.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 
        
      <table style="width: 930px">
                            <tr>
                                 <td style="font-size: 15px; font-family: Cambria; color: Black">
                            Project Name: &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblProjectName" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnPRJID" runat="server" />
                        </td>
                        <td style="font-size: 15px; font-family: Cambria;">
                        </td>
                        <td>
                            Date
                        </td>
                        <td>
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                            <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="14px"></asp:Label>
                            <asp:HiddenField ID="hdnWPDate" runat="server" />
                            <asp:HiddenField ID="hdnWPID" runat="server" />
                        </td>
                                
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="910px"
                                        EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%#Bind("OfficialEMPID") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnEmpID" runat="server" Value='<%#Bind("EmpID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
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
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbDesignation" runat="server" Text='<%#Bind("Designation") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Of Joining">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbDOJ" runat="server" Text='<%#Bind("DOJ") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbEmployeeType" runat="server" Text='<%#Bind("EmployeeType") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTime" runat="server" Text='<%#Bind("AttendanceTime") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
    </form>
</body>
</html>

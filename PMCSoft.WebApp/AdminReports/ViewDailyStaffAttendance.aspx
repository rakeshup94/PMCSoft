﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="AdminReports_ViewDailyStaffAttendance" Codebehind="ViewDailyStaffAttendance.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Staff Attendance</h3>
                        <table style="width: 930px">
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print Preview" />
                                </td>
                            </tr>
                            <tr>
                                <td>
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
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

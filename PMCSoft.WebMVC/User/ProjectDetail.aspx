<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.ProjectDetail" Codebehind="ProjectDetail.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

    <style type="text/css">
        .accordionContent
        {
            background-color: #F4F9F9;
            border-color: -moz-use-text-color #2F4F4F #2F4F4F;
            border-right: 1px dashed #2F4F4F;
            border-style: none dashed dashed;
            border-width: medium 1px 1px;
            padding: 10px 5px 5px;
            width: 910px;
        }
        .accordionHeaderSelected
        {
            background-color: #5D99A3;
            border: 1px solid #2F4F4F;
            color: white;
            cursor: pointer;
            font-family: Arial,Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            margin-top: 5px;
            padding: 5px;
            width: 910px;
        }
        .accordionHeader
        {
            background-color: #809080;
            border: 1px solid #2F4F4F;
            color: white;
            cursor: pointer;
            font-family: Arial,Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            margin-top: 5px;
            padding: 5px;
            width: 910px;
        }
        .href
        {
            color: White;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div id="content" style="width: 935px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            Project Detail</h3>
                        <table style="width: 925px; vertical-align: top;">
                            <tr style="vertical-align: top;">
                                <td colspan="2">
                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        <cc1:Accordion ID="Accordion1" runat="server" SelectedIndex="0" HeaderCssClass="accordionHeader"
                                            HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                                            FadeTransitions="true" SuppressHeaderPostbacks="true" TransitionDuration="250"
                                            FramesPerSecond="40" RequireOpenedPane="false" AutoSize="None">
                                            <Panes>
                                                <cc1:AccordionPane ID="AccordionPane1" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Project Particulars</a></Header>
                                                    <Content>
                                                        <table style="width: 900px; border: 1px solid #D9EAED; border-collapse: collapse;">
                                                            <tr style="background-color: #D9EAED; color: #202020; font-weight: bold;">
                                                                <td style="text-align: center; border: 1px solid #D9EAED; width: 40px;">
                                                                    S.No
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid #D9EAED; width: 550px;">
                                                                    Particular Details/Contract Provision
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid #D9EAED; width: 120px;">
                                                                    Clause
                                                                </td>
                                                                <td style="text-align: center; border: 1px solid #D9EAED; width: 170px;">
                                                                    Subsequent Amendments
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    1
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtProjectName" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Name of Project"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtProjectClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtProjectAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    2
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtLocation" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Location"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLocationClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLocationAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    3
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtDateOfAward" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Date of Award"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfAward"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtDateofAwardClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtDateOfAwardAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    4
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtLOINo" runat="server" Width="540px" onkeyup="valid(this)" onblur="valid(this)"
                                                                        placeholder="LOI No"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLOINoClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLOINoAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    5
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtLOIDate" runat="server" Width="540px" onkeyup="valid(this)" onblur="valid(this)"
                                                                        placeholder="LOI Date"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtLOIDate"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLOIDateClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtLOIDateAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    6
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtNameOfRegion" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Name Of Region Handling Project"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtNameOfRegionClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtNameOfRegionAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    7
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtProjectInchargeName" runat="server" Width="380px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Project In Charge Name"></asp:TextBox>
                                                                    <asp:TextBox ID="txtProjectInChargeMobileNo" runat="server" Width="150px" MaxLength="10"
                                                                        onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtProjectInChargeMobileNo">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtProjectInChargeClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtProjectInChargeAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    8
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Client Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlClientCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlClientCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlClientState" runat="server" Width="205px" OnSelectedIndexChanged="ddlClientState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlClientCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientZipCode" runat="server" Width="200px" MaxLength="6" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtClientZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientMobileNo" runat="server" Width="170px" MaxLength="10" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtClientMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientPhoneNo" runat="server" Width="200px" MaxLength="11" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtClientPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientFaxNo" runat="server" Width="170px" MaxLength="11" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtClientFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtClientEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtClientClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtClientAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    9
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                PMC/Project Manager Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlProjectManagerCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlProjectManagerCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlProjectManagerState" runat="server" Width="205px" OnSelectedIndexChanged="ddlProjectManagerState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlProjectManagerCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerZipCode" runat="server" Width="200px" MaxLength="6"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtProjectManagerZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtProjectManagerMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtProjectManagerPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerFaxNo" runat="server" Width="170px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtProjectManagerFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtProjectManagerEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtProjectManagerClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtProjectManagerAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    10
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Architect Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlArchitectCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlArchitectCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlArchitectState" runat="server" Width="205px" OnSelectedIndexChanged="ddlArchitectState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlArchitectCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectZipCode" runat="server" Width="200px" MaxLength="6"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtArchitectZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtArchitectMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtarchitectPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectFaxNo" runat="server" Width="170px" MaxLength="11" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtArchitectFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtArchitectEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtArchitectClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtArchitectAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    11
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Structural Consultant Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralConsultantName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralConsultantAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlStructuralConsultantCountry" runat="server" Width="175px"
                                                                                    OnSelectedIndexChanged="ddlStructuralConsultantCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlStructuralConsultantState" runat="server" Width="205px"
                                                                                    OnSelectedIndexChanged="ddlStructuralConsultantState_SelectedIndexChanged" AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlStructuralConsultantCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralConsultantZipCode" runat="server" Width="200px" MaxLength="6"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtStructuralConsultantZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralConsultantMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtStructuralConsultantMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralConsultantPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtStructuralConsultantPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralFaxNo" runat="server" Width="170px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtStructuralFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtStructuralEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtStructuralConsultantClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtStructuralConsultantAmendments" runat="server" Width="160px"
                                                                        onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    12
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Mechanical Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlMechanicalCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlMechanicalCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlMechanicalState" runat="server" Width="205px" OnSelectedIndexChanged="ddlMechanicalState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlMechanicalCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalZipCode" runat="server" Width="200px" MaxLength="6"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtMechanicalZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtMechanicalMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtMechanicalPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalFaxNo" runat="server" Width="170px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtMechanicalFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtMechanicalEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtMechanicalClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtMechanicalAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    13
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Electrical Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlElectricalCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlElectricalCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlElectricalState" runat="server" Width="205px" OnSelectedIndexChanged="ddlElectricalState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlElectricalCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalZipCode" runat="server" Width="170px" MaxLength="6"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtElectricalZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtElectricalMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtElectricalPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalFaxNo" runat="server" Width="170px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtElectricalFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtElectricalEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtElectricalClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtElectricalAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    14
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; vertical-align: top;">
                                                                    <table style="width: 540px; vertical-align: top; border: .5px solid #D9EAED; border-collapse: collapse">
                                                                        <tr>
                                                                            <td colspan="4" style="background-color: #D9EAED; color: #202020; font-weight: bold;
                                                                                border: .5px solid #D9EAED;">
                                                                                Plumbing Consultant Detail
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="vertical-align: top;">
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Name
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingName" runat="server" Width="170px" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Address
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingAddress" runat="server" Width="200px" TextMode="MultiLine"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Country
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlPlumbingCountry" runat="server" Width="175px" OnSelectedIndexChanged="ddlPlumbingCountry_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                State
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlPlumbingState" runat="server" Width="205px" OnSelectedIndexChanged="ddlPlumbingState_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                City
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:DropDownList ID="ddlPlumbingCity" runat="server" Width="175px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Zip Code
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingZipCode" runat="server" Width="200px" MaxLength="6" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtPlumbingZipCode">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Mobile No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingMobileNo" runat="server" Width="170px" MaxLength="10"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtPlumbingMobileNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Phone No.
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingPhoneNo" runat="server" Width="200px" MaxLength="11"
                                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtplumbingPhoneNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Fax No
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingFaxNo" runat="server" Width="170px" MaxLength="11" onkeyup="valid(this)"
                                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtPlumbingFaxNo">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td style="vertical-align: top; width: 80px; border: .5px solid #D9EAED;">
                                                                                Email Id
                                                                            </td>
                                                                            <td style="vertical-align: top; border: .5px solid #D9EAED;">
                                                                                <asp:TextBox ID="txtPlumbingEmail" runat="server" Width="200px" placeholder="Email Id"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtPlumbingClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center; vertical-align: top;">
                                                                    <asp:TextBox ID="txtPlumbingAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    15
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtStipulatedDateOfStart" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Stipulated Date Of Start"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtStipulatedDateOfStart"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtStipulatedDateClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtStipulatedDateAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    16
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtActualDateOfStart" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Date Of Actual Start"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtActualDateOfStart"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtActualDateClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtActualDateAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    17
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtStipulatedDateOfFinish" runat="server" Width="540px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Stipulated Date Of Finish"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtStipulatedDateOfFinish"
                                                                        CssClass="cal_Theme1">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtStipulatedDateFinishClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtStipulatedDateFinishAmendments" runat="server" Width="160px"
                                                                        onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    18
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtOriginalContractValue" runat="server" Width="150px" placeholder="Original Contract Value"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtOriginalContractValue" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:TextBox ID="txtOCVWord" runat="server" Width="380px" onkeyup="valid(this)" onblur="valid(this)"
                                                                        placeholder="Original Contract Value Word Format"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtOCVClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtOCVAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    19
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtRevisedContractValue" runat="server" Width="150px" placeholder="Revised Contract Value"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtRevisedContractValue" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:TextBox ID="txtRCVWord" runat="server" Width="380px" onkeyup="valid(this)" onblur="valid(this)"
                                                                        placeholder="Revised Contract Value Word Format"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtRCVClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtRCVAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center; border: 1px solid #D9EAED;">
                                                                    20
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED;">
                                                                    <asp:TextBox ID="txtExpectedContractValue" runat="server" Width="150px" placeholder="Expected Contract Value"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtExpectedContractValue" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:TextBox ID="txtECVWord" runat="server" Width="380px" onkeyup="valid(this)" onblur="valid(this)"
                                                                        placeholder="Expected Contract Value Word Format"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtECVClause" runat="server" Width="100px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                </td>
                                                                <td style="border: 1px solid #D9EAED; text-align: center;">
                                                                    <asp:TextBox ID="txtECVAmendments" runat="server" Width="160px" onkeyup="valid(this)"
                                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane2" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Availibility Of Documents (Y/N)</a></Header>
                                                    <Content>
                                                        <table style="width: 910px">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane3" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Insurance/Licenses (Y/N) &amp; Date of Validity</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane4" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Other Deposit / Bonds / Guarantees</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane5" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Facilities Provided By Clients (Y/N) and whether chargeable
                                                            from Co. or not</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane6" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Mobilization Advance</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane7" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Billing</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPane8" runat="server">
                                                    <Header>
                                                        <a href="#" class="href">Payments Terms</a></Header>
                                                    <Content>
                                                        <table style="width: 910px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="false" Width="890px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="40px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Particulars">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="200px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                                        TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="300px" HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Clause">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtClause" runat="server" Text='<%#Bind("Clause") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>' onkeyup="valid(this)"
                                                                                        onblur="valid(this)">
                                                                                    </asp:TextBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="100px" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </Content>
                                                </cc1:AccordionPane>
                                            </Panes>
                                        </cc1:Accordion>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <asp:Button ID="btnParticularsCancel" runat="server" Text="Cancel" OnClick="btnParticularsCancel_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

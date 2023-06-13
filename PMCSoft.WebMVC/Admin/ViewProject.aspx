<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ViewProject"
    CodeBehind="ViewProject.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Project Detail</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col-12 d-block d-sm-none">
                                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#tab-0"
                                        type="button">
                                        Project Particulars
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-1" type="button">
                                        Availibility Of Documents (Y/N)
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-2" type="button">
                                        Insurance/Licenses (Y/N) &amp; Date of Validity
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-3" type="button">
                                        Other Deposit / Bonds / Guarantees
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-4" type="button">
                                        Facilities Provided By Clients (Y/N) and whether chargeable
                                                            from Co. or not
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-5" type="button">
                                        Mobilization Advance
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-6" type="button">
                                        Billing
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-7" type="button">
                                        Payments Terms
                                    </button>
                                </div>
                            </div>
                            <div class="col-lg-9 pe-sm-0">
                                <div class="tab-content" id="v-pills-tabContent" style="min-height: 277px">
                                    <div class="tab-pane fade show active" id="tab-0" role="tabpanel" aria-labelledby="tab-0-tab">


                                        <div class="row">
                                            <div class="row" style="background-color: #D9EAED; color: #202020; font-weight: bold;">
                                                <div class="col-lg-4">
                                                    S.No
                                                </div>
                                                <div class="col-lg-4">
                                                    Particular Details/Contract Provision
                                                </div>
                                                <div class="col-lg-4">
                                                    Clause
                                                </div>
                                                <div class="col-lg-4">
                                                    Subsequent Amendments
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    1
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectName" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Name of Project"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    2
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Location"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLocationClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLocationAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    3
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtDateOfAward" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Date of Award"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfAward"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtDateofAwardClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtDateOfAwardAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    4
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOINo" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)"
                                                        placeholder="LOI No"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOINoClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOINoAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    5
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOIDate" runat="server"
                                                        onkeyup="valid(this)" onblur="valid(this)"
                                                        placeholder="LOI Date"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtLOIDate"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOIDateClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtLOIDateAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    6
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtNameOfRegion" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Name Of Region Handling Project"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtNameOfRegionClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtNameOfRegionAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    7
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInchargeName" runat="server" Width="380px"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Project In Charge Name"></asp:TextBox>
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInChargeMobileNo" runat="server"
                                                        MaxLength="10"
                                                        onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                        TargetControlID="txtProjectInChargeMobileNo">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInChargeClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInChargeAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    8
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Client Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientAddress" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlClientCountry" runat="server" OnSelectedIndexChanged="ddlClientCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlClientState" runat="server" OnSelectedIndexChanged="ddlClientState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlClientCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientZipCode" runat="server" MaxLength="6"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtClientZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientMobileNo" runat="server" MaxLength="10"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtClientMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientPhoneNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtClientPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtClientFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtClientEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtClientClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtClientAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    9
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                PMC/Project Manager Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerAddress" runat="server"
                                                                    TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerCountry" runat="server"
                                                                    OnSelectedIndexChanged="ddlProjectManagerCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerState" runat="server"
                                                                    OnSelectedIndexChanged="ddlProjectManagerState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerZipCode" runat="server"
                                                                    MaxLength="6"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtProjectManagerZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerMobileNo" runat="server"
                                                                    MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtProjectManagerMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerPhoneNo" runat="server"
                                                                    MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtProjectManagerPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtProjectManagerFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtProjectManagerEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectManagerClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtProjectManagerAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    10
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Architect Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectAddress" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlArchitectCountry" runat="server"
                                                                    OnSelectedIndexChanged="ddlArchitectCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlArchitectState" runat="server" OnSelectedIndexChanged="ddlArchitectState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlArchitectCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectZipCode" runat="server" MaxLength="6"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtArchitectZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectMobileNo" runat="server" MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtArchitectMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectPhoneNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtarchitectPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtArchitectFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtArchitectEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtArchitectClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtArchitectAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    11
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Structural Consultant Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantName" runat="server"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantAddress" runat="server"
                                                                    TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantCountry" runat="server"
                                                                    OnSelectedIndexChanged="ddlStructuralConsultantCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantState" runat="server"
                                                                    OnSelectedIndexChanged="ddlStructuralConsultantState_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantZipCode" runat="server"
                                                                    MaxLength="6"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtStructuralConsultantZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantMobileNo" runat="server"
                                                                    MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtStructuralConsultantMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantPhoneNo" runat="server"
                                                                    MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtStructuralConsultantPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtStructuralFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtStructuralEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantAmendments" runat="server"
                                                        onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    12
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Mechanical Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalAddress" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlMechanicalCountry" runat="server"
                                                                    OnSelectedIndexChanged="ddlMechanicalCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlMechanicalState" runat="server" OnSelectedIndexChanged="ddlMechanicalState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlMechanicalCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalZipCode" runat="server" MaxLength="6"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtMechanicalZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalMobileNo" runat="server" MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtMechanicalMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalPhoneNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtMechanicalPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtMechanicalFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtMechanicalEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtMechanicalClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtMechanicalAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    13
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Electrical Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalAddress" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlElectricalCountry" runat="server"
                                                                    OnSelectedIndexChanged="ddlElectricalCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlElectricalState" runat="server" OnSelectedIndexChanged="ddlElectricalState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlElectricalCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalZipCode" runat="server" MaxLength="6"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtElectricalZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalMobileNo" runat="server" MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtElectricalMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalPhoneNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtElectricalPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtElectricalFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtElectricalEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtElectricalClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtElectricalAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    14
                                                </div>
                                                <div class="col-lg-4" style="border: 1px solid #D9EAED; vertical-align: top;">
                                                    <div class="row" style="width: 540px; vertical-align: top; border: .5px solid #D9EAED;
                                                        border-collapse: collapse">
                                                        <div class="row">
                                                            <div class="col-lg-4" colspan="4" style="background-color: #D9EAED; color: #202020;
                                                                font-weight: bold; border: .5px solid #D9EAED;">
                                                                Plumbing Consultant Detail
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Name
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingName" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Address
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingAddress" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Country
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlPlumbingCountry" runat="server" OnSelectedIndexChanged="ddlPlumbingCountry_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                State
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlPlumbingState" runat="server" OnSelectedIndexChanged="ddlPlumbingState_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                City
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlPlumbingCity" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Zip Code
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingZipCode" runat="server" MaxLength="6"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtPlumbingZipCode">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Mobile No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingMobileNo" runat="server" MaxLength="10"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtPlumbingMobileNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Phone No.
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingPhoneNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtplumbingPhoneNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                Fax No
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingFaxNo" runat="server" MaxLength="11"
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server" FilterType="Custom, Numbers"
                                                                    TargetControlID="txtPlumbingFaxNo">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                Email Id
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control" ID="txtPlumbingEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtPlumbingClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtPlumbingAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    15
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateOfStart" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Stipulated Date Of Start"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtStipulatedDateOfStart"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    16
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtActualDateOfStart" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Date Of Actual Start"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtActualDateOfStart"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtActualDateClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtActualDateAmendments" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    17
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateOfFinish" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Stipulated Date Of Finish"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtStipulatedDateOfFinish"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateFinishClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtStipulatedDateFinishAmendments" runat="server"
                                                        onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    18
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtOriginalContractValue" runat="server"
                                                        placeholder="Original Contract Value"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" FilterType="Custom, Numbers"
                                                        TargetControlID="txtOriginalContractValue" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:TextBox CssClass="form-control" ID="txtOCVWord" runat="server" Width="380px"
                                                        onkeyup="valid(this)" onblur="valid(this)"
                                                        placeholder="Original Contract Value Word Format"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtOCVClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtOCVAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    19
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtRevisedContractValue" runat="server"
                                                        placeholder="Revised Contract Value"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server" FilterType="Custom, Numbers"
                                                        TargetControlID="txtRevisedContractValue" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:TextBox CssClass="form-control" ID="txtRCVWord" runat="server" Width="380px"
                                                        onkeyup="valid(this)" onblur="valid(this)"
                                                        placeholder="Revised Contract Value Word Format"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtRCVClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtRCVAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    20
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtExpectedContractValue" runat="server"
                                                        placeholder="Expected Contract Value"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" FilterType="Custom, Numbers"
                                                        TargetControlID="txtExpectedContractValue" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:TextBox CssClass="form-control" ID="txtECVWord" runat="server" Width="380px"
                                                        onkeyup="valid(this)" onblur="valid(this)"
                                                        placeholder="Expected Contract Value Word Format"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtECVClause" runat="server"
                                                        onkeyup="valid(this)"
                                                        onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox CssClass="form-control" ID="txtECVAmendments" runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView1" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="tab-pane fade" id="tab-1" role="tabpanel" aria-labelledby="tab-1-tab">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView2" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2-tab">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView3" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3-tab">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView4" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="tab-4-tab">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView5" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="tab-5" role="tabpanel" aria-labelledby="tab-5-tab">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView6" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>


                                    </div>


                                    <div class="tab-pane fade" id="tab-6" role="tabpanel" aria-labelledby="tab-6-tab">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView7" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="tab-pane fade" id="tab-7" role="tabpanel" aria-labelledby="tab-7-tab">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView8" runat="server" AutoGenerateColumns="false">
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
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" Text='<%#Bind("Details") %>'
                                                                    TextMode="MultiLine" Width="280px" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" Text='<%#Bind("Clause") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" Text='<%#Bind("Amendments") %>'
                                                                    onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle VerticalAlign="Top" BorderColor="#D9EAED" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" BorderColor="#D9EAED" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>
                            <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#tab-0"
                                        type="button">
                                        Project Particulars
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-1" type="button">
                                        Availibility Of Documents (Y/N)
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-2" type="button">
                                        Insurance/Licenses (Y/N) &amp; Date of Validity
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-3" type="button">
                                        Other Deposit / Bonds / Guarantees
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-4" type="button">
                                        Facilities Provided By Clients (Y/N) and whether chargeable
                                                            from Co. or not
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-5" type="button">
                                        Mobilization Advance
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-6" type="button">
                                        Billing
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-7" type="button">
                                        Payments Terms
                                    </button>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-4">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnParticularsCancel" runat="server"
                                    Text="Cancel" OnClick="btnParticularsCancel_Click" />
                            </div>
                        </div>






                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

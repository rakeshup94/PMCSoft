<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.ViewEditProject" Codebehind="ViewEditProject.aspx.cs" %>

 


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">Project Detail</div>
        </div>
        <div class="clearfix"></div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                          


                            <div class="col-lg-12 text-end">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnParticularsSubmit" runat="server"
                                    Text="Update"
                                    OnClick="btnParticularsSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnParticularsCancel" runat="server"
                                    Text="Cancel"
                                    OnClick="btnParticularsCancel_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">


                        <div class="row">
                            <div class="col-lg-12">
                                <div class="accordion">



                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Project">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Project"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Project Particulars
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Project" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Project">
                                            <div class="accordion-body">

                                                <div class="row">
                                                    <div class="col-12 d-block d-sm-none">
                                                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">


                                                            <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-Project"
                                                                type="button" role="tab">
                                                                Project Particulars
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Client"
                                                                type="button" role="tab">
                                                                Client Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-PMC"
                                                                type="button" role="tab">
                                                                PMC/Project Manager Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-Architect"
                                                                type="button" role="tab">
                                                                Architect Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Structural"
                                                                type="button" role="tab">
                                                                Structural Consultant Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-Mechanical"
                                                                type="button" role="tab">
                                                                Mechanical Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Electrical"
                                                                type="button" role="tab">
                                                                Electrical Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Plumbing"
                                                                type="button" role="tab">
                                                                Plumbing Consultant Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Others"
                                                                type="button" role="tab">
                                                                Others
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-9 pe-sm-0">




                                                        <div class="tab-content" id="v-pills-tabContent">
                                                            <div class="tab-pane fade show active" id="v-pills-Project" role="tabpanel">
                                                                <div class="row">


                                                                    <div class="col-lg-12">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>S.No</th>
                                                                                        <th>Particular Details/Contract Provision</th>
                                                                                        <th>Clause</th>
                                                                                        <th>Subsequent Amendments</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>1</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtProjectName" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Name of Project"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtProjectClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtProjectAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox></td>

                                                                                    </tr>


                                                                                    <tr>
                                                                                        <td>2</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Location"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLocationClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLocationAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox></td>


                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td>3</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtDateOfAward" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Date of Award"></asp:TextBox>
                                                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfAward"
                                                                                                CssClass="cal_Theme1">
                                                                                            </cc1:CalendarExtender>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtDateofAwardClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtDateOfAwardAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox></td>


                                                                                    </tr>


                                                                                    <tr>
                                                                                        <td>4</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOINo" runat="server" onkeyup="valid(this)"
                                                                                                onblur="valid(this)"
                                                                                                placeholder="LOI No"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOINoClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOINoAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox></td>


                                                                                    </tr>


                                                                                    <tr>
                                                                                        <td>5</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOIDate" runat="server"
                                                                                                onkeyup="valid(this)" onblur="valid(this)"
                                                                                                placeholder="LOI Date"></asp:TextBox>
                                                                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtLOIDate"
                                                                                                CssClass="cal_Theme1">
                                                                                            </cc1:CalendarExtender>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOIDateClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtLOIDateAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                        </td>


                                                                                    </tr>





                                                                                    <tr>
                                                                                        <td>6</td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtNameOfRegion" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Name Of Region Handling Project"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtNameOfRegionClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtNameOfRegionAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                        </td>


                                                                                    </tr>





                                                                                    <tr>
                                                                                        <td>7</td>
                                                                                        <td>





                                                                                            <div class="row">
                                                                                                <div class="col-lg-6">
                                                                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInchargeName" runat="server"
                                                                                                        onkeyup="valid(this)"
                                                                                                        onblur="valid(this)" placeholder="Project In Charge Name"></asp:TextBox>
                                                                                                </div>
                                                                                                <div class="col-lg-6">

                                                                                                    <asp:TextBox CssClass="form-control" ID="txtProjectInChargeMobileNo" runat="server"
                                                                                                        MaxLength="10"
                                                                                                        onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                                                                        TargetControlID="txtProjectInChargeMobileNo">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </div>
                                                                                            </div>







                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtProjectInChargeClause" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" placeholder="Clause"></asp:TextBox></td>
                                                                                        <td>
                                                                                            <asp:TextBox CssClass="form-control" ID="txtProjectInChargeAmendments" runat="server"
                                                                                                onkeyup="valid(this)"
                                                                                                onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                        </td>


                                                                                    </tr>






                                                                                </tbody>

                                                                            </table>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Client" role="tabpanel">
                                                                <div class="row">




                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name
                                                                 
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientName" runat="server"
                                                                                onkeyup="valid(this)"
                                                                                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Clause
                                                        <asp:TextBox CssClass="form-control" ID="txtClientClause" runat="server"
                                                            onkeyup="valid(this)"
                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Subsequent Amendments
                                                        <asp:TextBox CssClass="form-control" ID="txtClientAmendments" runat="server"
                                                            onkeyup="valid(this)"
                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                        </div>
                                                                    </div>




                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.
                                                                     
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientMobileNo" runat="server"
                                                                                MaxLength="10" onkeyup="valid(this)"
                                                                                onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtClientMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.
                                                                 
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientPhoneNo" runat="server" MaxLength="11"
                                                                                onkeyup="valid(this)"
                                                                                onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtClientPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No
                                                                   
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientFaxNo" runat="server"
                                                                                MaxLength="11" onkeyup="valid(this)"
                                                                                onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtClientFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>




                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id
                                                                  
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>







                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country
                                                              
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlClientCountry" runat="server"
                                                                                OnSelectedIndexChanged="ddlClientCountry_SelectedIndexChanged"
                                                                                AutoPostBack="true">
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State
                                                                  
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlClientState" runat="server" OnSelectedIndexChanged="ddlClientState_SelectedIndexChanged"
                                                                                AutoPostBack="true">
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>



                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City
                                                                    
                                                                            <asp:DropDownList CssClass="form-select" ID="ddlClientCity" runat="server">
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code
                                                                   
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientZipCode" runat="server" MaxLength="6"
                                                                                onkeyup="valid(this)"
                                                                                onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtClientZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address
                                                                
                                                                            <asp:TextBox CssClass="form-control" ID="txtClientAddress" runat="server" TextMode="MultiLine"
                                                                                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>



                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-PMC" role="tabpanel">
                                                                <div class="row">



                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name
   
            <asp:TextBox CssClass="form-control" ID="txtProjectManagerName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerAddress" runat="server"
                TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country
   
            <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerCountry" runat="server"
                OnSelectedIndexChanged="ddlProjectManagerCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State
 
            <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerState" runat="server"
                OnSelectedIndexChanged="ddlProjectManagerState_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City
 
            <asp:DropDownList CssClass="form-select" ID="ddlProjectManagerCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerZipCode" runat="server"
                MaxLength="6"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtProjectManagerZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtProjectManagerMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerPhoneNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtProjectManagerPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerFaxNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender26"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtProjectManagerFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id

            <asp:TextBox CssClass="form-control" ID="txtProjectManagerEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtProjectManagerClause"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtProjectManagerAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Architect" role="tabpanel">
                                                                <div class="row">


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name

            <asp:TextBox CssClass="form-control" ID="txtArchitectName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address
 
            <asp:TextBox CssClass="form-control" ID="txtArchitectAddress" runat="server" TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country
    
            <asp:DropDownList CssClass="form-select" ID="ddlArchitectCountry" runat="server"
                OnSelectedIndexChanged="ddlArchitectCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State

            <asp:DropDownList CssClass="form-select" ID="ddlArchitectState" runat="server" OnSelectedIndexChanged="ddlArchitectState_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City

            <asp:DropDownList CssClass="form-select" ID="ddlArchitectCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code

            <asp:TextBox CssClass="form-control" ID="txtArchitectZipCode" runat="server" MaxLength="6"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtArchitectZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.

            <asp:TextBox CssClass="form-control" ID="txtArchitectMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtArchitectMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.

            <asp:TextBox CssClass="form-control" ID="txtArchitectPhoneNo" runat="server" MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtarchitectPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtArchitectFaxNo" runat="server"
                MaxLength="11" onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender28"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtArchitectFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id

            <asp:TextBox CssClass="form-control" ID="txtArchitectEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtArchitectClause" runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtArchitectAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Structural" role="tabpanel">
                                                                <div class="row">


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name

            <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address

            <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantAddress" runat="server"
                TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country

            <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantCountry" runat="server"
                OnSelectedIndexChanged="ddlStructuralConsultantCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State

            <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantState" runat="server"
                OnSelectedIndexChanged="ddlStructuralConsultantState_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City


            <asp:DropDownList CssClass="form-select" ID="ddlStructuralConsultantCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code

            <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantZipCode" runat="server"
                MaxLength="6"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtStructuralConsultantZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.

            <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtStructuralConsultantMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.

            <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantPhoneNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtStructuralConsultantPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtStructuralFaxNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender29"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtStructuralFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id

            <asp:TextBox CssClass="form-control" ID="txtStructuralEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantClause"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtStructuralConsultantAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent
                                        Amendments"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Mechanical" role="tabpanel">
                                                                <div class="row">

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name

            <asp:TextBox CssClass="form-control" ID="txtMechanicalName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address

            <asp:TextBox CssClass="form-control" ID="txtMechanicalAddress" runat="server" TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country
    
            <asp:DropDownList CssClass="form-select" ID="ddlMechanicalCountry" runat="server"
                OnSelectedIndexChanged="ddlMechanicalCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State

            <asp:DropDownList CssClass="form-select" ID="ddlMechanicalState" runat="server" OnSelectedIndexChanged="ddlMechanicalState_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City

            <asp:DropDownList CssClass="form-select" ID="ddlMechanicalCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code

            <asp:TextBox CssClass="form-control" ID="txtMechanicalZipCode" runat="server" MaxLength="6"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtMechanicalZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.
 
            <asp:TextBox CssClass="form-control" ID="txtMechanicalMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtMechanicalMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.
   
            <asp:TextBox CssClass="form-control" ID="txtMechanicalPhoneNo" runat="server" MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender20"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtMechanicalPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtMechanicalFaxNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender30"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtMechanicalFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id

            <asp:TextBox CssClass="form-control" ID="txtMechanicalEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtMechanicalClause" runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtMechanicalAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Electrical" role="tabpanel">
                                                                <div class="row">


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name

            <asp:TextBox CssClass="form-control" ID="txtElectricalName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address

            <asp:TextBox CssClass="form-control" ID="txtElectricalAddress" runat="server" TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country

            <asp:DropDownList CssClass="form-select" ID="ddlElectricalCountry" runat="server"
                OnSelectedIndexChanged="ddlElectricalCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State

            <asp:DropDownList CssClass="form-select" ID="ddlElectricalState" runat="server" OnSelectedIndexChanged="ddlElectricalState_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City

            <asp:DropDownList CssClass="form-select" ID="ddlElectricalCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code

            <asp:TextBox CssClass="form-control" ID="txtElectricalZipCode" runat="server"
                MaxLength="6"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtElectricalZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.
 
            <asp:TextBox CssClass="form-control" ID="txtElectricalMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtElectricalMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.

            <asp:TextBox CssClass="form-control" ID="txtElectricalPhoneNo" runat="server" MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtElectricalPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtElectricalFaxNo" runat="server"
                MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtElectricalFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id
    
            <asp:TextBox CssClass="form-control" ID="txtElectricalEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtElectricalClause" runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtElectricalAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="v-pills-Plumbing" role="tabpanel">
                                                                <div class="row">


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Name

            <asp:TextBox CssClass="form-control" ID="txtPlumbingName" runat="server"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Address

            <asp:TextBox CssClass="form-control" ID="txtPlumbingAddress" runat="server" TextMode="MultiLine"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Address"></asp:TextBox>
                                                                        </div>
                                                                    </div>


                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Country
 
            <asp:DropDownList CssClass="form-select" ID="ddlPlumbingCountry" runat="server"
                OnSelectedIndexChanged="ddlPlumbingCountry_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            State

            <asp:DropDownList CssClass="form-select" ID="ddlPlumbingState" runat="server" OnSelectedIndexChanged="ddlPlumbingState_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            City

            <asp:DropDownList CssClass="form-select" ID="ddlPlumbingCity" runat="server">
            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Zip Code
  
            <asp:TextBox CssClass="form-control" ID="txtPlumbingZipCode" runat="server" MaxLength="6"
                onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Zip Code"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtPlumbingZipCode">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Mobile No.

            <asp:TextBox CssClass="form-control" ID="txtPlumbingMobileNo" runat="server"
                MaxLength="10"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Mobile No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                                                                FilterType="Custom, Numbers"
                                                                                TargetControlID="txtPlumbingMobileNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Phone No.
  
            <asp:TextBox CssClass="form-control" ID="txtPlumbingPhoneNo" runat="server" MaxLength="11"
                onkeyup="valid(this)" onblur="valid(this)" placeholder="Phone No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtplumbingPhoneNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Fax No

            <asp:TextBox CssClass="form-control" ID="txtPlumbingFaxNo" runat="server"
                MaxLength="11" onkeyup="valid(this)"
                onblur="valid(this)" placeholder="Fax No."></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32"
                                                                                runat="server" FilterType="Custom, Numbers"
                                                                                TargetControlID="txtPlumbingFaxNo">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            Email Id

            <asp:TextBox CssClass="form-control" ID="txtPlumbingEmail" runat="server" placeholder="Email Id"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtPlumbingClause" runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <asp:TextBox CssClass="form-control" ID="txtPlumbingAmendments"
                                                                            runat="server"
                                                                            onkeyup="valid(this)"
                                                                            onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="tab-pane fade" id="v-pills-Others" role="tabpanel">

                                                                <div class="card">

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>S.No</th>
                                                                                            <th>Particular Details/Contract Provision</th>
                                                                                            <th>Clause</th>
                                                                                            <th>Subsequent Amendments</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>


                                                                                        <tr>
                                                                                            <td>1</td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateOfStart"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Stipulated Date Of Start"></asp:TextBox>
                                                                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtStipulatedDateOfStart"
                                                                                                    CssClass="cal_Theme1">
                                                                                                </cc1:CalendarExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateClause"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateAmendments"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2</td>

                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtActualDateOfStart" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Date Of Actual Start"></asp:TextBox>
                                                                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtActualDateOfStart"
                                                                                                    CssClass="cal_Theme1">
                                                                                                </cc1:CalendarExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtActualDateClause" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtActualDateAmendments"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>


                                                                                        <tr>

                                                                                            <td>3</td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateOfFinish"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Stipulated Date Of Finish"></asp:TextBox>
                                                                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtStipulatedDateOfFinish"
                                                                                                    CssClass="cal_Theme1">
                                                                                                </cc1:CalendarExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateFinishClause"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtStipulatedDateFinishAmendments"
                                                                                                    runat="server"
                                                                                                    onkeyup="valid(this)" onblur="valid(this)" Placeholder="Subsequent
                                        Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td>4</td>

                                                                                            <td>
                                                                                                <div class="row">
                                                                                                    <div class="col-lg-6">
                                                                                                <asp:TextBox CssClass="form-control" ID="txtOriginalContractValue"
                                                                                                    runat="server"
                                                                                                    placeholder="Original Contract Value"></asp:TextBox></div>
                                                                                                    <div class="col-lg-6">    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server"
                                                                                                    FilterType="Custom, Numbers"
                                                                                                    TargetControlID="txtOriginalContractValue" ValidChars=".">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtOCVWord" runat="server"
                                                                                                    onkeyup="valid(this)" onblur="valid(this)"
                                                                                                    placeholder="Original Contract Value Word Format"></asp:TextBox></div>
                                                                                                </div>

                                                                                            
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtOCVClause" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtOCVAmendments" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>



                                                                                        <tr>
                                                                                            <td>5</td>

                                                                                            <td> <div class="row">
                                                                                                    <div class="col-lg-6"><asp:TextBox CssClass="form-control" ID="txtRevisedContractValue"
                                                                                                    runat="server"
                                                                                                    placeholder="Revised Contract Value"></asp:TextBox></div>
                                                                                                    <div class="col-lg-6">         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server"
                                                                                                    FilterType="Custom, Numbers"
                                                                                                    TargetControlID="txtRevisedContractValue" ValidChars=".">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtRCVWord" runat="server"
                                                                                                    onkeyup="valid(this)" onblur="valid(this)"
                                                                                                    placeholder="Revised Contract Value Word Format"></asp:TextBox></div>
                                                                                                </div>
                                                                                                
                                                                                       
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtRCVClause" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtRCVAmendments" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td>6</td>

                                                                                            <td> <div class="row">
                                                                                                    <div class="col-lg-6">  <asp:TextBox CssClass="form-control" ID="txtExpectedContractValue"
                                                                                                    runat="server"
                                                                                                    placeholder="Expected Contract Value"></asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server"
                                                                                                    FilterType="Custom, Numbers"
                                                                                                    TargetControlID="txtExpectedContractValue" ValidChars=".">
                                                                                                </cc1:FilteredTextBoxExtender></div>
                                                                                                    <div class="col-lg-6">   <asp:TextBox CssClass="form-control" ID="txtECVWord" runat="server"
                                                                                                    onkeyup="valid(this)" onblur="valid(this)"
                                                                                                    placeholder="Expected Contract Value Word Format"></asp:TextBox></div>
                                                                                                </div>
                                                                                              
                                                                                             
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtECVClause" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" placeholder="Clause"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtECVAmendments" runat="server"
                                                                                                    onkeyup="valid(this)"
                                                                                                    onblur="valid(this)" Placeholder="Subsequent Amendments"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>



























                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>




                                                                <div class="card">

                                                                    <div class="card-title"></div>
                                                                    <div class="card-body">

                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <asp:GridView CssClass="table table-hover table-striped table-bordered
                                        table-advanced tablesorter mbn"
                                                                                    ID="GridView1" runat="server" AutoGenerateColumns="false">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="S.No">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")
                                        %>'></asp:Label>
                                                                                                <asp:HiddenField ID="hdnProjectParticularsTransID"
                                                                                                    runat="server" Value='<%#Bind("TransID") %>' />
                                                                                            </ItemTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Particulars">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars")
                                        %>'>
                                                                                                </asp:Label>
                                                                                            </ItemTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision"
                                                                                                    runat="server" TextMode="MultiLine"
                                                                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top"
                                                                                                BorderColor="#D9EAED" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Clause">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtClause"
                                                                                                    runat="server" onkeyup="valid(this)"
                                                                                                    onblur="valid(this)"></asp:TextBox>
                                                                                            </ItemTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments"
                                                                                                    runat="server" onkeyup="valid(this)"
                                                                                                    onblur="valid(this)">
                                                                                                </asp:TextBox>
                                                                                            </ItemTemplate>

                                                                                        </asp:TemplateField>
                                                                                    </Columns>

                                                                                </asp:GridView>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>








                                                            </div>

                                                        </div>





                                                    </div>

                                                    <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                                                        <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">


                                                            <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-Project"
                                                                type="button" role="tab">
                                                                Project Particulars
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Client"
                                                                type="button" role="tab">
                                                                Client Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-PMC"
                                                                type="button" role="tab">
                                                                PMC/Project Manager Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-Architect"
                                                                type="button" role="tab">
                                                                Architect Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Structural"
                                                                type="button" role="tab">
                                                                Structural Consultant Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill"
                                                                data-bs-target="#v-pills-Mechanical"
                                                                type="button" role="tab">
                                                                Mechanical Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Electrical"
                                                                type="button" role="tab">
                                                                Electrical Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Plumbing"
                                                                type="button" role="tab">
                                                                Plumbing Consultant Detail
                                                            </button>
                                                            <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Others"
                                                                type="button" role="tab">
                                                                Others
                                                            </button>
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Availibility">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Availibility"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Availibility Of Documents (Y/N)
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Availibility" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Availibility">
                                            <div class="accordion-body">
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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>

                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Insurance">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Insurance"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Insurance/Licenses (Y/N) &amp; Date of Validity
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Insurance" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Insurance">
                                            <div class="accordion-body">

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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Facilities">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Facilities"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Facilities Provided By Clients (Y/N) and whether chargeable from Co. or not
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Facilities" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Facilities">
                                            <div class="accordion-body">
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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-OtherDeposit">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-OtherDeposit"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Other Deposit / Bonds / Guarantees
                                            </button>
                                        </h2>
                                        <div id="v-mpills-OtherDeposit" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-OtherDeposit">
                                            <div class="accordion-body">
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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Mobilization">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Mobilization"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Mobilization Advance
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Mobilization" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Mobilization">
                                            <div class="accordion-body">
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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Billing">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Billing"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Billing
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Billing" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Billing">
                                            <div class="accordion-body">
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

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Particulars">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Details / Contract Provision">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                            onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Clause">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Subsequent Amendments">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                            onblur="valid(this)">
                                                                        </asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsv-mpills-Payment">
                                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#v-mpills-Payment"
                                                type="button" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                                Payment Terms
                                            </button>
                                        </h2>
                                        <div id="v-mpills-Payment" class="accordion-collapse collapse show" aria-labelledby="panelsv-mpills-Payment">
                                            <div class="accordion-body">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView8" runat="server" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnProjectParticularsTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Particulars">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblParticulars" runat="server" Text='<%#Bind("Particulars") %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details / Contract Provision">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtContractProvision" runat="server" TextMode="MultiLine"
                                                                    onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clause">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtClause" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Subsequent Amendments">
                                                            <ItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtAmendments" runat="server" onkeyup="valid(this)"
                                                                    onblur="valid(this)">
                                                                </asp:TextBox>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                    </Columns>

                                                </asp:GridView>
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

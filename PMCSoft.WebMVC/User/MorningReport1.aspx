<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.MorningReport"
    CodeBehind="MorningReport1.aspx.cs" %>


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
            <!--BEGIN PAGE WRAPPER-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">MORNING REPORT</div>
                </div>
                <ol class="breadcrumb page-breadcrumb">
                </ol>
                <div class="clearfix"></div>
            </div>


            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->


            <div class="page-content">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project:
                            
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Date:
                                 
                                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                        </div>

                        <asp:Panel ID="Panel1" runat="server" Visible="false">

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        WP Date:
                                         
                                                <asp:Label ID="lblWorkProgrammeDate" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnWPDate" runat="server" />
                                        <asp:HiddenField ID="hdnWPID" runat="server" />
                                    </div>

                                </div>


                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        No.:
                                          
                                                    <asp:Label ID="lblNumber" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        ENG. In Charge:
                                                 
                                                        <asp:Label ID="lblEngInCharge" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Block:
                                         
                                                <asp:Label ID="lblBlock" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="table-responsive">
                                        <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                <HeaderTemplate>
                                                    <headertemplate>
                                                        <thead>
                                                            <tr>
                                                                <th rowspan="2">
                                                                S.No
                                                                </div>
                                                                   <th rowspan="2">Item Of Work
                                                                   </th>
                                                                <th rowspan="2">Area
                                                                </th>
                                                                <th colspan="4">Work Programme
                                                                </th>
                                                                <th rowspan="2">Actual Labour
                                                                </th>
                                                            </tr>
                                                            <tr class="row">
                                                                <th>SK
                                                                </th>
                                                                <th>SEMI
                                                                </th>
                                                                <th>UNSK
                                                                </th>
                                                                <th>O.T
                                                                </th>
                                                                <th>Total
                                                                </th>
                                                                <th>SK
                                                                </th>
                                                                <th>SEMI
                                                                </th>
                                                                <th>UNSK
                                                                </th>
                                                                <th>O.T
                                                                </th>
                                                                <th>Total
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </headertemplate>
                                                    <itemtemplate>
                                                        <tr>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="lblSNo" runat="server"
                                                                    Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnTransID"
                                                                    runat="server" Value='<%#Bind("TransID") %>' />
                                                                <asp:HiddenField ID="hdnItemID"
                                                                    runat="server" Value='<%#Bind("ItemID") %>' />
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="lblItemOfWork"
                                                                    runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:Label ID="lblArea" runat="server"
                                                                    Text='<%#Bind("Area") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                <asp:Label ID="lblSK" runat="server"
                                                                    Width="50px" Text='<%#Bind("LabourSK") %>'>
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                <asp:Label ID="lblSEMI" runat="server"
                                                                    Width="50px" Text='<%#Bind("LabourSEMI") %>'>
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                <asp:Label ID="lblUNSK" runat="server"
                                                                    Width="50px" Text='<%#Bind("LabourUNSK") %>'>
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                <asp:Label ID="lblOT" runat="server"
                                                                    Width="50px" Text='<%#Bind("LabourOT") %>'>
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                <asp:Label ID="lblWPTotal" runat="server"
                                                                    Width="50px" Text="">
                                                                </asp:Label>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control"
                                                                    ID="txtSK" runat="server" Text='<%#Bind("LabourSK") %>'>
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                    FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control"
                                                                    ID="txtSEMI" runat="server" Text='<%#Bind("LabourSEMI") %>'>
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                    FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control"
                                                                    ID="txtUNSK" runat="server" Text='<%#Bind("LabourUNSK") %>'>
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                    FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox CssClass="form-control"
                                                                    ID="txtOT" runat="server" Text='<%#Bind("LabourOT") %>'>
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                    FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <td class="col-lg-4">
                                                                <asp:Label ID="lblMRTotal" runat="server"
                                                                    Width="50px" Text="">
                                                                </asp:Label>
                                                            </td>
                                                        </tr>
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td>Total:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumSK"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumSEMI"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumUNSK"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumOT"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblWPGTotal"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMRSumSK"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMRSumSEMI"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMRSumUNSK"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMRSumOT"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMRGTotal"
                                                                        runat="server"
                                                                        Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                </td>
                                                                   <td></td>

                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Button CssClass="btn  btn-primary btn-square"
                                                                        ID="btnCalculate"
                                                                        runat="server"
                                                                        Text="Calculate"
                                                                        BackColor="#33ccff"
                                                                        BorderColor="Navy"
                                                                        OnClick="btnCalculate_Click" />
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                    </footertemplate>
                                                    </asp:Repeater>


                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Supervisor:
                            
                                        <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Foreman:
                                 
                                            <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnForeman" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Engineer:
                                  
                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnEngineer" runat="server" />
                                    </div>
                                </div>
                            </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:Button CssClass="btn btn-primary
            btn-square"
                                                                ID="btnSubmit" runat="server"
                                                                Text="Submit"
                                                                OnClick="btnSubmit_Click" />
                                                            <asp:Button CssClass="btn
btn-primary btn-square"
                                                                ID="btnCancel" runat="server"
                                                                Text="Cancel"
                                                                OnClick="btnCancel_Click" />
                                                        </div>
                                                    </div>
</asp:Panel>
                    </div>
                </div>
            </div>






















        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

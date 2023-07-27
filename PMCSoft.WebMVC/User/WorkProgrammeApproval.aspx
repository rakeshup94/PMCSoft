<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.WorkProgrammeApproval"
    CodeBehind="WorkProgrammeApproval.aspx.cs" %>


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
                    <div class="page-title">WORK PROGRAMME APPROVAL</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="card-header">
                        <div class="mb-3">
                            Date:
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                        </div>
                    </div>

                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
                        ShowHeader="false">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="card-header">
                                Project  
                                                    <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'></asp:Label>
                                <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%#Bind("ProjectID") %>' />

                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                            ID="GridView1" runat="server" AutoGenerateColumns="false"
                                            EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnWPID1" runat="server" Value='<%#Bind("WPID") %>' />
                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Work Programme Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWPDate" runat="server" Text='<%#Bind("WPDate") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdnWPDate1" runat="server" Value='<%#Bind("WPDate1") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Work Programme Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWPNumber" runat="server" Text='<%#Bind("WPNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Block">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBlock" runat="server" Text='<%#Bind("Block") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Forwarded By">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblForwardedBy" runat="server" Text='<%#Bind("ForwardedBy") %>'></asp:Label>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkView" runat="server" CommandName="WPView" Text="View" Font-Underline="true"></asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:DataList>


                    <div class="card-body">
                        <div style="display: none">
                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button3" runat="server" Text="Button" />
                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                        </div>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                            PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
                            Enabled="True">
                        </cc1:ModalPopupExtender>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                            PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False"
                            Enabled="True">
                        </cc1:ModalPopupExtender>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                            PopupControlID="Panel3" TargetControlID="Button3" EnableViewState="False"
                            Enabled="True">
                        </cc1:ModalPopupExtender>


                    </div>
                </div>
            </div>
            </div>




            <asp:Panel ID="Panel3" runat="server" Style="display: none;">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Work Programme Dis Approval</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        Remark
                                                                    <asp:HiddenField ID="hdnWPIDDisApproved" runat="server" />

                                        <asp:TextBox CssClass="form-control" ID="txtRemarkDisApproved" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnDisApproved" runat="server"
                                        Text="Submit" OnClick="btnDisApproved_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancelDisApproved" runat="server"
                                        Text="Cancel" OnClick="btnCancelDisApproved_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" data-bs-dismiss="modal" class="btn btn-lg btn-red">
                                <i class="fa fa-times"></i>Close</button>
                        </div>

                    </div>
                </div>


            </asp:Panel>



            <asp:Panel ID="Panel2" runat="server" Style="display: none;">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Work Programme Approval</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        Remark
                                                                    <asp:HiddenField ID="hdnWPIDApproved"
                                                                        runat="server" />

                                        <asp:TextBox CssClass="form-control" ID="txtRemark"
                                            runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnApproved"
                                        runat="server"
                                        Text="Submit" OnClick="btnApproved_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnApprovedCancel"
                                        runat="server"
                                        Text="Cancel" OnClick="btnApprovedCancel_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" data-bs-dismiss="modal" class="btn btn-lg btn-red">
                                <i class="fa fa-times"></i>Close</button>
                        </div>

                    </div>
                </div>

            </asp:Panel>


            <asp:Panel ID="Panel1" runat="server" Style="display: none; background-color: #F7F8E0;"
                ScrollBars="Horizontal">


                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Work Programme Detail</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">
                            <div class="card-body">
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
                                                                <th rowspan="2">Total
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th>SK
                                                                </th>
                                                                <th>SEMI
                                                                </th>
                                                                <th>UNSK
                                                                </th>
                                                                <th>O.T
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="row">
                                                            <td>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblSK" runat="server" Width="50px" Text='<%#Bind("LabourSK") %>'>
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblSEMI" runat="server" Width="50px" Text='<%#Bind("LabourSEMI") %>'>
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblUNSK" runat="server" Width="50px" Text='<%#Bind("LabourUNSK") %>'>
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblOT" runat="server" Width="50px" Text='<%#Bind("LabourOT") %>'>
                                                                </asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblTotal" runat="server" Width="50px" Text="">
                                                                </asp:Label>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                    </FooterTemplate>
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
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Approved"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Dis Approved"
                                            OnClick="btnCancel_Click" />
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnClose" runat="server" Text="Cancel"
                                            OnClick="btnClose_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" data-bs-dismiss="modal" class="btn btn-lg btn-red">
                            <i class="fa fa-times"></i>Close</button>
                    </div>

                </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

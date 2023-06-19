﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.ViewEditWorkProgramme"
    CodeBehind="ViewEditWorkProgramme1.aspx.cs" %>


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
                    <div class="page-title">VIEW / EDIT WORK PROGRAMME</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">

                    <div class="card-header">
                        Date:<asp:Label ID="lblDate" runat="server"></asp:Label>
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-12">
                                <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
                                    ShowHeader="false">
                                    <ItemTemplate>
                                        <div class="card-header">
                                            Project :  
                                                    <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        Font-Bold="true"></asp:Label>
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
                                                            <asp:TemplateField HeaderText="Forwarded To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblForwardedBy" runat="server" Text='<%#Bind("ForwardedTo") %>'></asp:Label>
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
                                </asp:DataList>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                    PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>
                                <div style="display: none">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                </div>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                    PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False"
                                    Enabled="True">
                                </cc1:ModalPopupExtender>

                            </div>
                        </div>
                    </div>
                </div>
            </div>








            <asp:Panel ID="Panel1" runat="server">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Department</h4>
                            <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                                class="close">
                                &times;
                            </button>

                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="card-header">
                                            Work Programme Detail
                                        </div>
                                        <div class="row" style="width: 790px;">
                                            <div class="row">
                                                <div class="col-lg-4" style="white-space: nowrap;">
                                                    WP Date:
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                    <asp:HiddenField ID="hdnProjID" runat="server" />
                                                </div>
                                                <div class="col-lg-4">
                                                </div>
                                                <div class="col-lg-4">
                                                </div>
                                                <div class="col-lg-4">
                                                </div>
                                                <div class="col-lg-4">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4" style="white-space: nowrap;">
                                                    No.:
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="lblNumber" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-lg-4" style="white-space: nowrap;">
                                                    ENG. In Charge:
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="lblEngInCharge" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                </div>
                                                <div class="col-lg-4">
                                                    Block:
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:Label ID="lblBlock" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4" colspan="6">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound"
                                                        OnItemCommand="Repeater1_ItemCommand">
                                                        <HeaderTemplate>
                                                            <div class="row">
                                                                <div class="row">
                                                                    <div class="col-lg-4" >
                                                                        S.No
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        Item Of Work
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        Area
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        Work Programme
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        Total
                                                                    </div>
                                                                    <div class="col-lg-4" >
                                                                        Delete
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SK
                                                                    </div>
                                                                    <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        SEMI
                                                                    </div>
                                                                    <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        UNSK
                                                                    </div>
                                                                    <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        O.T
                                                                    </div>

                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row">
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black;">
                                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black;">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtSK" runat="server" Text='<%#Bind("LabourSK") %>'></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtSEMI" runat="server" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtUNSK" runat="server" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtOT" runat="server" Text='<%#Bind("LabourOT") %>'></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblTotal" runat="server" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteWp" CommandArgument='<%#Bind("TransID") %>'>Delete</asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row">
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    Total:
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center;">
                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4" style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center;">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center;">
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="Add Item"
                                                                        OnClick="btnAdd_Click" />
                                                                </div>
                                                                <div class="col-lg-4" style="border: 1px solid black; background-color: #D8D8D8;
                                                                    text-align: center">
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate" runat="server"
                                                                        Text="Calculate" BackColor="#33ccff"
                                                                        BorderColor="Navy" OnClick="btnCalculate_Click" />
                                                                </div>
                                                            </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-4">
                                                    Supervisor:
                                                </div>
                                                <div class="col-lg-4" style="text-align: left;">
                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                </div>
                                                <div class="col-lg-4">
                                                    Foreman:
                                                </div>
                                                <div class="col-lg-4" style="text-align: left;">
                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                </div>
                                                <div class="col-lg-4">
                                                    Engineer:
                                                </div>
                                                <div class="col-lg-4" style="text-align: left;">
                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4" colspan="6">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Update"
                                                        OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                                        OnClick="btnCancel_Click" />
                                                </div>
                                            </div>
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

            <asp:Panel ID="Panel2" runat="server">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>

                        <div class="modal-body">

                            <div class="row">

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Item Of Work
                            
                                        <asp:DropDownList CssClass="form-select" ID="ddlitemworkaddmore" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        Area
                                  
                                        <asp:TextBox CssClass="form-control" ID="TxtAreaaddmore" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        SK
                                 
                                        <asp:TextBox CssClass="form-control" ID="txtskaddmore" runat="server"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtskaddmore"
                                            FilterType="Custom, Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        SEMI
                                  
                                        <asp:TextBox CssClass="form-control" ID="txtsemiaddmore" runat="server"> </asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtsemiaddmore"
                                            FilterType="Custom, Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        UNSK
                                 
                                        <asp:TextBox CssClass="form-control" ID="txtunskaddmore" runat="server"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="txtunskaddmore"
                                            FilterType="Custom, Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>


                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        OT
                                  

                                        <asp:TextBox CssClass="form-control" ID="txtotaddmore" runat="server"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="txtotaddmore"
                                            FilterType="Custom, Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnSaveADD" runat="server"
                                        Text="Save" OnClick="BtnSaveADD_Click" />
                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnCanceladd" runat="server"
                                        Text="Cancel" OnClick="BtnCanceladd_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>

                </div>


            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

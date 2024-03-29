﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.issuepdcrequest"
    CodeBehind="issuepdcrequest.aspx.cs" %>


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
            <div class="page-title">PDC</div>
        </div>
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
                            Project :
                   
                            <asp:DropDownList CssClass="form-select" ID="ddlP" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlP_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            Forwarded To :
                         
                                <asp:DropDownList CssClass="form-select" ID="ddlEmployee" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                            ID="grvProjectDetails" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                            GridLines="None" OnRowDataBound="grvProjectDetails_RowDataBound"
                            OnRowCommand="grvProjectDetails_RowCommand">
                            <Columns>
                                <%-- <asp:BoundField DataField="RowNumber" HeaderText="SNo" />--%>
                                <asp:TemplateField HeaderText="Vendor">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-select" ID="ddlBank" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlBank_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewBank" runat="server"
                                            Text="+" CausesValidation="false" CommandName="AddNewBank" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-select" ID="ddlBranch" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddNewBranch" runat="server"
                                            Text="+" CausesValidation="false"
                                            CommandName="AddNewBranch" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cheque No">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtChequeNo" runat="server" onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                            TargetControlID="txtAmount" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issue Date">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtIssueDate" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtIssueDate" runat="server"
                                            CssClass="cal_Theme1">
                                        </cc1:CalendarExtender>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="ButtonAdd" runat="server" Text="Add More"
                                            OnClick="ButtonAdd_Click" />
                                        <%--OnClick="ButtonAdd_Click" />--%>
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                        <div style="display: none">
                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                        </div>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                            PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                            Enabled="True">
                        </cc1:ModalPopupExtender>

                        <div style="display: none">
                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                        </div>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                            PopupControlID="PanelBranch" TargetControlID="Button2" EnableViewState="False"
                            Enabled="True">
                        </cc1:ModalPopupExtender>




                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnsubmit" runat="server" Text="Submit"
                            OnClick="btnsubmit_Click" />
                        <asp:Button CssClass="btn btn-default btn-square" ID="btncancle" runat="server" Text="Cancel"
                            OnClick="btncancle_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>





















    <asp:Panel ID="Panel2" runat="server">

        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Bank</h4>
                    <button type="button" data-bs-dismiss="modal" aria-hidden="true"
                        class="close">
                        &times;
                    </button>

                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                Bank Name
                  
                        <asp:TextBox CssClass="form-control"
                            ID="txtbankname" runat="server" onkeyup="valid(this)"
                            onblur="valid(this)"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Button CssClass="btn btn-primary
    btn-square"
                                ID="btnAddNewBankSave" runat="server"
                                Text="Submit"
                                OnClick="btnAddNewBankSave_Click" />

                        </div>
                    </div>
                </div>
                <div class="modal-footer">

                    <asp:Button CssClass="btn btn-primary
    btn-square"
                        ID="BtnAddNewBankCancel" runat="server"
                        Text="Cancle"
                        CausesValidation="False"
                        OnClick="BtnAddNewBankCancel_Click" />



                </div>

            </div>
        </div>

    </asp:Panel>




    <asp:Panel ID="PanelBranch" runat="server">

        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Branch</h4>


                </div>

                <div class="modal-body">


                    <div class="row">
                        <div class="col-lg-4">
                            <div class="mb-3">
                                Bank
                     
                            <asp:DropDownList CssClass="form-select"
                                ID="ddlbank" runat="server">
                            </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Branch
                          
                                <asp:TextBox CssClass="form-control"
                                    ID="txtBranch" runat="server" onkeyup="valid(this)"
                                    onblur="valid(this)"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Address
                           
                                    <asp:TextBox CssClass="form-control"
                                        ID="txtadress" runat="server" TextMode="MultiLine"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Country
                                
                                        <asp:DropDownList CssClass="form-select" ID="ddlcountry" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                        </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                Satate
                                      
                                            <asp:DropDownList CssClass="form-select" ID="ddlsatete" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlsatete_SelectedIndexChanged">
                                            </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                City
                                        
                                                <asp:DropDownList CssClass="form-select" ID="ddlCity" runat="server">
                                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                ZipCode
                                           
                                                    <asp:TextBox CssClass="form-control" ID="txtZipcode" runat="server" MaxLength="6"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom,
    Numbers"
                                    TargetControlID="txtZipcode">
                                </cc1:FilteredTextBoxExtender>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Button
                                CssClass="btn btn-primary btn-square" ID="btnbranchsave" runat="server"
                                OnClick="btnbranchsave_Click"
                                Text="Save" />

                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <asp:Button
                        CssClass="btn btn-primary btn-square" ID="btnbranchcancle" runat="server"
                        CausesValidation="false"
                        OnClick="btnbranchcancle_Click"
                        Text="Cancel" />
                </div>

            </div>
        </div>










    </asp:Panel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.MaterialReceive"
    Title="Material Receive" CodeBehind="MaterialReceive.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Material Receive</div>
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
                                    Project
                               
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Vender
                              
                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlVendor_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Vendor"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Address
                                
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server"
                                        TextMode="MultiLine"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)" ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Gate Entry No
                                
                                    <asp:TextBox CssClass="form-control" ID="TxtGateEntryNo" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    PO.No
                        
                                <asp:TextBox CssClass="form-control" ID="TxtPoNo" runat="server"
                                    onkeyup="valid(this)"
                                    onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    PO.Date
                            
                                    <asp:TextBox CssClass="form-control" ID="TxtPOdate" runat="server"
                                        onkeyup="valid(this)"
                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                                        TargetControlID="TxtPOdate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Received.Date
                                
                                        <asp:TextBox CssClass="form-control" ID="TxtReceivedDate" runat="server"
                                            onkeyup="valid(this)"
                                            onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                        TargetControlID="TxtReceivedDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Received By
                                   
                                            <asp:DropDownList CssClass="form-select" ID="DdlReceivedBy"
                                                runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="DdlReceivedBy_SelectedIndexChanged">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Bill/Challan No.
                                     
                                                <asp:TextBox CssClass="form-control" ID="TxtBillChallanNo" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Bill/Challan Date.
                                          
                                                    <asp:TextBox CssClass="form-control" ID="TxtBillChallanDate"
                                                        runat="server" onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server"
                                        TargetControlID="TxtBillChallanDate"
                                        CssClass="cal_Theme1" PopupPosition="BottomRight" Enabled="true">
                                    </cc1:CalendarExtender>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView CssClass="table table-hover table-striped table-bordered
                table-advanced tablesorter mbn"
                                    ID="GVMaterialReceive" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true"
                                    OnRowDataBound="GVMaterialReceive_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")
                %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Group">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlItemCode"
                                                    runat="server" OnSelectedIndexChanged="ddlItemCode_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlItemName"
                                                    runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-select" ID="ddlUnit"
                                                    runat="server" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtQuantity"
                                                    runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                                    runat="server" TargetControlID="txtQuantity"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rate">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtRate"
                                                    runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                                                    runat="server" TargetControlID="txtRate"
                                                    FilterType="Custom, Numbers" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtRemarks"
                                                    TextMode="MultiLine" runat="server"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button CssClass="btn btn-primary btn-square"
                                                    ID="btnAddMore" runat="server"
                                                    OnClick="btnAddMore_Click" Text="Add More" />
                                            </FooterTemplate>


                                        </asp:TemplateField>
                                    </Columns>


                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit"
                                    runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-default btn-square" ID="btnCancel"
                                    runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddDebitList"
    CodeBehind="AddDebitList.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">Creditor List</div>
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
                                        Add Creditor List
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-1" type="button">
                                        View Creditor List
                                    </button>

                                </div>
                            </div>
                            <div class="col-lg-9 pe-sm-0">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade show active" id="tab-0" role="tabpanel" aria-labelledby="tab-0-tab">


                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Project Name
                                              
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Forward To
                                                      
                                                                <asp:DropDownList CssClass="form-select" ID="ddlEmployee" runat="server" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                </div>
                                            </div>



                                        </div>

                                        <asp:Panel ID="Panel1" runat="server" Visible="False">

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                        ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                        OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting"
                                                        OnRowCommand="GridView1_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                </ItemTemplate>

                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Party / Vendor Name">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlVendor" runat="server">
                                                                    </asp:DropDownList>
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddVendor" runat="server"
                                                                        Text="+" CausesValidation="false" CommandName="AddVendor" />
                                                                </ItemTemplate>

                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount">
                                                                <ItemTemplate>
                                                                    <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtAmount" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Type">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlPaymentType" runat="server">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                                <ItemStyle VerticalAlign="Top" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <FooterTemplate>
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAddMore" runat="server"
                                                                        Text="Add More" OnClick="btnAddMore_Click" />
                                                                </FooterTemplate>
                                                                <ItemTemplate>
                                                                    <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" TextMode="MultiLine"
                                                                        onkeyup="valid(this)"
                                                                        onblur="valid(this)">
                                                                    </asp:TextBox>
                                                                </ItemTemplate>
                                                                <FooterStyle HorizontalAlign="Right" />

                                                            </asp:TemplateField>
                                                            <asp:CommandField ShowDeleteButton="True" />
                                                        </Columns>


                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit"
                                                        OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel"
                                                        OnClick="btnCancel_Click" />
                                                </div>
                                            </div>

                                        </asp:Panel>
                                        <div style="display: none">
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                        </div>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                            PopupControlID="Panel2" TargetControlID="Button1" EnableViewState="False"
                                            Enabled="True">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="Panel2" runat="server">

                                            <div class="card-body">
                                                <div class="card-header">
                                                    Party / Vendor Detail
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            Name
                                                                                          
                                                                                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" onkeyup="valid(this)"
                                                                                                        onblur="valid(this)"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            Address
                                                                                                 
                                                                                                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"
                                                                                                            onkeyup="valid(this)"
                                                                                                            onblur="valid(this)"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            Country
                                                                                                     
                                                                                                            <asp:DropDownList CssClass="form-select" ID="ddlCountry" runat="server" AutoPostBack="True"
                                                                                                                OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            State
                                                                                                         
                                                                                                                <asp:DropDownList CssClass="form-select" ID="ddlState" runat="server" AutoPostBack="True"
                                                                                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
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
                                                            Mobile No.
                                                                                                                 
                                                                                                                        <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" MaxLength="10"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            Email
                                                                                                                      
                                                                                                                            <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            PAN No
                                                                                                                       
                                                                                                                                <asp:TextBox CssClass="form-control" ID="TxtPanNo" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            TIN
                                                                                                                            
                                                                                                                                    <asp:TextBox CssClass="form-control" ID="TxtTinNo" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            ECC No
                                                                                                                               
                                                                                                                                        <asp:TextBox CssClass="form-control" ID="TxtEccNo" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            VAT
                                                                                                                                   
                                                                                                                                            <asp:TextBox CssClass="form-control" ID="TxtVat" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="mb-3">
                                                            Party / Vendor Type
                                                                                                                                       
                                                                                                                                                <asp:DropDownList CssClass="form-select" ID="ddlVendorType" runat="server" Width="185px">
                                                                                                                                                </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>




















                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnVSubmit" runat="server"
                                                            Text="Submit" OnClick="btnVSubmit_Click" />
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="btnVCancel" runat="server"
                                                            Text="Cancel" OnClick="btnVCancel_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                        </asp:Panel>



                                    </div>
                                    <div class="tab-pane fade" id="tab-1" role="tabpanel" aria-labelledby="tab-1-tab">


                                        <div class="row">

                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Project Name
                                                       
                                                            <asp:DropDownList CssClass="form-select" ID="ddlProject1" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlProject1_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Approval Type
                                                         
                                                                <asp:DropDownList CssClass="form-select" ID="ddlType" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                                    <asp:ListItem Selected="True" Text="Select Type" Value="-1"></asp:ListItem>
                                                                    <asp:ListItem Text="Approved" Value="A"></asp:ListItem>
                                                                    <asp:ListItem Text="Suggest Amount" Value="S"></asp:ListItem>
                                                                    <asp:ListItem Text="Disapproved" Value="D"></asp:ListItem>
                                                                    <asp:ListItem Text="Pending" Value="E"></asp:ListItem>
                                                                </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="mb-3">
                                                    Date
                                                            
                                                                    <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                                        CssClass="cal_Theme1">
                                                    </cc1:CalendarExtender>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnView" runat="server" Text="View"
                                                    OnClick="btnView_Click" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                    ID="GridView2" runat="server" AutoGenerateColumns="false"
                                                    EmptyDataText="No Record Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnListID" runat="server" Value='<%#Bind("ListID") %>' />
                                                                <asp:HiddenField ID="hdnApproveListID" runat="server" Value='<%#Bind("ApproveListID") %>' />
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Party / Vendor">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnVendorID" runat="server" Value='<%#Bind("VendorID") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payment Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaymentType" runat="server" Text='<%#Bind("PaymentType") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("ApprovalRemarks") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Suggested Amt.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSuggestAmount" runat="server" Text='<%#Bind("SuggestAmount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bal. Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBalanceAmount" runat="server" Text='<%#Bind("BalanceAmount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>

                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>
                            <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                    <button class="nav-link active text-start" data-bs-toggle="pill" data-bs-target="#tab-0"
                                        type="button">
                                        Add Creditor List
                                    </button>
                                    <button class="nav-link text-start" data-bs-toggle="pill"
                                        data-bs-target="#tab-1" type="button">
                                        View Creditor List
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

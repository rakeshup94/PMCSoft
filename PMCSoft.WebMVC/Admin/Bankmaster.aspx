<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Bankmaster"
    CodeBehind="Bankmaster.aspx.cs" %>


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
                    <div class="page-title">Bank</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->
            <!--BEGIN CONTENT-->
            <div class="page-content">
                <div class="card">
                    <div class="row">
                        <div class="col-12 d-block d-sm-none">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">


                                <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-Bank"
                                    type="button" role="tab">
                                    Bank
                                </button>
                                <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Branch"
                                    type="button" role="tab">
                                    Branch
                                </button>
                            </div>
                        </div>

                        <div class="col-lg-9 pe-sm-0">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-Bank" role="tabpanel">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bank Name
                                                     
                                                            <asp:TextBox CssClass="form-control" ID="txtbankname" runat="server" onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">

                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnSave" runat="server" OnClick="btnSave_Click"
                                                Text="Submit" />
                                            <asp:Button CssClass="btn btn-default btn-square" ID="btnCancle" runat="server" OnClick="btnCancle_Click"
                                                Text="Cancle"
                                                CausesValidation="False" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                                                OnRowUpdating="GridView1_RowUpdating">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            <asp:HiddenField ID="hdnBankID" runat="server" Value='<%#Bind("BankID") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bank Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox CssClass="form-control" ID="txtBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:TextBox>
                                                        </EditItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" CausesValidation="False"></asp:CommandField>
                                                </Columns>
                                                <HeaderStyle CssClass="reallynow" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-Branch" role="tabpanel">





                                    <div class="row">





                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Bank
                                                      
                                                                <asp:DropDownList CssClass="form-select" ID="ddlbank" runat="server">
                                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Branch
                                                      
                                                                    <asp:TextBox CssClass="form-control" ID="txtBranch" runat="server" onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-4">
                                            <div class="mb-3">
                                                Address
                                                                  
                                                                        <asp:TextBox CssClass="form-control" ID="txtadress" runat="server" TextMode="MultiLine"
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
                                                State
                                                                        
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
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                    TargetControlID="txtZipcode">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnbranchsave" runat="server"
                                                OnClick="btnbranchsave_Click" Text="Save" />
                                            <asp:Button CssClass="btn btn-default btn-square" ID="btnbranchcancle" runat="server"
                                                CausesValidation="false" OnClick="btnbranchcancle_Click"
                                                Text="Cancle" />
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"
                                                ID="GridView2" runat="server" AutoGenerateColumns="False" Width="880px"
                                                OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing"
                                                OnRowUpdating="GridView2_RowUpdating">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            <asp:HiddenField ID="hdnBranchID" runat="server" Value='<%#Bind("BranchID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="40px" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bank Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Branch Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox CssClass="form-control" ID="txtBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Country">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCountry" runat="server" Text='<%#Bind("CnName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="State">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblState" runat="server" Text='<%#Bind("StateName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="City">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCity" runat="server" Text='<%#Bind("CityName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" CausesValidation="False">
                                                        <HeaderStyle Width="30px" />
                                                    </asp:CommandField>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>


















                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 ps-sm-0 d-none d-sm-block">
                            <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                <button class="nav-link text-start active" data-bs-toggle="pill" data-bs-target="#v-pills-Bank"
                                    type="button" role="tab">
                                    Bank
                                </button>
                                <button class="nav-link text-start" data-bs-toggle="pill" data-bs-target="#v-pills-Branch"
                                    type="button" role="tab">
                                    Branch
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

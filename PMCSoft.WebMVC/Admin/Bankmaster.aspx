<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Admin.Bankmaster" Codebehind="Bankmaster.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"><div class="page-header pull-left"><div class="page-title">Add BOQ</div></div><div class="clearfix"></div></div><!--END TITLE & BREADCRUMB PAGE--><!--BEGIN CONTENT--><div class="page-content">
                <div class="card"    >
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                        <cc1:TabPanel ID="TabPanel1" runat="server" TabIndex="0">
                            <HeaderTemplate>
                                Bank
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="card-body">
                                    <h3 class="reallynow">
                                        Bank Detail</h3>
                                    <div class="row"  style="width: 910px;">
                                        <div class="row" >
                                            <div class="col-lg-4"   >
                                                <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="False" Width="540px"
                                                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                                                    OnRowUpdating="GridView1_RowUpdating">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnBankID" runat="server" Value='<%#Bind("BankID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bank Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox CssClass="form-control" ID="txtBankName" runat="server" Text='<%#Bind("BankName") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemStyle Width="410px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:CommandField ShowEditButton="True" CausesValidation="False">
                                                            <HeaderStyle Width="50px" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="reallynow" />
                                                </asp:GridView>
                                            </div>
                                            <div class="col-lg-4"   >
                                                <div class="card-body">
                                                    <h3 class="reallynow">
                                                        Add Bank</h3>
                                                    <div class="row"  style="width: 380;">
                                                        <div class="row" >
                                                            <div class="col-lg-4"    >
                                                                Bank Name
                                                            </div>
                                                            <div class="col-lg-4" >
                                                                <asp:TextBox CssClass="form-control" ID="txtbankname" runat="server"   onkeyup="valid(this)"
                                                                    onblur="valid(this)"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row" >
                                                            <div class="col-lg-4"    >
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" />
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancle" runat="server" OnClick="btnCancle_Click" Text="Cancle"
                                                                    CausesValidation="False" />
                                                            </div>
                                                        </div>
                                                      </div>
                                                </div>
                                            </div>
                                        </div>
                                      </div>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="1">
                            <HeaderTemplate>
                                Branch</HeaderTemplate>
                            <ContentTemplate>
                                <div class="row"  style="width: 900px;">
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            <div class="card-body">
                                                <h3 class="reallynow">
                                                    Add Branch</h3>
                                                <div class="row"  style="width: 330px;">
                                                    <div class="row" >
                                                        <div class="col-lg-4"    >
                                                            Bank
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlbank" runat="server"  >
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Branch
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:TextBox CssClass="form-control" ID="txtBranch" runat="server" onkeyup="valid(this)" onblur="valid(this)"
                                                                 ></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Address
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:TextBox CssClass="form-control" ID="txtadress" runat="server" TextMode="MultiLine"   onkeyup="valid(this)"
                                                                onblur="valid(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Country
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlcountry" runat="server"   AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            Satate
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlsatete" runat="server"   AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlsatete_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            City
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:DropDownList CssClass="form-select" ID="ddlCity" runat="server"  >
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4" >
                                                            ZipCode
                                                        </div>
                                                        <div class="col-lg-4" >
                                                            <asp:TextBox CssClass="form-control" ID="txtZipcode" runat="server" MaxLength="6"  ></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom, Numbers"
                                                                TargetControlID="txtZipcode">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </div>
                                                    </div>
                                                    <div class="row" >
                                                        <div class="col-lg-4"  colspan="2">
                                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnbranchsave" runat="server" OnClick="btnbranchsave_Click" Text="Save"
                                                                Width="70px" />
                                                            <asp:Button CssClass="btn btn-primary btn-square" ID="btnbranchcancle" runat="server" CausesValidation="false" OnClick="btnbranchcancle_Click"
                                                                Text="Cancle" Width="70px" />
                                                        </div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-4"   >
                                            <div class="card-body">
                                                <h3 class="reallynow">
                                                    Branch Detail</h3>
                                                <div class="row"  style="width: 900px;">
                                                    <div class="row" >
                                                        <div class="col-lg-4"   >
                                                            <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView2" runat="server" AutoGenerateColumns="False" Width="880px"
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
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBranchName" runat="server" Text='<%#Bind("BranchName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox CssClass="form-control" ID="txtBranchAddress" runat="server" Text='<%#Bind("Address") %>'></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemStyle   HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Country">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCountry" runat="server" Text='<%#Bind("CnName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="State">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblState" runat="server" Text='<%#Bind("StateName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="City">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCity" runat="server" Text='<%#Bind("CityName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle   />
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField ShowEditButton="True" CausesValidation="False">
                                                                        <HeaderStyle Width="30px" />
                                                                    </asp:CommandField>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#D9EAED" ForeColor="#202020" />
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                  </div>
                                        </div>
                                        </div>
                                    </div>
                                  </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

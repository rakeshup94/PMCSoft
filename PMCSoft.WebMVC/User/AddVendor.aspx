<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddVendor" Codebehind="AddVendor.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -30px;">
                <div class="card"  style="width: 1000px;">
                    <div class="card-body">
                        <div class="card-header">
                            Party / Vendor Detail</div>
                        <div class="row"  style="width: 990px">
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 650px; vertical-align: top;">
                                      Project Name  <asp:DropDownList CssClass="form-select" ID="ddlP" runat="server" AutoPostBack="true"
                                          OnSelectedIndexChanged="ddlP_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" Width="640px" AutoGenerateColumns="false"
                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("VendorID") %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Party / Vendor Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendorName" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%#Bind("MobileNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVendorType" runat="server" Text='<%#Bind("VendorType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEditVendor" runat="server" Text="Edit" CommandName="EditVendor">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                       
                                    </asp:GridView>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server"  >
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div class="card-body">
                                                        <div class="card-header">
                                                            Party / Vendor Detail</div>
                                                        <div class="row"  style="width: 330px;">
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Name
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtEName" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Address
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtEAddress" runat="server" TextMode="MultiLine"   onkeyup="valid(this)"
                                                                        onblur="valid(this)"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Country
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlECountry" runat="server" AutoPostBack="True"  
                                                                        OnSelectedIndexChanged="ddlECountry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    State
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlEState" runat="server" AutoPostBack="True"  
                                                                        OnSelectedIndexChanged="ddlEState_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    City
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlECity" runat="server"  >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Mobile No.
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:Label ID="txtEMobileNo" runat="server" MaxLength="10"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Email
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:TextBox CssClass="form-control" ID="txtEEmail" runat="server"  ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Party / Vendor Type
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:DropDownList CssClass="form-select" ID="ddlEVendorType" runat="server"  >
                                                                        <%--<asp:ListItem Selected="True" Text="Select Vendor Type" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="PRW" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Shuttering" Value="3"></asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    Project Name
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                      <asp:LinkButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" ><i class="fa fa-check-square"></i></asp:LinkButton>
                                                                    <asp:Panel ID="Panel2" runat="server"     >
                                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                                            ShowHeader="false">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSW" runat="server" />
                                                                                    </ItemTemplate>
                                                                                 
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'   ></asp:Label>
                                                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                    <cc1:PopupControlExtender ID="PopupControlExtender2" runat="server" TargetControlID="ImageButton2"
                                                                        PopupControlID="Panel2" Position="Bottom" OffsetY="-16">
                                                                    </cc1:PopupControlExtender>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"    >
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnESubmit" runat="server" Text="Submit" OnClick="btnESubmit_Click" />
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnECancel" runat="server" Text="Cancel" OnClick="btnECancel_Click" />
                                                                </div>
                                                            </div>
                                                          </div>
                                                    </div>
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                                <div class="col-lg-4"  style="width: 330px;">
                                    <div class="card-body">
                                        <div class="card-header">
                                            Add Party / Vendor</div>
                                        <div class="row"   >
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Name
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Address
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"   onkeyup="valid(this)"
                                                        onblur="valid(this)"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Country
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlCountry" runat="server" AutoPostBack="True"  
                                                        OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    State
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlState" runat="server" AutoPostBack="True"  
                                                        OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
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
                                                    Mobile No.
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server"   MaxLength="10"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Email
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    PAN No
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="TxtPanNo" runat="server"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    TIN
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="TxtTinNo" runat="server"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    ECC No
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="TxtEccNo" runat="server"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    VAT
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="TxtVat" runat="server"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Party / Vendor Type
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:DropDownList CssClass="form-select" ID="ddlVendorType" runat="server" Width="185px">
                                                        <%--<asp:ListItem Selected="True" Text="Select Vendor Type" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="Mechanical" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="PRW" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Shuttering" Value="3"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="+" OnClick="btnAdd_Click" />
                                                    <div style="display: none">
                                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                                    </div>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  
                                                        PopupControlID="Panel3" TargetControlID="Button2" EnableViewState="False"  
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Panel ID="Panel3" runat="server"  >
                                                        <div class="row"   >
                                                            <div class="row" >
                                                                <div class="col-lg-4" >
                                                                    <div id="Div1">
                                                                        <div class="card-header">
                                                                            Party / Vendor Type</div>
                                                                        <div class="row"  style="width: 330px;">
                                                                            <div class="row" >
                                                                                <div class="col-lg-4"    >
                                                                                    Type
                                                                                </div>
                                                                                <div class="col-lg-4" >
                                                                                    <asp:TextBox CssClass="form-control" ID="txtVendorType" runat="server"   onkeyup="valid(this)"
                                                                                        onblur="valid(this)"></asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row" >
                                                                                <div class="col-lg-4"    >
                                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" />
                                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Cancel" />
                                                                                </div>
                                                                            </div>
                                                                          </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                          </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    Project Name
                                                </div>
                                                <div class="col-lg-4" >
                                                      <asp:LinkButton ID="ImageButton1" runat="server" OnClick="lnkBtnProject_Click" ><i class="fa fa-check-square"></i></asp:LinkButton>
                                                    <asp:Panel ID="pnlCustomers" runat="server"     >
                                                        <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GVProject" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                            ShowHeader="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSW" runat="server" />
                                                                    </ItemTemplate>
                                                                 
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'   ></asp:Label>
                                                                        <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Eval("ProjectID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                    <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="lnkBtnProject"
                                                        PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-16">
                                                    </cc1:PopupControlExtender>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
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

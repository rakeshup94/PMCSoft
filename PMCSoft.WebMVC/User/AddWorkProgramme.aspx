<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddWorkProgramme" Codebehind="AddWorkProgramme.aspx.cs" %>

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
                    <div class="card-body">
                        <div class="card-header">
                            WORK PROGRAMME</div>
                        <div class="row"  style="width: 930px;">
                      
                            <div class="row" >
                                <div class="col-lg-4"  colspan="4">
                                    <div class="row"  style="width: 910px;">
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                No.
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="lblNumber" runat="server"  ></asp:Label>
                                            </div>
                                            <div class="col-lg-4" >
                                            </div>
                                            <div class="col-lg-4" >
                                            </div>
                                            <div class="col-lg-4"  style="width: 60px;">
                                                Date
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Label ID="lblDate" runat="server"   Font-Size="12px"></asp:Label>
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Project
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4"  style="white-space: nowrap;">
                                             Employee
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlEngInCharge" runat="server" Width="215px">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4" >
                                                Block
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:TextBox CssClass="form-control" ID="txtBlock" runat="server" Text="" Width="240px" onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Forward To
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlForwardTo" runat="server"  >
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4"  style="white-space: nowrap;">
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                        </div>
                                      </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="4">
                                    <div class="row"  style="width: 910px;">
                                        <div class="row" >
                                            <div class="col-lg-4"  colspan="6">
                                                <asp:Repeater ID="Repeater1" runat="server" 
                                                    OnItemDataBound="Repeater1_ItemDataBound" onitemcommand="Repeater1_ItemCommand">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="width: 895px; border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="2" style="width: 50px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    S.No
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Item Of Work
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Area
                                                                </div>
                                                                <div class="col-lg-4"  colspan="4" style="text-align: center; width: 400px; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Labour
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Total
                                                                </div>
                                                                 <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8;">
                                                                    Delete
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    SK
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    SEMI
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    UNSK
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    O.T
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black;">
                                                                <asp:DropDownList CssClass="form-select" ID="ddlItemOfWork" runat="server"  >
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black;">
                                                                <asp:TextBox CssClass="form-control" ID="txtArea" runat="server"   onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox CssClass="form-control" ID="txtSK" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox CssClass="form-control" ID="txtSEMI" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox CssClass="form-control" ID="txtUNSK" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                <asp:TextBox CssClass="form-control" ID="txtOT" runat="server" Width="80px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                    FilterType="Custom, Numbers">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; text-align: left;">
                                                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4" >
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteWp" CommandArgument='<%#Bind("SNo") %>'>Delete</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;
                                                                font-weight: bold;">
                                                                Total:
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTSK" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTSEMI" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTUNSK" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblTOT" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" >
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                                                            </div>
                                                            <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnCalculate" runat="server" Text="Calculate" BackColor="#33ccff"
                                                                    BorderColor="Navy" OnClick="btnCalculate_Click" />
                                                            </div>
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4" >
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-4"  style="text-align: center;">
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                Supervisor
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlSupervisor" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4" >
                                                Foreman
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlForeman" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4" >
                                                Engineer
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:DropDownList CssClass="form-select" ID="ddlEngineer" runat="server" Width="225px">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row" >
                                            <div class="col-lg-4"  colspan="6" style="text-align: center;">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

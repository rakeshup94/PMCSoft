<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.AddWorkProgramme"
    CodeBehind="AddWorkProgramme.aspx.cs" %>


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
                    <div class="page-title">WORK PROGRAMME</div>
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
                                    No.
                                           
                                                <asp:Label ID="lblNumber" runat="server"></asp:Label>
                                </div>

                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Date
                                      
                                                <asp:Label ID="lblDate" runat="server"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Project
                                    
                                                <asp:DropDownList CssClass="form-select" ID="ddlProject"
                                                    runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Employee
                                       
                                                <asp:DropDownList CssClass="form-select" ID="ddlEngInCharge"
                                                    runat="server" Width="215px">
                                                </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Block
                                         
                                                <asp:TextBox CssClass="form-control" ID="txtBlock" runat="server"
                                                    Text="" Width="240px"
                                                    onkeyup="valid(this)"
                                                    onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Forward To
                                           
                                                        <asp:DropDownList CssClass="form-select" ID="ddlForwardTo"
                                                            runat="server">
                                                        </asp:DropDownList>
                                </div>

                            </div>

                        </div>

                        <div class="row mtm">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered table-advanced tablesorter mbn">
                                        <asp:Repeater ID="Repeater1" runat="server"
                                            OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2">S.No</th>
                                                        <th rowspan="2">Item Of Work</th>
                                                        <th rowspan="2">Area</th>

                                                        <th colspan="4">Labour</th>
                                                        <th rowspan="2">Total
                                                        </th>
                                                        <th rowspan="2">Delete
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
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo")  %>'></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList CssClass="form-select"
                                                            ID="ddlItemOfWork" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtArea"
                                                            runat="server" onkeyup="valid(this)"
                                                            onblur="valid(this)"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtSK"
                                                            runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                                            runat="server" TargetControlID="txtSK"
                                                            FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtSEMI"
                                                            runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"
                                                            runat="server" TargetControlID="txtSEMI"
                                                            FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtUNSK"
                                                            runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3"
                                                            runat="server" TargetControlID="txtUNSK"
                                                            FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="txtOT"
                                                            runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4"
                                                            runat="server" TargetControlID="txtOT"
                                                            FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblTotal" runat="server"
                                                            Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                            CommandName="DeleteWp" CommandArgument='<%#Bind("SNo") %>'>Delete</asp:LinkButton>
                                                    </td>



                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                        <tfoot>
                                                            <tr>





                                                                <td></td>
                                                                <td></td>
                                                                <td>Total:</td>

                                                                <td>
                                                                    <asp:Label ID="lblTSK" runat="server" Text=""></asp:Label>




                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblTSEMI" runat="server"
                                                                        Text=""></asp:Label>




                                                                </td>

                                                                <td>
                                                                    <asp:Label ID="lblTUNSK" runat="server"
                                                                        Text=""></asp:Label>




                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblTOT" runat="server" Text=""></asp:Label>



                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblGTotal" runat="server"
                                                                        Text=""></asp:Label>



                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                    <asp:Button CssClass="btn btn-primary btn-square"
                                                                        ID="btnAdd" runat="server" Text="Add Item"
                                                                        OnClick="btnAdd_Click" /></td>
                                                                <td>
                                                                    <asp:Button CssClass="btn btn-primary btn-square"
                                                                        ID="btnCalculate" runat="server"
                                                                        Text="Calculate"
                                                                        OnClick="btnCalculate_Click" /></td>





                                                            </tr>
                                                        </tfoot>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </table>
                                </div>


                            </div>
                        </div>




                        <div class="row mtm">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Supervisor
                         
                                    <asp:DropDownList CssClass="form-select" ID="ddlSupervisor"
                                        runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Foreman
                               
                                        <asp:DropDownList CssClass="form-select" ID="ddlForeman"
                                            runat="server">
                                        </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    Engineer
                                    
                                            <asp:DropDownList CssClass="form-select" ID="ddlEngineer"
                                                runat="server">
                                            </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mtm">
                            <div class="col-lg-12">
                                <asp:Button CssClass="btn btn-primary btn-square"
                                    ID="btnSubmit" runat="server" Text="Submit"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button CssClass="btn btn-primary btn-square"
                                    ID="btnCancel" runat="server" Text="Cancel"
                                    OnClick="btnCancel_Click" />
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

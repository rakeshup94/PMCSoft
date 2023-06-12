<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.MorningReport" Codebehind="MorningReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
	function preventBack(){window.history.forward();}
	setTimeout("preventBack()", 0);
	window.onunload=function(){null};
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper" style="margin-left: -40px;">
                <div class="card"  style="width: 1000px;">
                    <div class="card-body">
                        <div class="card-header">
                            MORNING REPORT</div>
                        <div class="row"  style="width: 990px;">
                     
                            <div class="row" >
                                <div class="col-lg-4" >
                                    Project:
                                </div>
                                <div class="col-lg-4" >
                                    <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" Width="250px" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-4" >
                                </div>
                                <div class="col-lg-4"  style="width: 510px;">
                                </div>
                                <div class="col-lg-4"  style="width: 60px; font-weight: bold;">
                                    Date:
                                </div>
                                <div class="col-lg-4"  style="font-weight: bold;">
                                    <asp:Label ID="lblDate" runat="server"   Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  colspan="6">
                                    <asp:Panel ID="Panel1" runat="server" Width="970px" Visible="false">
                                        <div class="row"  style="width: 960px;">
                                            <div class="row" >
                                                <div class="col-lg-4"  style="white-space: nowrap; font-weight: bold;">
                                                    WP Date:
                                                </div>
                                                <div class="col-lg-4"  style="font-weight: bold;">
                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server"   Font-Size="12px"></asp:Label>
                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                                <div class="col-lg-4"  style="width: 60px;">
                                                </div>
                                                <div class="col-lg-4" >
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="white-space: nowrap; font-weight: bold;">
                                                    No.:
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Label ID="lblNumber" runat="server"  ></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="white-space: nowrap; font-weight: bold;">
                                                    ENG. In Charge:
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Label ID="lblEngInCharge" runat="server"  ></asp:Label>
                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                </div>
                                                <div class="col-lg-4"  style="width: 60px; font-weight: bold;">
                                                    Block:
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="6">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <div class="row"  style="width: 960px; border: 1px solid black; border-collapse: collapse;">
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
                                                                    <div class="col-lg-4"  colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Work Programme
                                                                    </div>
                                                                    <div class="col-lg-4"  colspan="5" style="text-align: center; width: 400px; border: 1px solid black;
                                                                        background-color: #D8D8D8;">
                                                                        Actual Labour
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
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        Total
                                                                    </div>
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
                                                                    <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                        Total
                                                                    </div>
                                                                </div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black;">
                                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black;">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSK" runat="server" Width="50px" Text='<%#Bind("LabourSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblSEMI" runat="server" Width="50px" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblUNSK" runat="server" Width="50px" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblOT" runat="server" Width="50px" Text='<%#Bind("LabourOT") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center; background-color: #FFEBCD;">
                                                                    <asp:Label ID="lblWPTotal" runat="server" Width="50px" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtSK" runat="server" Width="70px" Text='<%#Bind("LabourSK") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtSEMI" runat="server" Width="70px" Text='<%#Bind("LabourSEMI") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtUNSK" runat="server" Width="70px" Text='<%#Bind("LabourUNSK") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:TextBox CssClass="form-control" ID="txtOT" runat="server" Width="70px" Text='<%#Bind("LabourOT") %>'>
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                        FilterType="Custom, Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                    <asp:Label ID="lblMRTotal" runat="server" Width="50px" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                    Total:
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #FFEBCD; text-align: center;">
                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #FFEBCD; text-align: center">
                                                                    <asp:Label ID="lblWPGTotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumSEMI" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumUNSK" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRSumOT" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                    <asp:Label ID="lblMRGTotal" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                </div>
                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
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
                                                <div class="col-lg-4"  style="font-weight: bold;">
                                                    Supervisor:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                </div>
                                                <div class="col-lg-4"  style="font-weight: bold;">
                                                    Foreman:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                </div>
                                                <div class="col-lg-4"  style="font-weight: bold;">
                                                    Engineer:
                                                </div>
                                                <div class="col-lg-4"  style="text-align: left;">
                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4"  colspan="6" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

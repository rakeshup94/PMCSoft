<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.Report.MonthlyVWD" Codebehind="MonthlyVWD.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"">
                <div class="card"    >
                    <div class="card-body">
                        <div class="card-header">
                            MONTHLY VWD (FORMAT No. C)</div>
                        <div class="row"  style="width: 930px;">
                            <div class="row" >
                           
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Project&nbsp;&nbsp;&nbsp;<asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"  >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"  style="text-align: center; font-size: 15px; font-family: Cambria;">
                                    Status of Work Done / Plan As On&nbsp;&nbsp;&nbsp;<asp:TextBox CssClass="form-control" ID="txtDate" runat="server"
                                          ReadOnly="true" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                        <HeaderTemplate>
                                            <div class="row"  style="width: 920px; border: 1px solid black; border-collapse: collapse;">
                                                <div class="row" >
                                                    <div class="col-lg-4"  rowspan="3" style="width: 40px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        S.No
                                                    </div>
                                                    <div class="col-lg-4"  rowspan="3" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Month
                                                    </div>
                                                    <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Plan (Rs.)
                                                    </div>
                                                    <div class="col-lg-4"  colspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Actual (Rs.)
                                                    </div>
                                                    <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Variation (Rs.)
                                                    </div>
                                                    <div class="col-lg-4"  rowspan="3" style="width: 100px; text-align: center; border: 1px solid black;
                                                        background-color: #D8D8D8; font-weight: bold;">
                                                        Remarks
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        VWD
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Escl.
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Extra Item
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        Total
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        A
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        B
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        C
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        D
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        E = (B + C + D)
                                                    </div>
                                                    <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                        font-weight: bold;">
                                                        F = (A - B)
                                                    </div>
                                                </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <%--<asp:HiddenField ID="hdnDates" runat="server" Value='<%#Bind("Dates") %>' />--%>
                                                    <asp:HiddenField ID="hdnMonths" runat="server" Value='<%#Bind("Months") %>' />
                                                    <asp:HiddenField ID="hdnYears" runat="server" Value='<%#Bind("Years") %>' />
                                                    <asp:Label ID="lblFiscMonths" runat="server" Text='<%#Bind("FiscMonths") %>'></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtPlan" runat="server" Width="80px" Enabled="false" ReadOnly="true"
                                                        Text='<%#Bind("PlanRs") %>'></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPlan"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtActualVWD" runat="server" Width="80px" Enabled="false" ReadOnly="true"
                                                        Text='<%#Bind("ActualVWD") %>'>
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtActualVWD"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtActualEscl" runat="server" Width="80px" Enabled="false" ReadOnly="true"
                                                        Text='<%#Bind("ActualEscl") %>'>
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtActualEscl"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtExtraItem" runat="server" Width="80px" Enabled="false" ReadOnly="true"
                                                        Text='<%#Bind("ActualExtraItem") %>'>
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtExtraItem"
                                                        FilterType="Custom, Numbers" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtTotal" runat="server" Width="80px" ReadOnly="true" Enabled="false"
                                                        Text='<%#Bind("ActualTotal") %>'></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtVariation" runat="server" Width="80px" ReadOnly="true" Enabled="false"
                                                        Text='<%#Bind("Variation") %>'>
                                                    </asp:TextBox>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black;">
                                                    <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="valid(this)"
                                                        onblur="valid(this)" Enabled="false" ReadOnly="true" Text='<%#Bind("Remarks") %>'></asp:TextBox>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    GRAND TOTAL
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblPlan" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualVWD" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualEscl" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualExtraItem" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblActualTotal" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                    <asp:Label ID="lblVariation" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                    font-weight: bold;">
                                                </div>
                                            </div>
                                              </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

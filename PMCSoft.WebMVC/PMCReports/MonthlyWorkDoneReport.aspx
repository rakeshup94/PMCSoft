<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.PMCReports.MonthlyWorkDoneReport" Codebehind="MonthlyWorkDoneReport.aspx.cs" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper"    >
                <div class="card"     >
                    <div class="card-body">
                        <div class="card-header">
                            MONTHLY WORK DONE</div>
                        <div class="row"   >
                        
                            <div class="col-lg-4" >
                                <div class="row"   >
                                    <div class="row" >
                                        <div class="col-lg-4" >
                                            Project
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:DropDownList CssClass="form-select" ID="ddlProject" runat="server"   AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4" >
                                            Month
                                        </div>
                                        <div class="col-lg-4" >
                                            <asp:DropDownList CssClass="form-select" ID="ddlMonth" runat="server" AutoPostBack="True" Style="width: auto;">
                                                <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                                <asp:ListItem Text="February" Value="02"></asp:ListItem>
                                                <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                                <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                                <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                                <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                                <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                                <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                                <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                                <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList CssClass="form-select" ID="ddlSDaysYear" runat="server" AutoPostBack="True" Style="width: 400;">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4" >
                                            <div class="col-lg-4" >
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="BtnReport" runat="server" Text="View" OnClick="BtnReport_Click" />
                                            </div>
                                            <div class="col-lg-4" >
                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnPrint" runat="server" Text="Print Preview" OnClick="btnPrint_Click" />
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                            <%--<tr>
                                <div class="col-lg-4"   >
                                    Monthly Work Done Status For The Month Of   
                                    <asp:TextBox CssClass="form-control" ID="txtMonth" runat="server" onkeyup="valid(this)" onblur="valid(this)"></asp:TextBox>
                                </div>
                            </div>--%>
                            <div class="row" >
                                <div class="col-lg-4" >
                                    <div class="row"   >
                                        <div class="row" >
                                            <div class="col-lg-4" >
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row"  style="border: 1px solid black; border-collapse: collapse;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  rowspan="4" style="width: 40px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    S.No
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 220px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Particulars
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Unit
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="4" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Rate
                                                                </div>
                                                                <div class="col-lg-4"  rowspan="2" style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Awarded value of work (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Plan)
                                                                </div>
                                                                <div class="col-lg-4"  colspan="4" style="width: 250px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Work Done (Actual)
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; font-weight: bold;">
                                                                    Variation (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    font-weight: bold;">
                                                                    Balance
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"     style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"     style="width: 100px; text-align: center; border: 1px solid black;
                                                                    background-color: #D8D8D8; width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 100px; text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Upto Previous Months
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                    Current Month
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 100px; font-weight: bold;">
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    A
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    B
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    C
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    D
                                                                </div>
                                                                <div class="col-lg-4"     style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    E
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    F = B - D
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    G = C - E
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    H = (A - D - E)
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Qty.
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amt. (Rs.)
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                    Amount
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: center; border: 1px solid black; background-color: #D8D8D8;
                                                                    width: 50px; font-weight: bold;">
                                                                </div>
                                                            </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row" >
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Bind("WDMParticularId") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblActual" runat="server" Text='<%#Bind("WDMParticularName") %>' Font-Bold="true"
                                                                    Height="15"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtUnit" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtRate" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtAwardedValue" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtQty" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="txtAmt" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label2" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label3" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label4" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label5" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label6" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label7" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label8" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label9" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="Label10" runat="server"   Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" >
                                                            <div class="col-lg-4" >
                                                                <asp:Repeater ID="RptSub" runat="server" OnItemDataBound="RptSub_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("TransId") %>'></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDDName") %>'></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="txtUnit" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="txtRate" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="txtAwardedValue" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="txtQty" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="txtAmt" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label11" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label12" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label13" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label14" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label15" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label16" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label17" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label18" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                            <div class="col-lg-4"   >
                                                                                <asp:Label ID="Label19" runat="server"   Text=""></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" >
                                                                            <div class="col-lg-4" >
                                                                                <asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="row" >
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtUnit" runat="server"   Text='<%#Bind("CurrUnit") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtRate" runat="server"   Text='<%#Bind("CurrRate") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtAwardedValue" runat="server"   Text='<%#Bind("CurrAwardedValue") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtQty" runat="server"   Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtAmt" runat="server"   Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label11" runat="server"   Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label12" runat="server"   Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label13" runat="server"   Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label14" runat="server"   Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label15" runat="server"   Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label16" runat="server"   Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label17" runat="server"   Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label18" runat="server"   Text='<%#Bind("CurrentvariationAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label19" runat="server"   Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    
                                                                                    
                                                                                </asp:Repeater>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    
                                                                </asp:Repeater>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
<tr>
                                                            <div class="col-lg-4"   >
                                                             
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                <asp:Label ID="lblPPlanTotal" runat="server" Text="Grand Total"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label2220" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                               <asp:Label ID="Label21" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                 <asp:Label ID="Label23" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                  <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                  <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                 <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label30" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                                  <asp:Label ID="Label31" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="col-lg-4"   >
                                                              <asp:Label ID="Label32" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                          </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <%--<asp:Repeater ID="RptSubDetail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="row" >
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="LabelLblsub" runat="server" Text='<%#Bind("WDSubDID") %>' Visible="false"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="lblWDDName" runat="server" Text='<%#Bind("WDSubParticularsName") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtUnit" runat="server"   Text='<%#Bind("CurrUnit") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtRate" runat="server"   Text='<%#Bind("CurrRate") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtAwardedValue" runat="server"   Text='<%#Bind("CurrAwardedValue") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtQty" runat="server"   Text='<%#Bind("prePlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="txtAmt" runat="server"   Text='<%#Bind("prePlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label11" runat="server"   Text='<%#Bind("CurrPlanQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label12" runat="server"   Text='<%#Bind("CurrPlanAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label13" runat="server"   Text='<%#Bind("preActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label14" runat="server"   Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label15" runat="server"   Text='<%#Bind("CurrActualQty") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label16" runat="server"   Text='<%#Bind("CurrActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label17" runat="server"   Text='<%#Bind("preActualAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label18" runat="server"   Text='<%#Bind("CurrentvariationAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-lg-4"   >
                                                                                                <asp:Label ID="Label19" runat="server"   Text='<%#Bind("BalanceAmt") %>'></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>--%>
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

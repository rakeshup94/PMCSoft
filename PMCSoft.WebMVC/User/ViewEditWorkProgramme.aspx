<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="PMCSoft.Web.User.ViewEditWorkProgramme" Codebehind="ViewEditWorkProgramme.aspx.cs" %>

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
                        <h3 class="reallynow">
                            VIEW / EDIT WORK PROGRAMME</h3>
                        <div class="row"  style="width: 920px;">
                         
                            <div class="row" >
                                <div class="col-lg-4"  style="width: 60px;">
                                    Date:
                                </div>
                                <div class="col-lg-4" >
                                    <asp:Label ID="lblDate" runat="server"   Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-lg-4"    >
                                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
                                           ShowHeader="false">
                                        <HeaderTemplate>
                                            <div class="row" >
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="row" >
                                                <div class="col-lg-4"  style="background-color: #D9EAED; color: #202020;">
                                                    Project &nbsp;&nbsp;<asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        Font-Bold="true"></asp:Label>
                                                    <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%#Bind("ProjectID") %>' />
                                                </div>
                                            </div>
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <asp:GridView CssClass="table table-hover table-striped table-bordered table-advanced tablesorter mbn"  ID="GridView1" runat="server" AutoGenerateColumns="false"  
                                                        EmptyDataText="No Record Found" OnRowCommand="GridView1_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPID1" runat="server" Value='<%#Bind("WPID") %>' />
                                                                    <asp:HiddenField ID="hdnPRJID" runat="server" Value='<%#Bind("PRJID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Work Programme Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWPDate" runat="server" Text='<%#Bind("WPDate") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPDate1" runat="server" Value='<%#Bind("WPDate1") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Work Programme Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblWPNumber" runat="server" Text='<%#Bind("WPNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"   />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Block">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBlock" runat="server" Text='<%#Bind("Block") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Forwarded To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblForwardedBy" runat="server" Text='<%#Bind("ForwardedTo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkView" runat="server" CommandName="WPView" Text="View" Font-Underline="true"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                              </div>
                                        </FooterTemplate>
                                    </asp:DataList>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Width="900px" Height="500px" Style="display: none;
                                           background-color: #F7F8E0;" ScrollBars="Horizontal">
                                        <div class="row"  style="width: 800px; background-color: #F7F8E0;">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                    <div class="card-body">
                                                        <h3 class="reallynow">
                                                            Work Programme Detail</h3>
                                                        <div class="row"  style="width: 790px;">
                                                            <div class="row" >
                                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                                    WP Date:
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="12px"></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                                    <asp:HiddenField ID="hdnProjID" runat="server" />
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
                                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                                    No.:
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:Label ID="lblNumber" runat="server" Width="100px"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-4"  style="white-space: nowrap;">
                                                                    ENG. In Charge:
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:Label ID="lblEngInCharge" runat="server"  ></asp:Label>
                                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                                </div>
                                                                <div class="col-lg-4"  style="width: 60px;">
                                                                    Block:
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  colspan="6">
                                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" onitemcommand="Repeater1_ItemCommand">
                                                                        <HeaderTemplate>
                                                                            <div class="row"  style="width: 780px; border: 1px solid black; border-collapse: collapse;">
                                                                                <div class="row" >
                                                                                    <div class="col-lg-4"  rowspan="2" style="width: 40px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        S.No
                                                                                    </div>
                                                                                    <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Item Of Work
                                                                                    </div>
                                                                                    <div class="col-lg-4"  rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Area
                                                                                    </div>
                                                                                    <div class="col-lg-4"  colspan="4" style="text-align: center; width: 200px; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Work Programme
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
                                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                                    <asp:TextBox CssClass="form-control" ID="txtSK" runat="server" Width="70px" Text='<%#Bind("LabourSK") %>'></asp:TextBox>
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
                                                                                    <asp:TextBox CssClass="form-control" ID="txtOT" runat="server" Width="70px" Text='<%#Bind("LabourOT") %>'></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </div>
                                                                                <div class="col-lg-4"  style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblTotal" runat="server" Text="">
                                                                                    </asp:Label>
                                                                                </div>
                                                                                <div class="col-lg-4" >
                                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteWp" CommandArgument='<%#Bind("TransID") %>'>Delete</asp:LinkButton>
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
                                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                                <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
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
                                                                                 <div class="col-lg-4"  style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                <asp:Button CssClass="btn btn-primary btn-square" ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
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
                                                                <div class="col-lg-4" >
                                                                    Supervisor:
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: left;">
                                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    Foreman:
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: left;">
                                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                                </div>
                                                                <div class="col-lg-4" >
                                                                    Engineer:
                                                                </div>
                                                                <div class="col-lg-4"  style="text-align: left;">
                                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-lg-4"  colspan="6" style="text-align: center;">
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnSubmit" runat="server" Text="Update" OnClick="btnSubmit_Click" />
                                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                                </div>
                                                            </div>
                                                          </div>
                                                    </div>
                                                </div>
                                            </div>
                                          </div>
                                    </asp:Panel>
                                     <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary btn-square" ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  
                                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False"  
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server"   Height="200px" Style="display: none;
                                           background-color: #F7F8E0;">
                                        <div class="row"  style="width: 300px; background-color: #F7F8E0;" border="1">
                                            <div class="row" >
                                                <div class="col-lg-4" >
                                                  Item Of Work
                                                </div>
                                                <div class="col-lg-4" >
                                                 <asp:DropDownList CssClass="form-select" ID="ddlitemworkaddmore" runat="server"  >
                                                                </asp:DropDownList>
                                                </div>
                                                </div>
                                                <div class="row" >
                                                <div class="col-lg-4" >
                                                Area
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="TxtAreaaddmore" runat="server"  ></asp:TextBox>
                                                </div>
                                                </div>
                                                 <div class="row" >
                                                <div class="col-lg-4" >
                                                SK
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtskaddmore" runat="server"  ></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtskaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                </div>
                                                 <div class="row" >
                                                <div class="col-lg-4" >
                                                SEMI
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtsemiaddmore" runat="server"  > </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtsemiaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                </div>
                                                 <div class="row" >
                                                <div class="col-lg-4" >
                                                UNSK
                                                </div>
                                                <div class="col-lg-4" >
                                                    <asp:TextBox CssClass="form-control" ID="txtunskaddmore" runat="server"  ></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="txtunskaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                </div>
                                                
                                                 <div class="row" >
                                                <div class="col-lg-4" >
                                                OT
                                                </div>
                                                <div class="col-lg-4" >
                                                
                                                    <asp:TextBox CssClass="form-control" ID="txtotaddmore" runat="server"  ></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="txtotaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                </div>
                                                  <div class="row"   >
                                                 <div class="col-lg-4"    >
                                                    <asp:Button CssClass="btn btn-primary btn-square" ID="BtnSaveADD" runat="server" Text="Save" OnClick="BtnSaveADD_Click"     />
                                                     <asp:Button CssClass="btn btn-primary btn-square" ID="BtnCanceladd" runat="server" Text="Cancel"  OnClick="BtnCanceladd_Click"    />
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

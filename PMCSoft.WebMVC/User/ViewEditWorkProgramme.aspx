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
            <div id="wrapper">
                <div id="content" style="width: 940px;">
                    <div id="rightnow">
                        <h3 class="reallynow">
                            VIEW / EDIT WORK PROGRAMME</h3>
                        <div class="row"  style="width: 920px;">
                         
                            <tr>
                                <td style="width: 60px;">
                                    Date:
                                </td>
                                <td>
                                    <asp:Label ID="lblDate" runat="server"   Font-Size="12px"></asp:Label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
                                        Width="910px" ShowHeader="false">
                                        <HeaderTemplate>
                                            <div class="row" >
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="background-color: #D9EAED; color: #202020;">
                                                    Project &nbsp;&nbsp;<asp:Label ID="lblProjectName" runat="server" Text='<%#Bind("ProjectName") %>'
                                                        Font-Bold="true"></asp:Label>
                                                    <asp:HiddenField ID="hdnProjectID" runat="server" Value='<%#Bind("ProjectID") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="890px"
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
                                                                <ItemStyle HorizontalAlign="Center" Width="160px" />
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
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                              </div>
                                        </FooterTemplate>
                                    </asp:DataList>
                                    <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel1" TargetControlID="Button1" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" Width="900px" Height="500px" Style="display: none;
                                        border-color: Maroon; background-color: #F7F8E0;" ScrollBars="Horizontal">
                                        <div class="row"  style="width: 800px; background-color: #F7F8E0;">
                                            <tr>
                                                <td>
                                                    <div id="rightnow">
                                                        <h3 class="reallynow">
                                                            Work Programme Detail</h3>
                                                        <div class="row"  style="width: 790px;">
                                                            <tr>
                                                                <td style="white-space: nowrap;">
                                                                    WP Date:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblWorkProgrammeDate" runat="server" Width="100px" Font-Size="12px"></asp:Label>
                                                                    <asp:HiddenField ID="hdnWPDate" runat="server" />
                                                                    <asp:HiddenField ID="hdnWPID" runat="server" />
                                                                    <asp:HiddenField ID="hdnProjID" runat="server" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td style="width: 60px;">
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="white-space: nowrap;">
                                                                    No.:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNumber" runat="server" Width="100px"></asp:Label>
                                                                </td>
                                                                <td style="white-space: nowrap;">
                                                                    ENG. In Charge:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblEngInCharge" runat="server"  ></asp:Label>
                                                                    <asp:HiddenField ID="hdnEngInCharge" runat="server" />
                                                                </td>
                                                                <td style="width: 60px;">
                                                                    Block:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblBlock" runat="server" Text="" Width="250px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="6">
                                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" onitemcommand="Repeater1_ItemCommand">
                                                                        <HeaderTemplate>
                                                                            <div class="row"  style="width: 780px; border: 1px solid black; border-collapse: collapse;">
                                                                                <tr>
                                                                                    <td rowspan="2" style="width: 40px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        S.No
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Item Of Work
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Area
                                                                                    </td>
                                                                                    <td colspan="4" style="text-align: center; width: 200px; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Work Programme
                                                                                    </td>
                                                                                    <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Total
                                                                                    </td>
                                                                                       <td rowspan="2" style="width: 150px; text-align: center; border: 1px solid black;
                                                                                        background-color: #D8D8D8;">
                                                                                        Delete
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                        SK
                                                                                    </td>
                                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                        SEMI
                                                                                    </td>
                                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                        UNSK
                                                                                    </td>
                                                                                    <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                        O.T
                                                                                    </td>
                                                                                 
                                                                                </tr>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                    <asp:HiddenField ID="hdnTransID" runat="server" Value='<%#Bind("TransID") %>' />
                                                                                    <asp:HiddenField ID="hdnItemID" runat="server" Value='<%#Bind("ItemID") %>' />
                                                                                </td>
                                                                                <td style="border: 1px solid black;">
                                                                                    <asp:Label ID="lblItemOfWork" runat="server" Text='<%#Bind("ItemOfWork") %>'>
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black;">
                                                                                    <asp:Label ID="lblArea" runat="server" Text='<%#Bind("Area") %>'></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:TextBox CssClass="form-control" ID="txtSK" runat="server" Width="70px" Text='<%#Bind("LabourSK") %>'></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSK"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:TextBox CssClass="form-control" ID="txtSEMI" runat="server" Width="70px" Text='<%#Bind("LabourSEMI") %>'>
                                                                                    </asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtSEMI"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:TextBox CssClass="form-control" ID="txtUNSK" runat="server" Width="70px" Text='<%#Bind("LabourUNSK") %>'>
                                                                                    </asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUNSK"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:TextBox CssClass="form-control" ID="txtOT" runat="server" Width="70px" Text='<%#Bind("LabourOT") %>'></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtOT"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </td>
                                                                                <td style="border: 1px solid black; text-align: center;">
                                                                                    <asp:Label ID="lblTotal" runat="server" Text="">
                                                                                    </asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteWp" CommandArgument='<%#Bind("TransID") %>'>Delete</asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <tr>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                                </td>
                                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                    Total:
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                                    <asp:Label ID="lblSumSK" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumSEMI" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumUNSK" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblSumOT" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Label ID="lblGTotal" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8;">
                                                                                </td>
                                                                                <td style="text-align: center; border: 1px solid black; background-color: #D8D8D8;">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                </td>
                                                                                 <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center;">
                                                                <asp:Button CssClass="btn btn-primary" ID="btnAdd" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                                                            </td>
                                                                                <td style="border: 1px solid black; background-color: #D8D8D8; text-align: center">
                                                                                    <asp:Button CssClass="btn btn-primary" ID="btnCalculate" runat="server" Text="Calculate" BackColor="#33ccff"
                                                                                        BorderColor="Navy" OnClick="btnCalculate_Click" />
                                                                                </td>
                                                                            </tr>
                                                                              </div>
                                                                        </FooterTemplate>
                                                                    </asp:Repeater>
                                                                </td>
                                                            </tr>
                                                         
                                                            <tr>
                                                                <td>
                                                                    Supervisor:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="lblSupervisor" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnSupervisor" runat="server" />
                                                                </td>
                                                                <td>
                                                                    Foreman:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="lblForeman" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnForeman" runat="server" />
                                                                </td>
                                                                <td>
                                                                    Engineer:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="lblEngineer" runat="server"></asp:Label>
                                                                    <asp:HiddenField ID="hdnEngineer" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="6" style="text-align: center;">
                                                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Update" OnClick="btnSubmit_Click" />
                                                                    <asp:Button CssClass="btn btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                                </td>
                                                            </tr>
                                                          </div>
                                                    </div>
                                                </td>
                                            </tr>
                                          </div>
                                    </asp:Panel>
                                     <div style="display: none">
                                        <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Button" />
                                    </div>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="popUpStyle"
                                        PopupControlID="Panel2" TargetControlID="Button2" EnableViewState="False" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" Width="300px" Height="200px" Style="display: none;
                                        border-color: Maroon; background-color: #F7F8E0;">
                                        <div class="row"  style="width: 300px; background-color: #F7F8E0;" border="1">
                                            <tr>
                                                <td>
                                                  Item Of Work
                                                </td>
                                                <td>
                                                 <asp:DropDownList CssClass="form-select" ID="ddlitemworkaddmore" runat="server"  >
                                                                </asp:DropDownList>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                Area
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="TxtAreaaddmore" runat="server"  ></asp:TextBox>
                                                </td>
                                                </tr>
                                                 <tr>
                                                <td>
                                                SK
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtskaddmore" runat="server"  ></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtskaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                </tr>
                                                 <tr>
                                                <td>
                                                SEMI
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtsemiaddmore" runat="server"  > </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtsemiaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                </tr>
                                                 <tr>
                                                <td>
                                                UNSK
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="txtunskaddmore" runat="server"  ></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="txtunskaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                </tr>
                                                
                                                 <tr>
                                                <td>
                                                OT
                                                </td>
                                                <td>
                                                
                                                    <asp:TextBox CssClass="form-control" ID="txtotaddmore" runat="server"  ></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="txtotaddmore"
                                                                                        FilterType="Custom, Numbers">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                </tr>
                                                  <tr style="vertical-align: top;">
                                                 <td colspan="2" style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="BtnSaveADD" runat="server" Text="Save" OnClick="BtnSaveADD_Click"   class="button-bg"/>
                                                     <asp:Button CssClass="btn btn-primary" ID="BtnCanceladd" runat="server" Text="Cancel"  OnClick="BtnCanceladd_Click"  class="button-bg"/>
                                                </td>
                                                
                                                </tr>
                                                  </div>
                                                </asp:Panel>
                                </td>
                            </tr>
                          </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

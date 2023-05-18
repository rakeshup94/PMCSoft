﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls_MasterTCS" Codebehind="MasterTCS.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script src="../../Scripts/JScript.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript" src="../../Scripts/Fixfocus.js"></script>--%>
    <link href="../../Styles/vijay.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//        function closeForm() {

//            var objParent = window.opener;
//            if (objParent != null) {
//                if (window.opener.document.getElementById('CPH_Form_refreshDyerColor')) {
//                    window.opener.document.getElementById('CPH_Form_refreshDyerColor').click();
//                    self.close();
//                }

//            }
//            else {
//                window.location.href = "../../main.aspx";
//            }

//        }

        function reloadPage() {
            window.location.href = "FrmTCS.aspx";
        }
        function addpriview() {
            window.open("../../ReportViewer.aspx")
        }        
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

             <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                <div class="col-xl-3 mb-3">
                     <asp:TextBox CssClass="form-control" ID="txtid" runat="server" Visible="false"></asp:TextBox>
                </div>
                        
                        </div>
                    <div class="row">
                <div class="col-xl-3 mb-3">
                     <asp:Label ID="lblProcessName" runat="server" Text="Process Name" CssClass="labelbold"></asp:Label>
                             <asp:DropDownList CssClass="form-select" ID="DDProcessName" runat="server"
                              AutoPostBack="true" OnSelectedIndexChanged="DDProcessName_SelectedIndexChanged">
                            </asp:DropDownList>
                             <%--<asp:DropDownList CssClass="form-select" ID="DDItemName" Width="150px" runat="server"
                              AutoPostBack="true" OnSelectedIndexChanged="DDItemName_SelectedIndexChanged">
                            </asp:DropDownList>--%>
                       
                </div>
                        <div class="col-xl-3 mb-3">
                           <asp:Label ID="lblCategoryName" runat="server" Text="Category Name" CssClass="labelbold"></asp:Label>
                             <asp:DropDownList CssClass="form-select" ID="DDCategoryName" runat="server"
                              AutoPostBack="true" OnSelectedIndexChanged="DDCategoryName_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                       
                        </div>
                        <div class="col-xl-3 mb-3"> 
                           <asp:Label ID="lblItemName" runat="server" Text="Item Name" CssClass="labelbold"></asp:Label>
                             <asp:DropDownList CssClass="form-select" ID="DDItemName" runat="server"
                              AutoPostBack="true" OnSelectedIndexChanged="DDItemName_SelectedIndexChanged">
                            </asp:DropDownList>                            
                       
                        </div>
                        <div class="col-xl-3 mb-3">
                           
                         <asp:Label ID="lblSubItemName" runat="server" Text="SubItem Name" CssClass="labelbold"></asp:Label>
                           <asp:DropDownList CssClass="form-select" ID="DDQuality" runat="server"
                           AutoPostBack="true" OnSelectedIndexChanged="DDQuality_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                       
                        </div>
                        </div>
                    <div class="row">
                <div class="col-xl-3 mb-3">
                    <asp:Label ID="lblTCS" runat="server" Text="TCS" CssClass="labelbold"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtTCSRate" runat="server"></asp:TextBox>
                       
                </div>
                        <div class="col-xl-3 mb-3">                           
                          <asp:Label ID="lblEffectiveDate" runat="server" Text="Effective Date" CssClass="labelbold"></asp:Label>
                           <asp:TextBox ID="txtEffectiveDate" runat="server"  CssClass="form-control"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yyyy"
                                TargetControlID="txtEffectiveDate">
                            </asp:CalendarExtender>
                            
                      
                        </div>
                       
                        </div>
                    <div class="row">
                <div class="col-xl-12 mb-3">                   
                         
                           <%-- <asp:Button ID="btnSave" Text="Save" runat="server" CssClass="btn btn-lg btn-danger" Width="53px"
                                OnClientClick="return confirm('Do you want to save data?')" OnClick="btnSave_Click" />--%>
                                <asp:Button ID="BtnNew" runat="Server" Text="New" CssClass="btn btn-lg btn-danger" OnClientClick="return reloadPage();" />
                                  <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" 
                               OnClientClick="if (!SaveData()) return ;this.disabled=true;this.value = 'wait ...';" CssClass="btn btn-lg btn-danger" />                         
                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-lg btn-danger" Text="Close" OnClientClick="closeForm();"
                            UseSubmitBehavior="False" />
                         <%--   <asp:Button ID="btnpreview" Text="Preview" runat="server" CssClass="btn btn-lg btn-danger" Visible="false"
                                onclick="btnpreview_Click" />--%>
                           
                      
                </div>
                       
                        </div>
                    <div class="row">
                <div class="col-xl-12 mb-3"> 
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            <div class="table-responsive">
                                <asp:GridView ID="gdTCSRate" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered table-striped"
                                    OnSelectedIndexChanged="gdTCSRate_SelectedIndexChanged" DataKeyNames="Id"
                                    OnRowDataBound="gdTCSRate_RowDataBound">
                                    <HeaderStyle CssClass="gvheaders" />
                                    <AlternatingRowStyle CssClass="gvalts" />
                                    <RowStyle CssClass="gvrow" />
                                    <EmptyDataRowStyle CssClass="gvemptytext" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr No.">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                             <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Process Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProcessName" runat="server" Text='<%#Bind("PROCESS_NAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="300px" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Category Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCategoryName" runat="server" Text='<%#Bind("Category_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="300px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemName" runat="server" Text='<%#Bind("Item_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="300px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SubItemName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubItemName" runat="server" Text='<%#Bind("QualityName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="200px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TCS Rate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTCSRate" runat="server" Text='<%#Bind("TCSRate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>                                                                              
                                        <asp:TemplateField HeaderText="Effective Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEffectiveDate" runat="server" Text='<%#Bind("EffectiveDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>                                      
                                        <asp:TemplateField HeaderText="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>' Visible="false"></asp:Label>
                                                 <asp:Label ID="lblProcessId" runat="server" Text='<%# Bind("ProcessId") %>' Visible="false"></asp:Label>
                                                  <asp:Label ID="lblCategoryId" runat="server" Text='<%# Bind("CategoryId") %>' Visible="false"></asp:Label>
                                                 <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("ItemId") %>' Visible="false"></asp:Label>
                                                  <asp:Label ID="lblQualityId" runat="server" Text='<%# Bind("QualityId") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                </div>
                     
                        </div>
                    <div class="row">
                <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        </div>
                    <div class="row">
                <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        <div class="col-xl-3 mb-3">    </div>
                        </div>
                    </div>
                 </div>         
            <asp:HiddenField ID="hnId" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
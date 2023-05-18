<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls_MasterColor" Codebehind="MasterColor.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>





    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          
               <div class="row">
                <div class="col-xl-4 mb-3">
                      <asp:TextBox CssClass="form-control" ID="txtid" runat="server" Visible="false"></asp:TextBox>
                    </div>
                         
                        </div>

               <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                <div class="col-xl-4 mb-3">                  
                            <asp:Label ID="lblcolorname" runat="server" Text="ColorName" CssClass="label"></asp:Label>                       
                            <asp:TextBox CssClass="form-control" ID="txtcolor" runat="server"></asp:TextBox>
                        
                    </div>
                        <div class="col-xl-4 mb-3">                           
                            <asp:Label ID="lblColorCode" runat="server" Text="Color Code" CssClass="label"></asp:Label>                       
                            <asp:TextBox CssClass="form-control" ID="txtColorCode" runat="server"></asp:TextBox>
                       
                    </div>
                     
                        </div>
                    </div>
                   </div>


                <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                <div class="col-xl-12 mb-3"> 
                   
                            <asp:Button ID="Button1" runat="server" Text="New" CssClass="btn btn-lg btn-danger" OnClick="Button1_Click" />
                            <asp:Button ID="btnSave" Text="Save" runat="server" CssClass="btn btn-lg btn-danger" 
                                OnClientClick="return confirm('Do you want to save data?')" OnClick="btnSave_Click" />
                            <asp:Button ID="btnClear" Text="Close" runat="server" CssClass="btn btn-lg btn-danger"
                                OnClientClick="return CloseForm();" />
                            <asp:Button ID="btnpreview" Text="Preview" runat="server" CssClass="btn btn-lg btn-danger" 
                                onclick="btnpreview_Click" />
                            <asp:Button ID="btndelete" runat="server" Text="Delete" OnClientClick="return confirm('Do you want to Delete data?')"
                                CssClass="btn btn-lg btn-danger" OnClick="btndelete_Click" Visible="False" />
                     
                     </div>
                     
                        </div>
                     <div class="row">
                <div class="col-xl-12 mb-3"> 
                   
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                           
                                <asp:GridView ID="gdcolor" runat="server" DataKeyNames="Sr_No" OnRowDataBound="gdcolor_RowDataBound"
                                    OnSelectedIndexChanged="gdcolor_SelectedIndexChanged" CssClass="table table-bordered table-striped">
                                    <HeaderStyle CssClass="gvheaders" />
                                    <AlternatingRowStyle CssClass="gvalts" />
                                    <RowStyle CssClass="gvrow" />
                                    <PagerStyle CssClass="PagerStyle" />
                                    <EmptyDataRowStyle CssClass="gvemptytext" />
                                </asp:GridView>
                           
                      
                     </div>
                   </div>

                    </div>
                   </div>

           
        </ContentTemplate>
    </asp:UpdatePanel>


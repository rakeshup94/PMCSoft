<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="UserControls_YarnOpeningRateMaster" Codebehind="YarnOpeningRateMaster.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script src="../../Scripts/JScript.js" type="text/javascript"></script>

<script type="text/javascript">
    function closeForm() {

        var objParent = window.opener;
        if (objParent != null) {
            self.close();
        }
        else {
            window.location.href = "../../main.aspx";
        }
    }
    function Jscriptvalidate() {
        $(document).ready(function () {
            $("#<%=btnsave.ClientID %>").click(function () {
                var Message = "";
                var selectedindex = $("#<%=DDcategoryName.ClientID %>").attr('selectedIndex');
                if (selectedindex <= 0) {
                    Message = Message + "Please select Category Name!!\n";
                }
                var selectedindex = $("#<%=DDitemname.ClientID %>").attr('selectedIndex');
                if (selectedindex <= 0) {
                    Message = Message + "Please select Item Name!!\n";
                }
                var selectedindex = $("#<%=DDquality.ClientID %>").attr('selectedIndex');
                if (selectedindex <= 0) {
                    Message = Message + "Please select Quality Name!!\n";
                }
                var selectedindex = $("#<%=DDjobname.ClientID %>").attr('selectedIndex');
                if (selectedindex <= 0) {
                    Message = Message + "Please select Job Name!!\n";
                }
                if (Message == "") {
                    return true;
                }
                else {
                    alert(Message);
                    return false;
                }
            });

        });
    }
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        else {
            return true;
        }
    }
</script>
<asp:UpdatePanel ID="upd1" runat="server">
    <ContentTemplate>
        <script type="text/javascript" language="javascript">
            Sys.Application.add_load(Jscriptvalidate);
        </script>
         <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-4 mb-3">                         
                            <asp:Label ID="Label10" Text="Category Name" runat="server" CssClass="label" />                          
                            <asp:DropDownList ID="DDcategoryName" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDcategoryName_SelectedIndexChanged">
                            </asp:DropDownList>
                        
                    </div>
                     <div class="col-xl-4 mb-3">
                        
                            <asp:Label ID="lblitemName" Text="Item Name" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDitemname" CssClass="form-select" runat="server" AutoPostBack="true"
                               OnSelectedIndexChanged="DDitemname_SelectedIndexChanged">
                            </asp:DropDownList>
                       
                     </div>
                     <div class="col-xl-4 mb-3">                          
                            <asp:Label ID="Label1" Text="Quality Name" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDquality" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDquality_SelectedIndexChanged">
                            </asp:DropDownList>
                        
                     </div>
                    </div>
                <div class="row">
                    <div class="col-xl-4 mb-3">                       
                            <asp:Label ID="Label7" Text="Shade Name" runat="server" CssClass="label" />                          
                            <asp:DropDownList ID="DDShade" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDShade_SelectedIndexChanged">
                            </asp:DropDownList>
                       
                    </div>
                     <div class="col-xl-4 mb-3">                        
                            <asp:Label ID="Label2" Text="Job Name" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDjobname" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDjobname_SelectedIndexChanged">
                            </asp:DropDownList>
                        
                     </div>
                     <div class="col-xl-4 mb-3">                         
                            <asp:Label ID="Label8" Text="Emp Name" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDEmpName" CssClass="form-select" runat="server">
                            </asp:DropDownList>
                        
                     </div>
                    </div>
                <div class="row">
                    <div class="col-xl-4 mb-3" id="TDconetype" runat="server">                       
                            <asp:Label ID="Label9" Text="Cone type" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDConetype" CssClass="form-select" runat="server"
                                AutoPostBack="true" OnSelectedIndexChanged="DDConetype_SelectedIndexChanged">
                            </asp:DropDownList>
                      
                    </div>
                     <div class="col-xl-4 mb-3">                         
                            <asp:Label ID="Label11" Text="Ply Type" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDPly" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDPly_SelectedIndexChanged">
                                <asp:ListItem Text="" />
                                <asp:ListItem Text="1 Ply" />
                                <asp:ListItem Text="2 Ply" />
                                <asp:ListItem Text="3 Ply" />
                                <asp:ListItem Text="4 Ply" />
                                <asp:ListItem Text="5 Ply" />
                                <asp:ListItem Text="6 Ply" />
                                <asp:ListItem Text="7 Ply" />
                                <asp:ListItem Text="8 Ply" />
                                <asp:ListItem Text="9 Ply" />
                                <asp:ListItem Text="10 Ply" />
                                <asp:ListItem Text="11 Ply" />
                                <asp:ListItem Text="12 Ply" />
                                <asp:ListItem Text="8-32 Ply" />
                                <asp:ListItem Text="30 Ply" />
                                <asp:ListItem Text="15 Ply" />
                                <asp:ListItem Text="21 Ply" />
                                <asp:ListItem Text="13 Ply" />
                                <asp:ListItem Text="14 Ply" />
                            </asp:DropDownList>
                       
                     </div>
                     <div class="col-xl-4 mb-3">                        
                            <asp:Label ID="Label12" Text="Tranport" runat="server" CssClass="label" />                           
                            <asp:DropDownList ID="DDTransport" CssClass="form-select" runat="server"
                                AutoPostBack="true" OnSelectedIndexChanged="DDTransport_SelectedIndexChanged">
                                <asp:ListItem Text="" />
                                <asp:ListItem Text="Self" />
                                <asp:ListItem Text="Company" />
                            </asp:DropDownList>
                        
                     </div>
                    </div>
                <div class="row">
                    <div class="col-xl-12 mb-3">                       
                            <asp:Label ID="Label14" Text="Remark" runat="server" CssClass="label" />                           
                            <asp:TextBox ID="TxtRemark" CssClass="form-control" runat="server" />
                        
                    </div>
                    
                    </div>
              
                </div>
             </div>               
              
                <fieldset>
                    <div class="card mb-3">
                         <div class="card-header">
                         <legend>
                        <asp:Label ID="lblrrate" CssClass="label" Text="Rate" runat="server" />
                    </legend></div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-4 mb-3">                        
                                <asp:Label ID="lblRate" Text="Rate(Rs.)" CssClass="label" runat="server" />                               
                                <asp:TextBox ID="txtRate" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event);" />
                           
                    </div>
                     <div class="col-xl-4 mb-3">                          
                                <asp:Label ID="Label3" Text="OutSide Rate(Rs.)" CssClass="label" runat="server" />                                
                                <asp:TextBox ID="TxtORate" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event);" />
                            
                     </div>
                     <div class="col-xl-4 mb-3">                         
                                <asp:Label ID="Label4" Text="Effective Date" CssClass="label" runat="server" />                               
                                <asp:TextBox ID="txteffectivedate" CssClass="form-control" runat="server" />
                                <asp:CalendarExtender ID="cal1" runat="server" TargetControlID="txteffectivedate"
                                    Format="dd-MMM-yyyy">
                                </asp:CalendarExtender>
                            
                     </div>
                    </div>
              
                </div>
             </div>
                   
                   
                </fieldset>
                <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-12 mb-3">                       
                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-lg btn-danger mb-2" Text="New" OnClick="btnnew_Click" />
                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-lg btn-danger mb-2" Text="Save" OnClick="btnsave_Click" />
                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-lg btn-danger mb-2" Text="Close" OnClientClick="closeForm();" />
                    </div>
                    
                    </div>
                <div class="row">
                    <div class="col-xl-12 mb-3">                        
                            <asp:Label ID="lblmsg" ForeColor="Red" CssClass="label" Text="" runat="server" />                       
                    </div>                    
                     
                    </div>
                
                </div>
             </div>
              
          
        
            <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-12 mb-3">
                        <div class="table-responsive">
                            <asp:GridView ID="DgDetail" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false"
                                EmptyDataText="No records found." OnRowDataBound="DgDetail_RowDataBound" AutoGenerateSelectButton="true"
                                OnSelectedIndexChanged="DgDetail_SelectedIndexChanged">
                                <HeaderStyle CssClass="gvheaders" />
                                <AlternatingRowStyle CssClass="gvalts" />
                                <RowStyle CssClass="gvrow" />
                                <EmptyDataRowStyle CssClass="gvemptytext" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr No.">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemName" Text='<%#Bind("Item_name") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quality Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" Text='<%#Bind("Qualityname") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Shade Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblshade" Text='<%#Bind("shadecolorname") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Job Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" Text='<%#Bind("Process_name") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EmpName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" Text='<%#Bind("EmpName") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrate" Text='<%#Bind("Rate") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Outside Rate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblorate" Text='<%#Bind("ORate") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cone Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConeType" Text='<%#Bind("ConeType") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ply Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPlyType" Text='<%#Bind("PlyType") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transport">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransportType" Text='<%#Bind("TransportType") %>' runat="server"
                                                CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Effective From">
                                        <ItemTemplate>
                                            <asp:Label ID="lbleffectivefrom" Text='<%#Bind("Effectivedate") %>' runat="server"
                                                CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Effective To">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" Text='<%#Bind("Todate") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark">
                                        <ItemTemplate>
                                            <asp:Label ID="LblRemark" Text='<%#Bind("Remark") %>' runat="server" CssClass="label" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemid" Text='<%#Bind("Itemid") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblqualityid" Text='<%#Bind("Qualityid") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblprocessid" Text='<%#Bind("processid") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblid" Text='<%#Bind("id") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblcategoryid" Text='<%#Bind("categoryid") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblshadecolorid" Text='<%#Bind("shadecolorid") %>' runat="server"
                                                CssClass="label" />
                                            <asp:Label ID="lblEmpId" Text='<%#Bind("EmpId") %>' runat="server" CssClass="label" />
                                            <%--<asp:Label ID="lblORate" Text='<%#Bind("ORate") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblConeType" Text='<%#Bind("CONETYPE") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblPlyType" Text='<%#Bind("PlyType") %>' runat="server" CssClass="label" />
                                            <asp:Label ID="lblTransportType" Text='<%#Bind("TransportType") %>' runat="server"
                                                CssClass="label" />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    
                    </div>
               
                </div>
             </div>
          
    </ContentTemplate>
</asp:UpdatePanel>

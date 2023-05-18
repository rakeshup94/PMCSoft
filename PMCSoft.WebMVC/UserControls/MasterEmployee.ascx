<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="UserControls_MasterEmployee" CodeBehind="MasterEmployee.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:UpdatePanel ID="upd1" runat="server">
    <ContentTemplate>
        <asp:TabContainer ID="Tabemp" ActiveTabIndex="1" runat="server">
            <asp:TabPanel ID="Tabpanelemployeeinformation" HeaderText="Employee/Vendor Information"
                runat="server">
                <ContentTemplate>

                    <div class="card mb-3">
                        <div class="card-body">

                            <div class="row" id="trEmployeeType" runat="server" visible="False">
                                <div class="col-xl-4 mb-3">

                                    <asp:TextBox ID="txtEmpId" runat="server" Style="display: none" CssClass="label"></asp:TextBox>
                                    <asp:Label Text="Department" runat="server" ID="lbl" CssClass="label" />
                                    <asp:Button ID="BtnAddDepartment" runat="server" Style="display: none" EnableTheming="True"
                                        OnClick="BtnAddDepartment_Click" />

                                    <asp:DropDownList ID="DDDepartment" CssClass="form-select" runat="server"
                                        AutoPostBack="True" OnSelectedIndexChanged="DDDepartment_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnadd" runat="server" Visible="False" CssClass="btn btn-lg btn-danger" OnClientClick="AddDepartment();"
                                        Text="..." />

                                </div>
                                <div class="col-xl-4 mb-3">
                                    <asp:Label Text="Emp/Vendor" runat="server" ID="Label3" CssClass="label" />
                                    <asp:DropDownList ID="DDparttype" runat="server" CssClass="form-select"
                                        AutoPostBack="True" OnSelectedIndexChanged="DDparttype_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Vendor" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Employee" Value="1"></asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label21" runat="server" Text="Location" CssClass="label"></asp:Label>

                                    <asp:DropDownList ID="ddlEmployeeType" runat="server" CssClass="form-select"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlEmployeeType_SelectedIndexChanged">
                                        <asp:ListItem Text="---Select---" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="InHouse" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="OutSide" Value="1"></asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label Text="Emp/Vendor Code" runat="server" ID="Label4" CssClass="label" />

                                    <asp:TextBox ID="txtgetvalue" runat="server" Style="display: none"></asp:TextBox>
                                    <asp:TextBox ID="txtempcode" runat="server" CssClass="form-control" AutoPostBack="True"
                                        OnTextChanged="txtempcode_TextChanged"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="txtempcode_AutoCompleteExtender" runat="server" BehaviorID="SrchAutoComplete"
                                        CompletionInterval="20" Enabled="True" ServiceMethod="GetEmployeecode" CompletionSetCount="20"
                                        OnClientItemSelected="EmpSelected" ServicePath="~/Autocomplete.asmx" TargetControlID="txtempcode"
                                        UseContextKey="True" ContextKey="0" MinimumPrefixLength="2" DelimiterCharacters="">
                                    </asp:AutoCompleteExtender>

                                </div>
                                <div class="col-xl-4 mb-3">
                                    <td>
                                        <asp:Label Text="Emp/Vendor Name" runat="server" ID="Label1" CssClass="label" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmpName" runat="server" CssClass="form-control" AutoPostBack="True"
                                            OnTextChanged="txtEmpName_TextChanged" required></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter EmpName"
                                            ControlToValidate="txtEmpName" Display="Dynamic" ValidationGroup="s" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:AutoCompleteExtender ID="txtEmpName_AutoCompleteExtender" runat="server" BehaviorID="SrchAutoComplete1"
                                            CompletionInterval="20" Enabled="True" ServiceMethod="GetEmployeeName" CompletionSetCount="20"
                                            OnClientItemSelected="EmpSelected" ServicePath="~/Autocomplete.asmx" TargetControlID="txtEmpName"
                                            UseContextKey="True" ContextKey="0" MinimumPrefixLength="2" DelimiterCharacters="">
                                        </asp:AutoCompleteExtender>
                                    </td>
                                </div>
                                <div class="col-xl-4 mb-3">
                                    <td>
                                        <asp:Label Text="S/O" runat="server" ID="Label18" CssClass="label" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="address" runat="server" Text="Address1" CssClass="label"></asp:Label>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label5" runat="server" Text="Address2" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtaddress2" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label6" runat="server" Text="Address3" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtaddress3" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label118" runat="server" CssClass="label" Text="Branch Name"></asp:Label>

                                    <asp:DropDownList ID="DDBranchName" runat="server" CssClass="form-select">
                                    </asp:DropDownList>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label8" runat="server" Text="District" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">
                                    <asp:Label ID="Label7" runat="server" Text="State" CssClass="label"></asp:Label>
                                    <asp:DropDownList ID="DDstate" runat="server" CssClass="form-select" AutoPostBack="True">
                                    </asp:DropDownList>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label10" runat="server" Text="Mobile No." CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label9" runat="server" Text="Phone No." CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div id="tdfax" runat="server">
                                        <asp:Label ID="Label12" runat="server" Text=" Fax No." CssClass="label"></asp:Label>
                                    </div>
                                    <div id="tdfaxid" runat="server">
                                        <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label11" runat="server" Text="Email" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtEmailadd" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">
                                    <asp:Label ID="Label16" runat="server" Text="Pan No" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="TxtPanNo" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label13" runat="server" Text="CST No." CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtCST" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label14" runat="server" Text="Tin No." CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtTin" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label19" runat="server" Text="GST No." CssClass="label"></asp:Label>

                                    <div id="tdopen" runat="server">
                                        <asp:TextBox ID="txtGstNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label20" runat="server" Text=" Aadhar No." CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtaadharNo" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label17" runat="server" Text="TDSType" CssClass="label"></asp:Label>

                                    <asp:DropDownList ID="DDType" CssClass="form-select" runat="server">
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label15" runat="server" Text="  Remarks" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="lblCapacity" runat="server" Text="Capacity" CssClass="label"></asp:Label>

                                    <asp:TextBox ID="txtcapacity" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:TextBox ID="txtOpeningBal" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>

                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="lblGuarantor" CssClass="label" Text="Contact Person" runat="server" />

                                    <asp:TextBox ID="txtGuarantor" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label ID="Label36" runat="server" Text="GST Type" CssClass="label"></asp:Label>

                                    <asp:DropDownList ID="DDGSType" CssClass="form-select" runat="server">
                                        <asp:ListItem Value="0" Selected="True">----Select----</asp:ListItem>
                                        <asp:ListItem Value="1">CGST/SGST</asp:ListItem>
                                        <asp:ListItem Value="2">IGST</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label Text="Designation " CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="txtdesignation" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div id="Tremptype" runat="server" visible="False">

                                        <div id="Td1" runat="server">
                                            <asp:Label Text="Emp/Vendor Type" runat="server" ID="Label34" CssClass="label" />
                                        </div>
                                        <div id="Td2" runat="server">
                                            <asp:DropDownList ID="DDemptype" runat="server" CssClass="form-select"
                                                AutoPostBack="True" OnSelectedIndexChanged="ddlEmployeeType_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Text="Loop" Value="Loop"></asp:ListItem>
                                                <asp:ListItem Text="Cut" Value="Cut"></asp:ListItem>
                                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        </tr>
                                                        </table>
                                    </div>


                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">
                                    <div id="TDBankDetails" runat="server">
                                        <asp:Label ID="Label37" Text="Bank Details " CssClass="label" runat="server" />
                                    </div>
                                    <div id="Td4" runat="server">
                                        <asp:TextBox ID="txtBankDetails" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row" id="TREmpName2" runat="server" visible="False">
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label ID="Label41" Text="Emp/Vendor Name(2) " CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="txtEmpName2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label ID="Label39" Text="Emp Address(2) " CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="txtEmpAddress2" runat="server" CssClass="form-control"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row" id="TREmpName2SecondRow" runat="server" visible="False">
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label ID="Label38" Text="Emp(2) Pan No" CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="TxtEmp2PanNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label ID="Label40" Text="Emp(2) Aadhar No" CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="TxtEmp2AadharNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-4 mb-3">
                                    <div runat="server">
                                        <asp:Label ID="Label42" Text="Emp(2) Mobile No" CssClass="label" runat="server" />
                                    </div>
                                    <div runat="server">
                                        <asp:TextBox ID="TxtEmp2MobileNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                            <div class="card mb-3">
                                <div class="card-header">
                                    <asp:Label Text="Employee Process" runat="server" ID="Label2" CssClass="label" />
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-12 mb-3 li-colums-3">
                                            <asp:CheckBoxList ID="ChLProcess" runat="server" RepeatLayout="UnorderedList">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-xl-12 mb-3">

                                    <asp:CheckBox ID="chkforitem" runat="server" Text="Vendor Item Association"
                                        AutoPostBack="True" onclick="return Checkforitem();" />

                                    <asp:CheckBox ID="chkvendorrate" runat="server" Text="Vendor Item Rate"
                                        AutoPostBack="True" onclick="return CheckforitemRate();" Visible="False" />
                                    <asp:CheckBox ID="chkblacklist" runat="server" Text="Vendor Black List" />

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xl-12 mb-3">
                                    <td>
                                        <asp:Button ID="btnvendoritem" runat="server" Text="Vendor Item Detail" CssClass="btn btn-lg btn-danger"
                                            OnClientClick="VendorItemDetail();" />
                                    </td>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xl-4 mb-3">

                                    <asp:Label Text="Employee Photo" runat="server" CssClass="labelbold" />
                                    <br />
                                    <asp:Image ID="lblphotoimage" runat="server" />


                                </div>
                                <div class="col-xl-4 mb-3">

                                    <asp:FileUpload ID="fileuploadphoto" ViewStateMode="Enabled" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only .gif,.jpeg or.jpg files are allowed!"
                                        ValidationExpression="^.*\.(jpg|JPG|gif|GIF|jpeg|JPEG|BMP|bmp)$" ControlToValidate="fileuploadphoto"></asp:RegularExpressionValidator>

                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="dgRaw1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    DataKeyNames="SrNo" EmptyDataText="No Data Found!" OnPageIndexChanging="dgRaw1_PageIndexChanging"
                                    OnRowDataBound="dgRaw1_RowDataBound" OnSelectedIndexChanged="dgRaw1_SelectedIndexChanged" CssClass="table table-bordered table-striped">
                                    <HeaderStyle CssClass="gvheaders" />
                                    <AlternatingRowStyle CssClass="gvalts" />
                                    <RowStyle CssClass="gvrow" />
                                    <PagerStyle CssClass="PagerStyle" />
                                    <EmptyDataRowStyle CssClass="gvemptytext" />
                                    <PagerSettings NextPageText="Next" PreviousPageText="Prev" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Department">
                                            <ItemTemplate>
                                                <asp:Label ID="Label35" runat="server" Text='<%#Bind("Department") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp/Vendor">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempname" runat="server" Text='<%#Bind("EMpname") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Father Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label33" runat="server" Text='<%#Bind("Fathername") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgAddress" runat="server" Text='<%#Bind("Address") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgAddress2" runat="server" Text='<%#Bind("Address2") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Phone No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgPhoneNo" runat="server" Text='<%#Bind("PhoneNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgMobile" runat="server" Text='<%#Bind("Mobile") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgdistrict" runat="server" Text='<%#Bind("District") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="StateName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgstatename" runat="server" Text='<%#Bind("StateName") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgempcode" runat="server" Text='<%#Bind("EMpcode") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pan No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgpanno" runat="server" Text='<%#Bind("PanNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Aadhar No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgaadharno" runat="server" Text='<%#Bind("Aadharno") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GST No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblggstno" runat="server" Text='<%#Bind("GSTNo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstatus" runat="server" Text='<%#Bind("Status") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Upload Docs" ShowHeader="False" Visible="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlDetails2" runat="server" NavigateUrl='<%# "../Masters/Campany/frmuploadocs.aspx?srno=" + Eval("SrNo") +""%>'
                                                    Target="_blank" Text="Upload Docs" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkdel" runat="server" OnClick="lnkdel" OnClientClick="return confirm('Do you want to delete this row?')"
                                                    Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>


                </ContentTemplate>
            </asp:TabPanel>





            <asp:TabPanel ID="TabpanelHrDetail" runat="server" HeaderText="HR Details">
                <ContentTemplate>

                    <div class="card mb-3">
                        <div class="card-body" id="TRHrDetail" runat="server" visible="False">
                            <div runat="server">
                                <fieldset>
                                    <legend>
                                        <asp:Label ID="Label22" Text="HR DETAIL" CssClass="labelbold" runat="server" ForeColor="Red" />
                                    </legend>
                                    <div class="row">
                                        <div class="col-xl-2 mb-3">

                                            <asp:Label ID="lbldob" Text="D.O.B" CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtdob" CssClass="form-control" runat="server" />
                                            <asp:CalendarExtender ID="caldob" runat="server" TargetControlID="txtdob" Format="dd-MMM-yyyy"
                                                Enabled="True"></asp:CalendarExtender>

                                        </div>
                                        <div class="col-xl-2 mb-3">

                                            <asp:Label ID="lblnominee" Text="Nominee" runat="server" CssClass="label" />

                                            <asp:TextBox ID="txtnominee" CssClass="form-control" runat="server" />

                                        </div>
                                        <div class="col-xl-2 mb-3">
                                            <asp:Label ID="Label23" Text="Date of Joining" CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtdoj" CssClass="form-control" runat="server" />
                                            <asp:CalendarExtender ID="caldoj" runat="server" TargetControlID="txtdoj" Format="dd-MMM-yyyy"
                                                Enabled="True"></asp:CalendarExtender>

                                        </div>
                                        <div class="col-xl-2 mb-3" id="TDPendionallow" runat="server" visible="False">

                                            <asp:Label ID="lblpensionallow" Text="Pension Allow" CssClass="label" runat="server" />

                                            <asp:DropDownList ID="DDpensionallow" CssClass="form-select" runat="server">
                                                <asp:ListItem Text="No" />
                                                <asp:ListItem Text="Yes" />
                                            </asp:DropDownList>

                                        </div>
                                        <div class="col-xl-2 mb-3">
                                            <asp:Label ID="Label24" Text="Over Time Allow" CssClass="label" runat="server" />
                                            <br />
                                            <asp:DropDownList ID="DDOvertimeallow" CssClass="form-select" runat="server">
                                                <asp:ListItem Text="No" />
                                                <asp:ListItem Text="Yes" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-xl-2 mb-3">
                                            <asp:Label ID="Label25" Text="Staff Type" CssClass="label" runat="server" />
                                            <br />
                                            <asp:DropDownList ID="DDstafftype" CssClass="form-select" runat="server">
                                                <asp:ListItem Text="P" />
                                                <asp:ListItem Text="T" />
                                                <asp:ListItem Text="D" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label26" Text="Emp A/C No." CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtempacno" CssClass="form-control" runat="server" />

                                        </div>
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label27" Text="IP No." CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtIPno" CssClass="form-control" runat="server" />

                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label32" Text="Employee Group" CssClass="label" runat="server" />

                                            <asp:DropDownList ID="DDempgroup" CssClass="form-select" runat="server">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnaddgroup" runat="server" CssClass="btn btn-lg btn-danger" OnClientClick="Addgroupmaster();"
                                                Text="+" ToolTip="Add New Group" />
                                            <asp:Button ID="refreshgrouponemployee" runat="server" Style="display: none" OnClick="refreshgrouponemployee_Click" />

                                        </div>


                                    </div>




                                </fieldset>
                                <fieldset>
                                    <legend>
                                        <asp:Label ID="lblbankdetail" Text="Bank Detail" CssClass="labelbold" runat="server" />
                                    </legend>
                                    <div class="row">
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label28" Text="Bank Name" CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server" />

                                        </div>
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label29" Text="Branch Name" CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server" />

                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label30" Text="IFSC Code" CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server" />

                                        </div>
                                        <div class="col-xl-4 mb-3">

                                            <asp:Label ID="Label31" Text="A/C No." CssClass="label" runat="server" />

                                            <asp:TextBox ID="txtacno" CssClass="form-control" runat="server" />

                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12 mb-3">
                                            <asp:Label ID="lblsubdoc" BackColor="LightYellow" Font-Bold="True" Text="Submitted Documents"
                                                runat="server" />
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12 mb-3">
                                            <div style="overflow: scroll; max-height: 200px; width: 250PX">
                                                <asp:CheckBoxList ID="chkdocuments" CssClass="checkboxbold" runat="server">
                                                </asp:CheckBoxList>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12 mb-3">
                                            <asp:Label ID="lblstaff" Text="Staff : P=Permanent, T=Temporary, D=Daily Wages" BackColor="LightYellow"
                                                Font-Bold="True" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                </fieldset>


                            </div>
                        </div>
                    </div>


                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>

        <div class="card mb-3">
            <div class="card-body">

                <div class="row">
                    <div class="col-xl-12 mb-3">
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="false"
                            ShowSummary="true" Font-Bold="true" Font-Italic="true" Font-Names="Times new Roman"
                            Font-Overline="false" ForeColor="Red" />
                    </div>

                </div>
                <div class="row">
                    <div class="col-xl-12 mb-3">
                        <asp:Label ID="lblErr" runat="server" CssClass="errormsg" ForeColor="Red"></asp:Label>
                        <asp:Button CssClass="btn btn-lg btn-danger" ID="btnSave" runat="server" OnClientClick="return validate();"
                            OnClick="btnSave_Click" Width="70px" Text="Save" ValidationGroup="s" />
                        <asp:Button CssClass="btn btn-lg btn-danger" ID="btnCancel" runat="server" OnClick="btnCancel_Click"
                            Text="Clear" />
                        <asp:Button CssClass="btn btn-lg btn-danger" ID="Button2" runat="server" OnClick="Button2_Click"
                            Text="Preview" />
                        <asp:Button CssClass="btn btn-lg btn-danger" ID="btnclose" runat="server" Text="Close" OnClientClick="return CloseForm();" />
                        <%-- <asp:Button CssClass="btn btn-lg btn-danger" ID="btnclose" runat="server" Text="Close" OnClientClick="return CloseForm();" OnClick="btnclose_Click" />--%>
                        <asp:Button CssClass="btn btn-lg btn-danger" ID="addloom" runat="server" Text="ADDLOOM" OnClientClick="Addloom();"
                            ToolTip="click for add new loom master" />
                        <asp:Button ID="btnidentitycardpdf" Text="I-Card PDF" CssClass="btn btn-lg btn-danger" runat="server"
                            OnClick="btnidentitycardpdf_Click" />
                        <asp:Button ID="btnallidentitycard" Text="I-Card JPG" CssClass="btn btn-lg btn-danger" runat="server"
                            OnClick="btnallidentitycard_Click" />
                    </div>

                </div>

                <div class="row">
                    <div class="col-xl-12 mb-3">
                        <asp:TextBox ID="txtempcode_identitycard" Width="300px" TextMode="MultiLine" runat="server"
                            placeholder="Type Card No. Comma Separated to Print Identity card for more than one card No." />
                    </div>

                </div>

            </div>

        </div>




    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSave" />
        <asp:PostBackTrigger ControlID="Button2" />
    </Triggers>
</asp:UpdatePanel>



<script type="text/javascript">


/*    alert("Test");*/
    function report() {
        window.open('../../ReportViewer.aspx', '');
    }
    function EmpSelected(source, eventArgs) {
        document.getElementById('<%=txtgetvalue.ClientID %>').value = eventArgs.get_value();
    }
    function AddDepartment() {
        window.open('AddDepartment.aspx', '', 'Height=400px,width=600px');
    }
    function Addgroupmaster() {
        window.open('../Payroll/AddGroupMaster.aspx', '', 'Height=350px,width=500px');
    }
    function Addloom() {
        var answer = confirm("Do you want to ADD?")
        if (answer) {
            var a = document.getElementById('<%=txtEmpId.ClientID %>').value;
            if (a == "" || a == "0") {
                alert('Plz Select or Insert Employee');
                return false;
            }

            var left = (screen.width / 2) - (1225 / 2);
            var top = (screen.height / 2) - (500 / 2);

            //                window.open('FrmLoommaster.aspx?a=' + a, '', 'width=1125px,Height=200px');
            window.open('FrmLoommaster.aspx?a=' + a, 'ADD LOOM MASTER', 'width=1225px, height=500px, top=' + top + ', left=' + left);


        }
    }
    function VendorItemDetail() {
        var answer = confirm("Do you want to SHOW?")

        if (answer) {
            //                var a = document.getElementById('txtEmpId').value;
            //                if (a == "" || a == "0") {
            //                    alert('Plz Select or Insert Employee');
            //                    return false;
            //                }

            var left = (screen.width / 2) - (500 / 2);
            var top = (screen.height / 2) - (400 / 2);


            //                window.open('FrmLoommaster.aspx?a=' + a, '', 'width=1125px,Height=200px');
            window.open('FrmVendor_Item_Search.aspx', 'VENDOR ITEM DETAIL', 'width=550px, height=400px, top=' + top + ', left=' + left);
        }
    }

    function Checkforitem() {
        if (document.getElementById('<%=chkforitem.ClientID %>').checked) {
            var answer = confirm("Do you want to ADD?")

            if (answer) {
                var a = document.getElementById('<%=txtEmpId.ClientID %>').value;
                if (a == "" || a == "0") {
                    alert('Plz Select or Insert Employee');
                    return false;
                }

                var left = (screen.width / 2) - (500 / 2);
                var top = (screen.height / 2) - (400 / 2);

                //                window.open('FrmLoommaster.aspx?a=' + a, '', 'width=1125px,Height=200px');
                window.open('frmitemspecification.aspx?a=' + a, 'ADD Item ', 'width=550px, height=400px, top=' + top + ', left=' + left);


            }
        }
    }
    function CheckforitemRate() {
        if (document.getElementById('<%=chkvendorrate.ClientID %>').checked) {
            var answer = confirm("Do you want to ADD?")

            if (answer) {
                var a = document.getElementById('<%=txtEmpId.ClientID %>').value;
                if (a == "" || a == "0") {
                    alert('Plz Select or Insert Employee');
                    return false;
                }

                var left = (screen.width / 2) - (500 / 2);
                var top = (screen.height / 2) - (400 / 2);

                //                window.open('FrmLoommaster.aspx?a=' + a, '', 'width=1125px,Height=200px');
                window.open('frmvendorwiserate.aspx?vid=' + a, 'ADD Item ', 'width=850px, height=400px, top=' + top + ', left=' + left);


            }
        }
    }

    function CloseForm() {

        var objParent = window.opener;
        if (objParent != null) {
            if (window.opener.document.getElementById('CPH_Form_refreshEmp2')) {
                window.opener.document.getElementById('CPH_Form_refreshEmp2').click();
                self.close();
            }
            else if (window.opener.document.getElementById('refreshEmp')) {
                window.opener.document.getElementById('refreshEmp').click();
                self.close();
            }
            else if (window.opener.document.getElementById('CPH_Form_refreshEmployee')) {
                window.opener.document.getElementById('CPH_Form_refreshEmployee').click();
                self.close();
            }

        }
        else {
            window.location.href = "../../main.aspx";
        }
    }

    function validate() {
        if (document.getElementById('<%=DDDepartment.ClientID %>').options.length == 0) {
            alert("Department Must have a vlaue");
            document.getElementById('<%=DDDepartment.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%=DDDepartment.ClientID %>').selectedIndex == 0) {
            alert("Plz Select Department");
            document.getElementById('<%=DDDepartment.ClientID %>').focus();
            return false;
        }
        if (document.getElementById('<%=txtEmpName.ClientID %>').value == "") {
            alert("Plz Enter Employee Name");
            document.getElementById('<%=txtEmpName.ClientID %>').focus();
            return false;
        }
        return confirm('Do you Want to Save?');
    }
</script>

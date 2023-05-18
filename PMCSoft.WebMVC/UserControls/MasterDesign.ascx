<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="UserControls_MasterDesign" CodeBehind="MasterDesign.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>






<asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>

        <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-4 mb-3">
                        <asp:TextBox ID="txtid" runat="server" Visible="False"></asp:TextBox>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xl-4 mb-5">
                        <asp:TextBox ID="txtsearchdesign" runat="server" CssClass="form-control" placeholder="Enter design to search"
                            AutoPostBack="true" onKeyDown="KeyDownHandler('btnsearch');"></asp:TextBox>
                        <asp:Button ID="btnsearch" runat="server" Style="display: none" OnClick="txtsearchdesign_TextChanged" />

                    </div>
                </div>

                <div class="row">

                    <div class="col-xl-4 mb-3">

                        <asp:Label ID="lbldesignname" runat="server" Text="DesignName" CssClass="label"></asp:Label>

                        <asp:TextBox ID="txtDesign" runat="server" CssClass="form-control" ValidationGroup="a" required></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Design Name"
                            ControlToValidate="txtDesign" ValidationGroup="a" ForeColor="Red">*</asp:RequiredFieldValidator>

                    </div>
                    <div class="col-xl-4 mb-3">
                        <asp:Label ID="lblDesignCode" runat="server" Text="DesignCode" CssClass="label"></asp:Label>
                        <asp:TextBox ID="txtDesignCode" runat="server" CssClass="form-control" ValidationGroup="a"></asp:TextBox>
                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Design Code"
                            ControlToValidate="txtDesignCode" ValidationGroup="a" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-12 mb-3">

                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-danger preview_width" OnClick="Button1_Click"
                            Text="Preview" UseSubmitBehavior="False" />
                        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-lg btn-danger" OnClientClick="return confirm('Do you want to save data?')"
                            OnClick="btnsave_Click" ValidationGroup="a" />
                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-lg btn-danger" Text="Close" OnClientClick="closeForm();"
                            UseSubmitBehavior="False" />
                        <asp:Button ID="btndelete" runat="server" Text="Delete" OnClientClick="return confirm('Do you want to Delete data?')"
                            CssClass="btn btn-lg btn-danger" OnClick="btndelete_Click" Visible="False" />

                    </div>

                </div>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-12 mb-3">

                        <asp:Label ID="Lblerr" runat="server" ForeColor="Red"></asp:Label>

                        <asp:GridView ID="gdDesign" runat="server" AllowPaging="True" PageSize="30"
                            AutoGenerateColumns="false" DataKeyNames="Sr_No" OnPageIndexChanging="gdDesign_PageIndexChanging"
                            OnRowDataBound="gdDesign_RowDataBound" OnSelectedIndexChanged="gdDesign_SelectedIndexChanged"
                            OnInit="gdDesign_Init" CssClass="table table-bordered table-striped">
                            <HeaderStyle CssClass="gvheaders" />
                            <AlternatingRowStyle CssClass="gvalts" />
                            <RowStyle CssClass="gvrow" />
                            <PagerStyle CssClass="PagerStyle" />
                            <EmptyDataRowStyle CssClass="gvemptytext" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr No">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Design Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesign" Text='<%#Bind("DesignName") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Design Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignCode" Text='<%#Bind("DesignCode") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                    </div>

                </div>

            </div>
        </div>





    </ContentTemplate>
</asp:UpdatePanel>





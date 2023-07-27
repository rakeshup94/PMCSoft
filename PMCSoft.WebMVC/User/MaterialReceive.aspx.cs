using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
 
using PMCSoft.Infrastructure.Data;
namespace PMCSoft.Web.User
{
    public partial class MaterialReceive : BasePage
    {
        BALPMC PMC = new BALPMC();
        string AListID = string.Empty;

        DataTable DT = new DataTable();
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProject();
            }

        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                //BindGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindGetVendorID(ddlVendor, ddlProject.SelectedValue.ToString());
                Hashtable ht = new Hashtable();
                ht.Add("@FValue", ddlProject.SelectedValue.ToString());
                ATCommon.FillDrpDown(DdlReceivedBy, PMCApp.Get(ht, "GetStaffMaster"), "Select", "EmpName", "EmpID", "0");

                BindGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlVendor_SelectedIndexChanged(object sender, EventArgs e)
        {
            // BindGrid();
            Hashtable ht = new Hashtable();
            ht.Add("@VendorID", ddlVendor.SelectedValue);
            ht.Add("@CompanyID", Session["CompID"]);

            DataTable dt = PMCApp.Get(ht, "GetVandOrAddress");
            if (dt.Rows.Count > 0)
            {
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
            }
        }

        protected void DdlReceivedBy_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        public void BindGrid()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("SNo", typeof(int)));
            dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
            dt.Columns.Add(new DataColumn("Unit", typeof(string)));
            dt.Columns.Add(new DataColumn("Qty", typeof(string)));
            dt.Columns.Add(new DataColumn("Rate", typeof(string)));
            dt.Columns.Add(new DataColumn("Remark", typeof(string)));
            dr = dt.NewRow();
            dr["SNo"] = 1;
            dr["ItemCode"] = string.Empty;
            dr["ItemName"] = string.Empty;
            dr["Unit"] = string.Empty;
            dr["Qty"] = string.Empty;
            dr["Rate"] = string.Empty;
            dr["Remark"] = string.Empty;
            dt.Rows.Add(dr);

            Session["Detail"] = dt;
            GVMaterialReceive.DataSource = dt;
            GVMaterialReceive.DataBind();
        }
        protected void GVMaterialReceive_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlItemCode = e.Row.FindControl("ddlItemCode") as DropDownList;
                    DropDownList ddlItemName = e.Row.FindControl("ddlItemName") as DropDownList;
                    DropDownList ddlUnit = e.Row.FindControl("ddlUnit") as DropDownList;

                    // PMC.BindGetGroupDDL(ddlItemCode);
                    DataTable dt = (DataTable)PMC.BindItemGroup();
                    if (dt.Rows.Count > 0)
                    {
                        ddlItemCode.DataSource = dt;
                        ddlItemCode.DataTextField = "GroupName";
                        ddlItemCode.DataValueField = "ItemGroupID";
                        ddlItemCode.DataBind();
                        ddlItemCode.Items.Insert(0, new ListItem("Select Item Group", "-1"));
                        ddlItemName.Items.Insert(0, new ListItem("Select Item", "-1"));
                        ddlUnit.Items.Insert(0, new ListItem("Select Unit", "-1"));
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlItemCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {


                GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;
                DropDownList ddl = (DropDownList)sender;
                DropDownList ddlsecond = gvr.FindControl("ddlItemName") as DropDownList;
                // So in this you can get second drodpdown and bind your data

                ddlsecond.DataSource = PMC.BindItemName(ddl.SelectedValue);
                ddlsecond.DataTextField = "ItemName";
                ddlsecond.DataValueField = "ItemID";
                ddlsecond.DataBind();
                ddlsecond.Items.Insert(0, new ListItem("Select Item", "-1"));

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void ddlItemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;
                DropDownList ddl = (DropDownList)sender;
                DropDownList ddlsecond = gvr.FindControl("ddlUnit") as DropDownList;
                // So in this you can get second drodpdown and bind your data

                ddlsecond.DataSource = PMC.BindUnitName(ddl.SelectedValue);
                ddlsecond.DataTextField = "UnitName";
                ddlsecond.DataValueField = "UnitID";
                ddlsecond.DataBind();
                ddlsecond.Items.Insert(0, new ListItem("Select Unit", "-1"));

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0, check7 = 0;
                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemCode");
                    if (ddlItemCode.SelectedValue == "-1")
                    {
                        check = 1;
                        break;
                    }

                }
                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemName");
                    if (ddlItemName.SelectedValue == "0")
                    {
                        check1 = 1;
                        break;
                    }

                }
                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlUnit");
                    if (ddlUnit.SelectedValue == "-1")
                    {
                        check2 = 1;
                        break;
                    }

                }

                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtQuantity");
                    if (txtQuantity.Text == "")
                    {
                        check3 = 1;
                        break;
                    }
                    else
                    {
                        check3 = 0;
                    }

                }
                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    TextBox txtRate = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRate");
                    if (txtRate.Text == "")
                    {
                        check4 = 1;
                        break;
                    }
                    else
                    {
                        check4 = 0;
                    }

                }
                for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                {
                    TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRemarks");
                    if (txtRemarks.Text == "")
                    {
                        check5 = 1;
                        break;
                    }
                    else
                    {
                        check5 = 0;
                    }

                }
                if (ddlProject.SelectedValue != "-1")
                {
                    if (ddlVendor.SelectedValue != "-1")
                    {
                        if (TxtGateEntryNo.Text != "")
                        {
                            if (TxtPoNo.Text != "")
                            {
                                if (TxtPOdate.Text != "")
                                {
                                    if (TxtReceivedDate.Text != "")
                                    {
                                        if (DdlReceivedBy.SelectedValue != "0")
                                        {
                                            if (TxtBillChallanNo.Text != "")
                                            {
                                                if (TxtBillChallanDate.Text != "")
                                                {
                                                    if (check == 0)
                                                    {
                                                        if (check1 == 0)
                                                        {
                                                            if (check2 == 0)
                                                            {
                                                                if (check3 == 0)
                                                                {
                                                                    if (check4 == 0)
                                                                    {
                                                                        if (check5 == 0)
                                                                        {
                                                                            PMC.GetMaxIDForMaterialReceiveFunction(Session["CompID"].ToString(), out ItemID);
                                                                            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                                                                            {
                                                                                DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemCode");
                                                                                DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemName");
                                                                                DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlUnit");

                                                                                TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtQuantity");
                                                                                TextBox txtRate = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRate");
                                                                                TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRemarks");

                                                                                Hashtable ht = new Hashtable();
                                                                                ht.Add("@CompanyId", Session["CompID"].ToString());
                                                                                ht.Add("@MaterialReceiveId", ItemID.ToString());
                                                                                ht.Add("@ProjectId", ddlProject.SelectedValue);
                                                                                ht.Add("@Gate_Entry_No", TxtGateEntryNo.Text);
                                                                                ht.Add("@PO_No", TxtPoNo.Text);
                                                                                ht.Add("@PO_Date", TxtPOdate.Text);
                                                                                ht.Add("@Received_Date", TxtReceivedDate.Text);
                                                                                ht.Add("@Received_By", DdlReceivedBy.SelectedValue);
                                                                                ht.Add("@Vendor_ID", ddlVendor.SelectedValue);
                                                                                ht.Add("@Bill_Challan_No", TxtBillChallanNo.Text);
                                                                                ht.Add("@Bill_Challan_Date", TxtBillChallanDate.Text);
                                                                                ht.Add("@ItemGroupID", ddlItemCode.SelectedValue);
                                                                                ht.Add("@ItemID", ddlItemName.SelectedValue);
                                                                                ht.Add("@UnitID", ddlUnit.SelectedValue);
                                                                                ht.Add("@Item_Quantity", txtQuantity.Text);
                                                                                ht.Add("@Item_Rate", txtRate.Text);
                                                                                ht.Add("@Item_Remarks", txtRemarks.Text);
                                                                                ht.Add("@CreatedBy", Session["UserId"].ToString());
                                                                                ht.Add("@ModifiedBy", Session["UserId"].ToString());
                                                                                PMCApp.Get(ht, "InsertSumQtyOeningStockAndMaterialReceive");


                                                                            }
                                                                            string scripts = "alert('Insert Successfully .');";
                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                            ddlProject.SelectedValue = "-1"; ddlVendor.SelectedValue = "-1"; txtAddress.Text = ""; TxtGateEntryNo.Text = ""; TxtPoNo.Text = ""; TxtPOdate.Text = ""; DdlReceivedBy.SelectedValue = "0"; TxtReceivedDate.Text = ""; TxtBillChallanNo.Text = ""; TxtBillChallanDate.Text = "";
                                                                            BindGrid();
                                                                        }
                                                                        else
                                                                        {
                                                                            string scripts = "alert('Kindly Select Remarks. ');";
                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                        }
                                                                    }
                                                                    else
                                                                    {
                                                                        string scripts = "alert('Kindly Select Rate. ');";
                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    string scripts = "alert('Kindly Select Quantity. ');";
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                }
                                                            }
                                                            else
                                                            {
                                                                string scripts = "alert('Kindly Select Unit. ');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            string scripts = "alert('Kindly Select Item Name. ');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                    }
                                                    else
                                                    {
                                                        string scripts = "alert('Kindly Select Item Code. ');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                    }
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly Select Challan Date. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly Select ChallanNo. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly Select Received By. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Select Received Date. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly Select PO. Date. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly Select PO.No. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Select Gate Entry No. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }

                    }
                    else
                    {
                        string scripts = "alert('Kindly Select Vendor. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Select Project. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnAddMore_Click(object sender, EventArgs e)
        {

            TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtQuantity");
            TextBox txtRate = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtRate");
            TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtRemarks");

            if (txtQuantity.Text == "" || txtRate.Text == "" || txtRemarks.Text == "")
            {
                string scripts = "alert('please fill all the Boxes then click ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            else
            {
                AddMore();
            }




        }



        private void AddMore()
        {
            try
            {
                DataTable DL = new DataTable();
                DataTable Dlitem = new DataTable();
                DataTable Dlqty = new DataTable();
                DataRow dr1 = null;
                DataRow dr2 = null;
                DataRow dr3 = null;

                int x;
                if (Session["Detail"] != null)
                {
                    DataTable dt = (DataTable)Session["Detail"];

                    DataRow dr = null;
                    dt.Clear();
                    for (int i = 0; i < GVMaterialReceive.Rows.Count; i++)
                    {
                        DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlItemCode");
                        DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlItemName");
                        DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlUnit");

                        TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtQuantity");
                        TextBox txtRate = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtRate");
                        TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtRemarks");

                        dr = dt.NewRow();

                        dr["SNo"] = i + 1;
                        dr["ItemCode"] = ddlItemCode.SelectedItem.Text;
                        dr["ItemName"] = ddlItemName.SelectedItem.Text;
                        dr["Unit"] = ddlUnit.SelectedItem.Text;
                        dr["Qty"] = txtQuantity.Text;
                        dr["Rate"] = txtRate.Text;
                        dr["Remark"] = txtRemarks.Text;
                        dt.Rows.Add(dr);

                        GetDL(i);

                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlItemCode.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlItemCode.Items[x].Text.ToString();
                            dr1["Id"] = ddlItemCode.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }
                        ViewState["DL" + i.ToString()] = DL;
                        //    GetRBL(i);
                        //    Dlitem = ViewState["RBL" + i.ToString()] as DataTable;

                        //    for (x = 0; x < ddlItemName.Items.Count; x++)
                        //    {
                        //        dr2 = Dlitem.NewRow();
                        //        dr2["Text"] = ddlItemName.Items[x].Text.ToString();
                        //        dr2["Id"] = ddlItemName.Items[x].Value.ToString();
                        //        Dlitem.Rows.Add(dr2);
                        //    }
                        //    ViewState["RBL" + i.ToString()] = Dlitem;
                        //    Getddlunit(i);
                        //    Dlqty = ViewState["ddlunitdt" + i.ToString()] as DataTable;

                        //    for (x = 0; x < ddlUnit.Items.Count; x++)
                        //    {
                        //        dr3 = Dlqty.NewRow();
                        //        dr3["Text"] = ddlUnit.Items[x].Text.ToString();
                        //        dr3["Id"] = ddlUnit.Items[x].Value.ToString();
                        //        Dlqty.Rows.Add(dr3);
                        //    }
                        //    ViewState["ddlunitdt" + i.ToString()] = Dlqty;
                    }

                    dr = dt.NewRow();


                    dr["SNo"] = dt.Rows.Count + 1;
                    dr["ItemCode"] = string.Empty;
                    dr["ItemName"] = string.Empty;
                    dr["Unit"] = string.Empty;
                    dr["Qty"] = string.Empty;
                    dr["Rate"] = string.Empty;
                    dr["Remark"] = string.Empty;
                    dt.Rows.Add(dr);
                    Session["Detail"] = dt;
                    GVMaterialReceive.DataSource = dt;
                    GVMaterialReceive.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)GVMaterialReceive.Rows[t].FindControl("lblSNo");
                        DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlItemCode");
                        DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlItemName");
                        DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlUnit");

                        TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtQuantity");
                        TextBox txtRate = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtRate");
                        TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtRemarks");
                        ddlItemCode.Items.FindByText(dt.Rows[t]["ItemCode"].ToString()).Selected = true;
                        //DataTable ICode = ViewState["RBL" + t.ToString()] as DataTable;

                        //ddlItemName.DataTextField = ICode.Columns["Text"].ColumnName;
                        //ddlItemName.DataValueField = ICode.Columns["Id"].ColumnName;
                        //ddlItemName.DataSource = ICode;
                        //ddlItemName.DataBind();
                        ddlItemName.DataSource = PMC.BindItemName(ddlItemCode.SelectedValue);
                        ddlItemName.DataTextField = "ItemName";
                        ddlItemName.DataValueField = "ItemID";
                        ddlItemName.DataBind();
                        ddlItemName.Items.Insert(0, new ListItem("Select Item", "-1"));
                        //ddlItemName.Items.FindByText(dt.Rows[t]["Branch"].ToString()).Selected = true;
                        ddlItemName.Items.FindByText(dt.Rows[t]["ItemName"].ToString()).Selected = true;
                        //Hashtable ht = new Hashtable();
                        //ht.Add("@ItemGroupID", ddlItemName.SelectedValue);
                        //DataTable dt1 = PMCApp.Get(ht, "GetitemValue");
                        //ddlItemName.DataSource = dt1;
                        ddlUnit.DataSource = PMC.BindUnitName(ddlItemName.SelectedValue);
                        ddlUnit.DataTextField = "UnitName";
                        ddlUnit.DataValueField = "UnitID";
                        ddlUnit.DataBind();
                        ddlUnit.Items.Insert(0, new ListItem("Select Unit", "-1"));
                        //ddlItemName.Items.FindByText(dt.Rows[t]["Branch"].ToString()).Selected = true;
                        ddlUnit.Items.FindByText(dt.Rows[t]["Unit"].ToString()).Selected = true;

                        //DataTable IUnit = ViewState["ddlunitdt" + t.ToString()] as DataTable;

                        //ddlUnit.DataTextField = IUnit.Columns["Text"].ColumnName;
                        //ddlUnit.DataValueField = IUnit.Columns["Id"].ColumnName;
                        //ddlUnit.DataSource = IUnit;
                        //ddlUnit.DataBind();
                        //ddlUnit.Items.FindByText(dt.Rows[t]["Unit"].ToString()).Selected = true;


                        //DropDownList ddlVendor = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlVendor");
                        //DropDownList ddlbank = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlBank");
                        //DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlBranch");
                        //TextBox txtchequeNo = (TextBox)grvProjectDetails.Rows[t].FindControl("txtChequeNo");
                        //TextBox txtAmount = (TextBox)grvProjectDetails.Rows[t].FindControl("txtAmount");
                        //TextBox txtIssuDate = (TextBox)grvProjectDetails.Rows[t].FindControl("txtIssueDate");

                        //ddlVendor.Items.FindByText(dt.Rows[t]["Vendor"].ToString()).Selected = true;
                        //ddlbank.Items.FindByText(dt.Rows[t]["Bank"].ToString()).Selected = true;
                        //ddlBranch.DataSource = PMC.BindBranchName(ddlbank.SelectedValue);
                        //ddlBranch.DataTextField = "BranchName";
                        //ddlBranch.DataValueField = "BranchID";
                        //ddlBranch.DataBind();
                        //ddlBranch.Items.FindByText(dt.Rows[t]["Branch"].ToString()).Selected = true;
                        //txtchequeNo.Text = dt.Rows[t]["ChequeNo"].ToString();
                        //txtAmount.Text = dt.Rows[t]["Amount"].ToString();
                        //txtIssuDate.Text = dt.Rows[t]["IssueDate"].ToString();

                        txtQuantity.Text = dt.Rows[t]["Qty"].ToString();
                        txtRate.Text = dt.Rows[t]["Rate"].ToString();
                        txtRemarks.Text = dt.Rows[t]["Remark"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private void GetDL(int i)
        {
            try
            {
                DataTable DL = new DataTable();
                DL.Columns.Add(new DataColumn("Text", typeof(string)));
                DL.Columns.Add(new DataColumn("Id", typeof(string)));
                ViewState["DL" + i.ToString()] = DL;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private void Getddlunit(int i)
        {
            try
            {
                DataTable ddlunitdt = new DataTable();
                ddlunitdt.Columns.Add(new DataColumn("Text", typeof(string)));
                ddlunitdt.Columns.Add(new DataColumn("Id", typeof(string)));
                ViewState["ddlunitdt" + i.ToString()] = ddlunitdt;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private void GetRBL(int i)
        {
            try
            {
                DataTable datatableRBL = new DataTable();
                datatableRBL.Columns.Add(new DataColumn("Text", typeof(string)));
                datatableRBL.Columns.Add(new DataColumn("Id", typeof(string)));
                ViewState["RBL" + i.ToString()] = datatableRBL;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }

    }
}
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
    public partial class AdvanceRequisition : BasePage
    {
         ();
        string AListID = string.Empty;

        DataTable DT = new DataTable();
        string ItemID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProject();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindGrid()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("SNo", typeof(int)));
            dt.Columns.Add(new DataColumn("Type", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dt.Columns.Add(new DataColumn("Resion", typeof(string)));
            dt.Columns.Add(new DataColumn("Security", typeof(string)));
            dt.Columns.Add(new DataColumn("SecurityDDl", typeof(string)));
            dr = dt.NewRow();
            dr["SNo"] = 1;
            dr["Type"] = string.Empty;
            dr["Amount"] = string.Empty;
            dr["Resion"] = string.Empty;
            dr["Security"] = string.Empty;
            dr["SecurityDDl"] = string.Empty;
            dt.Rows.Add(dr);

            Session["Detail"] = dt;
            GVAdvanceReQuisition.DataSource = dt;
            GVAdvanceReQuisition.DataBind();
        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PMC.BindGetVendorID(ddlVendor, ddlProject.SelectedValue.ToString());
        }
        protected void ddlVendor_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
            Hashtable ht = new Hashtable();
            ht.Add("@VendorID", ddlVendor.SelectedValue);
            ht.Add("@CompanyID", Session["CompID"]);

            DataTable dt = PMCApp.Get(ht, "GetVandOrAddress");
            if (dt.Rows.Count > 0)
            {
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
            }
        }
        protected void GVAdvanceReQuisition_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlIW = e.Row.FindControl("ddltypeofpayment") as DropDownList;

                    DropDownList ddlSecurity = e.Row.FindControl("ddlSecurity") as DropDownList;
                    PMC.BindTypeAdvanceRequisition(ddlIW);

                    Hashtable HT = new Hashtable();
                    HT.Add("@CompanyID", Session["CompID"].ToString());
                    ATCommon.FillDrpDown(ddlSecurity, PMCApp.Get(HT, "GetSecurityAdvanceRequisition"), "Select Security", "PaymentSecurity", "SecurityID", "0");
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
            AddMore();
        }
        private void AddMore()
        {
            try
            {
                DataTable DL = new DataTable();
                DataRow dr1 = null;
                int x;
                if (Session["Detail"] != null)
                {
                    DataTable dt = (DataTable)Session["Detail"];

                    DataRow dr = null;
                    dt.Clear();
                    for (int i = 0; i < GVAdvanceReQuisition.Rows.Count; i++)
                    {
                        Label lblSNo = (Label)GVAdvanceReQuisition.Rows[i].FindControl("lblSNo");
                        DropDownList ddltypeofpayment = (DropDownList)GVAdvanceReQuisition.Rows[i].FindControl("ddltypeofpayment");
                        TextBox txtAmount = (TextBox)GVAdvanceReQuisition.Rows[i].FindControl("txtAmount");
                        TextBox txtReason = (TextBox)GVAdvanceReQuisition.Rows[i].FindControl("txtReason");
                        RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[i].FindControl("rbl");
                        DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[i].FindControl("ddlSecurity");
                        dr = dt.NewRow();

                        dr["SNo"] = i + 1;
                        dr["Type"] = ddltypeofpayment.SelectedItem.Text;
                        dr["Amount"] = txtAmount.Text;
                        dr["Resion"] = txtReason.Text;
                        dr["Security"] = rbl.SelectedItem.Text;
                        dr["SecurityDDl"] = ddlSecurity.SelectedItem.Text;


                        dt.Rows.Add(dr);

                        GetDL(i);

                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddltypeofpayment.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddltypeofpayment.Items[x].Text.ToString();
                            dr1["Id"] = ddltypeofpayment.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }
                        ViewState["RBL" + i.ToString()] = DL;
                        GetRBL(i);
                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlSecurity.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlSecurity.Items[x].Text.ToString();
                            dr1["Id"] = ddlSecurity.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }
                        ViewState["DL" + i.ToString()] = DL;
                    }

                    dr = dt.NewRow();

                    dr["SNo"] = dt.Rows.Count + 1;
                    dr["Type"] = string.Empty;
                    dr["Amount"] = string.Empty;
                    dr["Resion"] = string.Empty;
                    dr["Security"] = string.Empty;
                    dr["SecurityDDl"] = string.Empty;
                    dt.Rows.Add(dr);
                    Session["Detail"] = dt;
                    GVAdvanceReQuisition.DataSource = dt;
                    GVAdvanceReQuisition.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)GVAdvanceReQuisition.Rows[t].FindControl("lblSNo");
                        DropDownList ddltypeofpayment = (DropDownList)GVAdvanceReQuisition.Rows[t].FindControl("ddltypeofpayment");
                        TextBox txtAmount = (TextBox)GVAdvanceReQuisition.Rows[t].FindControl("txtAmount");
                        TextBox txtReason = (TextBox)GVAdvanceReQuisition.Rows[t].FindControl("txtReason");
                        RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[t].FindControl("rbl");
                        DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[t].FindControl("ddlSecurity");
                        txtReason = (TextBox)GVAdvanceReQuisition.Rows[t].FindControl("txtReason");
                        ddltypeofpayment.Items.FindByText(dt.Rows[t]["Type"].ToString()).Selected = true;
                        ddlSecurity.Items.FindByText(dt.Rows[t]["SecurityDDl"].ToString()).Selected = true;
                        rbl.Items.FindByText(dt.Rows[t]["Security"].ToString()).Selected = true;
                        if (rbl.SelectedValue == "1")
                        {
                            ddlSecurity.Enabled = true;
                            if (dt.Rows.Count > 0)
                            {
                                ddlSecurity.SelectedItem.Text = dt.Rows[t]["SecurityDDl"].ToString();
                            }

                        }
                        if (rbl.SelectedValue == "2")
                        {
                            if (dt.Rows.Count > 0)
                            {
                                ddlSecurity.Enabled = false;
                            }
                        }
                        txtAmount.Text = dt.Rows[t]["Amount"].ToString();
                        txtReason.Text = dt.Rows[t]["Resion"].ToString();
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
        private void GetRBL(int i)
        {
            try
            {
                DataTable RBL = new DataTable();
                RBL.Columns.Add(new DataColumn("Text", typeof(string)));
                RBL.Columns.Add(new DataColumn("Id", typeof(string)));
                ViewState["RBL" + i.ToString()] = RBL;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < GVAdvanceReQuisition.Rows.Count; i++)
                {

                    RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[i].FindControl("rbl");
                    DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[i].FindControl("ddlSecurity");
                    Button btnAdvanceRequisitionAddNewSecurity = (Button)GVAdvanceReQuisition.Rows[i].FindControl("btnAdvanceRequisitionAddNewSecurity");
                    if (rbl.SelectedValue == "1")
                    {
                        ddlSecurity.Enabled = true;
                        btnAdvanceRequisitionAddNewSecurity.Enabled = true;

                    }
                    if (rbl.SelectedValue == "2")
                    {

                        ddlSecurity.Enabled = false;
                        btnAdvanceRequisitionAddNewSecurity.Enabled = false;
                    }
                }
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
                int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0;
                for (int j = 0; j < GVAdvanceReQuisition.Rows.Count; j++)
                {
                    DropDownList ddltypeofpayment = (DropDownList)GVAdvanceReQuisition.Rows[j].FindControl("ddltypeofpayment");
                    if (ddltypeofpayment.SelectedValue == "-1")
                    {
                        check = 1;
                        break;
                    }
                    else
                    {
                        check = 0;
                    }
                }
                for (int j = 0; j < GVAdvanceReQuisition.Rows.Count; j++)
                {
                    TextBox txtAmount = (TextBox)GVAdvanceReQuisition.Rows[j].FindControl("txtAmount");
                    if (txtAmount.Text == "")
                    {
                        check1 = 1;
                        break;
                    }
                    else
                    {
                        check1 = 0;
                    }
                }
                for (int j = 0; j < GVAdvanceReQuisition.Rows.Count; j++)
                {
                    RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[j].FindControl("rbl");
                    if (rbl.SelectedValue == "")
                    {
                        check2 = 1;
                        break;
                    }
                }


                for (int j = 0; j < GVAdvanceReQuisition.Rows.Count; j++)
                {
                    RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[j].FindControl("rbl");
                    DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[j].FindControl("ddlSecurity");
                    if (rbl.SelectedValue == "1")
                    {
                        if (ddlSecurity.SelectedValue == "0")
                        {
                            check3 = 1;
                            break;
                        }


                    }
                    else if (rbl.SelectedValue == "2")
                    {
                        ddlSecurity.Enabled = false;
                    }
                }
                if (ddlProject.SelectedValue != "-1")
                {
                    if (ddlVendor.SelectedValue != "-1")
                    {




                        if (check == 0)
                        {
                            if (check1 == 0)
                            {

                                if (check2 == 0)
                                {
                                    if (check3 == 0)
                                    {

                                        for (int j = 0; j < GVAdvanceReQuisition.Rows.Count; j++)
                                        {
                                            DropDownList ddltypeofpayment = (DropDownList)GVAdvanceReQuisition.Rows[j].FindControl("ddltypeofpayment");
                                            RadioButtonList rbl = (RadioButtonList)GVAdvanceReQuisition.Rows[j].FindControl("rbl");
                                            DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[j].FindControl("ddlSecurity");
                                            TextBox txtAmount = (TextBox)GVAdvanceReQuisition.Rows[j].FindControl("txtAmount");
                                            TextBox txtReason = (TextBox)GVAdvanceReQuisition.Rows[j].FindControl("txtReason");
                                            PMC.GetMaxIDForAdvanceRequisitionFunction(Session["CompID"].ToString(), out ItemID);
                                            Hashtable ht = new Hashtable();
                                            ht.Add("@ARId", ItemID.ToString());
                                            ht.Add("@CompanyId", Session["CompID"].ToString());
                                            ht.Add("@ProjectId", ddlProject.SelectedValue);
                                            ht.Add("@VendorId", ddltypeofpayment.SelectedValue);

                                            ht.Add("@TypeId", ddlVendor.SelectedValue);
                                            ht.Add("@VendorAddress", txtAddress.Text);
                                            ht.Add("@AnysecurityCreated", rbl.SelectedItem.Text);
                                            ht.Add("@SecurityId", ddlSecurity.SelectedValue);
                                            ht.Add("@Amount", txtAmount.Text);
                                            ht.Add("@Reasion", txtReason.Text);
                                            ht.Add("@CreatedBy", Session["UserId"].ToString());
                                            PMCApp.Get(ht, "InsertAdvanceRequisition");

                                            string scripts = "alert('Insert Successfully .');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);

                                        }

                                        ddlProject.SelectedValue = "-1"; ddlVendor.SelectedValue = "-1"; txtAddress.Text = "";
                                        BindGrid();


                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Select  Security. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly Select  Any Security. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly Fill Amount. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Select Type Of Payment. ');";
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }
        protected void GVAdvanceReQuisition_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AdvanceRequisitionAddNew")
            {
                Button btn = (Button)e.CommandSource;
                Button btnAdvanceRequisitionAddNew = (Button)btn.Parent.FindControl("btnAdvanceRequisitionAddNew");


                ModalPopupExtender1.Show();
            }
            if (e.CommandName == "AdvanceRequisitionAddNewSecurity")
            {
                Button btn = (Button)e.CommandSource;
                Button AdvanceRequisitionAddNewSecurity = (Button)btn.Parent.FindControl("AdvanceRequisitionAddNewSecurity");


                ModalPopupExtender2.Show();
            }
        }
        protected void BtnTypeofAdvanceRequisitonAddNew_Click(object sender, EventArgs e)
        {

            try
            {
                if (txttypeofadvancerequisition.Text != "")
                {
                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@Type ", txttypeofadvancerequisition.Text);
                    DataTable DT = PMCApp.Get(ht1, "CheckTypeAdvanceRequisition  ");
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This type already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                    else
                    {
                        PMC.GetMaxIDForTypeAdvanceRequisitionFunction(Session["CompID"].ToString(), out ItemID);
                        Hashtable ht = new Hashtable();
                        ht.Add("@CompanyID", Session["CompID"].ToString());
                        ht.Add("@TypeTable", txttypeofadvancerequisition.Text);
                        ht.Add("@TypeId", ItemID.ToString());
                        ht.Add("@CreatedBy", Session["UserID"].ToString());

                        PMCApp.Get(ht, "InsertTypeAdvanceRequisition");
                        for (int i = 0; i < GVAdvanceReQuisition.Rows.Count; i++)
                        {
                            DropDownList ddltypeofpayment = (DropDownList)GVAdvanceReQuisition.Rows[i].FindControl("ddltypeofpayment");

                            PMC.BindTypeAdvanceRequisition(ddltypeofpayment);
                        }
                        txttypeofadvancerequisition.Text = "";

                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill type.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnCancelAddNewTypeOfAdvanceRequistion_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        protected void BtnSecurityAddNewSave_Click(object sender, EventArgs e)
        {

            try
            {
                if (txtsecurityadvancereq.Text != "")
                {
                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@PaymentSecurity ", txtsecurityadvancereq.Text);
                    DataTable DT = PMCApp.Get(ht1, "CheckSecurityAdvanceRequisition  ");
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This Security already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender2.Show();
                    }
                    else
                    {
                        PMC.GetMaxIDForSecurityAdvanceRequisitionFunction(Session["CompID"].ToString(), out ItemID);
                        Hashtable ht = new Hashtable();
                        ht.Add("@SecurityID", ItemID.ToString());
                        ht.Add("@CompanyID", Session["CompID"].ToString());
                        ht.Add("@PaymentSecurity", txtsecurityadvancereq.Text);
                        ht.Add("@CreatedBy", Session["UserId"].ToString());


                        PMCApp.Get(ht, "InsertSecurityAdvanceRequisition");
                        for (int i = 0; i < GVAdvanceReQuisition.Rows.Count; i++)
                        {
                            DropDownList ddlSecurity = (DropDownList)GVAdvanceReQuisition.Rows[i].FindControl("ddlSecurity");
                            Hashtable HT = new Hashtable();
                            HT.Add("@CompanyID", Session["CompID"].ToString());
                            ATCommon.FillDrpDown(ddlSecurity, PMCApp.Get(HT, "GetSecurityAdvanceRequisition"), "Select Security", "PaymentSecurity", "SecurityID", "0");
                        }
                        txtsecurityadvancereq.Text = "";

                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill Security Of Advance Requisition.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender2.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void BtnCancelSecurityAddNew_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
        }
    }
}
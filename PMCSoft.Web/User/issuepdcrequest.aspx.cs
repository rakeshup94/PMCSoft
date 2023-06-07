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

using System.Data.SqlClient;


namespace PMCSoft.Web.User
{
    public partial class issuepdcrequest : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null || Session["UserName"] == null || Session["CompID"] == null || Session["AName"] == null || Session["UserEmail"] == null || Session["AID"] == null || Session["PRJID"] == null)
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("~/Login.aspx?Value=" + "2");
                }
                else
                {
                    BindProject();
                }
            }
        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlP, Session["UserID"].ToString());
                PMC.BindGetEmp(ddlEmployee, "");
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void Bindgridview()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Vendor", typeof(string)));
            dt.Columns.Add(new DataColumn("Bank", typeof(string)));
            dt.Columns.Add(new DataColumn("Branch", typeof(string)));
            dt.Columns.Add(new DataColumn("ChequeNo", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dt.Columns.Add(new DataColumn("IssueDate", typeof(string)));
            dr = dt.NewRow();

            dr["Vendor"] = string.Empty;
            dr["Bank"] = string.Empty;
            dr["Branch"] = string.Empty;
            dr["ChequeNo"] = string.Empty;
            dr["Amount"] = string.Empty;
            dr["IssueDate"] = string.Empty;
            dt.Rows.Add(dr);
            Session["Detail"] = dt;
            grvProjectDetails.DataSource = dt;
            grvProjectDetails.DataBind();
        }
        protected void ddlP_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Bindgridview();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void grvProjectDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlVendor = e.Row.FindControl("ddlVendor") as DropDownList;
                    DropDownList ddlBank = e.Row.FindControl("ddlBank") as DropDownList;

                    DataTable dtt = (DataTable)PMC.BindvendorName(ddlP.SelectedValue);
                    if (dtt.Rows.Count > 0)
                    {
                        ddlVendor.DataSource = DT;
                        ddlVendor.DataTextField = "Name";
                        ddlVendor.DataValueField = "VendorID";
                        ddlVendor.DataBind();
                        // ddlVendor.Items.Insert(0, new ListItem("Select Vendor", "-1"));

                    }


                    DropDownList ddlBranch = e.Row.FindControl("ddlBranch") as DropDownList;

                    PMC.BindGetVendorID(ddlVendor, ddlP.SelectedValue.ToString());
                    DataTable dt = (DataTable)PMC.BindBank();
                    if (dt.Rows.Count > 0)
                    {
                        ddlBank.DataSource = dt;
                        ddlBank.DataTextField = "BankName";
                        ddlBank.DataValueField = "BankID";
                        ddlBank.DataBind();
                        ddlBank.Items.Insert(0, new ListItem("Select Bank", "-1"));
                        ddlBranch.Items.Insert(0, new ListItem("Selct Branch", "-1"));

                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;
            DropDownList ddl = (DropDownList)sender;
            DropDownList ddlsecond = gvr.FindControl("ddlBranch") as DropDownList;
            // So in this you can get second drodpdown and bind your data

            ddlsecond.DataSource = PMC.BindBranchName(ddl.SelectedValue);
            ddlsecond.DataTextField = "BranchName";
            ddlsecond.DataValueField = "BranchID";
            ddlsecond.DataBind();
            ddlsecond.Items.Insert(0, new ListItem("Selct Branch", "-1"));
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
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            TextBox txtbtn = (TextBox)grvProjectDetails.Rows[0].FindControl("txtChequeNo");
            TextBox txt = (TextBox)grvProjectDetails.Rows[0].FindControl("txtAmount");
            if (txtbtn.Text == "" || txt.Text == "")
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
                DataRow dr1 = null;
                int x;
                if (Session["Detail"] != null)
                {
                    DataTable dt = (DataTable)Session["Detail"];

                    DataRow dr = null;
                    dt.Clear();
                    for (int i = 0; i < grvProjectDetails.Rows.Count; i++)
                    {
                        //Label lblSNo = (Label)grvProjectDetails.Rows[i].FindControl("lblSNo");
                        DropDownList ddlVendor = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlVendor");
                        DropDownList ddlbank = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBank");
                        DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBranch");
                        TextBox txtchequeNo = (TextBox)grvProjectDetails.Rows[i].FindControl("txtChequeNo");
                        TextBox txtAmount = (TextBox)grvProjectDetails.Rows[i].FindControl("txtAmount");
                        TextBox txtIssuDate = (TextBox)grvProjectDetails.Rows[i].FindControl("txtIssueDate");

                        dr = dt.NewRow();

                        //dr["SNo"] = i + 1;
                        dr["Vendor"] = ddlVendor.SelectedItem.Text;
                        dr["Bank"] = ddlbank.SelectedItem.Text;
                        dr["Branch"] = ddlBranch.SelectedItem.Text;
                        dr["ChequeNo"] = txtchequeNo.Text;
                        dr["Amount"] = txtAmount.Text;
                        dr["IssueDate"] = txtIssuDate.Text;

                        dt.Rows.Add(dr);

                        GetDL(i);

                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlVendor.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlVendor.Items[x].Text.ToString();
                            dr1["Id"] = ddlVendor.Items[x].Value.ToString();

                            DL.Rows.Add(dr1);
                        }
                        ViewState["DL" + i.ToString()] = DL;
                    }

                    dr = dt.NewRow();

                    // dr["SNo"] = dt.Rows.Count + 1;
                    dr["Vendor"] = string.Empty;
                    dr["Bank"] = string.Empty;
                    dr["Branch"] = string.Empty;
                    dr["ChequeNo"] = string.Empty;
                    dr["Amount"] = string.Empty;
                    dr["IssueDate"] = string.Empty;

                    dt.Rows.Add(dr);
                    Session["Detail"] = dt;
                    grvProjectDetails.DataSource = dt;
                    grvProjectDetails.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        //Label lblSNo = (Label)grvProjectDetails.Rows[t].FindControl("lblSNo");
                        DropDownList ddlVendor = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlVendor");
                        DropDownList ddlbank = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlBank");
                        DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[t].FindControl("ddlBranch");
                        TextBox txtchequeNo = (TextBox)grvProjectDetails.Rows[t].FindControl("txtChequeNo");
                        TextBox txtAmount = (TextBox)grvProjectDetails.Rows[t].FindControl("txtAmount");
                        TextBox txtIssuDate = (TextBox)grvProjectDetails.Rows[t].FindControl("txtIssueDate");

                        ddlVendor.Items.FindByText(dt.Rows[t]["Vendor"].ToString()).Selected = true;
                        ddlbank.Items.FindByText(dt.Rows[t]["Bank"].ToString()).Selected = true;
                        ddlBranch.DataSource = PMC.BindBranchName(ddlbank.SelectedValue);
                        ddlBranch.DataTextField = "BranchName";
                        ddlBranch.DataValueField = "BranchID";
                        ddlBranch.DataBind();
                        ddlBranch.Items.FindByText(dt.Rows[t]["Branch"].ToString()).Selected = true;
                        txtchequeNo.Text = dt.Rows[t]["ChequeNo"].ToString();
                        txtAmount.Text = dt.Rows[t]["Amount"].ToString();
                        txtIssuDate.Text = dt.Rows[t]["IssueDate"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (ddlP.SelectedValue.ToString() == "-1")
            {
                string scripts = "alert('kindly Select Project.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            else if (ddlEmployee.SelectedValue.ToString() == "-1")
            {
                string scripts = "alert('kindly Select Forwarded to');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            try
            {
                int m = 0;
                for (int k = 0; k < grvProjectDetails.Rows.Count; k++)
                {
                    DropDownList ddlVendor = (DropDownList)grvProjectDetails.Rows[k].FindControl("ddlVendor");
                    DropDownList ddlbank = (DropDownList)grvProjectDetails.Rows[k].FindControl("ddlBank");
                    DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[k].FindControl("ddlBranch");
                    TextBox txtchequeNo = (TextBox)grvProjectDetails.Rows[k].FindControl("txtChequeNo");
                    TextBox txtAmount = (TextBox)grvProjectDetails.Rows[k].FindControl("txtAmount");
                    TextBox txtIssuDate = (TextBox)grvProjectDetails.Rows[k].FindControl("txtIssueDate");
                    if (ddlVendor.SelectedValue == "-1" || ddlbank.SelectedValue == "-1" || ddlBranch.SelectedValue == "-1" || txtchequeNo.Text == "" || txtAmount.Text == "" || txtIssuDate.Text == "")
                    {
                        m = 1;
                        break;
                    }
                }
                if (m == 0)
                {
                    // creating unique ID for ISSUE ID
                    string p;
                    PMC.CreateIssueID(Session["CompID"].ToString(), out p);

                    for (int i = 0; i < grvProjectDetails.Rows.Count; i++)
                    {
                        DropDownList ddlVendor = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlVendor");
                        DropDownList ddlbank = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBank");
                        DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBranch");
                        TextBox txtchequeNo = (TextBox)grvProjectDetails.Rows[i].FindControl("txtChequeNo");
                        TextBox txtAmount = (TextBox)grvProjectDetails.Rows[i].FindControl("txtAmount");
                        TextBox txtIssuDate = (TextBox)grvProjectDetails.Rows[i].FindControl("txtIssueDate");

                        PMC.insertPDCrequest(Session["CompID"].ToString(), ddlP.SelectedValue, p, ddlVendor.SelectedValue, ddlbank.SelectedValue,
                        ddlBranch.SelectedValue, txtchequeNo.Text, txtAmount.Text, txtIssuDate.Text, ddlEmployee.SelectedValue,
                        Session["UserId"].ToString(), Session["UserId"].ToString());
                    }
                    BindProject();
                    grvProjectDetails.DataSource = "";
                    grvProjectDetails.DataBind();
                    string scripts = "alert('Inserted Successfully.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    // PMC.genrateIssueID(ddlP.SelectedValue);
                }
                else
                {
                    string scripts = "alert('Kindly select & fill all Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }

            }
            catch (Exception EX)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void grvProjectDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddNewBank")
            {
                Button btn = (Button)e.CommandSource;
                Button btnAddNewBank = (Button)btn.Parent.FindControl("btnAddNewBank");


                ModalPopupExtender1.Show();
            }
            if (e.CommandName == "AddNewBranch")
            {
                Button btn = (Button)e.CommandSource;
                Button btnAddNewBranch = (Button)btn.Parent.FindControl("btnAddNewBranch");


                ModalPopupExtender2.Show();
                GetCountry();
            }

        }
        protected void btnAddNewBankSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtbankname.Text != "")
                {
                    DataTable dt = (DataTable)PMC.getbank(txtbankname.Text);
                    if (dt.Rows.Count > 0)
                    {
                        string scripts = "alert('Already Exist');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                    else
                    {


                        PMC.insertBankMaster(Session["CompID"].ToString(), txtbankname.Text, Session["UserId"].ToString());
                        string scripts = "alert('Bank Inserted Successfully');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        //TabContainer1.ActiveTab = TabContainer1.Tabs[1];
                        txtbankname.Text = "";
                        for (int i = 0; i < grvProjectDetails.Rows.Count; i++)
                        {
                            DropDownList ddlBank = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBank");

                            DropDownList ddlBranch = (DropDownList)grvProjectDetails.Rows[i].FindControl("ddlBranch");
                            DataTable dtm = (DataTable)PMC.BindBank();
                            if (dtm.Rows.Count > 0)
                            {
                                ddlBank.DataSource = dtm;
                                ddlBank.DataTextField = "BankName";
                                ddlBank.DataValueField = "BankID";
                                ddlBank.DataBind();
                                ddlBank.Items.Insert(0, new ListItem("Select Bank", "-1"));
                                //ddlBranch.Items.Insert(0, new ListItem("Select Branch", "-1"));
                            }
                        }

                    }
                }
                else
                {
                    string scripts = "alert('kindly fill Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
            }
            catch (Exception EX)
            {
                Response.Write(EX.Message.ToString());
            }

        }
        protected void BtnAddNewBankCancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        protected void btnbranchsave_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlbank.SelectedValue.ToString() != "-1" && txtBranch.Text != "" && txtadress.Text != "" && ddlcountry.SelectedValue.ToString() != "-1" && ddlsatete.SelectedValue.ToString() != "-1" && ddlCity.SelectedValue.ToString() != "-1" && txtZipcode.Text != "")
                {
                    DataTable dt = (DataTable)PMC.getBranchName(txtBranch.Text, ddlbank.SelectedValue.ToString());
                    if (dt.Rows.Count > 0)
                    {
                        string scripts = "alert('Branch already exist for this bank');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.insertBranchMaster(Session["CompID"].ToString(), ddlbank.SelectedValue, txtBranch.Text, txtadress.Text,
                        ddlcountry.SelectedValue, ddlsatete.SelectedValue, ddlCity.SelectedValue, txtZipcode.Text, Session["UserId"].ToString());

                        string scripts = "alert('Branch Inserted Successfully');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);

                        txtBranch.Text = ""; txtadress.Text = ""; txtZipcode.Text = "";

                        GetCountry();

                        PMC.BindStateDdl(ddlsatete, ddlcountry.SelectedValue.ToString());
                        ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
                        PMC.BindCityDdl(ddlCity, ddlsatete.SelectedValue.ToString());

                        ModalPopupExtender2.Hide();
                    }
                }
                else
                {
                    string scripts = "alert('kindly fill detail.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception EX)
            {
                Response.Write(EX.Message.ToString());
            }
        }
        protected void btnbranchcancle_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
        }

        public void GetCountry()
        {
            try
            {
                PMC.BindCountryDdl(ddlcountry);
                ddlsatete.Items.Insert(0, new ListItem("Select State", "-1"));
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));

                DataTable DT = (DataTable)PMC.getallBankName();
                ddlbank.DataSource = DT;
                ddlbank.DataTextField = "BankName";
                ddlbank.DataValueField = "BankID";
                ddlbank.DataBind();
                ddlbank.Items.Insert(0, new ListItem("Select Bank", "-1"));
                ModalPopupExtender2.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlsatete, ddlcountry.SelectedValue.ToString());
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
                ModalPopupExtender2.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlsatete_SelectedIndexChanged(object sender, EventArgs e)
        {
            PMC.BindCityDdl(ddlCity, ddlsatete.SelectedValue.ToString());
            ModalPopupExtender2.Show();
        }

    }

}
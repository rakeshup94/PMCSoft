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

namespace PMCSoft.Web.Admin
{
    public partial class Bankmaster : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        // string TypeID = "";
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
                    GetCountry();
                    GetBank();
                    GetBankBranch();
                }
            }
        }
        public void GetBank()
        {
            PMC.Bindprc_GetallBank(GridView1);
        }
        public void GetBankBranch()
        {
            PMC.Bindprc_GetallBankBranch(GridView2);
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
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
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
                    }
                    else
                    {


                        PMC.insertBankMaster(Session["CompID"].ToString(), txtbankname.Text, Session["UserId"].ToString());
                        string scripts = "alert('Bank Inserted Successfully');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        //TabContainer1.ActiveTab = TabContainer1.Tabs[1];
                        txtbankname.Text = "";
                        GetBank();
                    }
                }
                else
                {
                    string scripts = "alert('kindly fill Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception EX)
            {
                Response.Write(EX.Message.ToString());
            }
        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Home.aspx");
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
                        GetBankBranch();
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
            Response.Redirect("~/Admin/Home.aspx");
        }
        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlsatete, ddlcountry.SelectedValue.ToString());
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
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
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetBank();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetBank();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                TextBox txtBankName = (TextBox)row.FindControl("txtBankName");
                HiddenField hdnBankID = (HiddenField)row.FindControl("hdnBankID");
                if (txtBankName.Text != "")
                {
                    DataTable dt = (DataTable)PMC.getbank(txtBankName.Text);
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.EditIndex = -1;
                        GetBank();
                        string scripts = "alert('All ready existed.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.editBank(hdnBankID.Value, txtBankName.Text);
                        GridView1.EditIndex = -1;
                        GetBank();
                        string scripts = "alert('Saved Data.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('kindly fill Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    GridView1.EditIndex = -1;
                    GetBank();

                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            GetBankBranch();
        }
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GetBankBranch();
        }
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
                TextBox txtBranchAddress = (TextBox)row.FindControl("txtBranchAddress");
                HiddenField hdnBranchID = (HiddenField)row.FindControl("hdnBranchID");
                if (txtBranchAddress.Text != "")
                {
                    PMC.editBankBranch(hdnBranchID.Value, txtBranchAddress.Text);
                    GridView2.EditIndex = -1;
                    GetBankBranch();
                    string scripts = "alert('Saved Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                else
                {
                    string scripts = "alert('kindly fill Data.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    GridView2.EditIndex = -1;
                    GetBankBranch();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
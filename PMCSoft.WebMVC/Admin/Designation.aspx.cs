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
    public partial class Designation : BasePage
    {
         
        DataTable DT = new DataTable();
        string DesgID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindDepartmentDDL();
                    GetDesignation();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindDepartmentDDL()
        {
            try
            {
                PMC.BindDepartmentDDL(ddlDept);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetDesignation()
        {
            try
            {
                PMC.BindDesignation(GridView1);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                TextBox txtDesg = (TextBox)row.FindControl("txtEditDesignation");
                HiddenField Hiddenfield1 = (HiddenField)row.FindControl("Hiddenfield1");
                HiddenField Hiddenfield2 = (HiddenField)row.FindControl("Hiddenfield2");

                if (txtDesg.Text != "")
                {
                    DT = PMCApp.GetDataTableWithTwoStringValue("GetDesg", Hiddenfield1.Value, txtDesg.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Designation already exists for this department.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.UpdateDesg(txtDesg.Text, Hiddenfield1.Value, Hiddenfield2.Value);
                        GridView1.EditIndex = -1;
                        GetDesignation();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill department.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetDesignation();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                GetDesignation();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Home.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlDept.SelectedValue != "-1")
                {
                    if (txtDesignation.Text != "")
                    {
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetDesg", ddlDept.SelectedValue.ToString(), txtDesignation.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Designation already exists for this department.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            PMC.GetMaxIDForDesgID(Session["CompID"].ToString(), out DesgID);
                            PMC.InsertDesignation(Session["CompID"].ToString(), ddlDept.SelectedValue.ToString(), DesgID, txtDesignation.Text,
                                Session["UserID"].ToString());
                            txtDesignation.Text = ""; ddlDept.SelectedValue = "-1";
                            GetDesignation();
                            string scripts = "alert('Designation insert successfully.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill designation.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select department.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
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
    public partial class AddUnit : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string UnitID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                 
                        GetUnit();
                    
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetUnit()
        {
            try
            {
                PMC.BindUnit(GVUnit);
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
                if (txtName.Text != "")
                {
                    if (txtCode.Text != "")
                    {
                        DT = PMCApp.GetDataTableWithOneStringValue("GetUnitName", txtName.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Unit name is already exists.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            DT = PMCApp.GetDataTableWithTwoStringValue("GetUnitCode", txtName.Text, txtCode.Text);
                            if (DT.Rows.Count > 0)
                            {
                                string scripts = "alert('Unit code is already exists.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {
                                PMC.GetMaxIDForUnitID(Session["CompID"].ToString(), out UnitID);
                                PMC.InsertUnitMaster(txtName.Text, txtCode.Text, Session["UserID"].ToString(), UnitID.ToString(), Session["CompID"].ToString());
                                txtName.Text = ""; txtCode.Text = "";
                                GetUnit();
                                string scripts = "alert('Insert Successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill unit code.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill unit name.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GVUnit_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GVUnit.Rows[e.RowIndex];
                TextBox txtUnitCode = (TextBox)row.FindControl("txtUnitCode");
                TextBox txtUnitName = (TextBox)row.FindControl("txtUnitName");
                HiddenField hdnTID = (HiddenField)row.FindControl("hdnTransID");

                if (txtUnitName.Text != "")
                {
                    if (txtUnitCode.Text != "")
                    {

                        DT = PMCApp.GetDataTableWithTwoStringValue("GetUnitCode", txtUnitName.Text, txtUnitCode.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Unit code is already exists for this name.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            PMC.UpdateUnit(txtUnitName.Text, txtUnitCode.Text, hdnTID.Value);
                            GVUnit.EditIndex = -1;
                            GetUnit();
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill unit code.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill unit name.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GVUnit_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVUnit.EditIndex = e.NewEditIndex;
            GetUnit();
        }
        protected void GVUnit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVUnit.EditIndex = -1;
            GetUnit();
        }
    }
}
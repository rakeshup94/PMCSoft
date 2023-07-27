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
    public partial class TypeOfAdvanceRequisition : BasePage
    {
          
        DataTable DT = new DataTable();
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    GetTypeGrid();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetTypeGrid()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@CompanyID", Session["CompID"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetTypeAdvanceRequisition");
            GvTypeofAdvanceRequisition.DataSource = dt;
            GvTypeofAdvanceRequisition.DataBind();

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
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


                        txttypeofadvancerequisition.Text = "";
                        GetTypeGrid();
                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill type.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GvTypeofAdvanceRequisition_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GvTypeofAdvanceRequisition.EditIndex = e.NewEditIndex;
                GetTypeGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void GvTypeofAdvanceRequisition_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvTypeofAdvanceRequisition.EditIndex = -1;
            GetTypeGrid();
        }
        protected void GvTypeofAdvanceRequisition_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GvTypeofAdvanceRequisition.Rows[e.RowIndex];
                TextBox txtType = (TextBox)row.FindControl("txtType");
                Label lblTransid = (Label)row.FindControl("lblTransid");

                HiddenField Hiddenfield1 = (HiddenField)row.FindControl("Hiddenfield1");

                if (txtType.Text != "")
                {

                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@Type ", txtType.Text);
                    DataTable DT = PMCApp.Get(ht1, "CheckTypeAdvanceRequisition  ");
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This type already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        Hashtable ht = new Hashtable();
                        ht.Add("@TransId", lblTransid.Text);
                        ht.Add("@Type", txtType.Text);
                        ht.Add("@ModifiedBy", Session["UserId"].ToString());

                        PMCApp.Get(ht, "UpdateTypeAdvanceRequisition");
                        GvTypeofAdvanceRequisition.EditIndex = -1;
                        string scripts = "alert('Update Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        GetTypeGrid();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill Type.');";
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
            Response.Redirect("~/Admin/Home.aspx");
        }
    }
}
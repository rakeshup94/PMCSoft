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
    public partial class AddPaymentType : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string TypeID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                        GetPaymentType();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetPaymentType()
        {
            try
            {
                PMC.BindGetPaymentType(GridView1);
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPaymentType.Text != "")
                {
                    DT = PMCApp.GetDataTableWithOneStringValue("GetPT", txtPaymentType.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This payment type is already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.GetMaxIDForTypeID(Session["CompID"].ToString(), out TypeID);

                        PMC.InsertPaymentType(Session["CompID"].ToString(), TypeID, txtPaymentType.Text, Session["UserID"].ToString());

                        txtPaymentType.Text = "";
                        GetPaymentType();
                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill payment type.');";
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
            try
            {
                GridView1.EditIndex = -1;
                GetPaymentType();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                GetPaymentType();
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
                TextBox txtPaymentType = (TextBox)row.FindControl("txtPaymentType");
                HiddenField Hiddenfield1 = (HiddenField)row.FindControl("Hiddenfield1");

                if (txtPaymentType.Text != "")
                {
                    DT = PMCApp.GetDataTableWithOneStringValue("GetPT", txtPaymentType.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Item of work already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.UpdatePaymentType(txtPaymentType.Text, Hiddenfield1.Value);
                        GridView1.EditIndex = -1;
                        GetPaymentType();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill Item of work.');";
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
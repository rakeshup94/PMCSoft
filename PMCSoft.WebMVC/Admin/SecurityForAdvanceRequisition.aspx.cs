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
    public partial class SecurityForAdvanceRequisition : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    GetSecurityGrid();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetSecurityGrid()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@CompanyID", Session["CompID"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetSecurityAdvanceRequisition");
            GvAdvancePaymentSecurity.DataSource = dt;
            GvAdvancePaymentSecurity.DataBind();

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
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


                        txtsecurityadvancereq.Text = "";
                        GetSecurityGrid();
                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill Security Of Advance Requisition.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GvAdvancePaymentSecurity_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvAdvancePaymentSecurity.EditIndex = -1;
            GetSecurityGrid();
        }
        protected void GvAdvancePaymentSecurity_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GvAdvancePaymentSecurity.EditIndex = e.NewEditIndex;
                GetSecurityGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void GvAdvancePaymentSecurity_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = (GridViewRow)GvAdvancePaymentSecurity.Rows[e.RowIndex];
                TextBox txtPaymentSecurity = (TextBox)row.FindControl("txtPaymentSecurity");
                Label lblTransid = (Label)row.FindControl("lblTransid");

                HiddenField Hiddenfield1 = (HiddenField)row.FindControl("Hiddenfield1");

                if (txtPaymentSecurity.Text != "")
                {

                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@PaymentSecurity ", txtPaymentSecurity.Text);
                    DataTable DT = PMCApp.Get(ht1, "CheckSecurityAdvanceRequisition  ");
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This Security already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        Hashtable ht = new Hashtable();
                        ht.Add("@TransId", lblTransid.Text);
                        ht.Add("@PaymentSecurity", txtPaymentSecurity.Text);
                        ht.Add("@ModifiedBy", Session["UserId"].ToString());

                        PMCApp.Get(ht, "UpdateSecurityAdvanceRequisition");
                        GvAdvancePaymentSecurity.EditIndex = -1;
                        string scripts = "alert('Update Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        GetSecurityGrid();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill Security.');";
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
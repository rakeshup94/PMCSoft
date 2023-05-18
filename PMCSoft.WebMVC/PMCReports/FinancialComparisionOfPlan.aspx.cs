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

namespace PMCSoft.Web.PMCReports
{
    public partial class FinancialComparisionOfPlan : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
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
                        BindProj();

                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        public void BindProj()
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
        protected void BtnIncomeSave_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            Hashtable ht = new Hashtable();
            ht.Add("@CompanyId", Session["CompID"].ToString());
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            ht.Add("@Particular", txtIncomeParticulars.Text);
            ht.Add("@CreatedBy", Session["UserId"].ToString());
            //PMCApp.Get(ht, "InsertIncome");
            //PMCApp.Get(ht, "InserttblExpenditure");

            //  PMCApp.Get(ht, "InsertConsumbles");
            //  PMCApp.Get(ht, "InsertDirectExpenses");
            // PMCApp.Get(ht, "InsertHireChargesItemWise");
            PMCApp.Get(ht, "InsertIndirectExpenses");
            txtIncomeParticulars.Text = "";

        }
        protected void btnIncomeCancel_Click(object sender, EventArgs e)
        {

        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            //   ModalPopupExtender1.Show();
            GetData();
        }
        public void GetData()
        {
            Hashtable ht = new Hashtable();
            DataTable dt = PMCApp.Get(ht, "GetIncomedate");

            if (dt.Rows.Count > 0)
            {
                RptIncome.DataSource = dt;
                RptIncome.DataBind();
            }
            Hashtable ht1 = new Hashtable();
            DataTable dt1 = PMCApp.Get(ht, "GetExpenditure");

            if (dt1.Rows.Count > 0)
            {
                RptExpenditure.DataSource = dt;
                RptExpenditure.DataBind();
            }
            Hashtable ht2 = new Hashtable();
            DataTable dt2 = PMCApp.Get(ht, "GetConsumbles");

            if (dt2.Rows.Count > 0)
            {
                RptConsumbles.DataSource = dt;
                RptConsumbles.DataBind();
            }
            Hashtable ht3 = new Hashtable();
            DataTable dt3 = PMCApp.Get(ht, "GetConsumbles");

            if (dt3.Rows.Count > 0)
            {
                RptDirectExpenses.DataSource = dt;
                RptDirectExpenses.DataBind();
            }
            Hashtable ht4 = new Hashtable();
            DataTable dt4 = PMCApp.Get(ht, "GetConsumbles");

            if (dt4.Rows.Count > 0)
            {
                RptHirecharges.DataSource = dt;
                RptHirecharges.DataBind();
            }
            Hashtable ht5 = new Hashtable();
            DataTable dt5 = PMCApp.Get(ht, "GetConsumbles");

            if (dt4.Rows.Count > 0)
            {
                RptHirecharges.DataSource = dt;
                RptHirecharges.DataBind();
            }
        }
    }
}
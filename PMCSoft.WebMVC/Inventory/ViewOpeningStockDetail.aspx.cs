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

namespace PMCSoft.Web.Inventory
{
    public partial class ViewOpeningStockDetail : BasePage
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
                    BindProject();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
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
        public void Gridbind()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetLastOpeningStock");
            GVOpeningStock.DataSource = dt;
            GVOpeningStock.DataBind();
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            Gridbind();
        }
    }
}
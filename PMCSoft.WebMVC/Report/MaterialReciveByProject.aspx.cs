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
namespace PMCSoft.Web.Report
{
    public partial class MaterialReciveByProject : BasePage
    {
          ();
        string AListID = string.Empty;

        DataTable DT = new DataTable();
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProject();
            }
        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                //BindGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();

        }
        protected void GVMaterialReceive_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GVMaterialReceive.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        public void BindGrid()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetMaterialReciveByProjectReport");
            GVMaterialReceive.DataSource = dt;
            GVMaterialReceive.DataBind();
        }
    }
}
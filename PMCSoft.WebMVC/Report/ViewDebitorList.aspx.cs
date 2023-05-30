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
    public partial class ViewDebitorList : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProj();
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
                PMC.BindGetEmpProj(ddlProject1, Session["UserID"].ToString());
                GetSProj();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetSProj()
        {
            try
            {
                PMC.BindGetDebtorList(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlType.SelectedValue = "-1";
                GetSProj();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlType.SelectedValue == "E")
                {
                    GetProj();
                }
                else
                {
                    GetSProj();
                }
            }
            catch (Exception ex)
            {
            }
        }
        public void GetProj()
        {
            try
            {
                PMC.BindGetDebitorsList(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
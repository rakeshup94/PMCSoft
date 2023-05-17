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
    public partial class PageCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DdlMenuheaderBind();
            }
        }

        public void DdlMenuheaderBind()
        {
            try
            {
                Hashtable ht = new Hashtable();


                ATCommon.FillDrpDown(ddlMenu, PMCApp.Get(ht, "GetMenuHeader"), "Select", "MenuHeaderName", "TransId", "0");

                // PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                // GetStockOpeningDate();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }


        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtName.Text != "")
                {
                    Hashtable ht = new Hashtable();
                    ht.Add("@MenuHeaderId", ddlMenu.SelectedValue);
                    ht.Add("@pagename", txtName.Text);
                    DataTable DT = PMCApp.Get(ht, "CheckPageName");
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Page name  already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }

                    else
                    {

                        Hashtable ht1 = new Hashtable();
                        ht1.Add("@MenuHeader", ddlMenu.SelectedValue);
                        ht1.Add("@pagename", txtName.Text);
                        PMCApp.Get(ht1, "InsertPageNameByMenuHeader");
                        // PMCApp.Get(ht1, "InsertPageName");InsertPageNameByMenuHeader
                        txtName.Text = "";
                        // GetUnit();
                        string scripts = "alert('Insert Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }


                }
                else
                {
                    string scripts = "alert('Kindly fill Page name.');";
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


        }
    }
}
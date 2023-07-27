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
using System.Globalization;
namespace PMCSoft.Web.Inventory
{
    public partial class InventoryOpeningDate : BasePage
    {
        
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //  txtOpeningDate.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
            if (!IsPostBack)
            {
                BindProject();
                GetStockOpeningDate();
            }

        }
        public void BindProject()
        {
            try
            {
                Hashtable ht = new Hashtable();


                ATCommon.FillDrpDown(ddlProject, PMCApp.Get(ht, "GetProjectByAdmin"), "Select", "ProjectName", "PRJID", "0");

                // PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                // GetStockOpeningDate();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }



        }
        public void GetStockOpeningDate()
        {
            try
            {
                Hashtable ht = new Hashtable();
                DataTable dt = PMCApp.Get(ht, "GetLastStoreOpeningDate");
                GvStockOpeningDate.DataSource = dt;
                GvStockOpeningDate.DataBind();

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

                int check = 0, check2 = 0;

                if (ddlProject.SelectedValue != "0")
                {
                    if (txtOpeningDate.Text != "")
                    {
                        string Now = DateTime.Now.ToString("MM/dd/yyyy");

                        string OD = txtOpeningDate.Text;

                        if (Convert.ToDateTime(OD.ToString()) < Convert.ToDateTime(Now.ToString()))
                        {
                            string scripts = "alert('Opening date must be greater or equal to current date.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            try
                            {

                                Hashtable ht = new Hashtable();

                                ht.Add("@StoreOpeningDate", OD.ToString());

                                ht.Add("@ProjectId", ddlProject.SelectedValue);
                                ht.Add("@CompanyId", Session["CompID"].ToString());
                                ht.Add("@CreatedBy", Session["UserId"].ToString());
                                PMCApp.Get(ht, "InsertStockOpeningDate");
                                string scripts = "alert('Insert Successfully .');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);

                                ddlProject.SelectedValue = "0"; txtOpeningDate.Text = "";
                                GetStockOpeningDate();
                            }
                            catch (Exception ex)
                            {
                                string scripts = "alert('Some error occured data not saved.......!!!!!!! ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Fill Opening Date ');";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Select Project ');";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }

            catch (Exception ex)
            {
                string scripts = "alert('Some error occured data not saved.......!!!!!!! ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
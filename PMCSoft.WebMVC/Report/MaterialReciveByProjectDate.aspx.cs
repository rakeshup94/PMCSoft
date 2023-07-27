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
    public partial class MaterialReciveByProjectDate : BasePage
    {
        BALPMC PMC = new BALPMC();
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

        protected void BtnReport_Click(object sender, EventArgs e)
        {
            try
            {
                int CHECK = 0, check2 = 0, check3 = 0;
                if (ddlProject.SelectedValue == "-1")
                {
                    CHECK = 1;
                }

                if (txtDate.Text == "")
                {
                    check2 = 1;
                }
                if (Txtfrom.Text == "")
                {
                    check3 = 1;
                }
                if (CHECK == 0)
                {
                    if (check2 == 0)
                    {
                        if (check3 == 0)
                        {
                            Hashtable ht = new Hashtable();
                            ht.Add("@ProjectId", ddlProject.SelectedValue);
                            ht.Add("@To_Date", txtDate.Text);
                            ht.Add("@From_Date", Txtfrom.Text);
                            DataTable dt = PMCApp.Get(ht, "GetMatrialReciveByProjectIdAnddate");
                            GVMaterialReceive.DataSource = dt;
                            GVMaterialReceive.DataBind();
                            ddlProject.SelectedValue = "-1"; txtDate.Text = ""; Txtfrom.Text = "";
                        }


                        else
                        {
                            string scripts = "alert('Kindly Select From Date. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Select To Date. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Select Project. ');";
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
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
    public partial class StaffAttendance : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetD();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetD()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                PMC.BindGetAttendance(GridView1, ddlProject.SelectedValue.ToString(), txtDate.Text);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                DT = PMCApp.GetDataTableWithTwoStringValue("GetAttendance", ddlProject.SelectedValue.ToString(), txtDate.Text);
                if (DT.Rows.Count > 0)
                {
                    PMC.BindGetAttendance(GridView1, ddlProject.SelectedValue.ToString(), txtDate.Text);
                    btnPrint.Visible = true;
                }
                else
                {
                    PMC.BindGetAttendance(GridView1, ddlProject.SelectedValue.ToString(), txtDate.Text);
                    btnPrint.Visible = true;
                    string scripts = "alert('No record found. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string strURL = "PrintStaffAttendance.aspx?";
            if (HttpContext.Current != null)
            {
                string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strDate={1}&strProjName={2}",
                    ddlProject.SelectedValue.ToString(), txtDate.Text, ddlProject.SelectedItem.Text));

                string url = strURLWithData.ToString();

                string fullURL = "window.open('" + url + "', '_blank', 'width=800,height=550,status=yes,toolbar=no,menubar=no,location=no,left=10,scrollbars=yes,resizable=no,titlebar=no' );";
                ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", fullURL, true);
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Encrypt();
        }
    }
}
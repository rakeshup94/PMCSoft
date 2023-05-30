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
    public partial class ViewDailyStaffAttendance : System.Web.UI.Page
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
                string strReq = "";
                strReq = Request.RawUrl;
                strReq = strReq.Substring(strReq.IndexOf('?') + 1);

                if (!strReq.Equals(""))
                {
                    strReq = DecryptQueryString(strReq);
                    string[] arrMsgs = strReq.Split('&');
                    string[] arrIndMsg;

                    string PRJID = "", PRJName = "";
                    arrIndMsg = arrMsgs[0].Split('=');
                    PRJID = arrIndMsg[1].ToString().Trim();
                    arrIndMsg = arrMsgs[1].Split('=');
                    PRJName = arrIndMsg[1].ToString().Trim();
                    ViewState["PRJID"] = PRJID.ToString();
                    ViewState["PRJName"] = PRJName.ToString();
                }
                GetProject(ViewState["PRJID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetProject(string PRJID)
        {
            try
            {
                DT = PMCApp.GetDataTableWithOneStringValue("GetDailyAttendance", PRJID);
                if (DT.Rows.Count > 0)
                {
                    PMC.BindGetDailyAttendance(GridView1, PRJID);
                    btnPrint.Visible = true;
                }
                else
                {
                    PMC.BindGetDailyAttendance(GridView1, PRJID);
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
                    ViewState["PRJID"].ToString(), DateTime.Now.Date.ToString("MM/dd/yyyy"), ViewState["PRJName"].ToString()));

                string url = strURLWithData.ToString();

                string fullURL = "window.open('" + url + "', '_blank', 'width=800,height=550,status=yes,toolbar=no,menubar=no,location=no,left=10,scrollbars=yes,resizable=no,titlebar=no' );";
                ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", fullURL, true);
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
            EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
            return objEDQueryString.Decrypt(strQueryString, "r0b1nr0y");
        }
        public string EncryptQueryString(string strQueryString)
        {
            EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
            return objEDQueryString.Encrypt(strQueryString, "r0b1nr0y");
        }
    }
}
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
public partial class AdminReports_PrintStaffAttendance : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            {
                HttpContext.Current.Response.Write("<script>window.print();</script>");
            }
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
                    string strReq = "";
                    strReq = Request.RawUrl;
                    strReq = strReq.Substring(strReq.IndexOf('?') + 1);

                    if (!strReq.Equals(""))
                    {
                        strReq = DecryptQueryString(strReq);
                        string[] arrMsgs = strReq.Split('&');
                        string[] arrIndMsg;

                        string PRJID = "", Date = "", ProjName = "";
                        arrIndMsg = arrMsgs[0].Split('=');
                        PRJID = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[1].Split('=');
                        Date = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[2].Split('=');
                        ProjName = arrIndMsg[1].ToString().Trim();

                        lblDate.Text = Date.ToString();
                        lblProjectName.Text = ProjName.ToString();

                        GetValue(PRJID.ToString(), lblDate.Text);
                        //GetD();

                    }
                }

            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    //public void GetD()
    //{
    //    try
    //    {
    //       // PMC.BindGetProjectForAdmin(p);
    //        PMC.BindGetAttendance(GridView1, ddlProject.SelectedValue.ToString(), txtDate.Text);
    //    }
    //    catch (Exception ex)
    //    {
    //        string scripts = "alert('Some error occurs.');";
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
    //    }
    //}
    private string DecryptQueryString(string strQueryString)
    {
        QueryStringEncryption.EncryptDecryptQueryString objEDQueryString = new QueryStringEncryption.EncryptDecryptQueryString();
        return objEDQueryString.Decrypt(strQueryString, "r0b1nr0y");
    }
    public string EncryptQueryString(string strQueryString)
    {
        QueryStringEncryption.EncryptDecryptQueryString objEDQueryString = new QueryStringEncryption.EncryptDecryptQueryString();
        return objEDQueryString.Encrypt(strQueryString, "r0b1nr0y");
    }
    public void GetValue(string PRJID, string Date)
    {
        try
        {
            DT = PMCApp.GetDataTableWithTwoStringValue("GetAttendance", PRJID, Date);
            if (DT.Rows.Count > 0)
            {
                PMC.BindGetAttendance(GridView1, PRJID, Date);
                lblDate.Text = DT.Rows[0]["CreatedDate1"].ToString();
            }
            else
            {
                PMC.BindGetAttendance(GridView1, PRJID, Date);
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
  
  
}
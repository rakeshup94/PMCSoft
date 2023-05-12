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

public partial class PMCReports_MonthlyWorkDone : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
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
    //    try
    //    {
    //        PMC.BindGetEmpProj(ddlProjectA, Session["UserID"].ToString());
    //    }
    //    catch (Exception ex)
    //    {
    //        string scripts = "alert('Some error occurs.');";
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
    //    }
    }
    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Repeater1.DataSource = DT;
        //Repeater1.DataBind();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
}

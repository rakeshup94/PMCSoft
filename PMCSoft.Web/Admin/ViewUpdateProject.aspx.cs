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
 

public partial class Admin_ViewUpdateProject : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
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
                    BindProjectDetail();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void BindProjectDetail()
    {
        PMC.BindProjectDetail(GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DetailUpdate")
            {
                LinkButton lnk = (LinkButton)e.CommandSource;
                HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");

                DT = PMCApp.GetDataTableWithOneStringValue("GetProjectParticularADetail", hdnPRJID.Value);
                if (DT.Rows.Count > 0)
                {
                    string strURL = "~/Admin/EditProject.aspx?";
                    if (HttpContext.Current != null)
                    {
                        string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}",
                            hdnPRJID.Value));
                        HttpContext.Current.Response.Redirect(strURLWithData);
                    }
                    else
                    { }
                }
                else
                {
                    string scripts = "alert('No Records found.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            if (e.CommandName == "DetailView")
            {
                LinkButton lnk = (LinkButton)e.CommandSource;
                HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");

                DT = PMCApp.GetDataTableWithOneStringValue("GetProjectParticularADetail", hdnPRJID.Value);
                if (DT.Rows.Count > 0)
                {
                    string strURL = "~/Admin/ViewProjectDetail.aspx?";
                    if (HttpContext.Current != null)
                    {
                        string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}",
                            hdnPRJID.Value));
                        HttpContext.Current.Response.Redirect(strURLWithData);
                    }
                    else
                    { }
                }
                else
                {
                    string scripts = "alert('No Records found.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public string EncryptQueryString(string strQueryString)
    {
        EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
        return objEDQueryString.Encrypt(strQueryString, "r0b1nr0y");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hdnStatus = e.Row.FindControl("hdnFinalStatus") as HiddenField;
                LinkButton lnkUpdate = e.Row.FindControl("lnkUpdate") as LinkButton;

                if (hdnStatus.Value == "E")
                {
                    lnkUpdate.Visible = true;
                }
                else
                {
                    lnkUpdate.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
}

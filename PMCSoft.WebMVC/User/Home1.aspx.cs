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
using System.IO;
 
using PMCSoft.Infrastructure.Data;

namespace PMCSoft.Web.User
{
    public partial class Home : BasePage
    {
         ();
        DataTable DT = new DataTable();
        string P = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetCountProject();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetCountProject()
        {
            try
            {
                PMC.GetEmpProjCount(Session["UserID"].ToString(), out P);
                lblP.Text = P.ToString();
                PMC.BindGetDMRProjEmp(GridView1, Session["UserID"].ToString());
                PMC.BindGetProjStaffAttendance(GridView2, Session["UserID"].ToString());
                PMC.GetRSSNotification(DataList1, Session["UserID"].ToString());
                PMC.BindGetEmpProject(GridView3, Session["UserID"].ToString());
                // PMC.BindGetEmpProject(GridView4, Session["UserID"].ToString());
                GetMatrialRec();
                PMC.BindGetEmpLabour(GvTotalLaber, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                PMC.BindGetDMRProjEmp(GridView1, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView2.PageIndex = e.NewPageIndex;
                PMC.BindGetProjStaffAttendance(GridView2, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkAttachment = (LinkButton)e.Item.FindControl("lnkAttachment");
                if (lnkAttachment.Text == "")
                {
                    lnkAttachment.Visible = false;
                }
                else
                {
                    lnkAttachment.Visible = true;
                }
            }
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "FileNameO")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    LinkButton lnkAttachment = (LinkButton)lnk.Parent.FindControl("lnkAttachment");
                    HiddenField hdnAttachment = (HiddenField)lnk.Parent.FindControl("hdnAttachment");

                    string path = Server.MapPath("~/Upload/" + hdnAttachment.Value);
                    if (File.Exists(path))
                    {
                        Response.Clear();
                        Response.ContentType = @"application\octet-stream";
                        System.IO.FileInfo file = new System.IO.FileInfo(path);
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                        Response.AddHeader("Content-Length", file.Length.ToString());
                        Response.ContentType = "application/octet-stream";
                        Response.WriteFile(file.FullName);
                        Response.Flush();
                    }
                    else
                    {
                        string scripts = "alert('Attached file have been no longer exists on server....');";
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
        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView3.PageIndex = e.NewPageIndex;
                PMC.BindGetEmpProject(GridView3, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Project")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    ViewState["ProjectId"] = hdnPRJID.Value;
                    LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

                    DT = PMCApp.GetDataTableWithOneStringValue("GetDailyMR", hdnPRJID.Value);
                    if (DT.Rows.Count > 0)
                    {
                        string strURL = "~/Report/ViewDailyMorningReport.aspx?";
                        if (HttpContext.Current != null)
                        {
                            string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                                hdnPRJID.Value, lnkProjectName.Text));
                            HttpContext.Current.Response.Redirect(strURLWithData);
                        }
                        else
                        { }
                    }
                    else
                    {
                        string scripts = "alert('No records found.');";
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
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Project")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

                    DT = PMCApp.GetDataTableWithOneStringValue("GetDailyAttendance", hdnPRJID.Value);
                    if (DT.Rows.Count > 0)
                    {
                        string strURL = "~/Report/ViewDailyStaffAttendance.aspx?";
                        if (HttpContext.Current != null)
                        {
                            string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                                hdnPRJID.Value, lnkProjectName.Text));
                            HttpContext.Current.Response.Redirect(strURLWithData);
                        }
                        else
                        { }
                    }
                    else
                    {
                        string scripts = "alert('No records found.');";
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
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Project")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

                    string strURL = "~/User/ProjectDetail.aspx?";
                    if (HttpContext.Current != null)
                    {
                        string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                            hdnPRJID.Value, lnkProjectName.Text));
                        HttpContext.Current.Response.Redirect(strURLWithData);
                    }
                    else
                    { }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        //protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Open")
        //    {
        //        LinkButton lnk = (LinkButton)e.CommandSource;
        //        LinkButton lnkOpen = (LinkButton)lnk.Parent.FindControl("lnkOpen");
        //        HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
        //        GridView GridView5 = (GridView)lnk.Parent.FindControl("GridView5");
        //        LinkButton lnkClose = (LinkButton)lnk.Parent.FindControl("lnkClose");

        //        PMC.BindGetRawMaterialStock(GridView5, hdnPRJID.Value);
        //        GridView5.Visible = true;
        //        lnkClose.Visible = true;
        //        lnkOpen.Visible = false;
        //    }
        //    if (e.CommandName == "Close")
        //    {
        //        LinkButton lnk = (LinkButton)e.CommandSource;
        //        LinkButton lnkOpen = (LinkButton)lnk.Parent.FindControl("lnkOpen");
        //        HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
        //        GridView GridView5 = (GridView)lnk.Parent.FindControl("GridView5");
        //        LinkButton lnkClose = (LinkButton)lnk.Parent.FindControl("lnkClose");

        //        PMC.BindGetRawMaterialStock(GridView5, hdnPRJID.Value);
        //        GridView5.Visible = false;
        //        lnkClose.Visible = false;
        //        lnkOpen.Visible = true;
        //    }
        //    if (e.CommandName == "Project")
        //    {
        //        LinkButton lnk = (LinkButton)e.CommandSource;
        //        HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
        //        LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

        //        string strURL = "~/Report/StockDetail.aspx?";
        //        if (HttpContext.Current != null)
        //        {
        //            string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
        //                hdnPRJID.Value, lnkProjectName.Text));
        //            HttpContext.Current.Response.Redirect(strURLWithData);
        //        }
        //        else
        //        { }
        //    }
        //}
        public void GetMatrialRec()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@empid", Session["UserId"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetProjectByid");
            string projectid = dt.Rows[0]["ProjectID"].ToString();
            PMC.BindGetRawMaterialStockDetail(GridView5, projectid.ToString());
        }

        protected void Lnktodaylabour_Click(object sender, EventArgs e)
        {
            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@empid", Session["UserId"].ToString());
                DataTable dt = PMCApp.Get(ht, "GetProjectByidName");
                string projectid = dt.Rows[0]["ProjectID"].ToString();
                string projectname = dt.Rows[0]["ProjectName"].ToString();

                DT = PMCApp.GetDataTableWithOneStringValue("GetDailyAttendance", projectid.ToString());
                if (DT.Rows.Count > 0)
                {
                    string strURL = "~/Report/ViewDailyStaffAttendance.aspx?";
                    if (HttpContext.Current != null)
                    {
                        string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                            projectid.ToString(), projectname.ToString()));
                        HttpContext.Current.Response.Redirect(strURLWithData);
                    }
                    else
                    { }
                }
                else
                {
                    string scripts = "alert('No records found.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }

            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@empid", Session["UserId"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetProjectByidName");
            string projectid = dt.Rows[0]["ProjectID"].ToString();
            string projectname = dt.Rows[0]["ProjectName"].ToString();

            string strURL = "~/Report/StockDetail.aspx?";
            if (HttpContext.Current != null)
            {
                string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                    projectid.ToString(), projectname.ToString()));
                HttpContext.Current.Response.Redirect(strURLWithData);
            }
        }
        protected void Lnkprojectdetail_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@empid", Session["UserId"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetProjectByidName");
            string projectid = dt.Rows[0]["ProjectID"].ToString();
            string projectname = dt.Rows[0]["ProjectName"].ToString();

            string strURL = "~/User/ProjectDetail.aspx?";
            if (HttpContext.Current != null)
            {
                string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strPRJNAME={1}",
                    projectid.ToString(), projectname.ToString()));
                HttpContext.Current.Response.Redirect(strURLWithData);
            }
            else
            { }
        }
    }
}
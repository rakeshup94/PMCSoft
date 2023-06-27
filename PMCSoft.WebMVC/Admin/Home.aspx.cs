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

using PMCSoft.Core.Common;
namespace PMCSoft.Web.Admin
{
    public partial class Home : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
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
                PMC.GetCountProject(out P);
                lblP.Text = P.ToString();
                PMC.BindGetDMR(GridView1);
                PMC.BindGetStaffAttendance(GridView2);
                PMC.GetRSSNotification(DataList1, Session["UserID"].ToString());
                PMC.BindGetProject(GridView3);
                PMC.BindGetAdminProject(GridView4);
                PMC.BindGetTotalLaber(GvTotalLaber);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }


        protected void ImgAdd_Click(object sender, EventArgs e)
        {
            try
            {
                PMC.BindDepartmentDDL(ddlDepartment);
                ddlDesignation.Items.Insert(0, new ListItem("Select Designation", "-1"));
                ModalPopupExtender1.Show();
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
                if (ddlDepartment.SelectedValue != "-1")
                {
                    if (ddlDesignation.SelectedValue != "-1")
                    {
                        if (txtTitle.Text != "")
                        {
                            if (txtCircularNo.Text != "")
                            {
                                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                                {
                                    if (FileUpload1.PostedFile.ContentLength < 10485760)
                                    {
                                        int filesize = FileUpload1.PostedFile.ContentLength;
                                        string file = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
                                        string f = file.Replace(" ", "_");
                                        string fileExt = Path.GetExtension(FileUpload1.FileName);
                                        string filenameO = f.ToString() + fileExt.ToString();
                                        string CDate = DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
                                        string filename = f + CDate + fileExt;
                                        FileUpload1.SaveAs(Server.MapPath("~/Upload/") + filename);

                                        PMC.InsertRSSFeeds(txtTitle.Text, txtDescription.Text, Session["UserID"].ToString(), filename.ToString(),
                                            filenameO.ToString(), filesize.ToString(), txtCircularNo.Text, ddlDepartment.SelectedValue.ToString(),
                                            ddlDesignation.SelectedValue.ToString());
                                        txtDescription.Text = ""; txtTitle.Text = ""; txtCircularNo.Text = ""; ddlDepartment.SelectedValue = "-1";
                                        ddlDesignation.SelectedValue = "-1";
                                        string script = "alert('Insert successfully.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", script, true);
                                        ModalPopupExtender1.Hide();
                                        PMC.GetRSSNotification(DataList1, Session["UserID"].ToString());
                                    }
                                    else
                                    {
                                        string scripts = "alert('This file was not upload, because file size exceed from 10 mb.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        ModalPopupExtender1.Show();
                                    }
                                }
                                else
                                {
                                    PMC.InsertRSSFeeds(txtTitle.Text, txtDescription.Text, Session["UserID"].ToString(), "", "", "0", txtCircularNo.Text,
                                        ddlDepartment.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString());
                                    txtDescription.Text = ""; txtTitle.Text = ""; txtCircularNo.Text = ""; ddlDepartment.SelectedValue = "-1";
                                    ddlDesignation.SelectedValue = "-1";
                                    string script = "alert('Insert successfully.');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", script, true);
                                    ModalPopupExtender1.Hide();
                                    PMC.GetRSSNotification(DataList1, Session["UserID"].ToString());
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill circular no.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                ModalPopupExtender1.Show();
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly fill subject.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            ModalPopupExtender1.Show();
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select designation.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select department.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
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
                PMC.BindGetProject(GridView3);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindDesignationDDL(ddlDesignation, ddlDepartment.SelectedValue.ToString());
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
             
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
             
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
                    LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

                    DT = PMCApp.GetDataTableWithOneStringValue("GetDailyMR", hdnPRJID.Value);
                    if (DT.Rows.Count > 0)
                    {
                        string strURL = "~/AdminReports/ViewDailyMorningReport.aspx?";
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
                        string strURL = "~/AdminReports/ViewDailyStaffAttendance.aspx?";
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

                    string strURL = "~/Admin/ProjectDetail.aspx?";
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
        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Open")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;

                    LinkButton lnkOpen = (LinkButton)lnk.Parent.FindControl("lnkOpen");
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    GridView GridView5 = (GridView)lnk.Parent.FindControl("GridView5");
                    LinkButton lnkClose = (LinkButton)lnk.Parent.FindControl("lnkClose");

                    PMC.BindGetRawMaterialStockDetail(GridView5, hdnPRJID.Value);
                    GridView5.Visible = true;
                    lnkClose.Visible = true;
                    lnkOpen.Visible = false;
                }
                if (e.CommandName == "Close")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    LinkButton lnkOpen = (LinkButton)lnk.Parent.FindControl("lnkOpen");
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    GridView GridView5 = (GridView)lnk.Parent.FindControl("GridView5");
                    LinkButton lnkClose = (LinkButton)lnk.Parent.FindControl("lnkClose");

                    PMC.BindGetRawMaterialStockDetail(GridView5, hdnPRJID.Value);
                    GridView5.Visible = false;
                    lnkClose.Visible = false;
                    lnkOpen.Visible = true;
                }
                if (e.CommandName == "Project")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnPRJID = (HiddenField)lnk.Parent.FindControl("hdnPRJID");
                    LinkButton lnkProjectName = (LinkButton)lnk.Parent.FindControl("lnkProjectName");

                    string strURL = "~/AdminReports/StockDetail.aspx?";
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
    }
}
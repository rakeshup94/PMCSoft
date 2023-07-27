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

namespace PMCSoft.Web.Admin
{
    public partial class AddManagementInfo : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string DeptID = "";
        string DesgID = "";

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
                PMC.GetRSSFeedsGV(GridView1);
                PMC.BindDepartmentDDL(ddlDepartment);
                ddlDesignation.Items.Insert(0, new ListItem("Select Designation", "-1"));
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

                                        PMC.InsertRSSFeeds(txtTitle.Text, txtDescription.Text, Session["UserID"].ToString(), filename.ToString(), filenameO.ToString(),
                                            filesize.ToString(), txtCircularNo.Text, ddlDepartment.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString());
                                        txtDescription.Text = ""; txtTitle.Text = ""; txtCircularNo.Text = ""; ddlDepartment.SelectedValue = "-1";
                                        ddlDesignation.SelectedValue = "-1";
                                        string script = "alert('Insert successfully.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", script, true);
                                        PMC.GetRSSFeedsGV(GridView1);
                                    }
                                    else
                                    {
                                        string scripts = "alert('This file was not upload, because file size exceed from 10 mb.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
                                    PMC.GetRSSFeedsGV(GridView1);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill circular no.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly fill subject.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select designation.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select department.');";
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
            try
            {
                Response.Redirect("~/Admin/Home.aspx");
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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
                if (e.CommandName == "DeleteInfo")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");

                    PMC.UpdateRSS(hdnTransID.Value);
                    PMC.GetRSSFeedsGV(GridView1);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    HiddenField hdnStatus = e.Row.FindControl("hdnStatus") as HiddenField;
                    LinkButton lnkDeleteInfo = e.Row.FindControl("lnkDeleteInfo") as LinkButton;
                    Label lnkD = e.Row.FindControl("lblD") as Label;

                    if (hdnStatus.Value == "E")
                    {
                        lnkDeleteInfo.Visible = true;
                        lnkD.Visible = false;
                    }
                    else
                    {
                        lnkDeleteInfo.Visible = false;
                        lnkD.Visible = true;
                    }
                }
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
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void LnkAddNewDept_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }
        protected void BtnDeptSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDepartment.Text != "")
                {
                    DT = PMCApp.GetDataTableWithOneStringValue("GetDept", txtDepartment.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Department already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.GetMaxIDForDeptID(Session["CompID"].ToString(), out DeptID);
                        PMC.InsertDepartment(DeptID, txtDepartment.Text, Session["UserID"].ToString(), Session["CompID"].ToString());
                        txtDepartment.Text = "";

                        string scripts = "alert('Department insert successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill department.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btndepcancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        protected void LnkAddNewDesignation_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
            BindDepartmentDDL();
        }
        public void BindDepartmentDDL()
        {
            try
            {
                PMC.BindDepartmentDDL(ddlNewDept);
                ModalPopupExtender2.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void BtnAddnewDesignation_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlNewDept.SelectedValue != "-1")
                {
                    if (txtDesignation.Text != "")
                    {
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetDesg", ddlNewDept.SelectedValue.ToString(), txtDesignation.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Designation already exists for this department.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            PMC.GetMaxIDForDesgID(Session["CompID"].ToString(), out DesgID);
                            PMC.InsertDesignation(Session["CompID"].ToString(), ddlNewDept.SelectedValue.ToString(), DesgID, txtDesignation.Text,
                                Session["UserID"].ToString());
                            txtDesignation.Text = ""; ddlNewDept.SelectedValue = "-1";

                            string scripts = "alert('Designation insert successfully.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill designation.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender2.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select department.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender2.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnAddNewDesignationCancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
        }



    }
}
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

namespace PMCSoft.Web.User
{
    public partial class StaffAttendance : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string AT = "";
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
                        GetD();
                    }
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
                lblDate1.Text = DateTime.Now.ToString("dd/MM/yyyy");
                HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
                PMC.BindGetEmpProj(ddlProject1, Session["UserID"].ToString());
                PMC.BindGenaralEmployee(GridView2, ddlProject1.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindGenaralEmployee(GridView2, ddlProject1.SelectedValue.ToString());
                if (GridView2.Rows.Count > 0)
                {
                    btnCancel1.Visible = true;
                    btnSubmit1.Visible = true;
                }
                else
                {
                    btnSubmit1.Visible = false;
                    btnCancel1.Visible = false;
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnCancel1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }
        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            try
            {
                int check1 = 0, check2 = 0;
                if (ddlProject1.SelectedValue != "-1")
                {
                    for (int j = 0; j < GridView2.Rows.Count; j++)
                    {
                        CheckBox chk = (CheckBox)GridView2.Rows[j].Cells[0].FindControl("chk");
                        if (chk.Checked == true)
                        {
                            check1 = 1;
                            break;
                        }
                    }
                    //for (int k = 0; k < GridView2.Rows.Count; k++)
                    //{
                    //    CheckBox chk = (CheckBox)GridView2.Rows[k].Cells[0].FindControl("chk");
                    //    HiddenField hdnEmpID = (HiddenField)GridView2.Rows[k].Cells[0].FindControl("hdnEmpID");
                    //    if (chk.Checked == true)
                    //    {
                    //        DT = PMCApp.GetDataTableWithTwoStringValue("GetGSAttn", ddlProject1.SelectedValue.ToString(), hdnEmpID.Value);
                    //        if (DT.Rows.Count > 0)
                    //        {
                    //            string E = DT.Rows[0]["EmpID"].ToString();
                    //            if (hdnEmpID.Value == E.ToString())
                    //            {
                    //                check2 = 1;
                    //                break;
                    //            }
                    //            else
                    //            {
                    //                check2 = 0;
                    //            }
                    //        }
                    //    }
                    //}
                    if (check1 == 1)
                    {
                        PMC.GetMaxIDForATID(Session["CompID"].ToString(), out AT);
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            Label lblOEmployeeID = (Label)GridView2.Rows[i].Cells[0].FindControl("lblOEmployeeID");
                            Label lblEmpName = (Label)GridView2.Rows[i].Cells[0].FindControl("lblEmpName");
                            HiddenField hdnEmpID = (HiddenField)GridView2.Rows[i].Cells[0].FindControl("hdnEmpID");
                            Label lblCategory = (Label)GridView2.Rows[i].Cells[0].FindControl("lblCategory");
                            Label lblDepartment = (Label)GridView2.Rows[i].Cells[0].FindControl("lblDepartment");
                            Label lblDesignation = (Label)GridView2.Rows[i].Cells[0].FindControl("lblDesignation");
                            HiddenField hdnDeptID = (HiddenField)GridView2.Rows[i].Cells[0].FindControl("hdnDeptID");
                            HiddenField hdnDesgID = (HiddenField)GridView2.Rows[i].Cells[0].FindControl("hdnDesgID");
                            Label lblMobileNo = (Label)GridView2.Rows[i].Cells[0].FindControl("lblMobileNo");
                            CheckBox chk = (CheckBox)GridView2.Rows[i].Cells[0].FindControl("chk");
                            if (chk.Checked == true)
                            {
                                PMC.InsertGeneralStaffAttendance(Session["CompID"].ToString(), ddlProject1.SelectedValue.ToString(), hdnEmpID.Value,
                                    lblOEmployeeID.Text, lblEmpName.Text, hdnDeptID.Value, hdnDesgID.Value, lblMobileNo.Text, Session["UserID"].ToString(),
                                    AT.ToString(), lblCategory.Text);
                            }
                        }
                        ddlProject1.SelectedValue = "-1";
                        PMC.BindGenaralEmployee(GridView2, ddlProject1.SelectedValue.ToString());

                        string script = "alert('Attendance insert successfuly. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", script, true);
                    }
                    else
                    {
                        string scripts = "alert('Kindly select check box. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select project. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chk = e.Row.FindControl("chk") as CheckBox;
                    HiddenField hdnEmpID = e.Row.FindControl("hdnEmpID") as HiddenField;

                    DT = PMCApp.GetDataTableWithTwoStringValue("GetGSAttn", ddlProject1.SelectedValue.ToString(), hdnEmpID.Value);
                    if (DT.Rows.Count > 0)
                    {
                        string EID = DT.Rows[0]["EmpID"].ToString();
                        if (hdnEmpID.Value == EID.ToString())
                        {
                            chk.Enabled = false;
                        }
                        else
                        {
                            chk.Enabled = true;
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
    }
}
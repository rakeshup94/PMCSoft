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
using System.Text;
using System.Collections.ObjectModel;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Net;
using System.Net.Mail;
using System.IO;

using PMCSoft.Infrastructure.Data;

namespace PMCSoft.Web.Admin
{
    public partial class ViewStaff : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProjectName();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetEmployee()
        {
            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@ProjectId", ddlProject.SelectedValue);
                DataTable dt = PMCApp.Get(ht, "GetGeneralStaff");
                if (dt.Rows.Count > 0)
                {

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

                // PMC.BindGetGeneralStaff(GridView1);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetDept()
        {
            try
            {
                PMC.BindDepartmentDDL(ddlDepartment);
                ddlDesignation.Items.Insert(0, new ListItem("Select Designation", "-1"));
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindProject()
        {
            try
            {
                PMC.BindProject(GVProject);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int r = 0;
                string ch = string.Empty;

                if (txtFName.Text != "")
                {
                    if (txtDateOfBirth.Text != "")
                    {
                        if (ddlDepartment.SelectedValue != "-1")
                        {
                            if (ddlDesignation.SelectedValue != "-1")
                            {
                                if (txtDOJ.Text != "")
                                {
                                    if (txtMobileNo.Text != "")
                                    {
                                        if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                        {
                                            if (GVProject.Rows.Count > 0)
                                            {
                                                for (int i = 0; i < GVProject.Rows.Count; i++)
                                                {
                                                    CheckBox chkSW = (CheckBox)GVProject.Rows[i].Cells[0].FindControl("chkSW");
                                                    Label lblProjectName = (Label)GVProject.Rows[i].Cells[0].FindControl("lblProjectName");
                                                    HiddenField hdnPRJID = (HiddenField)GVProject.Rows[i].Cells[0].FindControl("hdnPRJID");

                                                    if (chkSW.Checked == true)
                                                    {
                                                        r = 1;
                                                        break;
                                                    }
                                                }
                                                if (r == 1)
                                                {
                                                    for (int w = 0; w < GVProject.Rows.Count; w++)
                                                    {
                                                        CheckBox chkSW = (CheckBox)GVProject.Rows[w].Cells[0].FindControl("chkSW");
                                                        if (chkSW.Checked)
                                                        {
                                                            Label lblProjectName = (Label)GVProject.Rows[w].Cells[0].FindControl("lblProjectName");
                                                            HiddenField hdnPRJID = (HiddenField)GVProject.Rows[w].Cells[0].FindControl("hdnPRJID");

                                                            ch = ch + hdnPRJID.Value + ",";
                                                            ViewState["ch"] = ch.ToString();
                                                        }
                                                    }

                                                    string strCH = ViewState["ch"].ToString().Remove(ViewState["ch"].ToString().Length - 1, 1);
                                                    ViewState["P"] = strCH.ToString();

                                                    PMC.UpdateGeneralStaffMaster(ViewState["P"].ToString(), txtFName.Text, txtLName.Text, txtDateOfBirth.Text,
                                                        ddlDepartment.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString(), txtDOJ.Text,
                                                        ddlEmployeeType.SelectedItem.Text, hdnEmployeeID.Value);

                                                    GetEmployee();
                                                    ModalPopupExtender1.Hide();

                                                    string scripts1 = "alert('User data insert successfully.');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                }
                                                else
                                                {
                                                    string scripts1 = "alert('Kindly select project.');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    ModalPopupExtender1.Show();
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly add project.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                ModalPopupExtender1.Show();
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly fill valid mobile number.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            ModalPopupExtender1.Show();
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill mobile number.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        ModalPopupExtender1.Show();
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill DOJ.');";
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
                    else
                    {
                        string scripts = "alert('Kindly fill date of birth.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill first name of user.');";
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
        protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }
        public bool isNumeric(string val, System.Globalization.NumberStyles NumberStyle)
        {
            if (val.Length > 0)
            {
                Double result;
                return Double.TryParse(val, NumberStyle,
                    System.Globalization.CultureInfo.CurrentCulture, out result);
            }
            else
            {
                return true;
            }
        }
        protected void lnkBtnProject_Click(object sender, EventArgs e)
        {
            GVProject.Visible = true;
            ModalPopupExtender1.Show();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EmpEdit")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    Label lblEmployeeID = (Label)lnk.Parent.FindControl("lblEmployeeID");
                    Label lblName = (Label)lnk.Parent.FindControl("lblName");
                    Label lblMobileNo = (Label)lnk.Parent.FindControl("lblMobileNo");
                    Label lblDOJ = (Label)lnk.Parent.FindControl("lblDOJ");
                    Label lblEmployeeType = (Label)lnk.Parent.FindControl("lblEmployeeType");
                    Label lblDesignation = (Label)lnk.Parent.FindControl("lblDesignation");
                    HiddenField hdnFName = (HiddenField)lnk.Parent.FindControl("hdnFName");
                    HiddenField hdnLName = (HiddenField)lnk.Parent.FindControl("hdnLName");
                    HiddenField hdnEmpID = (HiddenField)lnk.Parent.FindControl("hdnEmpID");
                    HiddenField hdnDOB = (HiddenField)lnk.Parent.FindControl("hdnDOB");
                    HiddenField hdnStatus = (HiddenField)lnk.Parent.FindControl("hdnStatus");
                    HiddenField hdnDeptID = (HiddenField)lnk.Parent.FindControl("hdnDeptID");
                    HiddenField hdnDepartmentName = (HiddenField)lnk.Parent.FindControl("hdnDepartmentName");
                    HiddenField hdnDesgID = (HiddenField)lnk.Parent.FindControl("hdnDesgID");
                    HiddenField hdnDesignation = (HiddenField)lnk.Parent.FindControl("hdnDesignation");

                    txtFName.Text = hdnFName.Value;
                    txtLName.Text = hdnLName.Value;
                    txtEmployeeID.Text = lblEmployeeID.Text;
                    ddlEmployeeType.SelectedItem.Text = lblEmployeeType.Text;

                    BindProject();
                    GetDept();
                    ddlDepartment.SelectedValue = hdnDeptID.Value;
                    PMC.BindDesignationDDL(ddlDesignation, ddlDepartment.SelectedValue.ToString());
                    ddlDesignation.SelectedValue = hdnDesgID.Value;
                    txtDOJ.Text = lblDOJ.Text;
                    txtDateOfBirth.Text = hdnDOB.Value;
                    txtMobileNo.Text = lblMobileNo.Text;
                    for (int i = 0; i < GVProject.Rows.Count; i++)
                    {
                        CheckBox chkSW = (CheckBox)GVProject.Rows[i].Cells[0].FindControl("chkSW");
                        HiddenField hdnPRJID = (HiddenField)GVProject.Rows[i].Cells[0].FindControl("hdnPRJID");
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetGenEmpDetailFromPRJID", hdnEmpID.Value, hdnPRJID.Value);
                        if (DT.Rows.Count > 0)
                        {
                            chkSW.Checked = true;
                        }
                    }
                    hdnEmployeeID.Value = hdnEmpID.Value;
                    ModalPopupExtender1.Show();
                }
                if (e.CommandName == "EmpDelete")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnEmpID = (HiddenField)lnk.Parent.FindControl("hdnEmpID");

                    PMC.UpdateGeneralStaff(hdnEmpID.Value);
                    GetEmployee();
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
                    LinkButton lnkEmpDelete = e.Row.FindControl("lnkEmpDelete") as LinkButton;
                    LinkButton lnkEmpEdit = e.Row.FindControl("lnkEmpEdit") as LinkButton;


                    if (hdnStatus.Value == "E")
                    {
                        lnkEmpDelete.Visible = true;
                        lnkEmpEdit.Visible = true;
                    }
                    else
                    {
                        lnkEmpDelete.Visible = false;
                        lnkEmpEdit.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetEmployee();
        }
        public void BindProjectName()
        {
            try
            {
                Hashtable ht = new Hashtable();


                ATCommon.FillDrpDown(ddlProject, PMCApp.Get(ht, "GetProjectByAdmin"), "Select", "ProjectName", "PRJID", "0");

                // PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                // GetStockOpeningDate();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }



        }
    }
}
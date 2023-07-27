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
    public partial class AddGeneralUser : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string EmpID = "";
        string DeptID = "";
        string DesgID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProject();
                    GetDept();
                }
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
            Response.Redirect("~/Admin/Home.aspx");
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
        protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {

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

                                if (txtMobileNo.Text != "")
                                {
                                    if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                    {
                                        DT = PMCApp.GetDataTableWithOneStringValue("GetStaffMobile", txtMobileNo.Text);
                                        if (DT.Rows.Count > 0)
                                        {
                                            string scripts = "alert('This user is already exists.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                        else
                                        {
                                            DT = PMCApp.GetDataTableWithOneStringValue("GetStaffOffEmpID", txtEmployeeID.Text);
                                            if (DT.Rows.Count > 0)
                                            {
                                                string scripts = "alert('Employee ID is already exists.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                            else
                                            {
                                                string str = System.Guid.NewGuid().ToString();

                                                PMC.GetMaxIDForGenEmpID(Session["CompID"].ToString(), out EmpID);

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

                                                        PMC.InsertGeneralStaffMaster(Session["CompID"].ToString(), ViewState["P"].ToString(), EmpID.ToString(),
                                                            txtFName.Text.Trim(), txtLName.Text.Trim(), txtMobileNo.Text, txtDateOfBirth.Text,
                                                            Session["UserID"].ToString(), ddlDepartment.SelectedValue.ToString(),
                                                            ddlDesignation.SelectedValue.ToString(), txtDOJ.Text, txtEmployeeID.Text, ddlEmployeeType.SelectedItem.Text);

                                                        ClearData();
                                                        string scripts1 = "alert('User data insert successfully.');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    }
                                                    else
                                                    {
                                                        string scripts1 = "alert('Kindly select project.');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    }
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly add project.');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill valid mobile number.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill mobile number.');";
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
                    else
                    {
                        string scripts = "alert('Kindly fill date of birth.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill first name of user.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void ClearData()
        {
            try
            {
                txtFName.Text = ""; txtLName.Text = ""; txtDateOfBirth.Text = ""; txtMobileNo.Text = "";
                ddlDesignation.SelectedValue = "-1"; txtEmployeeID.Text = ""; txtDateOfBirth.Text = ""; txtDOJ.Text = "";

                BindProject();
                GetDept();
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

        protected void btnRun_Click(object sender, EventArgs e)
        {
            GVProject.Visible = true;
        }
    }
}
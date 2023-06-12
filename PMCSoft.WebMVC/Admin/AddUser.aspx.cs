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
    public partial class AddUser : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string EmpID = "";
        string DesgID = "";
        string DeptID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetCountry();
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
                PMC.BindReportingTo(ddlReportingTo);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetCountry()
        {
            try
            {
                PMC.BindCountryDdl(ddlCountry);
                ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
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
                //PMC.BindProjectDdl(ddlProject);
                //PMC.BindEmpDdl(ddlReportingTo, ddlProject.SelectedValue.ToString());
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
                int r = 0;
                string ch = string.Empty;
                //if (ddlProject.SelectedValue != "-1")
                //{
                if (txtFName.Text != "")
                {
                    if (ddlCountry.SelectedValue != "-1")
                    {
                        if (ddlState.SelectedValue != "-1")
                        {
                            if (ddlCity.SelectedValue != "-1")
                            {
                                if (txtDateOfBirth.Text != "")
                                {
                                    if (txtEmail.Text != "")
                                    {
                                        if (txtPassword.Text != "")
                                        {
                                            if (txtConfirmPassword.Text != "")
                                            {
                                                if (ddlDepartment.SelectedValue != "-1")
                                                {
                                                    if (ddlDesignation.SelectedValue != "-1")
                                                    {
                                                        if (txtDOJ.Text != "")
                                                        {
                                                            if (this.IsValidEmail(txtEmail.Text))
                                                            {
                                                                if (this.IsValidPassword(txtPassword.Text))
                                                                {
                                                                    if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                                                    {
                                                                        if (this.isNumeric(txtZipCode.Text, System.Globalization.NumberStyles.Integer))
                                                                        {
                                                                            if (txtPassword.Text == txtConfirmPassword.Text)
                                                                            {
                                                                                DT = PMCApp.GetDataTableWithOneStringValue("GetEmpEmail", txtEmail.Text);
                                                                                if (DT.Rows.Count > 0)
                                                                                {
                                                                                    string scripts = "alert('This user is already exists.');";
                                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                }
                                                                                else
                                                                                {
                                                                                    DT = PMCApp.GetDataTableWithOneStringValue("GetEmpOffEmpID", txtEmployeeID.Text);
                                                                                    if (DT.Rows.Count > 0)
                                                                                    {
                                                                                        string scripts = "alert('Employee Id is already exists.');";
                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        PMC.GetMaxIDForEmpID(Session["CompID"].ToString(), out EmpID);

                                                                                        if (ddlReportingTo.SelectedValue == "-1")
                                                                                        {
                                                                                            ViewState["RT"] = EmpID;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            ViewState["RT"] = ddlReportingTo.SelectedValue.ToString();
                                                                                        }
                                                                                        string str = System.Guid.NewGuid().ToString();
                                                                                        string Pwd = CreateMD5Hash(txtPassword.Text);

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

                                                                                                PMC.InsertEmployeeMaster(Session["CompID"].ToString(), ViewState["P"].ToString(), EmpID.ToString(),
                                                                                                    txtFName.Text.Trim(), txtLName.Text.Trim(), txtAddress.Text, ddlCountry.SelectedValue.ToString(), ddlState.SelectedValue.ToString(),
                                                                                                    ddlCity.SelectedValue.ToString(), txtZipCode.Text, txtMobileNo.Text, txtEmail.Text, Pwd.ToString(), "2", txtDateOfBirth.Text,
                                                                                                    txtAltEmail.Text, ViewState["RT"].ToString(), Session["UserID"].ToString(), ddlDepartment.SelectedValue.ToString(),
                                                                                                    ddlDesignation.SelectedValue.ToString(), txtDOJ.Text, txtEmployeeID.Text, ddlEmployeeType.SelectedItem.Text);

                                                                                                PMC.InsertUserVerificationCode(Session["CompID"].ToString(), EmpID.ToString(), txtEmail.Text, str.ToString());

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
                                                                                string scripts = "alert('Confirm password and password must be same.');";
                                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            string scripts = "alert('Kindly fill valid zip code.');";
                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
                                                                    string scripts = "alert('Password should be of minimum one character, one numeric, one special character and between 8 to 20 character.');";
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                }
                                                            }
                                                            else
                                                            {
                                                                string scripts = "alert('Kindly fill valid email.');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            string scripts = "alert('Kindly fill date of joining.');";
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
                                                string scripts = "alert('Kindly fill confirm password.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly fill password.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill email id.');";
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
                                string scripts = "alert('Kindly select city.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select state.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select country.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill first name of user.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                //}
                //else
                //{
                //    string scripts = "alert('Kindly select project.');";
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                //}
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
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlState, ddlCountry.SelectedValue.ToString());
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            PMC.BindCityDdl(ddlCity, ddlState.SelectedValue.ToString());
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //PMC.BindEmpDdl(ddlReportingTo, ddlProject.SelectedValue.ToString());
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
        protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void ClearData()
        {
            try
            {
                //ddlProject.SelectedValue = "-1";
                txtFName.Text = ""; txtLName.Text = ""; txtAddress.Text = "";
                ddlState.SelectedValue = "-1"; ddlCity.SelectedValue = "-1"; txtZipCode.Text = ""; txtDateOfBirth.Text = "";
                txtMobileNo.Text = ""; txtEmail.Text = ""; txtPassword.Text = ""; txtConfirmPassword.Text = "";
                ddlDesignation.SelectedValue = "-1"; txtAltEmail.Text = ""; txtDOJ.Text = ""; txtEmployeeID.Text = "";

                GetCountry();
                BindProject();
                GetDept();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private bool IsValidEmail(string emailAddress)
        {
            return Regex.IsMatch(emailAddress, @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");
        }
        public string CreateMD5Hash(string input)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
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
        private bool IsValidPassword(string sPassword)
        {
            if (sPassword.Length > 8 || sPassword.Length < 20)
            {
                string sPattern;
                sPattern = "[^a-zA-Z0-9\n\r\t ]";
                Regex oReg = new Regex(sPattern, RegexOptions.IgnoreCase);
                return oReg.IsMatch(sPassword);
            }
            else
            {
                return false;
            }
        }
        protected void lnkBtnProject_Click(object sender, EventArgs e)
        {
            GVProject.Visible = true;
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
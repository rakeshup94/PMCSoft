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
    public partial class ViewUser : BasePage
    {
          
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProjectName();
                    //GetEmployee();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindProjectName()
        {
            try
            {
                Hashtable ht = new Hashtable();


                ATCommon.FillDrpDown(ddlProject, PMCApp.Get(ht, "GetProjectByAdmin"), "Select", "ProjectName", "PRJID", "0");


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
        public void GetEmployee()
        {
            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@ProjectId", ddlProject.SelectedValue);
                DataTable dt = PMCApp.Get(ht, "GetEmpployee");
                if (dt.Rows.Count > 0)
                {

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

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
                if (e.CommandName == "EmpEdit")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnProjectID = (HiddenField)lnk.Parent.FindControl("hdnProjectID");
                    HiddenField hdnEmpID = (HiddenField)lnk.Parent.FindControl("hdnEmpID");
                    HiddenField hdnFName = (HiddenField)lnk.Parent.FindControl("hdnFName");
                    HiddenField hdnLName = (HiddenField)lnk.Parent.FindControl("hdnLName");
                    HiddenField hdnAddress1 = (HiddenField)lnk.Parent.FindControl("hdnAddress1");
                    HiddenField hdnCountry = (HiddenField)lnk.Parent.FindControl("hdnCountry");
                    HiddenField hdnState = (HiddenField)lnk.Parent.FindControl("hdnState");
                    HiddenField hdnCity = (HiddenField)lnk.Parent.FindControl("hdnCity");
                    HiddenField hdnZipCode = (HiddenField)lnk.Parent.FindControl("hdnZipCode");
                    HiddenField hdnAccountType = (HiddenField)lnk.Parent.FindControl("hdnAccountType");
                    HiddenField hdnDOB = (HiddenField)lnk.Parent.FindControl("hdnDOB");
                    HiddenField hdnAltEmail = (HiddenField)lnk.Parent.FindControl("hdnAltEmail");
                    HiddenField hdnReportingTo = (HiddenField)lnk.Parent.FindControl("hdnReportingTo");
                    HiddenField hdnReportingToName = (HiddenField)lnk.Parent.FindControl("hdnReportingToName");
                    HiddenField hdnCreatedBy = (HiddenField)lnk.Parent.FindControl("hdnCreatedBy");
                    HiddenField hdnCreatedDate = (HiddenField)lnk.Parent.FindControl("hdnCreatedDate");
                    HiddenField hdnDeptID = (HiddenField)lnk.Parent.FindControl("hdnDeptID");
                    HiddenField hdnDesgID = (HiddenField)lnk.Parent.FindControl("hdnDesgID");
                    HiddenField hdnEmpType = (HiddenField)lnk.Parent.FindControl("hdnEmpType");
                    Label lblEmpID = (Label)lnk.Parent.FindControl("lblEmpID");
                    Label lblName = (Label)lnk.Parent.FindControl("lblName");
                    Label lblAddress = (Label)lnk.Parent.FindControl("lblAddress");
                    Label lblMobNo = (Label)lnk.Parent.FindControl("lblMobileNo");
                    Label lblEmail = (Label)lnk.Parent.FindControl("lblEmail");
                    Label lblDOJ = (Label)lnk.Parent.FindControl("lblDOJ");

                    txtFName.Text = hdnFName.Value;
                    txtLName.Text = hdnLName.Value;
                    txtEmployeeID.Text = lblEmpID.Text;
                    GetCountry();
                    BindProject();
                    GetDept();
                    ddlEmployeeType.SelectedItem.Text = hdnEmpType.Value;
                    ddlDepartment.SelectedValue = hdnDeptID.Value;
                    PMC.BindDesignationDDL(ddlDesignation, ddlDepartment.SelectedValue.ToString());
                    ddlDesignation.SelectedValue = hdnDesgID.Value;
                    ddlReportingTo.SelectedValue = hdnReportingTo.Value;
                    txtMobileNo.Text = lblMobNo.Text;
                    txtDOJ.Text = lblDOJ.Text;
                    txtDateOfBirth.Text = hdnDOB.Value;
                    txtEmail.Text = lblEmail.Text;
                    txtAltEmail.Text = hdnAltEmail.Value;
                    txtAddress.Text = hdnAddress1.Value;
                    ddlCountry.SelectedValue = hdnCountry.Value;
                    PMC.BindStateDdl(ddlState, ddlCountry.SelectedValue.ToString());
                    ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
                    ddlState.SelectedValue = hdnState.Value;
                    PMC.BindCityDdl(ddlCity, ddlState.SelectedValue.ToString());
                    ddlCity.SelectedValue = hdnCity.Value;
                    txtZipCode.Text = hdnZipCode.Value;
                    for (int i = 0; i < GVProject.Rows.Count; i++)
                    {
                        CheckBox chkSW = (CheckBox)GVProject.Rows[i].Cells[0].FindControl("chkSW");
                        HiddenField hdnPRJID = (HiddenField)GVProject.Rows[i].Cells[0].FindControl("hdnPRJID");
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetEmpDetailFromPRJID", hdnEmpID.Value, hdnPRJID.Value);
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

                    PMC.UpdateEmpStatus(hdnEmpID.Value);
                    GetEmployee();
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
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender1.Hide();
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
                                        if (ddlDepartment.SelectedValue != "-1")
                                        {
                                            if (ddlDesignation.SelectedValue != "-1")
                                            {
                                                if (txtDOJ.Text != "")
                                                {
                                                    if (this.IsValidEmail(txtEmail.Text))
                                                    {
                                                        if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                                        {
                                                            if (this.isNumeric(txtZipCode.Text, System.Globalization.NumberStyles.Integer))
                                                            {
                                                                if (ddlReportingTo.SelectedValue == "-1")
                                                                {
                                                                    ViewState["RT"] = hdnEmployeeID.Value;
                                                                }
                                                                else
                                                                {
                                                                    ViewState["RT"] = ddlReportingTo.SelectedValue.ToString();
                                                                }
                                                                string str = System.Guid.NewGuid().ToString();

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

                                                                        PMC.UpdateEmployee(ViewState["P"].ToString(), txtFName.Text, txtLName.Text, txtAddress.Text, ddlCountry.SelectedValue.ToString(),
                                                                            ddlState.SelectedValue.ToString(), ddlCity.SelectedValue.ToString(), txtZipCode.Text, txtMobileNo.Text, txtDateOfBirth.Text,
                                                                            txtAltEmail.Text, ddlReportingTo.SelectedValue.ToString(), ddlDepartment.SelectedValue.ToString(), ddlDesignation.SelectedValue.ToString(),
                                                                            txtDOJ.Text, ddlEmployeeType.SelectedItem.Text, hdnEmployeeID.Value);

                                                                        GetEmployee();
                                                                        ModalPopupExtender1.Hide();

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
            }
        }
        protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlState, ddlCountry.SelectedValue.ToString());
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
                ModalPopupExtender1.Show();
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
        private bool IsValidEmail(string emailAddress)
        {
            return Regex.IsMatch(emailAddress, @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");
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

        protected void lnkBtnProject_Click1(object sender, EventArgs e)
        {
            GVProject.Visible = true;
            ModalPopupExtender1.Show();
        }
    }
}
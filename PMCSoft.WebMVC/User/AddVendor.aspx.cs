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

namespace PMCSoft.Web.User
{
    public partial class AddVendor : BasePage
    {
      
        DataTable DT = new DataTable();
        string VenID = "", TypeID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetCountry();
                    BindProject();
                    PMC.BindGetPartyVendorType(ddlVendorType);
                }
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
                PMC.BindGetEmpProjGV(GVProject, Session["UserID"].ToString());
                //PMC.BindGetVendorDetail(GridView1);
                PMC.BindGetEmpProj(ddlP, Session["UserID"].ToString());
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
                Response.Redirect("~/User/Home.aspx");
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
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
                int check = 0, r = 0;
                string ch = string.Empty;
                if (txtEmail.Text.Length > 0)
                {
                    if (this.IsValidEmail(txtEmail.Text))
                    {
                        check = 0;
                    }
                    else
                    {
                        check = 1;
                    }
                }
                else
                {
                    check = 0;
                }
                if (txtName.Text != "")
                {
                    if (ddlCountry.SelectedValue != "-1")
                    {
                        if (ddlState.SelectedValue != "-1")
                        {
                            if (ddlCity.SelectedValue != "-1")
                            {
                                if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                {
                                    if (check == 0)
                                    {
                                        if (ddlVendorType.SelectedValue != "-1")
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
                                                    DT = PMCApp.GetDataTableWithOneStringValue("GetVendor", txtMobileNo.Text);
                                                    if (DT.Rows.Count > 0)
                                                    {
                                                        string scripts1 = "alert('This vendor is already exists.');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    }
                                                    else
                                                    {
                                                        PMC.GetMaxIDForVenID(Session["CompID"].ToString(), out VenID);
                                                        string strCH = ViewState["ch"].ToString().Remove(ViewState["ch"].ToString().Length - 1, 1);
                                                        ViewState["P"] = strCH.ToString();

                                                        PMC.InsertVendorDetail(Session["CompID"].ToString(), ViewState["P"].ToString(), VenID.ToString(), txtName.Text,
                                                            txtAddress.Text, ddlCountry.SelectedValue.ToString(), ddlState.SelectedValue.ToString(),
                                                            ddlCity.SelectedValue.ToString(), txtMobileNo.Text, txtEmail.Text, ddlVendorType.SelectedItem.Text,
                                                            Session["UserID"].ToString(), ddlVendorType.SelectedValue.ToString(), TxtPanNo.Text, TxtTinNo.Text, TxtEccNo.Text, TxtVat.Text);

                                                        ClearData();

                                                        string scripts1 = "alert('Vendor data insert successfully.');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    }
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
                                            string scripts = "alert('Kindly select vendor type.');";
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
                                    string scripts = "alert('Kindly fill valid mobile no.');";
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
                    string scripts = "alert('Kindly fill vendor name.');";
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
                txtName.Text = ""; txtAddress.Text = ""; ddlCountry.SelectedValue = "-1"; ddlState.SelectedValue = "-1";
                ddlCity.SelectedValue = "-1"; txtMobileNo.Text = ""; txtEmail.Text = ""; ddlVendorType.SelectedValue = "-1";
                BindProject();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void lnkBtnProject_Click(object sender, EventArgs e)
        {
            GVProject.Visible = true;
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
            try
            {
                PMC.BindCityDdl(ddlCity, ddlState.SelectedValue.ToString());
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
        protected void ddlP_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindGetVendorDetailByProject(GridView1, ddlP.SelectedValue.ToString());
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
                if (e.CommandName == "EditVendor")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField HiddenField1 = (HiddenField)lnk.Parent.FindControl("HiddenField1");
                    DT = PMCApp.GetDataTableWithOneStringValue("GetVendorDetailFromID", HiddenField1.Value);
                    if (DT.Rows.Count > 0)
                    {
                        PMC.BindCountryDdl(ddlECountry);
                        ddlECountry.SelectedValue = DT.Rows[0]["Country"].ToString();
                        PMC.BindStateDdl(ddlEState, ddlECountry.SelectedValue.ToString());
                        ddlEState.SelectedValue = DT.Rows[0]["State"].ToString();
                        PMC.BindCityDdl(ddlECity, ddlEState.SelectedValue.ToString());
                        ddlECity.SelectedValue = DT.Rows[0]["City"].ToString();
                        PMC.BindGetPartyVendorType(ddlEVendorType);
                        ddlEVendorType.SelectedValue = DT.Rows[0]["VendorTypeCode"].ToString();
                        txtEName.Text = DT.Rows[0]["Name"].ToString();
                        txtEAddress.Text = DT.Rows[0]["Address"].ToString();
                        txtEMobileNo.Text = DT.Rows[0]["MobileNo"].ToString();
                        txtEEmail.Text = DT.Rows[0]["Email"].ToString();
                        PMC.BindGetEmpProjGV(GridView2, Session["UserID"].ToString());
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            CheckBox chkSW = (CheckBox)GridView2.Rows[i].Cells[0].FindControl("chkSW");
                            HiddenField hdnPRJID = (HiddenField)GridView2.Rows[i].Cells[0].FindControl("hdnPRJID");
                            DT = PMCApp.GetDataTableWithTwoStringValue("GetVendorDetailFromPRJID", HiddenField1.Value, hdnPRJID.Value);
                            if (DT.Rows.Count > 0)
                            {
                                chkSW.Checked = true;
                            }
                        }
                        HiddenField2.Value = HiddenField1.Value;
                        ModalPopupExtender1.Show();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlECountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlEState, ddlECountry.SelectedValue.ToString());
                ddlECity.Items.Insert(0, new ListItem("Select City", "-1"));
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlEState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindCityDdl(ddlECity, ddlEState.SelectedValue.ToString());
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnECancel_Click(object sender, EventArgs e)
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
        protected void btnESubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int check = 0, r = 0;
                string ch = string.Empty;
                if (txtEEmail.Text.Length > 0)
                {
                    if (this.IsValidEmail(txtEEmail.Text))
                    {
                        check = 0;
                    }
                    else
                    {
                        check = 1;
                    }
                }
                else
                {
                    check = 0;
                }
                if (txtEName.Text != "")
                {
                    if (ddlECountry.SelectedValue != "-1")
                    {
                        if (ddlEState.SelectedValue != "-1")
                        {
                            if (ddlECity.SelectedValue != "-1")
                            {
                                if (this.isNumeric(txtEMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                {
                                    if (check == 0)
                                    {
                                        if (ddlEVendorType.SelectedValue != "-1")
                                        {
                                            if (GridView2.Rows.Count > 0)
                                            {
                                                for (int i = 0; i < GridView2.Rows.Count; i++)
                                                {
                                                    CheckBox chkSW = (CheckBox)GridView2.Rows[i].Cells[0].FindControl("chkSW");
                                                    Label lblProjectName = (Label)GridView2.Rows[i].Cells[0].FindControl("lblProjectName");
                                                    HiddenField hdnPRJID = (HiddenField)GridView2.Rows[i].Cells[0].FindControl("hdnPRJID");

                                                    if (chkSW.Checked == true)
                                                    {
                                                        r = 1;
                                                        break;
                                                    }
                                                }
                                                if (r == 1)
                                                {
                                                    for (int w = 0; w < GridView2.Rows.Count; w++)
                                                    {
                                                        CheckBox chkSW = (CheckBox)GridView2.Rows[w].Cells[0].FindControl("chkSW");
                                                        if (chkSW.Checked)
                                                        {
                                                            Label lblProjectName = (Label)GridView2.Rows[w].Cells[0].FindControl("lblProjectName");
                                                            HiddenField hdnPRJID = (HiddenField)GridView2.Rows[w].Cells[0].FindControl("hdnPRJID");

                                                            ch = ch + hdnPRJID.Value + ",";
                                                            ViewState["ch1"] = ch.ToString();
                                                        }
                                                    }

                                                    string strCH = ViewState["ch1"].ToString().Remove(ViewState["ch1"].ToString().Length - 1, 1);
                                                    ViewState["P1"] = strCH.ToString();

                                                    PMC.UpdateVendor(ViewState["P1"].ToString(), HiddenField2.Value, txtEName.Text, txtEAddress.Text,
                                                        ddlECountry.SelectedValue.ToString(), ddlEState.SelectedValue.ToString(), ddlECity.SelectedValue.ToString(),
                                                        txtEMobileNo.Text, txtEEmail.Text, ddlEVendorType.SelectedItem.Text, ddlEVendorType.SelectedValue.ToString());

                                                    ModalPopupExtender1.Hide();
                                                    //PMC.BindGetVendorDetail(GridView1);
                                                    PMC.BindGetVendorDetailByProject(GridView1, ddlP.SelectedValue.ToString());
                                                    string scripts1 = "alert('update successfully.');";
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
                                            string scripts = "alert('Kindly select vendor type.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            ModalPopupExtender1.Show();
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill valid email.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        ModalPopupExtender1.Show();
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill valid mobile no.');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    ModalPopupExtender1.Show();
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly select city.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                ModalPopupExtender1.Show();
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select state.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            ModalPopupExtender1.Show();
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select country.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill vendor name.');";
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
        protected void ImageButton2_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            ModalPopupExtender1.Show();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender2.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtVendorType.Text != "")
                {
                    DT = PMCApp.GetDataTableWithOneStringValue("GetVendorType", txtVendorType.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('This party/vendor type is already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender2.Show();
                    }
                    else
                    {
                        PMC.GetMaxIDForVenTypeID(Session["CompID"].ToString(), out TypeID);

                        PMC.InsertVendorType(Session["CompID"].ToString(), TypeID.ToString(), txtVendorType.Text, Session["UserID"].ToString(),
                            Session["UserID"].ToString());

                        txtVendorType.Text = "";
                        PMC.BindGetPartyVendorType(ddlVendorType);
                        ModalPopupExtender2.Hide();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill party/vendor type.');";
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
        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender2.Hide();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
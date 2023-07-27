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
 
using PMCSoft.Infrastructure.Data;

namespace PMCSoft.Web.User
{
    public partial class ChangePassword : BasePage
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

                    }
                }
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
                if (txtOldPassword.Text != "" && txtNewPassword.Text != "" && txtReType.Text != "")
                {
                    if (txtNewPassword.Text == txtReType.Text)
                    {
                        string OldPwd = CreateMD5Hash(txtOldPassword.Text);
                        DT = PMCApp.GetDataTableWithThreeStringValue("EmpPassword", Session["CompID"].ToString(), Session["UserID"].ToString(), OldPwd.ToString());
                        if (DT.Rows.Count > 0)
                        {
                            ViewState["Pwd"] = "R";
                        }
                        else
                        {
                            ViewState["Pwd"] = "W";
                        }
                        if (ViewState["Pwd"].ToString() == "R")
                        {
                            if (this.IsValidPassword(txtNewPassword.Text))
                            {
                                string Pwd = CreateMD5Hash(txtNewPassword.Text);
                                PMCApp.UpdateThreeStringValue("UpdateEmpPassword", Pwd.ToString(), Session["CompID"].ToString(), Session["UserID"].ToString());

                                txtOldPassword.Text = ""; txtNewPassword.Text = ""; txtReType.Text = "";

                                string scripts = "alert('Your Password Change Successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill at least one digit, one character, one special characters, and 8-20 characters in length in password. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else if (ViewState["Pwd"].ToString() == "W")
                        {
                            string scripts = "alert('Your Old Password is Incorrect.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Fill Same Password.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Fill All (*) Mandetory Fields.');";
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
                Response.Redirect("~/PL/Home.aspx");
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
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
        private bool IsValidPassword(string sPassword)
        {
            if (sPassword.Length > 8 || sPassword.Length < 20)
            {
                string sPattern;
                //sPattern = "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,20})$";
                sPattern = "[^a-zA-Z0-9\n\r\t ]";
                Regex oReg = new Regex(sPattern, RegexOptions.IgnoreCase);
                return oReg.IsMatch(sPassword);
            }
            else
            {
                return false;
            }
        }
    }
}
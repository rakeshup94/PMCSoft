using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using PMCSoft.Infrastructure.Data;
using System.Collections;
using System.Security.Policy;

namespace PMCSoft.Web
{

    public partial class Login : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoginId"] != null)
                {
                    var returnUrl = Session["AID"].ToString() == "1" ? "~/Admin/Home.aspx" : "~/User/Home.aspx";
                    Response.Redirect(returnUrl);
                }
            }

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string _password = CreateMD5Hash(txtPassword.Text.Trim());
                Hashtable ht = new Hashtable();
                ht.Add("@flag", 1);
                ht.Add("@UserName", txtUserID.Text.Trim());
                ht.Add("@Password", _password);
                DataTable result = PMCApp.Get(ht, "LoginProc");
                var IsResult = Convert.ToInt32(result.Rows[0]["IsResult"]);
                if (IsResult > 0)
                {
                    var User = new
                    {
                        UserId = (long)result.Rows[0]["UserId"],
                        EmpId = result.Rows[0]["EmpId"].ToString(),
                        EmpName = result.Rows[0]["EmpName"].ToString(),
                        CompanyId = result.Rows[0]["CompanyId"].ToString(),
                        ProjectId = result.Rows[0]["ProjectId"].ToString(),
                        UserTypeId = (int)result.Rows[0]["UserTypeId"],
                        AccountType = result.Rows[0]["AccountType"].ToString(),
                        UserEmail = txtUserID.Text.Trim(),
                        LoginId = (long)result.Rows[0]["LoginId"],
                    };
                    Session["LoginId"] = User.LoginId;
                    Session["UserId"] = User.UserId;
                    Session["UserName"] = User.EmpName;
                    Session["CompID"] = User.CompanyId;
                    Session["AName"] = User.AccountType;
                    Session["UserEmail"] = User.UserEmail;
                    Session["AID"] = User.UserTypeId;
                    Session["PRJID"] = User.ProjectId;

                    var returnUrl = User.UserTypeId == 1 ? "~/Admin/Home.aspx" : "~/User/Home.aspx";
       

                    Response.Redirect(returnUrl, false);
                    HttpContext.Current.ApplicationInstance.CompleteRequest();

                }
                else
                {
                    lblMsg.Text = result.Rows[0]["Message"].ToString();

                }

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs." + ex.Message.ToString() + ");";
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
        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {

        }
    }
}
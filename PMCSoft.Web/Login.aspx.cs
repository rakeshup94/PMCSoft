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
namespace PMCSoft.Web
{

    public partial class Login : System.Web.UI.Page
    {


        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        DataTable DA = new DataTable();
        string AID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    lblMsg.Text = "";
                    string Value = Server.UrlDecode(Request.QueryString["Value"]);
                    if (Value == "1")
                    {
                        PMC.InsertLogOut(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["LoginId"].ToString(), Session["PRJID"].ToString());
                        Session.Abandon();
                        lblMsg.Text = "Logout Successfully";
                    }
                    if (Request.QueryString["Value"] == "2")
                    {
                        lblMsg.Text = "You are not an authorized user or you are already login.";
                    }
                    if (Session["UserId"] != null || Session["UserName"] != null || Session["CompID"] != null || Session["AName"] != null || Session["UserEmail"] != null || Session["AID"] != null || Session["PRJID"] != null)
                    {
                        if (Session["AID"].ToString() == "1")
                        {
                            Response.Redirect("~/Admin/Home.aspx");
                        }
                        else
                        {
                            //Response.Redirect("~/User/Home.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    //string scripts = "alert('Some error occurs.');";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            txtUserID.Focus();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUserID.Text != "")
                {
                    if (txtPassword.Text != "")
                    {
                        string Pwd = CreateMD5Hash(txtPassword.Text);
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetEmployee", txtUserID.Text, Pwd.ToString());
                        if (DT.Rows.Count > 0)
                        {
                            var User = new
                            {
                                UserId = DT.Rows[0]["EmpID"].ToString(),
                                UserName = DT.Rows[0]["Name"].ToString(),
                                CompanyId = DT.Rows[0]["CompanyID"].ToString(),
                                AName = DT.Rows[0]["AccountType"].ToString(),
                                AID = DT.Rows[0]["AID"].ToString(),
                                ProjectId = DT.Rows[0]["ProjectID"].ToString(),
                                UserEmail = txtUserID.Text,
                            };

                            DataTable DV = new DataTable();
                            DV = PMCApp.GetDataTableWithTwoStringValue("GetUserVerify", User.CompanyId, User.UserId);
                            if (DV.Rows.Count > 0)
                            {
                                DataTable DL = new DataTable();
                                DL = PMCApp.GetDataTableWithTwoStringValue("GetLogInformation", User.UserId, User.CompanyId);
                                if (DL.Rows.Count > 0)
                                {
                                    int value;
                                    PMC.InsertLoginInformation(User.UserId, User.CompanyId, User.ProjectId);
                                    PMCApp.FindTransId("GetRecordId", User.ProjectId, User.UserId, out value);
                                    PMC.InsertDataForThreeString(User.UserId, User.CompanyId, value.ToString());
                                    Session["LoginId"]  = value.ToString();
                                }
                                Session["UserId"] = User.UserId;
                                Session["UserName"] = User.UserName;
                                Session["CompID"] = User.CompanyId;
                                Session["AName"] = User.AName;
                                Session["UserEmail"] = User.UserEmail;
                                Session["AID"] = User.AID;
                                Session["PRJID"] = User.ProjectId;

                                var returnUrl = User.AID == "1" ? "~/Admin/Home.aspx" : "~/User/Home.aspx";
                                Response.Redirect(returnUrl);

                            }
                            else
                            {
                                lblMsg.Text = "This email id is not verified, please verify the mail id from your mail.";
                            }
                        }
                        else
                        {
                            lblMsg.Text = "Incorrect Login, please try again.";
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Kindly Fill Password";
                    }
                }
                else
                {
                    lblMsg.Text = "Kindly Fill User Id";
                }
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
        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {

        }
    }
}
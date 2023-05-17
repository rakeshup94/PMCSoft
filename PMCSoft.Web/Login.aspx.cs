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
                        if (Session["AID"] == "1")
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
                            DataTable DV = new DataTable();
                            DV = PMCApp.GetDataTableWithTwoStringValue("GetUserVerify", DT.Rows[0]["CompanyID"].ToString(), DT.Rows[0]["EmpID"].ToString());
                            if (DV.Rows.Count > 0)
                            {
                                DataTable DL = new DataTable();
                                DL = PMCApp.GetDataTableWithTwoStringValue("GetLogInformation", DT.Rows[0]["EmpID"].ToString(), DT.Rows[0]["CompanyID"].ToString());
                                if (DL.Rows.Count > 0)
                                {
                                    Session["UserId"] = DT.Rows[0]["EmpID"].ToString();
                                    Session["UserName"] = DT.Rows[0]["Name"].ToString();
                                    Session["CompID"] = DT.Rows[0]["CompanyID"].ToString();
                                    Session["AName"] = DT.Rows[0]["AccountType"].ToString();
                                    Session["UserEmail"] = txtUserID.Text;
                                    Session["AID"] = DT.Rows[0]["AID"].ToString();
                                    Session["PRJID"] = DT.Rows[0]["ProjectID"].ToString();
                                    AID = DT.Rows[0]["AID"].ToString();
                                    if (AID == "1")
                                    {

                                        int value;
                                        PMC.InsertLoginInformation(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["PRJID"].ToString());
                                        PMCApp.FindTransId("GetRecordId", Session["PRJID"].ToString(), Session["UserId"].ToString(), out value);
                                        Session["LoginId"] = value.ToString();

                                        Response.Redirect("~/Admin/Home.aspx");
                                    }
                                    else
                                    {
                                        int value;
                                        PMC.InsertLoginInformation(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["PRJID"].ToString());
                                        PMCApp.FindTransId("GetRecordId", Session["PRJID"].ToString(), Session["UserId"].ToString(), out value);
                                        Session["LoginId"] = value.ToString();
                                        Response.Redirect("~/User/Home.aspx");
                                    }
                                    PMC.InsertDataForThreeString(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["LoginId"].ToString());
                                }
                                else
                                {
                                    Session["UserId"] = DT.Rows[0]["EmpID"].ToString();
                                    Session["UserName"] = DT.Rows[0]["Name"].ToString();
                                    Session["CompID"] = DT.Rows[0]["CompanyID"].ToString();
                                    Session["AName"] = DT.Rows[0]["AccountType"].ToString();
                                    Session["UserEmail"] = txtUserID.Text;
                                    Session["AID"] = DT.Rows[0]["AID"].ToString();
                                    AID = DT.Rows[0]["AID"].ToString();
                                    Session["PRJID"] = DT.Rows[0]["ProjectID"].ToString();
                                    if (AID == "1")
                                    {
                                        int value;
                                        PMC.InsertLoginInformation(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["PRJID"].ToString());
                                        PMCApp.FindTransId("GetRecordId", Session["PRJID"].ToString(), Session["UserId"].ToString(), out value);
                                        Session["LoginId"] = value.ToString();
                                        Response.Redirect("~/Admin/Home.aspx");
                                    }
                                    else
                                    {
                                        int value;
                                        PMC.InsertLoginInformation(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["PRJID"].ToString());
                                        PMCApp.FindTransId("GetRecordId", Session["PRJID"].ToString(), Session["UserId"].ToString(), out value);
                                        Session["LoginId"] = value.ToString();
                                        Response.Redirect("~/User/Home.aspx");
                                    }
                                    PMC.InsertDataForThreeString(Session["UserId"].ToString(), Session["CompID"].ToString(), Session["LoginId"].ToString());
                                }
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
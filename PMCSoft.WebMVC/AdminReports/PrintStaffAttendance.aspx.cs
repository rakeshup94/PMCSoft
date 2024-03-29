﻿using PMCSoft.Core.Common;
using PMCSoft.Infrastructure.Data;
using System;
using System.Data;
using System.Web;
using System.Web.UI;
namespace PMCSoft.Web.AdminReports
{
    public partial class PrintStaffAttendance : BasePage
    {
         
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                {
                    HttpContext.Current.Response.Write("<script>window.print();</script>");
                }
                if (!IsPostBack)
                {
                    string strReq = "";
                    strReq = Request.RawUrl;
                    strReq = strReq.Substring(strReq.IndexOf('?') + 1);

                    if (!strReq.Equals(""))
                    {
                        strReq = DecryptQueryString(strReq);
                        string[] arrMsgs = strReq.Split('&');
                        string[] arrIndMsg;

                        string PRJID = "", Date = "", ProjName = "";
                        arrIndMsg = arrMsgs[0].Split('=');
                        PRJID = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[1].Split('=');
                        Date = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[2].Split('=');
                        ProjName = arrIndMsg[1].ToString().Trim();

                        lblDate.Text = Date.ToString();
                        lblProjectName.Text = ProjName.ToString();

                        GetValue(PRJID.ToString(), lblDate.Text);
                        //GetD();

                    }

                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        //public void GetD()
        //{
        //    try
        //    {
        //       // PMC.BindGetProjectForAdmin(p);
        //        PMC.BindGetAttendance(GridView1, ddlProject.SelectedValue.ToString(), txtDate.Text);
        //    }
        //    catch (Exception ex)
        //    {
        //        string scripts = "alert('Some error occurs.');";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        //    }
        //}
        private string DecryptQueryString(string strQueryString)
        {
              
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
            
            return  strQueryString.Encrypt();
        }
        public void GetValue(string PRJID, string Date)
        {
            try
            {
                DT = PMCApp.GetDataTableWithTwoStringValue("GetAttendance", PRJID, Date);
                if (DT.Rows.Count > 0)
                {
                    PMC.BindGetAttendance(GridView1, PRJID, Date);
                    lblDate.Text = DT.Rows[0]["CreatedDate1"].ToString();
                }
                else
                {
                    PMC.BindGetAttendance(GridView1, PRJID, Date);
                    string scripts = "alert('No record found. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
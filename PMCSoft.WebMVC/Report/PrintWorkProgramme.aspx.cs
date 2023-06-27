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
 
using PMCSoft.Infrastructure.Data;

namespace PMCSoft.Web.Report
{
    public partial class PrintWorkProgramme : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
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
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Encrypt();
        }
        public void GetValue(string PRJID, string Date)
        {
            try
            {
                DT = PMCApp.GetDataTableWithTwoStringValue("GetDailyWP", PRJID, Date);
                if (DT.Rows.Count > 0)
                {
                    Panel1.Visible = true;
                    lblNumber.Text = DT.Rows[0]["WPNumber"].ToString();
                    lblWorkProgrammeDate.Text = DT.Rows[0]["WPDate"].ToString();
                    hdnWPDate.Value = DT.Rows[0]["WPDate1"].ToString();
                    lblEngInCharge.Text = DT.Rows[0]["EngInCharge1"].ToString();
                    lblBlock.Text = DT.Rows[0]["Block"].ToString();
                    lblSupervisor.Text = DT.Rows[0]["Supervisor1"].ToString();
                    lblForeman.Text = DT.Rows[0]["Foreman1"].ToString();
                    lblEngineer.Text = DT.Rows[0]["Engineer1"].ToString();
                    hdnWPID.Value = DT.Rows[0]["WPID"].ToString();
                    hdnEngInCharge.Value = DT.Rows[0]["EngInCharge"].ToString();
                    hdnSupervisor.Value = DT.Rows[0]["Supervisor"].ToString();
                    hdnForeman.Value = DT.Rows[0]["Foreman"].ToString();
                    hdnEngineer.Value = DT.Rows[0]["Engineer"].ToString();
                    lblCreatedBy.Text = DT.Rows[0]["CreatedBy"].ToString();

                    Repeater1.DataSource = DT;
                    Repeater1.DataBind();
                    Get();
                }
                else
                {
                    Panel1.Visible = false;
                    lblNumber.Text = "";
                    lblWorkProgrammeDate.Text = "";
                    hdnWPDate.Value = "";
                    lblEngInCharge.Text = "";
                    lblBlock.Text = "";
                    lblSupervisor.Text = "";
                    lblForeman.Text = "";
                    lblEngineer.Text = "";
                    hdnWPID.Value = "";
                    hdnEngInCharge.Value = "";
                    hdnSupervisor.Value = "";
                    hdnForeman.Value = "";
                    hdnEngineer.Value = "";
                    lblCreatedBy.Text = "";

                    Repeater1.DataSource = DT;
                    Repeater1.DataBind();

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
        public void Get()
        {
            try
            {
                decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0, SumOT = 0, SumTotal = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label txtSK = (Label)Repeater1.Items[i].FindControl("lblSK");
                    Label txtSEMI = (Label)Repeater1.Items[i].FindControl("lblSEMI");
                    Label txtUNSK = (Label)Repeater1.Items[i].FindControl("lblUNSK");
                    Label txtOT = (Label)Repeater1.Items[i].FindControl("lblOT");
                    Label lblTotal = (Label)Repeater1.Items[i].FindControl("lblTotal");
                    if (txtSK.Text != "")
                    {
                        txtSK.Text = txtSK.Text;
                    }
                    else
                    {
                        txtSK.Text = "0";
                    }
                    if (txtSEMI.Text != "")
                    {
                        txtSEMI.Text = txtSEMI.Text;
                    }
                    else
                    {
                        txtSEMI.Text = "0";
                    }
                    if (txtUNSK.Text != "")
                    {
                        txtUNSK.Text = txtUNSK.Text;
                    }
                    else
                    {
                        txtUNSK.Text = "0";
                    }
                    if (txtOT.Text != "")
                    {
                        txtOT.Text = txtOT.Text;
                    }
                    else
                    {
                        txtOT.Text = "0";
                    }

                    lblTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtSK.Text) + Convert.ToDecimal(txtSEMI.Text) + Convert.ToDecimal(txtUNSK.Text) + Convert.ToDecimal(txtOT.Text)), 2));

                    SumSK = SumSK + Math.Round(Convert.ToDecimal(txtSK.Text), 0);
                    SumSEMI = SumSEMI + Math.Round(Convert.ToDecimal(txtSEMI.Text), 0);
                    SumUNSK = SumUNSK + Math.Round(Convert.ToDecimal(txtUNSK.Text), 0);
                    SumOT = SumOT + Math.Round(Convert.ToDecimal(txtOT.Text), 0);
                    SumTotal = SumTotal + Math.Round(Convert.ToDecimal(lblTotal.Text), 0);

                    ViewState["SumSK"] = SumSK;
                    ViewState["SumSEMI"] = SumSEMI;
                    ViewState["SumUNSK"] = SumUNSK;
                    ViewState["SumOT"] = SumOT;
                    ViewState["SumTotal"] = SumTotal;
                }
                Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSK");
                Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSEMI");
                Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumUNSK");
                Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumOT");
                Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblGTotal");

                lblTSK.Text = ViewState["SumSK"].ToString();
                lblTSEMI.Text = ViewState["SumSEMI"].ToString();
                lblTUNSK.Text = ViewState["SumUNSK"].ToString();
                lblTOT.Text = ViewState["SumOT"].ToString();
                lblGTotal.Text = ViewState["SumTotal"].ToString();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
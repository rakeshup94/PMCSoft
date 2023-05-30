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
    public partial class WorkProgramme : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetD();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetD()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                DT = PMCApp.GetDataTableWithTwoStringValue("GetDailyWP", ddlProject.SelectedValue.ToString(), txtDate.Text);
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
                    btnPrint.Visible = true;
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
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string strURL = "PrintWorkProgramme.aspx?";
            if (HttpContext.Current != null)
            {
                string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strDate={1}&strProjName={2}",
                    ddlProject.SelectedValue.ToString(), txtDate.Text, ddlProject.SelectedItem.Text));

                string url = strURLWithData.ToString();

                string fullURL = "window.open('" + url + "', '_blank', 'width=800,height=550,status=yes,toolbar=no,menubar=no,location=no,left=10,scrollbars=yes,resizable=no,titlebar=no' );";
                ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", fullURL, true);
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
            EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
            return objEDQueryString.Decrypt(strQueryString, "r0b1nr0y");
        }
        public string EncryptQueryString(string strQueryString)
        {
            EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
            return objEDQueryString.Encrypt(strQueryString, "r0b1nr0y");
        }
    }
}
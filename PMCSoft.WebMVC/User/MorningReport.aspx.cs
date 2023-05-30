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

namespace PMCSoft.Web.User
{
    public partial class MorningReport : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        decimal S1 = 0, S2 = 0, S3 = 0, S4 = 0, TS1 = 0, TS2 = 0, TS3 = 0, TS4 = 0;
        string MRID = "";
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
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");

                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DT = PMCApp.GetDataTableWithOneStringValue("GetWP", ddlProject.SelectedValue.ToString());
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

                    Repeater1.DataSource = DT;
                    Repeater1.DataBind();
                    Get();
                    GetWP();
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
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlProject.SelectedValue != "-1")
                {
                    int check = 0;
                    for (int j = 0; j < Repeater1.Items.Count; j++)
                    {
                        TextBox txtSK = (TextBox)Repeater1.Items[j].FindControl("txtSK");
                        TextBox txtSEMI = (TextBox)Repeater1.Items[j].FindControl("txtSEMI");
                        TextBox txtUNSK = (TextBox)Repeater1.Items[j].FindControl("txtUNSK");
                        TextBox txtOT = (TextBox)Repeater1.Items[j].FindControl("txtOT");
                        if (txtSK.Text == "" || txtSEMI.Text == "" || txtUNSK.Text == "" || txtOT.Text == "")
                        {
                            check = 1;
                            break;
                        }
                    }
                    if (check == 0)
                    {
                        DT = PMCApp.GetDataTableWithOneStringValue("GETMR", ddlProject.SelectedValue.ToString());
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Morning report already exists for this project.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            PMC.GetMaxIDForMRID(Session["CompID"].ToString(), out MRID);
                            for (int k = 0; k < Repeater1.Items.Count; k++)
                            {
                                HiddenField hdnItemID = (HiddenField)Repeater1.Items[k].FindControl("hdnItemID");
                                Label lblItemOfWork = (Label)Repeater1.Items[k].FindControl("lblItemOfWork");
                                Label lblArea = (Label)Repeater1.Items[k].FindControl("lblArea");
                                Label lblSK = (Label)Repeater1.Items[k].FindControl("lblSK");
                                Label lblSEMI = (Label)Repeater1.Items[k].FindControl("lblSEMI");
                                Label lblUNSK = (Label)Repeater1.Items[k].FindControl("lblUNSK");
                                Label lblOT = (Label)Repeater1.Items[k].FindControl("lblOT");
                                TextBox txtSK = (TextBox)Repeater1.Items[k].FindControl("txtSK");
                                TextBox txtSEMI = (TextBox)Repeater1.Items[k].FindControl("txtSEMI");
                                TextBox txtUNSK = (TextBox)Repeater1.Items[k].FindControl("txtUNSK");
                                TextBox txtOT = (TextBox)Repeater1.Items[k].FindControl("txtOT");

                                PMC.InsertDailyMorningReport(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), hdnWPID.Value, MRID.ToString(),
                                    hdnWPDate.Value, HiddenField2.Value, hdnEngInCharge.Value, lblBlock.Text, hdnItemID.Value, lblItemOfWork.Text, lblArea.Text,
                                    lblSK.Text, lblSEMI.Text, lblUNSK.Text, lblOT.Text, txtSK.Text, txtSEMI.Text, txtUNSK.Text, txtOT.Text, hdnSupervisor.Value,
                                    hdnForeman.Value, hdnEngineer.Value, Session["UserID"].ToString(), lblNumber.Text);
                            }
                            GetD();
                            Panel1.Visible = false;
                            string scripts = "alert('Morning Report Insert Successfully.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill actual labour. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select project. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }
        }
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            try
            {
                decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0, SumOT = 0, SumTotal = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");
                    Label lblTotal = (Label)Repeater1.Items[i].FindControl("lblMRTotal");
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
                Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumSK");
                Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumSEMI");
                Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumUNSK");
                Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumOT");
                Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRGTotal");

                lblTSK.Text = ViewState["SumSK"].ToString();
                lblTSEMI.Text = ViewState["SumSEMI"].ToString();
                lblTUNSK.Text = ViewState["SumUNSK"].ToString();
                lblTOT.Text = ViewState["SumOT"].ToString();
                lblGTotal.Text = ViewState["SumTotal"].ToString();

                ViewState["Sum"] = 1;
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
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");
                    Label lblTotal = (Label)Repeater1.Items[i].FindControl("lblMRTotal");
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
                Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumSK");
                Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumSEMI");
                Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumUNSK");
                Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRSumOT");
                Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMRGTotal");

                lblTSK.Text = ViewState["SumSK"].ToString();
                lblTSEMI.Text = ViewState["SumSEMI"].ToString();
                lblTUNSK.Text = ViewState["SumUNSK"].ToString();
                lblTOT.Text = ViewState["SumOT"].ToString();
                lblGTotal.Text = ViewState["SumTotal"].ToString();

                ViewState["Sum"] = 1;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetWP()
        {
            try
            {
                decimal SumWSK = 0, SumWSEMI = 0, SumWUNSK = 0, SumWOT = 0, SumWTotal = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label txtSK = (Label)Repeater1.Items[i].FindControl("lblSK");
                    Label txtSEMI = (Label)Repeater1.Items[i].FindControl("lblSEMI");
                    Label txtUNSK = (Label)Repeater1.Items[i].FindControl("lblUNSK");
                    Label txtOT = (Label)Repeater1.Items[i].FindControl("lblOT");
                    Label lblTotal = (Label)Repeater1.Items[i].FindControl("lblWPTotal");
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

                    SumWSK = SumWSK + Math.Round(Convert.ToDecimal(txtSK.Text), 0);
                    SumWSEMI = SumWSEMI + Math.Round(Convert.ToDecimal(txtSEMI.Text), 0);
                    SumWUNSK = SumWUNSK + Math.Round(Convert.ToDecimal(txtUNSK.Text), 0);
                    SumWOT = SumWOT + Math.Round(Convert.ToDecimal(txtOT.Text), 0);
                    SumWTotal = SumWTotal + Math.Round(Convert.ToDecimal(lblTotal.Text), 0);

                    ViewState["SumWSK"] = SumWSK;
                    ViewState["SumWSEMI"] = SumWSEMI;
                    ViewState["SumWUNSK"] = SumWUNSK;
                    ViewState["SumWOT"] = SumWOT;
                    ViewState["SumWTotal"] = SumWTotal;
                }
                Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSK");
                Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSEMI");
                Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumUNSK");
                Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumOT");
                Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblWPGTotal");

                lblTSK.Text = ViewState["SumWSK"].ToString();
                lblTSEMI.Text = ViewState["SumWSEMI"].ToString();
                lblTUNSK.Text = ViewState["SumWUNSK"].ToString();
                lblTOT.Text = ViewState["SumWOT"].ToString();
                lblGTotal.Text = ViewState["SumWTotal"].ToString();

                ViewState["Sum"] = 1;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}

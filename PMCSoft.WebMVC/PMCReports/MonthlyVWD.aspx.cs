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

namespace PMCSoft.Web.PMCReports
{
    public partial class MonthlyVWD : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProj();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindProj()
        {
            try
            {
                txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                PMC.BindGetCurrentMonth(Repeater1);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            try
            {
                decimal SumPlan = 0, SumVWD = 0, SumEscl = 0, SumExtraItem = 0, SumTotal = 0, SumVariation = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    TextBox txtPlan = (TextBox)Repeater1.Items[i].FindControl("txtPlan");
                    TextBox txtActualVWD = (TextBox)Repeater1.Items[i].FindControl("txtActualVWD");
                    TextBox txtActualEscl = (TextBox)Repeater1.Items[i].FindControl("txtActualEscl");
                    TextBox txtExtraItem = (TextBox)Repeater1.Items[i].FindControl("txtExtraItem");
                    TextBox txtTotal = (TextBox)Repeater1.Items[i].FindControl("txtTotal");
                    TextBox txtVariation = (TextBox)Repeater1.Items[i].FindControl("txtVariation");
                    if (txtPlan.Text != "")
                    {
                        txtPlan.Text = txtPlan.Text;
                    }
                    else
                    {
                        txtPlan.Text = "0.00";
                    }
                    if (txtActualVWD.Text != "")
                    {
                        txtActualVWD.Text = txtActualVWD.Text;
                    }
                    else
                    {
                        txtActualVWD.Text = "0.00";
                    }
                    if (txtActualEscl.Text != "")
                    {
                        txtActualEscl.Text = txtActualEscl.Text;
                    }
                    else
                    {
                        txtActualEscl.Text = "0.00";
                    }
                    if (txtExtraItem.Text != "")
                    {
                        txtExtraItem.Text = txtExtraItem.Text;
                    }
                    else
                    {
                        txtExtraItem.Text = "0.00";
                    }

                    txtTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtActualVWD.Text) + Convert.ToDecimal(txtActualEscl.Text) + Convert.ToDecimal(txtExtraItem.Text)), 2));
                    txtVariation.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPlan.Text) - Convert.ToDecimal(txtActualVWD.Text)), 2));

                    SumPlan = SumPlan + Math.Round(Convert.ToDecimal(txtPlan.Text), 2);
                    SumVWD = SumVWD + Math.Round(Convert.ToDecimal(txtActualVWD.Text), 2);
                    SumEscl = SumEscl + Math.Round(Convert.ToDecimal(txtActualEscl.Text), 2);
                    SumExtraItem = SumExtraItem + Math.Round(Convert.ToDecimal(txtExtraItem.Text), 2);
                    SumTotal = SumTotal + Math.Round(Convert.ToDecimal(txtTotal.Text), 2);
                    SumVariation = SumVariation + Math.Round(Convert.ToDecimal(txtVariation.Text), 2);

                    ViewState["SumPlan"] = SumPlan;
                    ViewState["SumVWD"] = SumVWD;
                    ViewState["SumEscl"] = SumEscl;
                    ViewState["SumExtraItem"] = SumExtraItem;
                    ViewState["SumTotal"] = SumTotal;
                    ViewState["SumVariation"] = SumVariation;
                }
                Label lblPlan = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblPlan");
                Label lblActualVWD = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualVWD");
                Label lblActualEscl = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualEscl");
                Label lblActualExtraItem = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualExtraItem");
                Label lblActualTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualTotal");
                Label lblVariation = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblVariation");

                lblPlan.Text = ViewState["SumPlan"].ToString();
                lblActualVWD.Text = ViewState["SumVWD"].ToString();
                lblActualEscl.Text = ViewState["SumEscl"].ToString();
                lblActualExtraItem.Text = ViewState["SumExtraItem"].ToString();
                lblActualTotal.Text = ViewState["SumTotal"].ToString();
                lblVariation.Text = ViewState["SumVariation"].ToString();

                ViewState["Sum"] = 1;
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlProject.SelectedValue != "-1")
                {
                    if (txtDate.Text != "")
                    {
                        if (ViewState["Sum"] != null)
                        {
                            DT = PMCApp.GetDataTableWithOneStringValue("GetCMData", ddlProject.SelectedValue.ToString());
                            if (DT.Rows.Count > 0)
                            {
                                string scripts = "alert('Detail already exists for this project of current month.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {
                                for (int i = 0; i < Repeater1.Items.Count; i++)
                                {
                                    HiddenField hdnDates = (HiddenField)Repeater1.Items[i].FindControl("hdnDates");
                                    HiddenField hdnMonths = (HiddenField)Repeater1.Items[i].FindControl("hdnMonths");
                                    HiddenField hdnYears = (HiddenField)Repeater1.Items[i].FindControl("hdnYears");
                                    Label lblFiscMonths = (Label)Repeater1.Items[i].FindControl("lblFiscMonths");
                                    TextBox txtPlan = (TextBox)Repeater1.Items[i].FindControl("txtPlan");
                                    TextBox txtActualVWD = (TextBox)Repeater1.Items[i].FindControl("txtActualVWD");
                                    TextBox txtActualEscl = (TextBox)Repeater1.Items[i].FindControl("txtActualEscl");
                                    TextBox txtExtraItem = (TextBox)Repeater1.Items[i].FindControl("txtExtraItem");
                                    TextBox txtTotal = (TextBox)Repeater1.Items[i].FindControl("txtTotal");
                                    TextBox txtVariation = (TextBox)Repeater1.Items[i].FindControl("txtVariation");
                                    TextBox txtRemarks = (TextBox)Repeater1.Items[i].FindControl("txtRemarks");
                                    PMC.InsertMonthlyVWD(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), txtDate.Text, hdnDates.Value,
                                        lblFiscMonths.Text, hdnMonths.Value, hdnYears.Value, txtPlan.Text, txtActualVWD.Text, txtActualEscl.Text, txtExtraItem.Text,
                                        txtTotal.Text, txtVariation.Text, txtRemarks.Text, Session["UserID"].ToString());
                                }
                                BindProj();
                                txtDate.Text = "";
                                ViewState["Sum"] = null;
                                string scripts = "alert('Detail insert successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly calculate details.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill as on date.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select project name.');";
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
                HiddenField hdnMonths = e.Item.FindControl("hdnMonths") as HiddenField;
                HiddenField hdnYears = e.Item.FindControl("hdnYears") as HiddenField;
                TextBox txtPlan = e.Item.FindControl("txtPlan") as TextBox;
                TextBox txtActualVWD = e.Item.FindControl("txtActualVWD") as TextBox;
                TextBox txtActualEscl = e.Item.FindControl("txtActualEscl") as TextBox;
                TextBox txtExtraItem = e.Item.FindControl("txtExtraItem") as TextBox;
                TextBox txtTotal = e.Item.FindControl("txtTotal") as TextBox;
                TextBox txtVariation = e.Item.FindControl("txtVariation") as TextBox;
                TextBox txtRemarks = e.Item.FindControl("txtRemarks") as TextBox;

                string M = DateTime.Now.Month.ToString();
                string Y = DateTime.Now.Year.ToString();

                if (hdnMonths.Value == M && hdnYears.Value == Y)
                {
                    txtPlan.Enabled = true;
                    txtPlan.ReadOnly = false;
                    txtPlan.BackColor = System.Drawing.Color.LightYellow;
                    txtPlan.BorderColor = System.Drawing.Color.Red;
                    txtActualVWD.Enabled = true;
                    txtActualVWD.ReadOnly = false;
                    txtActualVWD.BackColor = System.Drawing.Color.LightYellow;
                    txtActualVWD.BorderColor = System.Drawing.Color.Red;
                    txtActualEscl.Enabled = true;
                    txtActualEscl.ReadOnly = false;
                    txtActualEscl.BackColor = System.Drawing.Color.LightYellow;
                    txtActualEscl.BorderColor = System.Drawing.Color.Red;
                    txtExtraItem.Enabled = true;
                    txtExtraItem.ReadOnly = false;
                    txtExtraItem.BackColor = System.Drawing.Color.LightYellow;
                    txtExtraItem.BorderColor = System.Drawing.Color.Red;
                    //txtTotal.Enabled = true;
                    //txtTotal.ReadOnly = false;
                    txtTotal.BackColor = System.Drawing.Color.Silver;
                    txtTotal.BorderColor = System.Drawing.Color.Red;
                    //txtVariation.Enabled = true;
                    //txtVariation.ReadOnly = false;
                    txtVariation.BackColor = System.Drawing.Color.Silver;
                    txtVariation.BorderColor = System.Drawing.Color.Red;
                    txtRemarks.Enabled = true;
                    txtRemarks.ReadOnly = false;
                    txtRemarks.BackColor = System.Drawing.Color.LightYellow;
                    txtRemarks.BorderColor = System.Drawing.Color.Red;
                }
                else
                {
                    txtPlan.Enabled = false;
                    txtPlan.ReadOnly = true;
                    txtActualVWD.Enabled = false;
                    txtActualVWD.ReadOnly = true;
                    txtActualEscl.Enabled = false;
                    txtActualEscl.ReadOnly = true;
                    txtExtraItem.Enabled = false;
                    txtExtraItem.ReadOnly = true;
                    txtTotal.Enabled = false;
                    txtTotal.ReadOnly = true;
                    txtVariation.Enabled = false;
                    txtVariation.ReadOnly = true;
                    txtRemarks.Enabled = false;
                    txtRemarks.ReadOnly = true;
                }
            }
        }
    }
}
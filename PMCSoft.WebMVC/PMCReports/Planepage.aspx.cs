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
    public partial class Planepage : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string No = "", IncomeParticularsID = "", HirechargeParticularsId = "";

        string ExpenditureParticularsID = "", ConsumbleParticularsID = "", DirectExpansesParticularsID = "", IndirectExpensesParticularsID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProj1();
                    LoadYears1(ref ddlSDaysYear1);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        void LoadYears1(ref DropDownList DrpYears)
        {
            DrpYears.Items.Clear();
            string Yrs = "";
            for (int i = 1901; i <= 2100; i++)
            {
                if (i.ToString().Length < 2)
                {
                    Yrs = "0" + i.ToString();
                }
                else
                {
                    Yrs = i.ToString();
                }
                DrpYears.Items.Add(Yrs);
            }
        }
        public void BindProj1()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject1, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }


        public void GetData1()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetIncomeMasterData");

            if (dt.Rows.Count > 0)
            {
                RptIncome1.DataSource = dt;
                RptIncome1.DataBind();
            }
            Hashtable ht1 = new Hashtable();
            ht1.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht1.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt1 = PMCApp.Get(ht1, "GetExPenditureMasterData");

            if (dt1.Rows.Count > 0)
            {
                RptExpenditure1.DataSource = dt1;
                RptExpenditure1.DataBind();
            }
            Hashtable ht2 = new Hashtable();
            ht2.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht2.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt2 = PMCApp.Get(ht2, "GetCONSUMBLESMasterData");

            if (dt2.Rows.Count > 0)
            {
                RptConsumbles1.DataSource = dt2;
                RptConsumbles1.DataBind();
            }
            Hashtable ht3 = new Hashtable();
            ht3.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht3.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt3 = PMCApp.Get(ht3, "GetDirectMasterData");

            if (dt3.Rows.Count > 0)
            {
                RptDirectExpenses1.DataSource = dt3;
                RptDirectExpenses1.DataBind();
            }
            Hashtable ht4 = new Hashtable();
            ht4.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht4.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt4 = PMCApp.Get(ht4, "GetHireMasterData");

            if (dt4.Rows.Count > 0)
            {
                RptHirecharges1.DataSource = dt4;
                RptHirecharges1.DataBind();
            }
            Hashtable ht6 = new Hashtable();
            ht6.Add("@PlanMonth", ddlMonth1.SelectedValue);
            ht6.Add("@PlanYear", ddlSDaysYear1.SelectedValue);
            DataTable dt6 = PMCApp.Get(ht6, "GetIndirectMasterData");

            if (dt6.Rows.Count > 0)
            {
                RptIndirectExpenses1.DataSource = dt6;
                RptIndirectExpenses1.DataBind();
            }
        }

        protected void btnCalculate1_Click(object sender, EventArgs e)
        {
            double SumIncomeValue = 0; double SumIncomActulValue = 0; double SumIncomeVariance = 0; double SumExpValue = 0; double SumExpActulValue = 0; double SumExpVariance = 0;
            double SumConsumblesValue = 0; double SumConsumblesActulValue = 0; double SumConsumblesVariance = 0;
            double SumDirectExpensesValue = 0; double SumDirectExpensesActulValue = 0; double SumDirectExpensesVariance = 0;
            double SumHireChargesValue = 0; double SumHireChargesActulValue = 0; double SumHireChargesVariance = 0;
            double SumIndirectExpensesValue = 0; double SumIndirectExpensesActulValue = 0; double SumIndirectExpensesVariance = 0;
            for (int k = 0; k < RptIncome1.Items.Count; k++)
            {

                TextBox txtpincomeValue1 = (TextBox)RptIncome1.Items[k].FindControl("txtpincomeValue1");
                Label txtIncimePlanParcentage1 = (Label)RptIncome1.Items[k].FindControl("txtIncimePlanParcentage1");
                TextBox txtIncomeActualValue1 = (TextBox)RptIncome1.Items[k].FindControl("txtIncomeActualValue1");
                Label txtIncomeActualParcentage1 = (Label)RptIncome1.Items[k].FindControl("txtIncomeActualParcentage1");
                if (txtpincomeValue1.Text != "")
                {
                    txtpincomeValue1.Text = txtpincomeValue1.Text;
                }
                else
                {
                    txtpincomeValue1.Text = "0";
                }
                if (txtIncimePlanParcentage1.Text != "")
                {
                    txtIncimePlanParcentage1.Text = txtIncimePlanParcentage1.Text;
                }
                else
                {
                    txtIncimePlanParcentage1.Text = "0";
                }
                if (txtIncomeActualValue1.Text != "")
                {
                    txtIncomeActualValue1.Text = txtIncomeActualValue1.Text;
                }
                else
                {
                    txtIncomeActualValue1.Text = "0";

                }
                if (txtIncomeActualValue1.Text == "0")
                {
                    txtIncomeActualParcentage1.Text = "0";
                }
                else
                {
                    txtIncomeActualParcentage1.Text = txtIncomeActualParcentage1.Text;
                }
                SumIncomeValue = SumIncomeValue + Math.Round(Convert.ToDouble(txtpincomeValue1.Text), 2);
                ViewState["SumIncome"] = SumIncomeValue;
                SumIncomActulValue = SumIncomActulValue + Math.Round(Convert.ToDouble(txtIncomeActualValue1.Text), 2);

                ViewState["SumIncomActulValue"] = SumIncomActulValue;
            }
            for (int j = 0; j < RptIncome1.Items.Count; j++)
            {
                TextBox txtpincomeValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtpincomeValue1");
                Label txtIncimePlanParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncimePlanParcentage1");

                txtIncimePlanParcentage1.Text = "0.00";
                double SumIncomeValueViewstate = Convert.ToDouble(ViewState["SumIncome"]);

                double per = Math.Round(Convert.ToDouble(txtpincomeValue1.Text) / (Convert.ToDouble(SumIncomeValueViewstate)) * 100, 2);
                txtIncimePlanParcentage1.Text = per.ToString();

                TextBox txtIncomeActualValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtIncomeActualValue1");
                Label txtIncomeActualParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeActualParcentage1");
                if (txtIncomeActualValue1.Text == "0")
                {
                    txtIncomeActualParcentage1.Text = "0";
                }
                else
                {
                    txtIncomeActualParcentage1.Text = txtIncomeActualParcentage1.Text;
                }
                double SumIncomeActualValueViewstate = Convert.ToDouble(ViewState["SumIncomActulValue"]);

                double per1 = Math.Round(Convert.ToDouble(txtIncomeActualValue1.Text) / (Convert.ToDouble(SumIncomeActualValueViewstate)) * 100, 2);
                txtIncomeActualParcentage1.Text = per1.ToString();


                Label txtIncomeVariance1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVariance1");
                Label txtIncomeVarianceParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVarianceParcentage1");
                double VarianceIncome = Convert.ToDouble(txtpincomeValue1.Text) - Convert.ToDouble(txtIncomeActualValue1.Text);
                txtIncomeVariance1.Text = VarianceIncome.ToString();
                SumIncomeVariance = SumIncomeVariance + Math.Round(Convert.ToDouble(txtIncomeVariance1.Text), 2);
                ViewState["SumIncomeVariance"] = SumIncomeVariance;

            }
            for (int l = 0; l < RptIncome1.Items.Count; l++)
            {
                Label txtIncomeVariance1 = (Label)RptIncome1.Items[l].FindControl("txtIncomeVariance1");
                Label txtIncomeVarianceParcentage1 = (Label)RptIncome1.Items[l].FindControl("txtIncomeVarianceParcentage1");
                txtIncomeVarianceParcentage1.Text = "0.00";
                double SumIncomeVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);

                double per2 = Math.Round(Convert.ToDouble(txtIncomeVariance1.Text) / (Convert.ToDouble(SumIncomeVarianceViewstate)) * 100, 2);
                txtIncomeVarianceParcentage1.Text = per2.ToString();

            }
            for (int m = 0; m < RptExpenditure1.Items.Count; m++)
            {

                TextBox txtpExpValue1 = (TextBox)RptExpenditure1.Items[m].FindControl("txtpExpValue1");
                Label txtExpPlanParcentage1 = (Label)RptExpenditure1.Items[m].FindControl("txtExpPlanParcentage1");
                TextBox txtExpActualValue1 = (TextBox)RptExpenditure1.Items[m].FindControl("txtExpActualValue1");
                Label txtExpActualParcentage1 = (Label)RptExpenditure1.Items[m].FindControl("txtExpActualParcentage1");
                if (txtpExpValue1.Text != "")
                {
                    txtpExpValue1.Text = txtpExpValue1.Text;
                }
                else
                {
                    txtpExpValue1.Text = "0";
                }
                if (txtExpPlanParcentage1.Text != "")
                {
                    txtExpPlanParcentage1.Text = txtExpPlanParcentage1.Text;
                }
                else
                {
                    txtExpPlanParcentage1.Text = "0";
                }
                if (txtExpActualValue1.Text != "")
                {
                    txtExpActualValue1.Text = txtExpActualValue1.Text;
                }
                else
                {
                    txtExpActualValue1.Text = "0";
                }
                if (txtExpActualParcentage1.Text != "")
                {
                    txtExpActualParcentage1.Text = txtExpActualParcentage1.Text;
                }
                else
                {
                    txtExpActualParcentage1.Text = "0";
                }
                SumExpValue = SumExpValue + Math.Round(Convert.ToDouble(txtpExpValue1.Text), 2);
                ViewState["SumExpValue"] = SumExpValue;
                SumExpActulValue = SumExpActulValue + Math.Round(Convert.ToDouble(txtExpActualValue1.Text), 2);

                ViewState["SumExpActulValue"] = SumExpActulValue;
            }
            for (int n = 0; n < RptExpenditure1.Items.Count; n++)
            {
                TextBox txtpExpValue1 = (TextBox)RptExpenditure1.Items[n].FindControl("txtpExpValue1");
                Label txtExpPlanParcentage1 = (Label)RptExpenditure1.Items[n].FindControl("txtExpPlanParcentage1");
                txtExpPlanParcentage1.Text = "0.00";
                double SumExpValueViewstate = Convert.ToDouble(ViewState["SumExpValue"]);

                double per = Math.Round(Convert.ToDouble(txtpExpValue1.Text) / (Convert.ToDouble(ViewState["SumIncome"])) * 100, 2);
                txtExpPlanParcentage1.Text = per.ToString();

                TextBox txtExpActualValue1 = (TextBox)RptExpenditure1.Items[n].FindControl("txtExpActualValue1");
                Label txtExpActualParcentage1 = (Label)RptExpenditure1.Items[n].FindControl("txtExpActualParcentage1");
                txtExpActualParcentage1.Text = "0.00";
                double SumExpActulValueViewstate = Convert.ToDouble(ViewState["SumExpActulValue"]);

                double per1 = Math.Round(Convert.ToDouble(txtExpActualValue1.Text) / (Convert.ToDouble(ViewState["SumIncomActulValue"])) * 100, 2);
                txtExpActualParcentage1.Text = per1.ToString();


                Label txtExpVariance1 = (Label)RptExpenditure1.Items[n].FindControl("txtExpVariance1");
                Label txtExpVarianceParcentage1 = (Label)RptExpenditure1.Items[n].FindControl("txtExpVarianceParcentage1");
                double VarianceIncome = Convert.ToDouble(txtpExpValue1.Text) - Convert.ToDouble(txtExpActualValue1.Text);
                txtExpVariance1.Text = VarianceIncome.ToString();
                SumExpVariance = SumExpVariance + Math.Round(Convert.ToDouble(txtExpActualValue1.Text), 2);
                ViewState["SumExpVariance"] = SumExpVariance;

            }
            for (int O = 0; O < RptExpenditure1.Items.Count; O++)
            {
                Label txtExpVariance1 = (Label)RptExpenditure1.Items[O].FindControl("txtExpVariance1");
                Label txtExpVarianceParcentage1 = (Label)RptExpenditure1.Items[O].FindControl("txtExpVarianceParcentage1");
                txtExpVarianceParcentage1.Text = "0.00";
                double SumExpVarianceViewstate = Convert.ToDouble(ViewState["SumExpVariance"]);
                double SumIncomeVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);
                double per3 = Math.Round(Convert.ToDouble(txtExpVariance1.Text) / (Convert.ToDouble(SumIncomeVarianceViewstate)) * 100, 2);
                txtExpVarianceParcentage1.Text = per3.ToString();

            }
            for (int p = 0; p < RptConsumbles1.Items.Count; p++)
            {

                TextBox txtpConSumblesValue1 = (TextBox)RptConsumbles1.Items[p].FindControl("txtpConSumblesValue1");
                Label txtConSumblesPlanParcentage1 = (Label)RptConsumbles1.Items[p].FindControl("txtConSumblesPlanParcentage1");
                TextBox txtConSumblesActualValue1 = (TextBox)RptConsumbles1.Items[p].FindControl("txtConSumblesActualValue1");
                Label txtConSumblesActualParcentage1 = (Label)RptConsumbles1.Items[p].FindControl("txtConSumblesActualParcentage1");
                if (txtpConSumblesValue1.Text != "")
                {
                    txtpConSumblesValue1.Text = txtpConSumblesValue1.Text;
                }
                else
                {
                    txtpConSumblesValue1.Text = "0";
                }
                if (txtConSumblesPlanParcentage1.Text != "")
                {
                    txtConSumblesPlanParcentage1.Text = txtConSumblesPlanParcentage1.Text;
                }
                else
                {
                    txtConSumblesPlanParcentage1.Text = "0";
                }
                if (txtConSumblesActualValue1.Text != "")
                {
                    txtConSumblesActualValue1.Text = txtConSumblesActualValue1.Text;
                }
                else
                {
                    txtConSumblesActualValue1.Text = "0";
                }
                if (txtConSumblesActualParcentage1.Text != "")
                {
                    txtConSumblesActualParcentage1.Text = txtConSumblesActualParcentage1.Text;
                }
                else
                {
                    txtConSumblesActualParcentage1.Text = "0";
                }
                SumConsumblesValue = SumConsumblesValue + Math.Round(Convert.ToDouble(txtpConSumblesValue1.Text), 2);
                ViewState["SumConsumblesValue"] = SumConsumblesValue;
                SumConsumblesActulValue = SumConsumblesActulValue + Math.Round(Convert.ToDouble(txtConSumblesActualValue1.Text), 2);

                ViewState["SumConsumblesActulValue"] = SumConsumblesActulValue;
            }
            for (int q = 0; q < RptConsumbles1.Items.Count; q++)
            {
                TextBox txtpConSumblesValue1 = (TextBox)RptConsumbles1.Items[q].FindControl("txtpConSumblesValue1");
                Label txtConSumblesPlanParcentage1 = (Label)RptConsumbles1.Items[q].FindControl("txtConSumblesPlanParcentage1");
                txtConSumblesPlanParcentage1.Text = "0.00";
                double SumConsumblesValueViewstate = Convert.ToDouble(ViewState["SumConsumblesValue"]);

                double per = Math.Round(Convert.ToDouble(txtpConSumblesValue1.Text) / (Convert.ToDouble(ViewState["SumIncome"])) * 100, 2);
                txtConSumblesPlanParcentage1.Text = per.ToString();

                TextBox txtConSumblesActualValue1 = (TextBox)RptConsumbles1.Items[q].FindControl("txtConSumblesActualValue1");
                Label txtConSumblesActualParcentage1 = (Label)RptConsumbles1.Items[q].FindControl("txtConSumblesActualParcentage1");
                txtConSumblesActualParcentage1.Text = "0.00";
                double SumExpActulValueViewstate = Convert.ToDouble(ViewState["SumConsumblesActulValue"]);

                double per4 = Math.Round(Convert.ToDouble(txtConSumblesActualValue1.Text) / (Convert.ToDouble(ViewState["SumIncomActulValue"])) * 100, 2);
                txtConSumblesActualParcentage1.Text = per4.ToString();


                Label txtConSumblesVariance1 = (Label)RptConsumbles1.Items[q].FindControl("txtConSumblesVariance1");
                Label txtConSumblesVarianceParcentage1 = (Label)RptConsumbles1.Items[q].FindControl("txtConSumblesVarianceParcentage1");
                double VarianceConSumbles = Convert.ToDouble(txtpConSumblesValue1.Text) - Convert.ToDouble(txtConSumblesActualValue1.Text);
                txtConSumblesVariance1.Text = VarianceConSumbles.ToString();
                SumConsumblesVariance = SumConsumblesVariance + Math.Round(Convert.ToDouble(txtConSumblesActualValue1.Text), 2);
                ViewState["SumConsumblesVariance"] = SumConsumblesVariance;

            }
            for (int r = 0; r < RptConsumbles1.Items.Count; r++)
            {
                Label txtConSumblesVariance1 = (Label)RptConsumbles1.Items[r].FindControl("txtConSumblesVariance1");
                Label txtConSumblesVarianceParcentage1 = (Label)RptConsumbles1.Items[r].FindControl("txtConSumblesVarianceParcentage1");
                txtConSumblesVarianceParcentage1.Text = "0.00";
                double SumConsumblesVarianceViewstate = Convert.ToDouble(ViewState["SumConsumblesVariance"]);
                double SumIncomeVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);
                double per3 = Math.Round(Convert.ToDouble(txtConSumblesVariance1.Text) / (Convert.ToDouble(SumIncomeVarianceViewstate)) * 100, 2);
                txtConSumblesVarianceParcentage1.Text = per3.ToString();

            }
            for (int s = 0; s < RptDirectExpenses1.Items.Count; s++)
            {

                TextBox txtpDirectExpensesValue1 = (TextBox)RptDirectExpenses1.Items[s].FindControl("txtpDirectExpensesValue1");
                Label txtDirectExpensesPlanParcentage1 = (Label)RptDirectExpenses1.Items[s].FindControl("txtDirectExpensesPlanParcentage1");
                TextBox txtDirectExpensesActualValue1 = (TextBox)RptDirectExpenses1.Items[s].FindControl("txtDirectExpensesActualValue1");
                Label txtDirectExpensesActualParcentage1 = (Label)RptDirectExpenses1.Items[s].FindControl("txtDirectExpensesActualParcentage1");
                if (txtpDirectExpensesValue1.Text != "")
                {
                    txtpDirectExpensesValue1.Text = txtpDirectExpensesValue1.Text;
                }
                else
                {
                    txtpDirectExpensesValue1.Text = "0";
                }
                if (txtDirectExpensesPlanParcentage1.Text != "")
                {
                    txtDirectExpensesPlanParcentage1.Text = txtDirectExpensesPlanParcentage1.Text;
                }
                else
                {
                    txtDirectExpensesPlanParcentage1.Text = "0";
                }
                if (txtDirectExpensesActualValue1.Text != "")
                {
                    txtDirectExpensesActualValue1.Text = txtDirectExpensesActualValue1.Text;
                }
                else
                {
                    txtDirectExpensesActualValue1.Text = "0";
                }
                if (txtDirectExpensesActualParcentage1.Text != "")
                {
                    txtDirectExpensesActualParcentage1.Text = txtDirectExpensesActualParcentage1.Text;
                }
                else
                {
                    txtDirectExpensesActualParcentage1.Text = "0";
                }
                SumDirectExpensesValue = SumDirectExpensesValue + Math.Round(Convert.ToDouble(txtpDirectExpensesValue1.Text), 2);
                ViewState["SumDirectExpensesValue"] = SumDirectExpensesValue;
                SumConsumblesActulValue = SumConsumblesActulValue + Math.Round(Convert.ToDouble(txtDirectExpensesActualValue1.Text), 2);

                ViewState["SumDirectExpensesActulValueViewstate"] = SumDirectExpensesActulValue;
            }
            for (int t = 0; t < RptDirectExpenses1.Items.Count; t++)
            {
                TextBox txtpDirectExpensesValue1 = (TextBox)RptDirectExpenses1.Items[t].FindControl("txtpDirectExpensesValue1");
                Label txtDirectExpensesPlanParcentage1 = (Label)RptDirectExpenses1.Items[t].FindControl("txtDirectExpensesPlanParcentage1");
                txtDirectExpensesPlanParcentage1.Text = "0.00";
                double SumDirectExpensesValueViewstate = Convert.ToDouble(ViewState["SumDirectExpensesValue"]);

                double per = Math.Round(Convert.ToDouble(txtpDirectExpensesValue1.Text) / (Convert.ToDouble(ViewState["SumIncome"])) * 100, 2);
                txtDirectExpensesPlanParcentage1.Text = per.ToString();

                TextBox txtDirectExpensesActualValue1 = (TextBox)RptDirectExpenses1.Items[t].FindControl("txtDirectExpensesActualValue1");
                Label txtDirectExpensesActualParcentage1 = (Label)RptDirectExpenses1.Items[t].FindControl("txtDirectExpensesActualParcentage1");
                txtDirectExpensesActualParcentage1.Text = "0.00";
                double SumDirectExpensesActulValueViewstate = Convert.ToDouble(ViewState["SumDirectExpensesActulValue"]);

                double per1 = Math.Round(Convert.ToDouble(txtDirectExpensesActualValue1.Text) / (Convert.ToDouble(ViewState["SumIncomActulValue"])) * 100, 2);
                txtDirectExpensesActualParcentage1.Text = per1.ToString();


                Label txtDirectExpensesVariance1 = (Label)RptDirectExpenses1.Items[t].FindControl("txtDirectExpensesVariance1");
                Label txtConSumblesVarianceParcentage1 = (Label)RptDirectExpenses1.Items[t].FindControl("txtConSumblesVarianceParcentage1");
                double DirectExpensesVariance = Convert.ToDouble(txtpDirectExpensesValue1.Text) - Convert.ToDouble(txtDirectExpensesActualValue1.Text);
                txtDirectExpensesVariance1.Text = DirectExpensesVariance.ToString();
                SumDirectExpensesVariance = SumDirectExpensesVariance + Math.Round(Convert.ToDouble(txtDirectExpensesVariance1.Text), 2);
                ViewState["SumDirectExpensesVariance"] = SumDirectExpensesVariance;

            }
            for (int u = 0; u < RptDirectExpenses1.Items.Count; u++)
            {
                Label txtDirectExpensesVariance1 = (Label)RptDirectExpenses1.Items[u].FindControl("txtDirectExpensesVariance1");
                Label txtDirectExpensesVarianceParcentage1 = (Label)RptDirectExpenses1.Items[u].FindControl("txtDirectExpensesVarianceParcentage1");
                txtDirectExpensesVarianceParcentage1.Text = "0.00";
                double SumConsumblesVarianceViewstate = Convert.ToDouble(ViewState["SumDirectExpensesVariance"]);
                double SumDirectExpensesVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);
                double per3 = Math.Round(Convert.ToDouble(txtDirectExpensesVariance1.Text) / (Convert.ToDouble(SumDirectExpensesVarianceViewstate)) * 100, 2);
                txtDirectExpensesVarianceParcentage1.Text = per3.ToString();

            }
            for (int v = 0; v < RptHirecharges1.Items.Count; v++)
            {

                TextBox txtpHireChargesExpensesValue1 = (TextBox)RptHirecharges1.Items[v].FindControl("txtpHireChargesExpensesValue1");
                Label txtHireChargesExpensesPlanParcentage1 = (Label)RptHirecharges1.Items[v].FindControl("txtHireChargesExpensesPlanParcentage1");
                TextBox txtHireChargesExpensesActualValue1 = (TextBox)RptHirecharges1.Items[v].FindControl("txtHireChargesExpensesActualValue1");
                Label txtHireChargesExpensesActualParcentage1 = (Label)RptHirecharges1.Items[v].FindControl("txtHireChargesExpensesActualParcentage1");
                if (txtpHireChargesExpensesValue1.Text != "")
                {
                    txtpHireChargesExpensesValue1.Text = txtpHireChargesExpensesValue1.Text;
                }
                else
                {
                    txtpHireChargesExpensesValue1.Text = "0";
                }
                if (txtHireChargesExpensesPlanParcentage1.Text != "")
                {
                    txtHireChargesExpensesPlanParcentage1.Text = txtHireChargesExpensesPlanParcentage1.Text;
                }
                else
                {
                    txtHireChargesExpensesPlanParcentage1.Text = "0";
                }
                if (txtHireChargesExpensesActualValue1.Text != "")
                {
                    txtHireChargesExpensesActualValue1.Text = txtHireChargesExpensesActualValue1.Text;
                }
                else
                {
                    txtHireChargesExpensesActualValue1.Text = "0";
                }
                if (txtHireChargesExpensesActualParcentage1.Text != "")
                {
                    txtHireChargesExpensesActualParcentage1.Text = txtHireChargesExpensesActualParcentage1.Text;
                }
                else
                {
                    txtHireChargesExpensesActualParcentage1.Text = "0";
                }
                SumHireChargesValue = SumHireChargesValue + Math.Round(Convert.ToDouble(txtpHireChargesExpensesValue1.Text), 2);
                ViewState["SumHireChargesValue"] = SumHireChargesValue;
                SumHireChargesActulValue = SumHireChargesActulValue + Math.Round(Convert.ToDouble(txtHireChargesExpensesActualValue1.Text), 2);

                ViewState["SumHireChargesActulValueViewstate"] = SumHireChargesActulValue;
            }
            for (int w = 0; w < RptHirecharges1.Items.Count; w++)
            {
                TextBox txtpHireChargesExpensesValue1 = (TextBox)RptHirecharges1.Items[w].FindControl("txtpHireChargesExpensesValue1");
                Label txtHireChargesExpensesPlanParcentage1 = (Label)RptHirecharges1.Items[w].FindControl("txtHireChargesExpensesPlanParcentage1");
                txtHireChargesExpensesPlanParcentage1.Text = "0.00";
                double SumHireChargesValueViewstate = Convert.ToDouble(ViewState["SumHireChargesValue"]);

                double per = Math.Round(Convert.ToDouble(txtpHireChargesExpensesValue1.Text) / (Convert.ToDouble(ViewState["SumIncome"])) * 100, 2);
                txtHireChargesExpensesPlanParcentage1.Text = per.ToString();

                TextBox txtHireChargesExpensesActualValue1 = (TextBox)RptHirecharges1.Items[w].FindControl("txtHireChargesExpensesActualValue1");
                Label txtHireChargesExpensesActualParcentage1 = (Label)RptHirecharges1.Items[w].FindControl("txtHireChargesExpensesActualParcentage1");
                txtHireChargesExpensesActualParcentage1.Text = "0.00";
                double SumHireChargesActulValueViewstate = Convert.ToDouble(ViewState["SumHireChargesActulValue"]);

                double per1 = Math.Round(Convert.ToDouble(txtHireChargesExpensesActualValue1.Text) / (Convert.ToDouble(ViewState["SumIncomActulValue"])) * 100, 2);
                txtHireChargesExpensesActualParcentage1.Text = per1.ToString();


                Label txtHireChargesExpensesVariance1 = (Label)RptHirecharges1.Items[w].FindControl("txtHireChargesExpensesVariance1");
                Label txtHireChargesExpensesVarianceParcentage1 = (Label)RptHirecharges1.Items[w].FindControl("txtHireChargesExpensesVarianceParcentage1");
                double HireChargesExpensesVariance = Convert.ToDouble(txtpHireChargesExpensesValue1.Text) - Convert.ToDouble(txtHireChargesExpensesActualValue1.Text);
                txtHireChargesExpensesVariance1.Text = HireChargesExpensesVariance.ToString();
                SumHireChargesVariance = SumHireChargesVariance + Math.Round(Convert.ToDouble(txtHireChargesExpensesVariance1.Text), 2);
                ViewState["SumHireChargesVariance"] = SumHireChargesVariance;

            }
            for (int x = 0; x < RptHirecharges1.Items.Count; x++)
            {
                Label txtHireChargesExpensesVariance1 = (Label)RptHirecharges1.Items[x].FindControl("txtHireChargesExpensesVariance1");
                Label txtHireChargesExpensesVarianceParcentage1 = (Label)RptHirecharges1.Items[x].FindControl("txtHireChargesExpensesVarianceParcentage1");
                txtHireChargesExpensesVarianceParcentage1.Text = "0.00";
                // double SumHireChargesVarianceViewstate = Convert.ToDouble(ViewState["SumHireChargesVariance"]);
                double SumHireChargesVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);
                double per3 = Math.Round(Convert.ToDouble(txtHireChargesExpensesVariance1.Text) / (Convert.ToDouble(SumHireChargesVarianceViewstate)) * 100, 2);
                txtHireChargesExpensesVarianceParcentage1.Text = per3.ToString();

            }
            for (int y = 0; y < RptIndirectExpenses1.Items.Count; y++)
            {

                TextBox txtpIndirectExpensesValue1 = (TextBox)RptIndirectExpenses1.Items[y].FindControl("txtpIndirectExpensesValue1");
                Label txtIndirectExpensesPlanParcentage1 = (Label)RptIndirectExpenses1.Items[y].FindControl("txtIndirectExpensesPlanParcentage1");
                TextBox txtIndirectExpensesActualValue1 = (TextBox)RptIndirectExpenses1.Items[y].FindControl("txtIndirectExpensesActualValue1");
                Label txtIndirectExpensesActualParcentage1 = (Label)RptIndirectExpenses1.Items[y].FindControl("txtIndirectExpensesActualParcentage1");
                SumIndirectExpensesValue = SumIndirectExpensesValue + Math.Round(Convert.ToDouble(txtpIndirectExpensesValue1.Text), 2);
                if (txtpIndirectExpensesValue1.Text != "")
                {
                    txtpIndirectExpensesValue1.Text = txtpIndirectExpensesValue1.Text;
                }
                else
                {
                    txtpIndirectExpensesValue1.Text = "0";
                }
                if (txtIndirectExpensesPlanParcentage1.Text != "")
                {
                    txtIndirectExpensesPlanParcentage1.Text = txtIndirectExpensesPlanParcentage1.Text;
                }
                else
                {
                    txtIndirectExpensesPlanParcentage1.Text = "0";
                }
                if (txtIndirectExpensesActualValue1.Text != "")
                {
                    txtIndirectExpensesActualValue1.Text = txtIndirectExpensesActualValue1.Text;
                }
                else
                {
                    txtIndirectExpensesActualValue1.Text = "0";
                }
                if (txtIndirectExpensesActualParcentage1.Text != "")
                {
                    txtIndirectExpensesActualParcentage1.Text = txtIndirectExpensesActualParcentage1.Text;
                }
                else
                {
                    txtIndirectExpensesActualParcentage1.Text = "0";
                }
                ViewState["SumIndirectExpensesValue"] = SumIndirectExpensesValue;
                SumIndirectExpensesActulValue = SumIndirectExpensesActulValue + Math.Round(Convert.ToDouble(txtIndirectExpensesActualValue1.Text), 2);

                ViewState["SumIndirectExpensesActulValueViewstate"] = SumIndirectExpensesActulValue;
            }
            for (int z = 0; z < RptIndirectExpenses1.Items.Count; z++)
            {
                TextBox txtpIndirectExpensesValue1 = (TextBox)RptIndirectExpenses1.Items[z].FindControl("txtpIndirectExpensesValue1");
                Label txtIndirectExpensesPlanParcentage1 = (Label)RptIndirectExpenses1.Items[z].FindControl("txtIndirectExpensesPlanParcentage1");
                txtIndirectExpensesPlanParcentage1.Text = "0.00";
                double SumIndirectExpensesValueViewstate = Convert.ToDouble(ViewState["SumIndirectExpensesValue"]);

                double per = Math.Round(Convert.ToDouble(txtpIndirectExpensesValue1.Text) / (Convert.ToDouble(ViewState["SumIncome"])) * 100, 2);
                txtIndirectExpensesPlanParcentage1.Text = per.ToString();

                TextBox txtIndirectExpensesActualValue1 = (TextBox)RptIndirectExpenses1.Items[z].FindControl("txtIndirectExpensesActualValue1");
                Label txtIndirectExpensesActualParcentage1 = (Label)RptIndirectExpenses1.Items[z].FindControl("txtIndirectExpensesActualParcentage1");
                txtIndirectExpensesActualParcentage1.Text = "0.00";
                double SumIndirectExpensesActulValueViewstate = Convert.ToDouble(ViewState["SumIndirectExpensesActulValue"]);

                double per1 = Math.Round(Convert.ToDouble(txtIndirectExpensesActualValue1.Text) / (Convert.ToDouble(ViewState["SumIncomActulValue"])) * 100, 2);
                txtIndirectExpensesActualParcentage1.Text = per1.ToString();


                Label txtIndirectExpensesVariance1 = (Label)RptIndirectExpenses1.Items[z].FindControl("txtIndirectExpensesVariance1");
                Label txtIndirectExpensesVarianceParcentage1 = (Label)RptIndirectExpenses1.Items[z].FindControl("txtIndirectExpensesVarianceParcentage1");
                double IndirectExpensesVariance = Convert.ToDouble(txtpIndirectExpensesValue1.Text) - Convert.ToDouble(txtIndirectExpensesActualValue1.Text);
                txtIndirectExpensesVariance1.Text = IndirectExpensesVariance.ToString();
                SumIndirectExpensesVariance = SumIndirectExpensesVariance + Math.Round(Convert.ToDouble(txtIndirectExpensesVariance1.Text), 2);
                ViewState["SumIndirectExpensesVariance"] = SumIndirectExpensesVariance;

            }
            for (int x1 = 0; x1 < RptIndirectExpenses1.Items.Count; x1++)
            {
                Label txtIndirectExpensesVariance1 = (Label)RptIndirectExpenses1.Items[x1].FindControl("txtIndirectExpensesVariance1");
                Label txtIndirectExpensesVarianceParcentage1 = (Label)RptIndirectExpenses1.Items[x1].FindControl("txtIndirectExpensesVarianceParcentage1");
                txtIndirectExpensesVarianceParcentage1.Text = "0.00";
                double SumIndirectVarianceViewstate = Convert.ToDouble(ViewState["SumIncomeVariance"]);
                double per2 = Math.Round(Convert.ToDouble(txtIndirectExpensesVariance1.Text) / (Convert.ToDouble(SumIndirectVarianceViewstate)) * 100, 2);
                txtIndirectExpensesVarianceParcentage1.Text = per2.ToString();

            }

        }
        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            try
            {
                decimal SumIncome = 0;
                int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0, check7 = 0;
                for (int j = 0; j < RptIncome1.Items.Count; j++)
                {
                    Label lblIncomeTransid1 = (Label)RptIncome1.Items[j].FindControl("lblIncomeTransid1");
                    HiddenField hdnIncomeParticularID1 = (HiddenField)RptIncome1.Items[j].FindControl("hdnIncomeParticularID1");
                    Label LblParticualName1 = (Label)RptIncome1.Items[j].FindControl("LblParticualName1");
                    TextBox txtpincomeValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtpincomeValue1");
                    Label txtIncimePlanParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncimePlanParcentage1");
                    TextBox txtIncomeActualValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtIncomeActualValue1");
                    Label txtIncomeActualParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeActualParcentage1");
                    Label txtIncomeVariance1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVariance1");
                    Label txtIncomeVarianceParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVarianceParcentage1");
                    if (txtIncomeActualValue1.Text == "")
                    {
                        check = 1;
                        break;
                    }

                }
                for (int j = 0; j < RptExpenditure1.Items.Count; j++)
                {

                    Label lblExpTransid1 = (Label)RptExpenditure1.Items[j].FindControl("lblExpTransid1");
                    HiddenField hdnExpParticularID1 = (HiddenField)RptExpenditure1.Items[j].FindControl("hdnExpParticularID1");
                    Label LblExpParticualName1 = (Label)RptExpenditure1.Items[j].FindControl("LblExpParticualName1");
                    TextBox txtpExpValue1 = (TextBox)RptExpenditure1.Items[j].FindControl("txtpExpValue1");
                    Label txtExpPlanParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpPlanParcentage1");
                    TextBox txtExpActualValue1 = (TextBox)RptExpenditure1.Items[j].FindControl("txtExpActualValue1");
                    Label txtExpActualParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpActualParcentage1");
                    Label txtExpVariance1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpVariance1");
                    Label txtExpVarianceParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpVarianceParcentage1");
                    if (txtExpActualValue1.Text == "")
                    {
                        check1 = 1;
                        break;
                    }

                }
                for (int j = 0; j < RptConsumbles1.Items.Count; j++)
                {

                    Label lblConSumblesTransid1 = (Label)RptConsumbles1.Items[j].FindControl("lblConSumblesTransid1");
                    HiddenField hdnConSumblesParticularID1 = (HiddenField)RptConsumbles1.Items[j].FindControl("hdnConSumblesParticularID1");
                    Label LblConSumblesParticualName1 = (Label)RptConsumbles1.Items[j].FindControl("LblConSumblesParticualName1");
                    TextBox txtpConSumblesValue1 = (TextBox)RptConsumbles1.Items[j].FindControl("txtpConSumblesValue1");
                    Label txtConSumblesPlanParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesPlanParcentage1");
                    TextBox txtConSumblesActualValue1 = (TextBox)RptConsumbles1.Items[j].FindControl("txtConSumblesActualValue1");
                    Label txtConSumblesActualParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesActualParcentage1");
                    Label txtConSumblesVariance1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesVariance1");
                    Label txtConSumblesVarianceParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesVarianceParcentage1");
                    if (txtConSumblesActualValue1.Text == "")
                    {
                        check2 = 1;
                        break;
                    }

                }
                for (int j = 0; j < RptDirectExpenses1.Items.Count; j++)
                {


                    Label lblDirectExpensesTransid1 = (Label)RptDirectExpenses1.Items[j].FindControl("lblDirectExpensesTransid1");
                    HiddenField hdnDirectExpensesParticularID1 = (HiddenField)RptDirectExpenses1.Items[j].FindControl("hdnDirectExpensesParticularID1");
                    Label LblDirectExpensesParticualName1 = (Label)RptDirectExpenses1.Items[j].FindControl("LblDirectExpensesParticualName1");
                    TextBox txtpDirectExpensesValue1 = (TextBox)RptDirectExpenses1.Items[j].FindControl("txtpDirectExpensesValue1");
                    Label txtDirectExpensesPlanParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesPlanParcentage1");
                    TextBox txtDirectExpensesActualValue1 = (TextBox)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesActualValue1");
                    Label txtDirectExpensesActualParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesActualParcentage1");
                    Label txtDirectExpensesVariance1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesVarianceParcentage1");
                    Label txtDirectExpensesVarianceParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtConSumblesVarianceParcentage1");
                    if (txtDirectExpensesActualValue1.Text == "")
                    {
                        check3 = 1;
                        break;
                    }

                }
                for (int j = 0; j < RptHirecharges1.Items.Count; j++)
                {


                    Label lblDirectExpensesTransid1 = (Label)RptHirecharges1.Items[j].FindControl("lblDirectExpensesTransid1");
                    HiddenField hdnHireChargesExpensesParticularID1 = (HiddenField)RptHirecharges1.Items[j].FindControl("hdnHireChargesExpensesParticularID1");
                    Label LblHireChargesExpensesParticualName1 = (Label)RptHirecharges1.Items[j].FindControl("LblHireChargesExpensesParticualName1");
                    TextBox txtpHireChargesExpensesValue1 = (TextBox)RptHirecharges1.Items[j].FindControl("txtpHireChargesExpensesValue1");
                    Label txtHireChargesExpensesPlanParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesPlanParcentage1");
                    TextBox txtHireChargesExpensesActualValue1 = (TextBox)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesActualValue1");
                    Label txtHireChargesExpensesActualParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesActualParcentage1");
                    Label txtHireChargesExpensesVariance1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesVariance1");
                    Label txtHireChargesExpensesVarianceParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesVarianceParcentage1");
                    if (txtHireChargesExpensesActualValue1.Text == "")
                    {
                        check4 = 1;
                        break;
                    }

                }
                for (int j = 0; j < RptIndirectExpenses1.Items.Count; j++)
                {

                    Label lblIndirectExpensesTransid1 = (Label)RptIndirectExpenses1.Items[j].FindControl("lblIndirectExpensesTransid1");
                    HiddenField hdnIndirectExpensesParticularID1 = (HiddenField)RptIndirectExpenses1.Items[j].FindControl("hdnIndirectExpensesParticularID1");
                    Label LblHireIndirectExpensesParticualName1 = (Label)RptIndirectExpenses1.Items[j].FindControl("LblHireIndirectExpensesParticualName1");
                    TextBox txtpIndirectExpensesValue1 = (TextBox)RptIndirectExpenses1.Items[j].FindControl("txtpIndirectExpensesValue1");
                    Label txtIndirectExpensesPlanParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesPlanParcentage1");
                    TextBox txtIndirectExpensesActualValue1 = (TextBox)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesActualValue1");
                    Label txtIndirectExpensesActualParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesActualParcentage1");
                    Label txtIndirectExpensesVariance1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesVariance1");
                    Label txtIndirectExpensesVarianceParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesVarianceParcentage1");
                    if (txtIndirectExpensesActualValue1.Text == "")
                    {
                        check5 = 1;
                        break;
                    }

                }
                Hashtable htcheck = new Hashtable();
                htcheck.Add("@ProjectId", ddlProject1.SelectedValue);
                htcheck.Add("@PlaneMonth", ddlMonth1.SelectedValue);
                htcheck.Add("@PlaneYear", ddlSDaysYear1.SelectedValue);
                DataTable Dtcheck = PMCApp.Get(htcheck, "CheckActualPlanMonthandYearWise");
                if (Dtcheck.Rows.Count > 0)
                {
                    string scripts = "alert('Already exists.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                else
                {

                    if (ddlProject1.SelectedValue != "-1")
                    {
                        if (txtDate1.Text != "")
                        {
                            if (ddlMonth1.SelectedValue != "-1")
                            {
                                if (ddlSDaysYear1.SelectedValue != "-1")
                                {
                                    if (check == 0)
                                    {
                                        if (check1 == 0)
                                        {
                                            if (check2 == 0)
                                            {
                                                if (check3 == 0)
                                                {
                                                    if (check4 == 0)
                                                    {
                                                        if (check4 == 0)
                                                        {
                                                            for (int j = 0; j < RptIncome1.Items.Count; j++)
                                                            {
                                                                Label lblIncomeTransid1 = (Label)RptIncome1.Items[j].FindControl("lblIncomeTransid1");
                                                                HiddenField hdnIncomeParticularID1 = (HiddenField)RptIncome1.Items[j].FindControl("hdnIncomeParticularID1");
                                                                Label LblParticualName1 = (Label)RptIncome1.Items[j].FindControl("LblParticualName1");
                                                                TextBox txtpincomeValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtpincomeValue1");
                                                                Label txtIncimePlanParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncimePlanParcentage1");
                                                                TextBox txtIncomeActualValue1 = (TextBox)RptIncome1.Items[j].FindControl("txtIncomeActualValue1");
                                                                Label txtIncomeActualParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeActualParcentage1");
                                                                Label txtIncomeVariance1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVariance1");
                                                                Label txtIncomeVarianceParcentage1 = (Label)RptIncome1.Items[j].FindControl("txtIncomeVarianceParcentage1");
                                                                Hashtable htincome = new Hashtable();
                                                                htincome.Add("@ParticularsId", hdnIncomeParticularID1.Value);
                                                                htincome.Add("@CompanyId", Session["CompID"].ToString());
                                                                htincome.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htincome.Add("@ActualPlanDate", txtDate1.Text);
                                                                htincome.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htincome.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htincome.Add("@ParticularsName", LblParticualName1.Text);
                                                                htincome.Add("@PlanValue", Convert.ToDecimal(txtpincomeValue1.Text));


                                                                htincome.Add("@PlanParcentage", Convert.ToDecimal(txtIncimePlanParcentage1.Text));
                                                                htincome.Add("@ActulValue", Convert.ToDecimal(txtIncomeActualValue1.Text));
                                                                htincome.Add("@ActulParcentage", Convert.ToDecimal(txtIncomeActualParcentage1.Text));
                                                                htincome.Add("@Variance", Convert.ToDecimal(txtIncomeVariance1.Text));
                                                                htincome.Add("@VarianceParcentage", Convert.ToDecimal(txtIncomeVarianceParcentage1.Text));
                                                                htincome.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htincome, "InsertPanandActualData");


                                                            }
                                                            for (int j = 0; j < RptExpenditure1.Items.Count; j++)
                                                            {

                                                                Label lblExpTransid1 = (Label)RptExpenditure1.Items[j].FindControl("lblExpTransid1");
                                                                HiddenField hdnExpParticularID1 = (HiddenField)RptExpenditure1.Items[j].FindControl("hdnExpParticularID1");
                                                                Label LblExpParticualName1 = (Label)RptExpenditure1.Items[j].FindControl("LblExpParticualName1");
                                                                TextBox txtpExpValue1 = (TextBox)RptExpenditure1.Items[j].FindControl("txtpExpValue1");
                                                                Label txtExpPlanParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpPlanParcentage1");
                                                                TextBox txtExpActualValue1 = (TextBox)RptExpenditure1.Items[j].FindControl("txtExpActualValue1");
                                                                Label txtExpActualParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpActualParcentage1");
                                                                Label txtExpVariance1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpVariance1");
                                                                Label txtExpVarianceParcentage1 = (Label)RptExpenditure1.Items[j].FindControl("txtExpVarianceParcentage1");
                                                                Hashtable htExp = new Hashtable();
                                                                htExp.Add("@ParticularsId", hdnExpParticularID1.Value);
                                                                htExp.Add("@CompanyId", Session["CompID"].ToString());
                                                                htExp.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htExp.Add("@ActualPlanDate", txtDate1.Text);
                                                                htExp.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htExp.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htExp.Add("@ParticularsName", LblExpParticualName1.Text);
                                                                htExp.Add("@PlanValue", Convert.ToDecimal(txtpExpValue1.Text));


                                                                htExp.Add("@PlanParcentage", Convert.ToDecimal(txtExpPlanParcentage1.Text));
                                                                htExp.Add("@ActulValue", Convert.ToDecimal(txtExpActualValue1.Text));
                                                                htExp.Add("@ActulParcentage", Convert.ToDecimal(txtExpActualParcentage1.Text));
                                                                htExp.Add("@Variance", Convert.ToDecimal(txtExpVariance1.Text));
                                                                htExp.Add("@VarianceParcentage", Convert.ToDecimal(txtExpVarianceParcentage1.Text));
                                                                htExp.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htExp, "InsertPanandActualData");


                                                            }
                                                            for (int j = 0; j < RptConsumbles1.Items.Count; j++)
                                                            {

                                                                Label lblConSumblesTransid1 = (Label)RptConsumbles1.Items[j].FindControl("lblConSumblesTransid1");
                                                                HiddenField hdnConSumblesParticularID1 = (HiddenField)RptConsumbles1.Items[j].FindControl("hdnConSumblesParticularID1");
                                                                Label LblConSumblesParticualName1 = (Label)RptConsumbles1.Items[j].FindControl("LblConSumblesParticualName1");
                                                                TextBox txtpConSumblesValue1 = (TextBox)RptConsumbles1.Items[j].FindControl("txtpConSumblesValue1");
                                                                Label txtConSumblesPlanParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesPlanParcentage1");
                                                                TextBox txtConSumblesActualValue1 = (TextBox)RptConsumbles1.Items[j].FindControl("txtConSumblesActualValue1");
                                                                Label txtConSumblesActualParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesActualParcentage1");
                                                                Label txtConSumblesVariance1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesVariance1");
                                                                Label txtConSumblesVarianceParcentage1 = (Label)RptConsumbles1.Items[j].FindControl("txtConSumblesVarianceParcentage1");
                                                                Hashtable htCon = new Hashtable();
                                                                htCon.Add("@ParticularsId", hdnConSumblesParticularID1.Value);
                                                                htCon.Add("@CompanyId", Session["CompID"].ToString());
                                                                htCon.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htCon.Add("@ActualPlanDate", txtDate1.Text);
                                                                htCon.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htCon.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htCon.Add("@ParticularsName", LblConSumblesParticualName1.Text);
                                                                htCon.Add("@PlanValue", Convert.ToDecimal(txtpConSumblesValue1.Text));


                                                                htCon.Add("@PlanParcentage", Convert.ToDecimal(txtConSumblesPlanParcentage1.Text));
                                                                htCon.Add("@ActulValue", Convert.ToDecimal(txtConSumblesActualValue1.Text));
                                                                htCon.Add("@ActulParcentage", Convert.ToDecimal(txtConSumblesActualParcentage1.Text));
                                                                htCon.Add("@Variance", Convert.ToDecimal(txtConSumblesVariance1.Text));
                                                                htCon.Add("@VarianceParcentage", Convert.ToDecimal(txtConSumblesVarianceParcentage1.Text));
                                                                htCon.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htCon, "InsertPanandActualData");


                                                            }
                                                            for (int j = 0; j < RptDirectExpenses1.Items.Count; j++)
                                                            {


                                                                Label lblDirectExpensesTransid1 = (Label)RptDirectExpenses1.Items[j].FindControl("lblDirectExpensesTransid1");
                                                                HiddenField hdnDirectExpensesParticularID1 = (HiddenField)RptDirectExpenses1.Items[j].FindControl("hdnDirectExpensesParticularID1");
                                                                Label LblDirectExpensesParticualName1 = (Label)RptDirectExpenses1.Items[j].FindControl("LblDirectExpensesParticualName1");
                                                                TextBox txtpDirectExpensesValue1 = (TextBox)RptDirectExpenses1.Items[j].FindControl("txtpDirectExpensesValue1");
                                                                Label txtDirectExpensesPlanParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesPlanParcentage1");
                                                                TextBox txtDirectExpensesActualValue1 = (TextBox)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesActualValue1");
                                                                Label txtDirectExpensesActualParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesActualParcentage1");
                                                                Label txtDirectExpensesVariance1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesVariance1");
                                                                Label txtDirectExpensesVarianceParcentage1 = (Label)RptDirectExpenses1.Items[j].FindControl("txtDirectExpensesVarianceParcentage1");
                                                                Hashtable htDirect = new Hashtable();
                                                                htDirect.Add("@ParticularsId", hdnDirectExpensesParticularID1.Value);
                                                                htDirect.Add("@CompanyId", Session["CompID"].ToString());
                                                                htDirect.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htDirect.Add("@ActualPlanDate", txtDate1.Text);
                                                                htDirect.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htDirect.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htDirect.Add("@ParticularsName", LblDirectExpensesParticualName1.Text);
                                                                htDirect.Add("@PlanValue", Convert.ToDecimal(txtpDirectExpensesValue1.Text));


                                                                htDirect.Add("@PlanParcentage", Convert.ToDecimal(txtDirectExpensesPlanParcentage1.Text));
                                                                htDirect.Add("@ActulValue", Convert.ToDecimal(txtDirectExpensesActualValue1.Text));
                                                                htDirect.Add("@ActulParcentage", Convert.ToDecimal(txtDirectExpensesActualParcentage1.Text));
                                                                htDirect.Add("@Variance", Convert.ToDecimal(txtDirectExpensesVariance1.Text));
                                                                htDirect.Add("@VarianceParcentage", Convert.ToDecimal(txtDirectExpensesVarianceParcentage1.Text));
                                                                htDirect.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htDirect, "InsertPanandActualData");


                                                            }
                                                            for (int j = 0; j < RptHirecharges1.Items.Count; j++)
                                                            {


                                                                Label lblDirectExpensesTransid1 = (Label)RptHirecharges1.Items[j].FindControl("lblDirectExpensesTransid1");
                                                                HiddenField hdnHireChargesExpensesParticularID1 = (HiddenField)RptHirecharges1.Items[j].FindControl("hdnHireChargesExpensesParticularID1");
                                                                Label LblHireChargesExpensesParticualName1 = (Label)RptHirecharges1.Items[j].FindControl("LblHireChargesExpensesParticualName1");
                                                                TextBox txtpHireChargesExpensesValue1 = (TextBox)RptHirecharges1.Items[j].FindControl("txtpHireChargesExpensesValue1");
                                                                Label txtHireChargesExpensesPlanParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesPlanParcentage1");
                                                                TextBox txtHireChargesExpensesActualValue1 = (TextBox)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesActualValue1");
                                                                Label txtHireChargesExpensesActualParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesActualParcentage1");
                                                                Label txtHireChargesExpensesVariance1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesVariance1");
                                                                Label txtHireChargesExpensesVarianceParcentage1 = (Label)RptHirecharges1.Items[j].FindControl("txtHireChargesExpensesVarianceParcentage1");
                                                                Hashtable htHire = new Hashtable();
                                                                htHire.Add("@ParticularsId", hdnHireChargesExpensesParticularID1.Value);
                                                                htHire.Add("@CompanyId", Session["CompID"].ToString());
                                                                htHire.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htHire.Add("@ActualPlanDate", txtDate1.Text);
                                                                htHire.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htHire.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htHire.Add("@ParticularsName", LblHireChargesExpensesParticualName1.Text);
                                                                htHire.Add("@PlanValue", Convert.ToDecimal(txtpHireChargesExpensesValue1.Text));


                                                                htHire.Add("@PlanParcentage", Convert.ToDecimal(txtHireChargesExpensesPlanParcentage1.Text));
                                                                htHire.Add("@ActulValue", Convert.ToDecimal(txtHireChargesExpensesActualValue1.Text));
                                                                htHire.Add("@ActulParcentage", Convert.ToDecimal(txtHireChargesExpensesActualParcentage1.Text));
                                                                htHire.Add("@Variance", Convert.ToDecimal(txtHireChargesExpensesVariance1.Text));
                                                                htHire.Add("@VarianceParcentage", Convert.ToDecimal(txtHireChargesExpensesVarianceParcentage1.Text));
                                                                htHire.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htHire, "InsertPanandActualData");


                                                            }
                                                            for (int j = 0; j < RptIndirectExpenses1.Items.Count; j++)
                                                            {

                                                                Label lblIndirectExpensesTransid1 = (Label)RptIndirectExpenses1.Items[j].FindControl("lblIndirectExpensesTransid1");
                                                                HiddenField hdnIndirectExpensesParticularID1 = (HiddenField)RptIndirectExpenses1.Items[j].FindControl("hdnIndirectExpensesParticularID1");
                                                                Label LblHireIndirectExpensesParticualName1 = (Label)RptIndirectExpenses1.Items[j].FindControl("LblHireIndirectExpensesParticualName1");
                                                                TextBox txtpIndirectExpensesValue1 = (TextBox)RptIndirectExpenses1.Items[j].FindControl("txtpIndirectExpensesValue1");
                                                                Label txtIndirectExpensesPlanParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesPlanParcentage1");
                                                                TextBox txtIndirectExpensesActualValue1 = (TextBox)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesActualValue1");
                                                                Label txtIndirectExpensesActualParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesActualParcentage1");
                                                                Label txtIndirectExpensesVariance1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesVariance1");
                                                                Label txtIndirectExpensesVarianceParcentage1 = (Label)RptIndirectExpenses1.Items[j].FindControl("txtIndirectExpensesVarianceParcentage1");
                                                                Hashtable htIndirect = new Hashtable();
                                                                htIndirect.Add("@ParticularsId", hdnIndirectExpensesParticularID1.Value);
                                                                htIndirect.Add("@CompanyId", Session["CompID"].ToString());
                                                                htIndirect.Add("@ProjectId", ddlProject1.SelectedValue);
                                                                htIndirect.Add("@ActualPlanDate", txtDate1.Text);
                                                                htIndirect.Add("@ActulPlanMonth", ddlMonth1.SelectedValue);
                                                                htIndirect.Add("@ActulplanYear", ddlSDaysYear1.SelectedValue);
                                                                htIndirect.Add("@ParticularsName", LblHireIndirectExpensesParticualName1.Text);
                                                                htIndirect.Add("@PlanValue", Convert.ToDecimal(txtpIndirectExpensesValue1.Text));


                                                                htIndirect.Add("@PlanParcentage", Convert.ToDecimal(txtIndirectExpensesPlanParcentage1.Text));
                                                                htIndirect.Add("@ActulValue", Convert.ToDecimal(txtIndirectExpensesActualValue1.Text));
                                                                htIndirect.Add("@ActulParcentage", Convert.ToDecimal(txtIndirectExpensesActualParcentage1.Text));
                                                                htIndirect.Add("@Variance", Convert.ToDecimal(txtIndirectExpensesVariance1.Text));
                                                                htIndirect.Add("@VarianceParcentage", Convert.ToDecimal(txtIndirectExpensesVarianceParcentage1.Text));
                                                                htIndirect.Add("@CreatedBy", Session["UserId"].ToString());
                                                                PMCApp.Get(htIndirect, "InsertPanandActualData");
                                                                GetData1();
                                                                string scripts = "alert('Insert Successfully.');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);


                                                            }
                                                        }
                                                        else
                                                        {
                                                            string scripts = "alert('Kindly Fill Particulars Indirct Expenses Actual Value. ');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                    }
                                                    else
                                                    {
                                                        string scripts = "alert('Kindly Fill Particulars Hire Charges(Item Wise) Actual Value. ');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                    }

                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly Fill Particulars Direct Expenses Actual Value. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }

                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly Fill Particulars Consumbles Actual Value. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }

                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly Fill Particulars Expenditure Actual Value. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }

                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Fill Particulars Income Actual Value. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }

                                else
                                {
                                    string scripts = "alert('Kindly Select Year. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }

                            else
                            {
                                string scripts = "alert('Kindly Select Month. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }

                        else
                        {
                            string scripts = "alert('Kindly Select Date. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }


                    }
                    else
                    {
                        string scripts = "alert('Kindly Select Project. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }


                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }


        }
        protected void ViewReport1_Click(object sender, EventArgs e)
        {
            btnCalculate1.Visible = true;
            btnSubmit1.Visible = true;
            btnCancel1.Visible = true;
            GetData1();
        }
        public void BlankGetData1()
        {



            RptExpenditure1.DataSource = null; ;
            RptExpenditure1.DataBind();


            RptConsumbles1.DataSource = null;
            RptConsumbles1.DataBind();

            RptDirectExpenses1.DataSource = null;
            RptDirectExpenses1.DataBind();

            RptHirecharges1.DataSource = null;
            RptHirecharges1.DataBind();

            RptIndirectExpenses1.DataSource = null;
            RptIndirectExpenses1.DataBind();
        }
    }

}
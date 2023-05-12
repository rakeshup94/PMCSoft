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

public partial class PMCReports_AddNewActual : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
    DataTable DT = new DataTable();
    string No = "", IncomeParticularsID = "", HirechargeParticularsId = "";

    string ExpenditureParticularsID = "", ConsumbleParticularsID = "", DirectExpansesParticularsID = "", IndirectExpensesParticularsID = "";
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
                    BindProj();
                    LoadYears(ref ddlSDaysYear);

                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }

    }
    void LoadYears(ref DropDownList DrpYears)
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
    public void BindProj()
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

    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        //   ModalPopupExtender1.Show();
       GetData();
    }
    public void GetData()
    {
        Hashtable ht = new Hashtable();
        DataTable dt = PMCApp.Get(ht, "GetIncomeMasterData");

        if (dt.Rows.Count > 0)
        {
            RptIncome.DataSource = dt;
            RptIncome.DataBind();
        }
        Hashtable ht1 = new Hashtable();
        DataTable dt1 = PMCApp.Get(ht1, "GetExPenditureMasterData");

        if (dt1.Rows.Count > 0)
        {
            RptExpenditure.DataSource = dt1;
            RptExpenditure.DataBind();
        }
        Hashtable ht2 = new Hashtable();
        DataTable dt2 = PMCApp.Get(ht2, "GetCONSUMBLESMasterData");

        if (dt2.Rows.Count > 0)
        {
            RptConsumbles.DataSource = dt2;
            RptConsumbles.DataBind();
        }
        Hashtable ht3 = new Hashtable();
        DataTable dt3 = PMCApp.Get(ht3, "GetDirectMasterData");

        if (dt3.Rows.Count > 0)
        {
            RptDirectExpenses.DataSource = dt3;
            RptDirectExpenses.DataBind();
        }
        Hashtable ht4 = new Hashtable();
        DataTable dt4 = PMCApp.Get(ht4, "GetHireMasterData");

        if (dt4.Rows.Count > 0)
        {
            RptHirecharges.DataSource = dt4;
            RptHirecharges.DataBind();
        }
        Hashtable ht6 = new Hashtable();
        DataTable dt6 = PMCApp.Get(ht6, "GetIndirectMasterData");

        if (dt6.Rows.Count > 0)
        {
            RptIndirectExpenses.DataSource = dt6;
            RptIndirectExpenses.DataBind();
        }
       
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         try
        {
            decimal SumIncome = 0;
            int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0, check7 = 0;
            for (int j = 0; j < RptIncome.Items.Count; j++)
            {
                HiddenField hdnIncomeParticularID = (HiddenField)RptIncome.Items[j].FindControl("hdnIncomeParticularID");
                Label LblParticualName = (Label)RptIncome.Items[j].FindControl("LblParticualName");
                Label txtPPlan = (Label)RptIncome.Items[j].FindControl("txtPPlan");
                Label txtPPlan1 = (Label)RptIncome.Items[j].FindControl("txtPPlan1");
                TextBox txtActual = (TextBox)RptIncome.Items[j].FindControl("txtActual");
                if (txtActual.Text == "")
                {
                    check = 1;
                    break;
                }

            }
            for (int j = 0; j < RptExpenditure.Items.Count; j++)
            {

                HiddenField hdnExpParticularID = (HiddenField)RptExpenditure.Items[j].FindControl("hdnExpParticularID");
                Label LblExpName = (Label)RptExpenditure.Items[j].FindControl("LblExpName");
                Label txtExpPPlan = (Label)RptExpenditure.Items[j].FindControl("txtExpPPlan");
                Label txtExpPPlan1 = (Label)RptExpenditure.Items[j].FindControl("txtExpPPlan1");
                TextBox txtExpActualValue = (TextBox)RptExpenditure.Items[j].FindControl("txtExpActualValue");
                if (txtExpActualValue.Text == "")
                {
                    check1 = 1;
                    break;
                }

            }
            for (int j = 0; j < RptConsumbles.Items.Count; j++)
            {

                HiddenField hdnCONSUMBLESParticularID = (HiddenField)RptConsumbles.Items[j].FindControl("hdnCONSUMBLESParticularID");
                Label LblCONSUMBLESName = (Label)RptConsumbles.Items[j].FindControl("LblCONSUMBLESName");
                Label txtCONSUMBLESPPlan = (Label)RptConsumbles.Items[j].FindControl("txtCONSUMBLESPPlan");
                Label txtCONSUMBLESPlan1 = (Label)RptConsumbles.Items[j].FindControl("txtCONSUMBLESPlan1");
                TextBox txtCONSUMBLESActual = (TextBox)RptConsumbles.Items[j].FindControl("txtCONSUMBLESActual");
                if (txtCONSUMBLESActual.Text == "")
                {
                    check2 = 1;
                    break;
                }

            }
            for (int j = 0; j < RptDirectExpenses.Items.Count; j++)
            {


                HiddenField hdnDIRECTParticularID = (HiddenField)RptDirectExpenses.Items[j].FindControl("hdnDIRECTParticularID");
                Label LblDIRECTName = (Label)RptDirectExpenses.Items[j].FindControl("LblDIRECTName");
                Label txtDIRECTPlanValue = (Label)RptDirectExpenses.Items[j].FindControl("txtDIRECTPlanValue");
                Label txtDIRECTPlanParcentage = (Label)RptDirectExpenses.Items[j].FindControl("txtDIRECTPlanParcentage");
                TextBox txtDIRECTActualValue = (TextBox)RptDirectExpenses.Items[j].FindControl("txtDIRECTActualValue");
                if (txtDIRECTActualValue.Text == "")
                {
                    check3 = 1;
                    break;
                }

            }
            for (int j = 0; j < RptHirecharges.Items.Count; j++)
            {

                HiddenField hdnHIREParticularID = (HiddenField)RptHirecharges.Items[j].FindControl("hdnHIREParticularID");
                Label LblHIREName = (Label)RptHirecharges.Items[j].FindControl("LblHIREName");
                Label txtHIREPPlanValue = (Label)RptHirecharges.Items[j].FindControl("txtHIREPPlanValue");
                Label txtHIREValueParcentage = (Label)RptHirecharges.Items[j].FindControl("txtHIREValueParcentage");
                TextBox txtHIREActualValue = (TextBox)RptHirecharges.Items[j].FindControl("txtHIREActualValue");
                if (txtHIREActualValue.Text == "")
                {
                    check4 = 1;
                    break;
                }

            }
            for (int j = 0; j < RptIndirectExpenses.Items.Count; j++)
            {

                HiddenField hdnINDIRECTParticularID = (HiddenField)RptIndirectExpenses.Items[j].FindControl("hdnINDIRECTParticularID");
                Label LblINDIRECTName = (Label)RptIndirectExpenses.Items[j].FindControl("LblINDIRECTName");
                Label txtINDIRECTPPlan = (Label)RptIndirectExpenses.Items[j].FindControl("txtINDIRECTPPlan");
                Label txtINDIRECTan1 = (Label)RptIndirectExpenses.Items[j].FindControl("txtINDIRECTan1");
                TextBox txtINDIRECTActualValue = (TextBox)RptIndirectExpenses.Items[j].FindControl("txtINDIRECTActualValue");
                if (txtINDIRECTActualValue.Text == "")
                {
                    check5 = 1;
                    break;
                }

            }

            Hashtable htcheck = new Hashtable();
            htcheck.Add("@ProjectId", ddlProject.SelectedValue);
            htcheck.Add("@PlaneMonth", ddlMonth.SelectedValue);
            htcheck.Add("@PlaneYear", ddlSDaysYear.SelectedValue);
            DataTable Dtcheck = PMCApp.Get(htcheck, "CheckActualPlanMonthandYearWise");
            if (Dtcheck.Rows.Count > 0)
            {
                string scripts = "alert('Already exists.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            else
            {

                if (ddlProject.SelectedValue != "-1")
                {
                    if (txtDate.Text != "")
                    {
                        if (ddlMonth.SelectedValue != "-1")
                        {
                            if (ddlSDaysYear.SelectedValue != "-1")
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
                                                        for (int j = 0; j < RptIncome.Items.Count; j++)
                                                        {
                                                            HiddenField hdnIncomeParticularID = (HiddenField)RptIncome.Items[j].FindControl("hdnIncomeParticularID");
                                                            ViewState["ParticuarId"]=hdnIncomeParticularID.ToString();
                                                            Label LblParticualName = (Label)RptIncome.Items[j].FindControl("LblParticualName");
                                                            Label txtPPlan = (Label)RptIncome.Items[j].FindControl("txtPPlan");
                                                            HiddenField HdnSumInComeValue = (HiddenField)RptIncome.Items[j].FindControl("HdnSumInComeValue");
                                                            Label txtPPlan1 = (Label)RptIncome.Items[j].FindControl("txtPPlan1");
                                                            TextBox txtActual = (TextBox)RptIncome.Items[j].FindControl("txtActual");
                                                            Hashtable htincome = new Hashtable();
                                                            htincome.Add("@ParticularsId", hdnIncomeParticularID.ToString());
                                                            htincome.Add("@CompanyId", Session["CompID"].ToString());
                                                            htincome.Add("@ProjectId", ddlProject.SelectedValue);
                                                            htincome.Add("@ActualPlanDate", txtDate.Text);
                                                            htincome.Add("@ActulPlanMonth", ddlMonth.SelectedValue);
                                                            htincome.Add("@ActulplanYear", ddlSDaysYear.SelectedValue);
                                                            htincome.Add("@ParticularsName", LblParticualName.Text);
                                                            htincome.Add("@PlanValue", Convert.ToDecimal(txtPPlan.Text));
                                                          
                                                            htincome.Add("@SumPlanvalue", Convert.ToDecimal(HdnSumInComeValue.Value));
                                                            htincome.Add("@PlanParcentage", Convert.ToDecimal(txtPPlan1.Text));
                                                            htincome.Add("@ActulValue", Convert.ToDecimal(txtActual.Text));
                                                             htincome.Add("@CreatedBy", Session["UserId"].ToString());
                                                             PMCApp.Get(htincome, "InsertActulPlan");
                                                            SumIncome = SumIncome + Math.Round(Convert.ToDecimal(txtActual.Text), 2);
                                                            ViewState["SumIncome"] = SumIncome;
                                                        }
                                                        Hashtable HtUpdateSumincome = new Hashtable();
                                                        HtUpdateSumincome.Add("@ParticularsId", ViewState["ParticuarId"].ToString());
                                                        HtUpdateSumincome.Add("@SumPlanValue", ViewState["SumIncome"].ToString());
                                                        DataTable dtupdate = PMCApp.Get(HtUpdateSumincome, "UpdateParticularsActualSumPlan");
                                                    //    for (int j = 0; j < RptExpenditure.Items.Count; j++)
                                                    //    {

                                                    //        HiddenField hdnExpParticularID = (HiddenField)RptExpenditure.Items[j].FindControl("hdnExpParticularID");
                                                    //        Label LblExpName = (Label)RptExpenditure.Items[j].FindControl("LblExpName");
                                                    //        Label txtExpPPlan = (Label)RptExpenditure.Items[j].FindControl("txtExpPPlan");
                                                    //        Label txtExpPPlan1 = (Label)RptExpenditure.Items[j].FindControl("txtExpPPlan1");
                                                    //        TextBox txtExpActualValue = (TextBox)RptExpenditure.Items[j].FindControl("txtExpActualValue");
                                                    //        HiddenField HdnSumInComeValue = (HiddenField)RptIncome.Items[j].FindControl("HdnSumInComeValue");
                                                          
                                                    //        Hashtable htincome = new Hashtable();
                                                    //        htincome.Add("@ParticularsId", hdnIncomeParticularID.ToString());
                                                    //        htincome.Add("@CompanyId", Session["CompID"].ToString());
                                                    //        htincome.Add("@ProjectId", ddlProject.SelectedValue);
                                                    //        htincome.Add("@ActualPlanDate", txtDate.Text);
                                                    //        htincome.Add("@ActulPlanMonth", ddlMonth.SelectedValue);
                                                    //        htincome.Add("@ActulplanYear", ddlSDaysYear.SelectedValue);
                                                    //        htincome.Add("@ParticularsName", LblParticualName.Text);
                                                    //        htincome.Add("@PlanValue", Convert.ToDecimal(txtPPlan.Text));
                                                    //        // Decimal ss = Convert.ToDecimal(lblSumInComeValue.ToString());
                                                    //        htincome.Add("@SumPlanvalue", Convert.ToDecimal(HdnSumInComeValue.Value));
                                                    //        htincome.Add("@PlanParcentage", Convert.ToDecimal(txtPPlan1.Text));
                                                    //        htincome.Add("@ActulValue", Convert.ToDecimal(txtActual.Text));
                                                    //        htincome.Add("@CreatedBy", Session["UserId"].ToString());
                                                    //        PMCApp.Get(htincome, "InsertActulPlan");
                                                    //        SumIncome = SumIncome + Math.Round(Convert.ToDecimal(txtActual.Text), 2);
                                                    //        ViewState["SumIncome"] = SumIncome;
                                                    //    }
                                                    //    Hashtable HtUpdateSumincome = new Hashtable();
                                                    //    HtUpdateSumincome.Add("@ParticularsId", ViewState["ParticuarId"].ToString());
                                                    //    HtUpdateSumincome.Add("@SumPlanValue", ViewState["SumIncome"].ToString());
                                                    //    DataTable dtupdate = PMCApp.Get(HtUpdateSumincome, "UpdateParticularsActualSumPlan");



                                                      

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
    }

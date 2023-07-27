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
 
using System.Text;
namespace PMCSoft.Web.User
{
    public partial class NewRABILL : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string No = "", WPID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    BindProject();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {



            if (ddlProject.SelectedValue != "-1")
            {
                if (txtbillNo.Text != "")
                {
                    if (txtbillPeriod.Text != "")
                    {
                        if (TxtBillperiodto.Text != "")
                        {
                            if (Txtbillsubmitteddate.Text != "")
                            {

                                if (TxtBillAmt.Text != "")
                                {

                                    if (txtServiceTex.Text != "")
                                    {
                                        if (TxtServiceTexonFoc.Text != "")
                                        {
                                            if (txtMobilizationAdvancereceived.Text != "")
                                            {
                                                if (txtSecuredAdvancereceived.Text != "")
                                                {
                                                    if (txtTotal.Text != "")
                                                    {
                                                        if (txtTDS2.Text != "")
                                                        {
                                                            if (txtRetentionMoneyDeductd5.Text != "")
                                                            {
                                                                if (txtwct4.Text != "")
                                                                {
                                                                    if (txtMobilizationAdvanceDeducted.Text != "")
                                                                    {
                                                                        if (txtSecuredAdvanceAdjusted.Text != "")
                                                                        {
                                                                            if (txtOtherDeduction.Text != "")
                                                                            {
                                                                                if (TxtOtherDeduction1.Text != "")
                                                                                {
                                                                                    if (TxtOtherDeduction2.Text != "")
                                                                                    {
                                                                                        if (TxtOtherDeduction3.Text != "")
                                                                                        {
                                                                                            if (TxtOtherDeduction4.Text != "")
                                                                                            {
                                                                                                if (txtTotalDeduction.Text != "")
                                                                                                {
                                                                                                    Hashtable ht1 = new Hashtable();
                                                                                                    ht1.Add("@RaBillNo", txtbillNo.Text);
                                                                                                    ht1.Add("@ProjectId", ddlProject.SelectedValue);
                                                                                                    DataTable dt = PMCApp.Get(ht1, "ChekRaBiillNo");
                                                                                                    if (dt.Rows.Count > 0)
                                                                                                    {
                                                                                                        string scripts = "alert('Alrady Exist Bill No ');";
                                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                    }
                                                                                                    if (ViewState["Sum"] != null)
                                                                                                    {
                                                                                                        PMC.GetMaxIDForRaBillNo(Session["CompID"].ToString(), out WPID);
                                                                                                        Hashtable ht = new Hashtable();
                                                                                                        ht.Add("@CompanyId", Session["CompID"].ToString());
                                                                                                        ht.Add("@ProjectId", ddlProject.SelectedValue);
                                                                                                        ht.Add("@RaBillId", WPID);

                                                                                                        ht.Add("@RaBillNo", txtbillNo.Text);
                                                                                                        ht.Add("@Billperiod", txtbillPeriod.Text);
                                                                                                        ht.Add("@BillperiodTo", TxtBillperiodto.Text);
                                                                                                        ht.Add("@Billsubmitteddate", Txtbillsubmitteddate.Text);
                                                                                                        ht.Add("@BillAmount", TxtBillAmt.Text);

                                                                                                        ht.Add("@ServiceTex", txtServiceTex.Text);
                                                                                                        ht.Add("@ServiceTexonFoc", TxtServiceTexonFoc.Text);
                                                                                                        ht.Add("@MobilizationAdvancereceived", txtMobilizationAdvancereceived.Text);
                                                                                                        ht.Add("@SecuredAdvancereceived", txtSecuredAdvancereceived.Text);
                                                                                                        ht.Add("@Total", txtTotal.Text);
                                                                                                        ht.Add("@TDS@2", txtTDS2.Text);
                                                                                                        ht.Add("@RetentionMoneyDeductd@5", txtRetentionMoneyDeductd5.Text);
                                                                                                        ht.Add("@WCT@4", txtwct4.Text);
                                                                                                        ht.Add("@MobilizationAdvanceDeducted", txtMobilizationAdvanceDeducted.Text);
                                                                                                        ht.Add("@SecuredAdvanceAdjusted", txtSecuredAdvanceAdjusted.Text);
                                                                                                        ht.Add("@OtherDeduction", txtOtherDeduction.Text);
                                                                                                        ht.Add("@OtherDeduction1", TxtOtherDeduction1.Text);
                                                                                                        ht.Add("@OtherDeduction2", TxtOtherDeduction2.Text);
                                                                                                        ht.Add("@OtherDeduction3", TxtOtherDeduction3.Text);
                                                                                                        ht.Add("@OtherDeduction4", TxtOtherDeduction4.Text);
                                                                                                        ht.Add("@TotalDeduction", txtTotalDeduction.Text);
                                                                                                        ht.Add("@NetReceivable", TxttotalReceivable.Text);
                                                                                                        ht.Add("@Remarks", txtremarks.Text);
                                                                                                        ht.Add("@CreatedBy", Session["UserId"]);
                                                                                                        PMCApp.Get(ht, "InsertRabill");
                                                                                                        ddlProject.SelectedValue = "-1"; txtbillNo.Text = ""; txtbillPeriod.Text = ""; Txtbillsubmitteddate.Text = "";
                                                                                                        txtServiceTex.Text = ""; TxtServiceTexonFoc.Text = ""; txtMobilizationAdvancereceived.Text = "";
                                                                                                        txtSecuredAdvancereceived.Text = ""; txtTotal.Text = ""; txtTDS2.Text = ""; txtRetentionMoneyDeductd5.Text = "";
                                                                                                        txtwct4.Text = ""; txtMobilizationAdvanceDeducted.Text = ""; txtSecuredAdvanceAdjusted.Text = "";
                                                                                                        txtOtherDeduction.Text = ""; txtTotalDeduction.Text = ""; TxtBillperiodto.Text = ""; txtremarks.Text = "";
                                                                                                        TxttotalReceivable.Text = ""; TxtBillAmt.Text = ""; TxtOtherDeduction1.Text = ""; TxtOtherDeduction2.Text = ""; TxtOtherDeduction3.Text = ""; TxtOtherDeduction4.Text = "";
                                                                                                        string scripts = "alert('Insert Successfully.');";
                                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                    }
                                                                                                    else
                                                                                                    {

                                                                                                        string scripts = "alert('Kindly calculate Value.');";
                                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                    }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    string scripts = "alert('Kindly Fill Total Deduction ');";
                                                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);

                                                                                                }

                                                                                            }

                                                                                            else
                                                                                            {
                                                                                                string scripts = "alert('Kindly Fill Other Deduction 4 ');";
                                                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                            }

                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            string scripts = "alert('Kindly Fill Other Deduction 3 ');";
                                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                        }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        string scripts = "alert('Kindly Fill Other Deduction 2 ');";
                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                    }
                                                                                }
                                                                                else
                                                                                {
                                                                                    string scripts = "alert('Kindly Fill Other Deduction 1 ');";
                                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                }
                                                                            }
                                                                            else
                                                                            {
                                                                                string scripts = "alert('Kindly Fill Other Deduction ');";
                                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            string scripts = "alert('Kindly Fill Secured Advance Adjusted ');";
                                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                        }
                                                                    }
                                                                    else
                                                                    {
                                                                        string scripts = "alert('Kindly Fill Mobilization Advance Deducted ');";
                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    string scripts = "alert('Kindly Fill Retention Money Deductd @5 %.. ');";
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                }
                                                            }
                                                            else
                                                            {
                                                                string scripts = "alert('Kindly Fill Retention Money Deductd @5 %.. ');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            string scripts = "alert('Kindly Fill TDS @2%.. ');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                    }
                                                    else
                                                    {
                                                        string scripts = "alert('Kindly Fill Secured Advance Received.. ');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                    }
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly Fill Secured Advance Received.. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly Fill Mobilization Advance Received.. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly Fill Service Tex FOC. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Fill Service Tex. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly Fill Bill Amount. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly Fill Bill Submit date. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Fill Bill Period To Date. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Fill Bill Period Date. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }

                }
                else
                {
                    string scripts = "alert('Kindly Fill Bill No. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }

            }
            else
            {
                string scripts = "alert('Kindly select project name. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }



        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");

        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                //BindGrid();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void txtSecuredAdvancereceived_TextChanged(object sender, EventArgs e)
        {
            //txtTotal.Text=Convert.ToDouble(TxtBillCertifiedAmount.Text)+Convert.ToDouble(txtServiceTex.Text)+Convert.ToDouble(TxtServiceTexonFoc.Text)+Convert.ToDouble(txtMobilizationAdvancereceived.Text)+txtSecuredAdvancereceived.Text;
            //txtTotal.Text = (Convert.ToInt32(TxtBillCertifiedAmount.Text) + Convert.ToInt32(txtServiceTex.Text).ToString());
            if ((!string.IsNullOrEmpty(TxtBillAmt.Text)) && (!string.IsNullOrEmpty(txtServiceTex.Text)) && (!string.IsNullOrEmpty(TxtServiceTexonFoc.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvancereceived.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvancereceived.Text)))
            {
                txtTotal.Text = (Convert.ToDouble(TxtBillAmt.Text) + Convert.ToDouble(txtServiceTex.Text) + Convert.ToDouble(TxtServiceTexonFoc.Text) + Convert.ToDouble(txtMobilizationAdvancereceived.Text) + Convert.ToDouble(txtSecuredAdvancereceived.Text)).ToString();

                double val1 = Convert.ToDouble(txtTotal.Text);

                // double val3 = (val1 * 2) / 100;
                double val3 = Math.Round((val1 * 2) / 100, 2);
                txtTDS2.Text = val3.ToString();
            }
        }
        protected void txtTotal_TextChanged(object sender, EventArgs e)
        {

            double val1 = Convert.ToDouble(txtTotal.Text);

            double val3 = (val1 * 2) / 100;
            txtTDS2.Text = val3.ToString();
        }

        protected void txtTotalDeduction_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtTotal.Text)) && (!string.IsNullOrEmpty(txtTotalDeduction.Text)))
            {
                TxttotalReceivable.Text = (Convert.ToDouble(txtTotal.Text) - Convert.ToDouble(txtTotalDeduction.Text)).ToString();


            }

        }
        protected void BtnCalculate_Click(object sender, EventArgs e)
        {

            if ((!string.IsNullOrEmpty(TxtBillAmt.Text)) && (!string.IsNullOrEmpty(txtServiceTex.Text)) && (!string.IsNullOrEmpty(TxtServiceTexonFoc.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvancereceived.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvancereceived.Text)))
            {
                txtTotal.Text = (Convert.ToDouble(TxtBillAmt.Text) + Convert.ToDouble(txtServiceTex.Text) + Convert.ToDouble(TxtServiceTexonFoc.Text) + Convert.ToDouble(txtMobilizationAdvancereceived.Text) + Convert.ToDouble(txtSecuredAdvancereceived.Text)).ToString();

                double val1 = Convert.ToDouble(txtTotal.Text);
                ViewState["total"] = val1.ToString();
                double val3 = (val1 * 2) / 100;
                txtTDS2.Text = val3.ToString();
                ViewState["tds"] = txtTDS2.Text;
                txtTotalDeduction.Text = (Convert.ToDouble(txtTDS2.Text) + Convert.ToDouble(txtRetentionMoneyDeductd5.Text) + Convert.ToDouble(txtwct4.Text) + Convert.ToDouble(txtMobilizationAdvanceDeducted.Text) + Convert.ToDouble(txtSecuredAdvanceAdjusted.Text) + Convert.ToDouble(txtOtherDeduction.Text) + Convert.ToDouble(TxtOtherDeduction1.Text) + Convert.ToDouble(TxtOtherDeduction2.Text) + Convert.ToDouble(TxtOtherDeduction3.Text) + Convert.ToDouble(TxtOtherDeduction4.Text)).ToString();
                ViewState["totaldeduction"] = txtTotalDeduction.Text;
                TxttotalReceivable.Text = (Convert.ToDouble(txtTotal.Text) - Convert.ToDouble(txtTotalDeduction.Text)).ToString();
                ViewState["totalReceivable"] = TxttotalReceivable.Text;
                ViewState["Sum"] = 1;

            }

        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                Hashtable ht = new Hashtable();

                ht.Add("@PRJID", ddlProject.SelectedValue);
                DataTable dt = PMCApp.Get(ht, "GetProjectAddress");
                if (dt.Rows.Count > 0)
                {
                    Lbladdress.Text = dt.Rows[0]["Address"].ToString();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

        protected void TxtOtherDeduction4_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtTDS2.Text)) && (!string.IsNullOrEmpty(txtRetentionMoneyDeductd5.Text)) && (!string.IsNullOrEmpty(txtwct4.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvanceDeducted.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvanceAdjusted.Text)) && (!string.IsNullOrEmpty(txtOtherDeduction.Text)) && (!string.IsNullOrEmpty(TxtOtherDeduction1.Text)) && (!string.IsNullOrEmpty(TxtOtherDeduction2.Text)) && (!string.IsNullOrEmpty(TxtOtherDeduction3.Text)) && (!string.IsNullOrEmpty(TxtOtherDeduction4.Text)))
            {
                txtTotalDeduction.Text = (Convert.ToDouble(txtTDS2.Text) + Convert.ToDouble(txtRetentionMoneyDeductd5.Text) + Convert.ToDouble(txtwct4.Text) + Convert.ToDouble(txtMobilizationAdvanceDeducted.Text) + Convert.ToDouble(txtSecuredAdvanceAdjusted.Text) + Convert.ToDouble(txtOtherDeduction.Text) + Convert.ToDouble(TxtOtherDeduction1.Text) + Convert.ToDouble(TxtOtherDeduction2.Text) + Convert.ToDouble(TxtOtherDeduction3.Text) + Convert.ToDouble(TxtOtherDeduction4.Text)).ToString();
                TxttotalReceivable.Text = (Convert.ToDouble(txtTotal.Text) - Convert.ToDouble(txtTotalDeduction.Text)).ToString();

            }
        }
    }
}
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
    public partial class RABILLDetail : BasePage
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
                    GridBind();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GridBind()
        {
            Hashtable ht = new Hashtable();
            DataTable dt = PMCApp.Get(ht, "GetRaBillsubmit");
            GvRAbillSub.DataSource = dt;
            GvRAbillSub.DataBind();
        }
        protected void GvRAbillSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "RABILLsub")
                {
                    ModalPopupExtender1.Show();
                    // ModalPopupExtender2.Hide();
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");
                    ViewState["Transid"] = hdnTransID.Value;

                    BindProject();
                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@TransId", hdnTransID.Value);
                    DataTable dt = PMCApp.Get(ht1, "GetRabillData");
                    if (dt.Rows.Count > 0)
                    {
                        ddlProject.SelectedValue = dt.Rows[0]["ProjectId"].ToString();
                        Lbladdress.Text = dt.Rows[0]["Address"].ToString();
                        txtbillNo.Text = dt.Rows[0]["RaBillNo"].ToString();
                        txtbillPeriod.Text = dt.Rows[0]["Billperiod"].ToString();
                        TxtBillperiodto.Text = dt.Rows[0]["BillperiodTo"].ToString();
                        string submitteddate = dt.Rows[0]["Billsubmitteddate"].ToString();
                        Txtbillsubmitteddate.Text = dt.Rows[0]["Billsubmitteddate1"].ToString();

                        TxtBillAmt.Text = dt.Rows[0]["BillAmount"].ToString();

                        txtServiceTex.Text = dt.Rows[0]["ServiceTex"].ToString();
                        TxtServiceTexonFoc.Text = dt.Rows[0]["ServiceTexonFoc"].ToString();
                        txtMobilizationAdvancereceived.Text = dt.Rows[0]["MobilizationAdvancereceived"].ToString();
                        txtSecuredAdvancereceived.Text = dt.Rows[0]["SecuredAdvancereceived"].ToString();
                        txtTotal.Text = dt.Rows[0]["Total"].ToString();
                        txtTDS2.Text = dt.Rows[0]["TDS@2"].ToString();
                        txtRetentionMoneyDeductd5.Text = dt.Rows[0]["RetentionMoneyDeductd@5"].ToString();
                        txtwct4.Text = dt.Rows[0]["WCT@4"].ToString();
                        txtMobilizationAdvanceDeducted.Text = dt.Rows[0]["MobilizationAdvanceDeducted"].ToString();
                        txtSecuredAdvanceAdjusted.Text = dt.Rows[0]["SecuredAdvanceAdjusted"].ToString();
                        txtOtherDeduction.Text = dt.Rows[0]["OtherDeduction"].ToString();
                        TxtOtherDeduction1.Text = dt.Rows[0]["OtherDeduction1"].ToString();
                        TxtOtherDeduction2.Text = dt.Rows[0]["OtherDeduction2"].ToString();
                        TxtOtherDeduction3.Text = dt.Rows[0]["OtherDeduction3"].ToString();
                        TxtOtherDeduction4.Text = dt.Rows[0]["OtherDeduction4"].ToString();
                        txtTotalDeduction.Text = dt.Rows[0]["TotalDeduction"].ToString();
                        TxttotalReceivable.Text = dt.Rows[0]["NetReceivable"].ToString();
                        txtremarks.Text = dt.Rows[0]["Remarks"].ToString();

                        ModalPopupExtender1.Show();
                    }
                }
                else if (e.CommandName == "RABILLView")
                {
                    ModalPopupExtender2.Show();

                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");


                    ViewState["Transid"] = hdnTransID.Value;

                    //BindProject();
                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@TransId", hdnTransID.Value);
                    DataTable dt = PMCApp.Get(ht1, "GetRabillData");
                    if (dt.Rows.Count > 0)
                    {
                        // ddlProject.SelectedValue = dt.Rows[0]["ProjectId"].ToString();
                        lblproject.Text = dt.Rows[0]["ProjectName"].ToString();
                        Lbladdressview.Text = dt.Rows[0]["Address"].ToString();
                        lblbillno.Text = dt.Rows[0]["RaBillNo"].ToString();
                        lblbillperiod.Text = dt.Rows[0]["Billperiod"].ToString();
                        lblbillperiodTo.Text = dt.Rows[0]["BillperiodTo"].ToString();
                        string submitteddate = dt.Rows[0]["Billsubmitteddate"].ToString();
                        lblbillsubmitteddate.Text = dt.Rows[0]["Billsubmitteddate1"].ToString();

                        lblbillamt.Text = dt.Rows[0]["BillAmount"].ToString();
                        lblservicetex.Text = dt.Rows[0]["ServiceTex"].ToString();
                        lblservicetexonfoc.Text = dt.Rows[0]["ServiceTexonFoc"].ToString();
                        lblmobilizationAdvancereceived.Text = dt.Rows[0]["MobilizationAdvancereceived"].ToString();
                        lblSecuredAdvancereceived.Text = dt.Rows[0]["SecuredAdvancereceived"].ToString();
                        lbltotal.Text = dt.Rows[0]["Total"].ToString();
                        lbltds.Text = dt.Rows[0]["TDS@2"].ToString();
                        lblRetentionMoneyDeductd.Text = dt.Rows[0]["RetentionMoneyDeductd@5"].ToString();
                        lblwct.Text = dt.Rows[0]["WCT@4"].ToString();
                        lblMobilizationAdvanceDeducted.Text = dt.Rows[0]["MobilizationAdvanceDeducted"].ToString();
                        lblSecuredAdvanceAdjusted.Text = dt.Rows[0]["SecuredAdvanceAdjusted"].ToString();
                        lblotherdeduction.Text = dt.Rows[0]["OtherDeduction"].ToString();
                        lblOtherDeduction1.Text = dt.Rows[0]["OtherDeduction1"].ToString();
                        LblOtherDeduction2.Text = dt.Rows[0]["OtherDeduction2"].ToString();
                        lblOtherDeduction3.Text = dt.Rows[0]["OtherDeduction3"].ToString();
                        lblOtherDeduction4.Text = dt.Rows[0]["OtherDeduction4"].ToString();
                        lblTotalDeduction.Text = dt.Rows[0]["TotalDeduction"].ToString();
                        Lblnetreceivable.Text = dt.Rows[0]["NetReceivable"].ToString();
                        lblremarks.Text = dt.Rows[0]["Remarks"].ToString();
                        ModalPopupExtender2.Show();
                    }
                }
            }

            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
                //   ModalPopupExtender1.Show();
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
            if ((!string.IsNullOrEmpty(TxtBillAmt.Text)) && (!string.IsNullOrEmpty(txtServiceTex.Text)) && (!string.IsNullOrEmpty(TxtServiceTexonFoc.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvancereceived.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvancereceived.Text)))
            {
                txtTotal.Text = (Convert.ToDouble(TxtBillAmt.Text) + Convert.ToDouble(txtServiceTex.Text) + Convert.ToDouble(TxtServiceTexonFoc.Text) + Convert.ToDouble(txtMobilizationAdvancereceived.Text) + Convert.ToDouble(txtSecuredAdvancereceived.Text)).ToString();

                double val1 = Convert.ToDouble(txtTotal.Text);

                double val3 = (val1 * 2) / 100;
                txtTDS2.Text = val3.ToString();
                ModalPopupExtender1.Show();


            }
        }
        protected void txtTotal_TextChanged(object sender, EventArgs e)
        {

            double val1 = Convert.ToDouble(txtTotal.Text);

            double val3 = (val1 * 2) / 100;
            txtTDS2.Text = val3.ToString();
            ModalPopupExtender1.Show();
        }
        protected void TxtBillCertifiedAmount_TextChanged(object sender, EventArgs e)
        {

            //if ((!string.IsNullOrEmpty(TxtBillCertifiedAmount.Text)) && (!string.IsNullOrEmpty(txtTotal.Text)))
            //{ 
            //    txtTotal.Text = (Convert.ToDouble(TxtBillCertifiedAmount.Text) + Convert.ToDouble(txtTotal.Text)).ToString();
            //    ModalPopupExtender1.Show();
            //}
        }
        protected void BtnCalculate_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            if ((!string.IsNullOrEmpty(TxtBillAmt.Text)) && (!string.IsNullOrEmpty(txtServiceTex.Text)) && (!string.IsNullOrEmpty(TxtServiceTexonFoc.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvancereceived.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvancereceived.Text)))
            {
                txtTotal.Text = Math.Round(Convert.ToDouble(TxtBillAmt.Text) + Convert.ToDouble(txtServiceTex.Text) + Convert.ToDouble(TxtServiceTexonFoc.Text) + Convert.ToDouble(txtMobilizationAdvancereceived.Text) + Convert.ToDouble(txtSecuredAdvancereceived.Text), 2).ToString();

                double val1 = Convert.ToDouble(txtTotal.Text);
                ViewState["total"] = val1.ToString();
                double val3 = (val1 * 2) / 100;
                txtTDS2.Text = val3.ToString();
                ViewState["tds"] = txtTDS2.Text;
                txtTotalDeduction.Text = (Convert.ToDouble(txtTDS2.Text) + Convert.ToDouble(txtRetentionMoneyDeductd5.Text) + Convert.ToDouble(txtwct4.Text) + Convert.ToDouble(txtMobilizationAdvanceDeducted.Text) + Convert.ToDouble(txtSecuredAdvanceAdjusted.Text) + Convert.ToDouble(txtOtherDeduction.Text) + Convert.ToDouble(TxtOtherDeduction1.Text) + Convert.ToDouble(TxtOtherDeduction2.Text) + Convert.ToDouble(TxtOtherDeduction3.Text) + Convert.ToDouble(TxtOtherDeduction4.Text)).ToString();
                ViewState["totaldeduction"] = txtTotalDeduction.Text;
                TxttotalReceivable.Text = (Convert.ToDouble(txtTotal.Text) - Convert.ToDouble(txtTotalDeduction.Text)).ToString();
                ViewState["Sum"] = 1;
                ModalPopupExtender1.Show();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                if (ddlProject.SelectedValue != "-1")
                {
                    if (txtbillNo.Text != "")
                    {
                        if (txtbillPeriod.Text != "")
                        {
                            if (Txtbillsubmitteddate.Text != "")
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
                                                                                                if (Txtbillcertificationdate.Text != "")
                                                                                                {

                                                                                                    if (ViewState["Sum"] != null)
                                                                                                    {

                                                                                                        PMC.GetMaxIDForRaBillGoToCertified(Session["CompID"].ToString(), out WPID);
                                                                                                        Hashtable ht = new Hashtable();
                                                                                                        ht.Add("@RABillTransId", ViewState["Transid"]);
                                                                                                        ht.Add("@CompanyId", Session["CompID"].ToString());
                                                                                                        ht.Add("@ProjectId", ddlProject.SelectedValue);
                                                                                                        ht.Add("@RaBillId", WPID);

                                                                                                        ht.Add("@RaBillNo", txtbillNo.Text);
                                                                                                        ht.Add("@Billperiod", txtbillPeriod.Text);
                                                                                                        ht.Add("@BillperiodTo", TxtBillperiodto.Text);
                                                                                                        ht.Add("@Billsubmitteddate", Txtbillsubmitteddate.Text);
                                                                                                        ht.Add("@BillCertificationDate", Txtbillcertificationdate.Text);
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
                                                                                                        ht.Add("@TotalReceived", TxttotalReceivable.Text);
                                                                                                        ht.Add("@Remarks", txtremarks.Text);
                                                                                                        ht.Add("@CreatedBy", Session["UserId"]);
                                                                                                        PMCApp.Get(ht, "InsertRabillGoForCertified");
                                                                                                        ddlProject.SelectedValue = "-1"; txtbillNo.Text = ""; txtbillPeriod.Text = ""; Txtbillsubmitteddate.Text = "";
                                                                                                        txtServiceTex.Text = ""; TxtServiceTexonFoc.Text = ""; txtMobilizationAdvancereceived.Text = "";
                                                                                                        txtSecuredAdvancereceived.Text = ""; txtTotal.Text = ""; txtTDS2.Text = ""; txtRetentionMoneyDeductd5.Text = "";
                                                                                                        txtwct4.Text = ""; txtMobilizationAdvanceDeducted.Text = ""; txtSecuredAdvanceAdjusted.Text = "";
                                                                                                        txtOtherDeduction.Text = ""; txtTotalDeduction.Text = ""; TxtBillperiodto.Text = ""; txtremarks.Text = "";
                                                                                                        string scripts = "alert('Insert Successfully.');";
                                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                        //upbill.Add("@RABillTransId", ViewState["Transid"]);
                                                                                                        // PMCApp.Get(upbill, "UpdateRabill");
                                                                                                        // string scripts = "alert('Update Successfully.');";
                                                                                                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                        GridBind();
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        ModalPopupExtender1.Show();
                                                                                                        string scripts = "alert('Kindly calculate.');";
                                                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                    }

                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    ModalPopupExtender1.Show();
                                                                                                    string scripts = "alert('Kindly Fill Certification Date ');";
                                                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                                                }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                ModalPopupExtender1.Show();
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
                                                                        ModalPopupExtender1.Show();
                                                                        string scripts = "alert('Kindly Fill Secured Advance Adjusted ');";
                                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    ModalPopupExtender1.Show();
                                                                    string scripts = "alert('Kindly Fill Mobilization Advance Deducted ');";
                                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                                }
                                                            }
                                                            else
                                                            {
                                                                ModalPopupExtender1.Show();
                                                                string scripts = "alert('Kindly Fill Retention Money Deductd @5 %.. ');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            ModalPopupExtender1.Show();
                                                            string scripts = "alert('Kindly Fill Retention Money Deductd @5 %.. ');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                    }
                                                    else
                                                    {
                                                        ModalPopupExtender1.Show();
                                                        string scripts = "alert('Kindly Fill TDS @2%.. ');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                    }
                                                }
                                                else
                                                {
                                                    ModalPopupExtender1.Show();
                                                    string scripts = "alert('Kindly Fill Secured Advance Received.. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                ModalPopupExtender1.Show();
                                                string scripts = "alert('Kindly Fill Secured Advance Received.. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            ModalPopupExtender1.Show();
                                            string scripts = "alert('Kindly Fill Mobilization Advance Received.. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        ModalPopupExtender1.Show();
                                        string scripts = "alert('Kindly Fill Service Tex FOC. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    ModalPopupExtender1.Show();
                                    string scripts = "alert('Kindly Fill Service Tex. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }

                            }
                            else
                            {
                                ModalPopupExtender1.Show();
                                string scripts = "alert('Kindly Fill Bill Submit date. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            ModalPopupExtender1.Show();
                            string scripts = "alert('Kindly Fill Bill Period. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }

                    }
                    else
                    {
                        ModalPopupExtender1.Show();
                        string scripts = "alert('Kindly Fill Bill No. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }

                }
                else
                {
                    ModalPopupExtender1.Show();
                    string scripts = "alert('Kindly select project name. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }






            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }


        protected void GvRAbillSub_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                HiddenField hdnTransID = (HiddenField)e.Row.FindControl("hdnTransID");
                LinkButton LnkRabillupdate = (LinkButton)e.Row.FindControl("LnkRabillupdate");
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Hashtable ht = new Hashtable();

                    ht.Add("@TransId", hdnTransID.Value);
                    DataTable dt = PMCApp.Get(ht, "GetRaBillCertifiedByid");
                    if (dt.Rows.Count > 0)
                    {
                        LnkRabillupdate.Enabled = false;



                    }
                    else
                    {
                        LnkRabillupdate.Enabled = true;
                        //  ModalPopupExtender1.Show();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
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
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
    public partial class RABILLCertified : System.Web.UI.Page
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
                    if (Session["UserId"] == null || Session["UserName"] == null || Session["CompID"] == null || Session["AName"] == null || Session["UserEmail"] == null || Session["AID"] == null || Session["PRJID"] == null)
                    {
                        Session.Clear();
                        Session.Abandon();
                        Session.RemoveAll();
                        Response.Redirect("~/Login.aspx?Value=" + "2");
                    }
                    else
                    {
                        GridBind();

                    }
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
            DataTable dt = PMCApp.Get(ht, "GetRaBillCertified");
            GvRAbillSub.DataSource = dt;
            GvRAbillSub.DataBind();
        }
        protected void GvRAbillSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "RABILLsub")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");
                    ModalPopupExtender1.Show();
                    // BindProject();
                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@TransId", hdnTransID.Value);
                    DataTable dt = PMCApp.Get(ht1, "GetRabillCertifiedData");
                    if (dt.Rows.Count > 0)
                    {
                        string projectid = dt.Rows[0]["ProjectId"].ToString();
                        ViewState["Projectid"] = projectid.ToString();
                        string Transid = dt.Rows[0]["TransId"].ToString();
                        ViewState["Transid"] = Transid.ToString();
                        LblProject.Text = dt.Rows[0]["ProjectName"].ToString();
                        Lbladdressview.Text = dt.Rows[0]["address"].ToString();
                        txtbillNo.Text = dt.Rows[0]["RaBillNo"].ToString();
                        // lblbillperiod.Text = dt.Rows[0]["Billperiod"].ToString();
                        /// lblbillperiodTo.Text = dt.Rows[0]["BillperiodTo"].ToString();

                        string submitteddate = dt.Rows[0]["Billsubmitteddate"].ToString();
                        Txtbillsubmitteddate.Text = dt.Rows[0]["Billsubmitteddate1"].ToString();
                        string billcertificationdate = dt.Rows[0]["BillCertificationDate"].ToString();
                        Txtbillcertificationdate.Text = dt.Rows[0]["BillCertificationDate1"].ToString();
                        txtNetReceivable.Text = dt.Rows[0]["TotalReceived"].ToString();
                        LblNetBalanceamt.Text = dt.Rows[0]["BalAmt"].ToString();
                        if (LblNetBalanceamt.Text == "")
                        {
                            LblNetBalanceamt.Text = dt.Rows[0]["TotalReceived"].ToString();
                        }
                        else
                        {
                            LblNetBalanceamt.Text = dt.Rows[0]["BalAmt"].ToString();
                        }
                        //txtServiceTex.Text = dt.Rows[0]["ServiceTex"].ToString();
                        //TxtServiceTexonFoc.Text = dt.Rows[0]["ServiceTexonFoc"].ToString();
                        //txtMobilizationAdvancereceived.Text = dt.Rows[0]["MobilizationAdvancereceived"].ToString();
                        //txtSecuredAdvancereceived.Text = dt.Rows[0]["SecuredAdvancereceived"].ToString();
                        //txtTotal.Text = dt.Rows[0]["Total"].ToString();
                        //txtTDS2.Text = dt.Rows[0]["TDS@2"].ToString();
                        //txtRetentionMoneyDeductd5.Text = dt.Rows[0]["RetentionMoneyDeductd@5"].ToString();
                        //txtwct4.Text = dt.Rows[0]["WCT@4"].ToString();
                        //txtMobilizationAdvanceDeducted.Text = dt.Rows[0]["MobilizationAdvanceDeducted"].ToString();
                        //txtSecuredAdvanceAdjusted.Text = dt.Rows[0]["SecuredAdvanceAdjusted"].ToString();
                        //txtOtherDeduction.Text = dt.Rows[0]["OtherDeduction"].ToString();
                        //   txtTotalDeduction.Text = dt.Rows[0]["TotalDeduction"].ToString();
                    }
                }
                if (e.CommandName == "RaBillView")
                {
                    ModalPopupExtender2.Show();
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");
                    Hashtable ht = new Hashtable();
                    ht.Add("@RaBillTransid", hdnTransID.Value);
                    DataTable dt = PMCApp.Get(ht, "GetCertifieddataById");
                    GvCertifiedView.DataSource = dt;
                    GvCertifiedView.DataBind();
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

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void txtSecuredAdvancereceived_TextChanged(object sender, EventArgs e)
        {

            //if ((!string.IsNullOrEmpty(TxtBillCertifiedAmount.Text)) && (!string.IsNullOrEmpty(txtServiceTex.Text)) && (!string.IsNullOrEmpty(TxtServiceTexonFoc.Text)) && (!string.IsNullOrEmpty(txtMobilizationAdvancereceived.Text)) && (!string.IsNullOrEmpty(txtSecuredAdvancereceived.Text)))
            //{
            //    txtTotal.Text = (Convert.ToDouble(TxtBillCertifiedAmount.Text) + Convert.ToDouble(txtServiceTex.Text) + Convert.ToDouble(TxtServiceTexonFoc.Text) + Convert.ToDouble(txtMobilizationAdvancereceived.Text) + Convert.ToDouble(txtSecuredAdvancereceived.Text)).ToString();

            //    double val1 = Convert.ToDouble(txtTotal.Text);

            //    double val3 = (val1 * 2) / 100;
            //    txtTDS2.Text = val3.ToString();
            //}
        }
        protected void txtTotal_TextChanged(object sender, EventArgs e)
        {

            //double val1 = Convert.ToDouble(txtTotal.Text);

            //double val3 = (val1 * 2) / 100;
            //txtTDS2.Text = val3.ToString();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            //Hashtable ht1 = new Hashtable();
            //ht1.Add("@RaBillTransId", ViewState["Transid"]);
            //DataTable dt = PMCApp.Get(ht1, "CheckBillCertified");
            //if (dt.Rows.Count > 0)
            //{
            //    string scripts = "alert('Certified Bill Already Exists ');";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            //    ModalPopupExtender1.Hide();
            //    GridBind();
            //}
            //else
            //{
            if (txtReceivable.Text != "")
            {
                if (txtAmountReceived.Text != "")
                {
                    if (txtChequeNoRTGS.Text != "")
                    {
                        if (txtChequeNoRTGSDate.Text != "")
                        {
                            if (txtNetReceivable.Text != "")
                            {



                                PMC.GetMaxIDForRaBillCertified(Session["CompID"].ToString(), out WPID);
                                Hashtable ht = new Hashtable();
                                ht.Add("@CompanyId", Session["CompID"].ToString());
                                ht.Add("@ProjectId", ViewState["Projectid"].ToString());
                                ht.Add("@RaBillTransId", ViewState["Transid"]);


                                ht.Add("@RaBillCertifiedId", WPID);
                                ht.Add("@Receivable", txtReceivable.Text);
                                ht.Add("@AmountReceived", txtAmountReceived.Text);
                                ht.Add("@ChequeNoRTGS", txtChequeNoRTGS.Text);

                                ht.Add("@ChequeNoRTGSDate", Convert.ToDateTime(txtChequeNoRTGSDate.Text));
                                ht.Add("@NetReceivable", txtNetReceivable.Text);
                                ht.Add("@CreatedBy", Session["UserId"]);
                                ht.Add("@Remarks", txtRemarks.Text);
                                ht.Add("@ModifiedBy", Session["UserId"]);
                                PMCApp.Get(ht, "InsertRaBillCertified");
                                txtReceivable.Text = ""; txtAmountReceived.Text = ""; txtChequeNoRTGS.Text = ""; txtChequeNoRTGSDate.Text = "";
                                txtNetReceivable.Text = "";

                                string scripts = "alert('Insert Successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                GridBind();
                                ModalPopupExtender1.Hide();

                            }
                            else
                            {
                                string scripts = "alert('Kindly Fill Net Receivable');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Fill Cheque No RTGS Date');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Fill Cheque No RTGS ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Fill Amount Receivable ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly Fill Receivable ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            GridBind();
            //  }
        }




        protected void txtAmountReceived_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtNetReceivable.Text)) && (!string.IsNullOrEmpty(txtAmountReceived.Text)))
            {
                txtReceivable.Text = (Convert.ToDouble(LblNetBalanceamt.Text) - Convert.ToDouble(txtAmountReceived.Text)).ToString();

                ModalPopupExtender1.Show();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
            GridBind();
        }
    }
}
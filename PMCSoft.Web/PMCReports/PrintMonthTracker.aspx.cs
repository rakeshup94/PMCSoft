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
    public partial class PrintMonthTracker : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        decimal PPlan = 0, PActual = 0, PVariance = 0, CPlan = 0, CActual = 0, CVariance = 0, NPlan = 0;
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
                    if (Session["UserId"] == null || Session["UserName"] == null || Session["CompID"] == null || Session["AName"] == null || Session["UserEmail"] == null || Session["AID"] == null || Session["PRJID"] == null)
                    {
                        Session.Clear();
                        Session.Abandon();
                        Session.RemoveAll();
                        Response.Redirect("~/Login.aspx?Value=" + "2");
                    }
                    else
                    {
                        string strReq = "";
                        strReq = Request.RawUrl;
                        strReq = strReq.Substring(strReq.IndexOf('?') + 1);

                        if (!strReq.Equals(""))
                        {
                            strReq = DecryptQueryString(strReq);
                            string[] arrMsgs = strReq.Split('&');
                            string[] arrIndMsg;

                            string PRJID = "", ProjName = "", FromMonth = "", FromYear = "", ToMonth = "", Toyear = "";
                            arrIndMsg = arrMsgs[0].Split('=');
                            PRJID = arrIndMsg[1].ToString().Trim();
                            arrIndMsg = arrMsgs[1].Split('=');
                            ProjName = arrIndMsg[1].ToString().Trim();
                            arrIndMsg = arrMsgs[2].Split('=');
                            FromMonth = arrIndMsg[1].ToString().Trim();
                            arrIndMsg = arrMsgs[3].Split('=');
                            FromYear = arrIndMsg[1].ToString().Trim();

                            arrIndMsg = arrMsgs[4].Split('=');
                            ToMonth = arrIndMsg[1].ToString().Trim();

                            arrIndMsg = arrMsgs[5].Split('=');
                            Toyear = arrIndMsg[1].ToString().Trim();

                            //FromMonth.Text = Date.ToString();
                            //lblProjectName.Text = ProjName.ToString();
                            GetValue(FromMonth.ToString(), FromYear.ToString(), ToMonth.ToString(), Toyear.ToString());

                        }


                    }
                }
            }



            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }





        public void GetValue(string FromMonth1, string FromYear1, string ToMonth, string Toyear)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@PlanMonth", FromMonth1);
            ht.Add("@PlanYear", FromYear1);
            DataTable dt = PMCApp.Get(ht, "FromDateplan");

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            Hashtable ht1 = new Hashtable();
            ht1.Add("@PlanMonth", FromMonth1);
            ht1.Add("@PlanYear", FromYear1);
            DataTable dt1 = PMCApp.Get(ht1, "PreviousMonthPlan");

            if (dt1.Rows.Count > 0)
            {
                Repeater2.DataSource = dt1;
                Repeater2.DataBind();
            }
            Hashtable ht2 = new Hashtable();
            ht2.Add("@PlanMonth", ToMonth);
            ht2.Add("@PlanYear", Toyear);
            DataTable dt2 = PMCApp.Get(ht2, "toDateplan");

            if (dt2.Rows.Count > 0)
            {
                Repeater3.DataSource = dt2;
                Repeater3.DataBind();
            }
            Hashtable ht3 = new Hashtable();
            ht3.Add("@PlanMonth", FromMonth1);
            ht3.Add("@PlanYear", FromYear1);
            DataTable dt3 = PMCApp.Get(ht3, "FromDateplanExp");

            if (dt3.Rows.Count > 0)
            {
                RptExpenditure1.DataSource = dt3;
                RptExpenditure1.DataBind();
            }
            Hashtable ht4 = new Hashtable();
            ht4.Add("@PlanMonth", FromMonth1);
            ht4.Add("@PlanYear", FromYear1);
            DataTable dt4 = PMCApp.Get(ht4, "PreviousMonthPlanExp");

            if (dt4.Rows.Count > 0)
            {
                RptExpenditure2.DataSource = dt4;
                RptExpenditure2.DataBind();
            }
            Hashtable ht5 = new Hashtable();
            ht5.Add("@PlanMonth", ToMonth);
            ht5.Add("@PlanYear", Toyear);
            DataTable dt5 = PMCApp.Get(ht5, "toDateplanExp");

            if (dt5.Rows.Count > 0)
            {
                RptExpenditure3.DataSource = dt5;
                RptExpenditure3.DataBind();
            }
            Hashtable ht6 = new Hashtable();
            ht6.Add("@PlanMonth", FromMonth1);
            ht6.Add("@PlanYear", FromYear1);
            DataTable dt6 = PMCApp.Get(ht6, "FromDateplanCon");

            if (dt6.Rows.Count > 0)
            {
                RptCon1.DataSource = dt6;
                RptCon1.DataBind();
            }
            Hashtable ht7 = new Hashtable();
            ht7.Add("@PlanMonth", FromMonth1);
            ht7.Add("@PlanYear", FromYear1);
            DataTable dt7 = PMCApp.Get(ht7, "PreviousMonthPlanCon");

            if (dt7.Rows.Count > 0)
            {
                RptCon2.DataSource = dt7;
                RptCon2.DataBind();
            }
            Hashtable ht8 = new Hashtable();
            ht8.Add("@PlanMonth", ToMonth);
            ht8.Add("@PlanYear", Toyear);
            DataTable dt8 = PMCApp.Get(ht8, "toDateplanCon");

            if (dt8.Rows.Count > 0)
            {
                RptCon3.DataSource = dt8;
                RptCon3.DataBind();
            }
            Hashtable ht9 = new Hashtable();
            ht9.Add("@PlanMonth", FromMonth1);
            ht9.Add("@PlanYear", FromYear1);
            DataTable dt9 = PMCApp.Get(ht9, "FromDateplanDirect");

            if (dt9.Rows.Count > 0)
            {
                RptDirectExp1.DataSource = dt9;
                RptDirectExp1.DataBind();
            }
            Hashtable ht10 = new Hashtable();
            ht10.Add("@PlanMonth", FromMonth1);
            ht10.Add("@PlanYear", FromYear1);
            DataTable dt10 = PMCApp.Get(ht10, "PreviousMonthPlanDirect");

            if (dt10.Rows.Count > 0)
            {
                RptDirectExp2.DataSource = dt10;
                RptDirectExp2.DataBind();
            }
            Hashtable ht11 = new Hashtable();
            ht11.Add("@PlanMonth", ToMonth);
            ht11.Add("@PlanYear", Toyear);
            DataTable dt11 = PMCApp.Get(ht11, "toDateplanDirect");

            if (dt11.Rows.Count > 0)
            {
                RptDirectExp3.DataSource = dt11;
                RptDirectExp3.DataBind();
            }
            Hashtable ht12 = new Hashtable();
            ht12.Add("@PlanMonth", FromMonth1);
            ht12.Add("@PlanYear", FromYear1);
            DataTable dt12 = PMCApp.Get(ht12, "FromDateplanHire");

            if (dt12.Rows.Count > 0)
            {
                RptHire1.DataSource = dt12;
                RptHire1.DataBind();
            }
            Hashtable ht13 = new Hashtable();
            ht13.Add("@PlanMonth", FromMonth1);
            ht13.Add("@PlanYear", FromYear1);
            DataTable dt13 = PMCApp.Get(ht13, "PreviousMonthPlanHire");

            if (dt13.Rows.Count > 0)
            {
                RptHire2.DataSource = dt13;
                RptHire2.DataBind();
            }
            Hashtable ht14 = new Hashtable();
            ht14.Add("@PlanMonth", ToMonth);
            ht14.Add("@PlanYear", Toyear);
            DataTable dt14 = PMCApp.Get(ht14, "toDateplanHire");

            if (dt14.Rows.Count > 0)
            {
                RptHire3.DataSource = dt14;
                RptHire3.DataBind();
            }
            Hashtable ht15 = new Hashtable();
            ht15.Add("@PlanMonth", FromMonth1);
            ht15.Add("@PlanYear", FromYear1);
            DataTable dt15 = PMCApp.Get(ht15, "FromDateplanIndirect");

            if (dt15.Rows.Count > 0)
            {
                RptIndirect1.DataSource = dt15;
                RptIndirect1.DataBind();
            }
            Hashtable ht16 = new Hashtable();
            ht16.Add("@PlanMonth", FromMonth1);
            ht16.Add("@PlanYear", FromYear1);
            DataTable dt16 = PMCApp.Get(ht16, "PreviousMonthPlanIndirect");

            if (dt16.Rows.Count > 0)
            {
                RptIndirect2.DataSource = dt16;
                RptIndirect2.DataBind();
            }
            Hashtable ht17 = new Hashtable();
            ht17.Add("@PlanMonth", ToMonth);
            ht17.Add("@PlanYear", Toyear);
            DataTable dt17 = PMCApp.Get(ht17, "toDateplanIndirect");

            if (dt17.Rows.Count > 0)
            {
                RptIndirect3.DataSource = dt17;
                RptIndirect3.DataBind();
                Get();
                GetFormTotal();
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
        public void Get()
        {
            try
            {
                decimal SumIV = 0, SumIP = 0, SumIAV = 0, SumIAP = 0, SumIVV = 0, SumIVP = 0;
                decimal SumEV = 0, SumEP = 0, SumEAV = 0, SumEAP = 0, SumEVV = 0, SumEVP = 0;
                decimal SumCV = 0, SumCP = 0, SumCAV = 0, SumCAP = 0, SumCVV = 0, SumCVP = 0;


                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label txtIPlan = (Label)Repeater1.Items[i].FindControl("txtIPlan");
                    Label txtIPlan1 = (Label)Repeater1.Items[i].FindControl("txtIPlan1");
                    Label txtIActual = (Label)Repeater1.Items[i].FindControl("txtIActual");
                    Label txtIActual1 = (Label)Repeater1.Items[i].FindControl("txtIActual1");
                    Label txtIVariance = (Label)Repeater1.Items[i].FindControl("txtIVariance");
                    Label txtIVariance1 = (Label)Repeater1.Items[i].FindControl("txtIVariance1");


                    SumIV = SumIV + Math.Round(Convert.ToDecimal(txtIPlan.Text), 0);
                    SumIP = SumIP + Math.Round(Convert.ToDecimal(txtIPlan1.Text), 0);
                    SumIAV = SumIAV + Math.Round(Convert.ToDecimal(txtIActual.Text), 0);
                    SumIAP = SumIAP + Math.Round(Convert.ToDecimal(txtIActual1.Text), 0);
                    SumIVV = SumIVV + Math.Round(Convert.ToDecimal(txtIVariance.Text), 0);
                    SumIVP = SumIVP + Math.Round(Convert.ToDecimal(txtIVariance1.Text), 0);


                    ViewState["SumIV"] = SumIV;
                    ViewState["SumIP"] = SumIP;
                    ViewState["SumIAV"] = SumIAV;
                    ViewState["SumIAP"] = SumIAP;
                    ViewState["SumIVV"] = SumIVV;
                    ViewState["SumIVP"] = SumIVP;
                }
                Label lblSumincomeValueA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumincomeValueA");
                Label lblSumincomesumParcentageA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumincomesumParcentageA");
                Label lblSumIncomeActualValueA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumIncomeActualValueA");
                Label lblSumIncomeActualValueParcentageA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumIncomeActualValueParcentageA");
                Label lblSumIncomeVarianceA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumIncomeVarianceA");
                Label lblSumIncomeVarianceParcentageA = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumIncomeVarianceParcentageA");

                lblSumincomeValueA.Text = ViewState["SumIV"].ToString();
                lblSumincomesumParcentageA.Text = ViewState["SumIP"].ToString();
                lblSumIncomeActualValueA.Text = ViewState["SumIAV"].ToString();
                lblSumIncomeActualValueParcentageA.Text = ViewState["SumIAP"].ToString();
                lblSumIncomeVarianceA.Text = ViewState["SumIVV"].ToString();
                lblSumIncomeVarianceParcentageA.Text = ViewState["SumIVP"].ToString();

                ///fOR 2nD SUM
                for (int i = 0; i < Repeater2.Items.Count; i++)
                {
                    Label txtEPlan = (Label)Repeater2.Items[i].FindControl("txtEPlan");
                    Label txtEPlan1 = (Label)Repeater2.Items[i].FindControl("txtEPlan1");
                    Label txtEActual = (Label)Repeater2.Items[i].FindControl("txtEActual");
                    Label txtEActual1 = (Label)Repeater2.Items[i].FindControl("txtEActual1");
                    Label txtEVariance = (Label)Repeater2.Items[i].FindControl("txtEVariance");
                    Label txtEVariance1 = (Label)Repeater2.Items[i].FindControl("txtEVariance1");


                    SumEV = SumEV + Math.Round(Convert.ToDecimal(txtEPlan.Text), 0);
                    SumEP = SumEP + Math.Round(Convert.ToDecimal(txtEPlan1.Text), 0);
                    SumEAV = SumEAV + Math.Round(Convert.ToDecimal(txtEActual.Text), 0);
                    SumEAP = SumEAP + Math.Round(Convert.ToDecimal(txtEActual1.Text), 0);
                    SumEVV = SumEVV + Math.Round(Convert.ToDecimal(txtEVariance.Text), 0);
                    SumEVP = SumEVP + Math.Round(Convert.ToDecimal(txtEVariance1.Text), 0);


                    ViewState["SumEV"] = SumEV;
                    ViewState["SumEP"] = SumEP;
                    ViewState["SumEAV"] = SumEAV;
                    ViewState["SumEAP"] = SumEAP;
                    ViewState["SumEVV"] = SumEVV;
                    ViewState["SumEVP"] = SumEVP;
                }
                Label lblSumEValueA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEValueA");
                Label lblSumEParcentageA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEParcentageA");
                Label lblSumEActualValueA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEActualValueA");
                Label lblSumEActualValueParcentageA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEActualValueParcentageA");
                Label lblSumEeVarianceA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEeVarianceA");
                Label lblSumEVarianceParcentageA = (Label)Repeater2.Controls[Repeater2.Controls.Count - 1].Controls[0].FindControl("lblSumEVarianceParcentageA");

                lblSumEValueA.Text = ViewState["SumEV"].ToString();
                lblSumEParcentageA.Text = ViewState["SumEP"].ToString();
                lblSumEActualValueA.Text = ViewState["SumEAV"].ToString();
                lblSumEActualValueParcentageA.Text = ViewState["SumEAP"].ToString();
                lblSumEeVarianceA.Text = ViewState["SumEVV"].ToString();
                lblSumEVarianceParcentageA.Text = ViewState["SumEVP"].ToString();

                //3 Rep Sum
                for (int i = 0; i < Repeater3.Items.Count; i++)
                {
                    Label txtCPlan = (Label)Repeater3.Items[i].FindControl("txtCPlan");
                    Label txtCPlan1 = (Label)Repeater3.Items[i].FindControl("txtCPlan1");
                    Label txtCActual = (Label)Repeater3.Items[i].FindControl("txtCActual");
                    Label txtCActual1 = (Label)Repeater3.Items[i].FindControl("txtCActual1");
                    Label txtCVariance = (Label)Repeater3.Items[i].FindControl("txtCVariance");
                    Label txtCVariance1 = (Label)Repeater3.Items[i].FindControl("txtCVariance1");


                    SumCV = SumCV + Math.Round(Convert.ToDecimal(txtCPlan.Text), 0);
                    SumCP = SumCP + Math.Round(Convert.ToDecimal(txtCPlan1.Text), 0);
                    SumCAV = SumCAV + Math.Round(Convert.ToDecimal(txtCActual.Text), 0);
                    SumCAP = SumCAP + Math.Round(Convert.ToDecimal(txtCActual1.Text), 0);
                    SumCVV = SumCVV + Math.Round(Convert.ToDecimal(txtCVariance.Text), 0);
                    SumCVP = SumCVP + Math.Round(Convert.ToDecimal(txtCVariance1.Text), 0);


                    ViewState["SumCV"] = SumCV;
                    ViewState["SumCP"] = SumCP;
                    ViewState["SumCAV"] = SumCAV;
                    ViewState["SumCAP"] = SumCAP;
                    ViewState["SumCVV"] = SumCVV;
                    ViewState["SumCVP"] = SumCVP;
                }
                Label lblSumCValueA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCValueA");
                Label lblSumCParcentageA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCParcentageA");
                Label lblSumCActualValueA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCActualValueA");
                Label lblSumCActualValueParcentageA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCActualValueParcentageA");
                Label lblSumCeVarianceA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCeVarianceA");
                Label lblSumCVarianceParcentageA = (Label)Repeater3.Controls[Repeater3.Controls.Count - 1].Controls[0].FindControl("lblSumCVarianceParcentageA");

                lblSumCValueA.Text = ViewState["SumCV"].ToString();
                lblSumCParcentageA.Text = ViewState["SumCP"].ToString();
                lblSumCActualValueA.Text = ViewState["SumCAV"].ToString();
                lblSumCActualValueParcentageA.Text = ViewState["SumCAP"].ToString();
                lblSumCeVarianceA.Text = ViewState["SumCVV"].ToString();
                lblSumCVarianceParcentageA.Text = ViewState["SumCVP"].ToString();


            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetFormTotal()
        {
            try
            {
                decimal SumEV1 = 0, SumEP1 = 0, SumEAV1 = 0, SumEAP1 = 0, SumEVV1 = 0, SumEVP1 = 0;
                decimal SumCV1 = 0, SumCP1 = 0, SumCAV1 = 0, SumCAP1 = 0, SumCVV1 = 0, SumCVP1 = 0;
                decimal SumDV1 = 0, SumDP1 = 0, SumDAV1 = 0, SumDAP1 = 0, SumDVV1 = 0, SumDVP1 = 0;
                decimal SumHV1 = 0, SumHP1 = 0, SumHAV1 = 0, SumHAP1 = 0, SumHVV1 = 0, SumHVP1 = 0;
                decimal SumIDV1 = 0, SumIDP1 = 0, SumIDAV1 = 0, SumIDAP1 = 0, SumIDVV1 = 0, SumIDVP1 = 0;
                decimal T1 = 0, T2 = 0, T3 = 0, T4 = 0, T5 = 0, T6 = 0;

                ///FROM TOTAL
                for (int i = 0; i < RptExpenditure1.Items.Count; i++)
                {
                    Label txtEAPlan = (Label)RptExpenditure1.Items[i].FindControl("txtEAPlan");
                    Label txtEAPlan1 = (Label)RptExpenditure1.Items[i].FindControl("txtEAPlan1");
                    Label txtEAActual = (Label)RptExpenditure1.Items[i].FindControl("txtEAActual");
                    Label txtEAActual1 = (Label)RptExpenditure1.Items[i].FindControl("txtEAActual1");
                    Label txtEAVariance = (Label)RptExpenditure1.Items[i].FindControl("txtEAVariance");
                    Label txtEAVariance1 = (Label)RptExpenditure1.Items[i].FindControl("txtEAVariance1");


                    SumEV1 = SumEV1 + Math.Round(Convert.ToDecimal(txtEAPlan.Text), 0);
                    SumEP1 = SumEP1 + Math.Round(Convert.ToDecimal(txtEAPlan1.Text), 0);
                    SumEAV1 = SumEAV1 + Math.Round(Convert.ToDecimal(txtEAActual.Text), 0);
                    SumEAP1 = SumEAP1 + Math.Round(Convert.ToDecimal(txtEAActual1.Text), 0);
                    SumEVV1 = SumEVV1 + Math.Round(Convert.ToDecimal(txtEAVariance.Text), 0);
                    SumEVP1 = SumEVP1 + Math.Round(Convert.ToDecimal(txtEAVariance1.Text), 0);


                    ViewState["SumEV1"] = SumEV1;
                    ViewState["SumEP1"] = SumEP1;
                    ViewState["SumEAV1"] = SumEAV1;
                    ViewState["SumEAP1"] = SumEAP1;
                    ViewState["SumEVV1"] = SumEVV1;
                    ViewState["SumEVP1"] = SumEVP1;
                }


                ///fOR 2nD SUM
                for (int i = 0; i < RptCon1.Items.Count; i++)
                {
                    Label txtCAPlan = (Label)RptCon1.Items[i].FindControl("txtCAPlan");
                    Label txtCAPlan1 = (Label)RptCon1.Items[i].FindControl("txtCAPlan1");
                    Label txtCAActual = (Label)RptCon1.Items[i].FindControl("txtCAActual");
                    Label txtCAActual1 = (Label)RptCon1.Items[i].FindControl("txtCAActual1");
                    Label txtCAVariance = (Label)RptCon1.Items[i].FindControl("txtCAVariance");
                    Label txtCAVariance1 = (Label)RptCon1.Items[i].FindControl("txtCAVariance1");


                    SumCV1 = SumCV1 + Math.Round(Convert.ToDecimal(txtCAPlan.Text), 0);
                    SumCP1 = SumCP1 + Math.Round(Convert.ToDecimal(txtCAPlan1.Text), 0);
                    SumCAV1 = SumCAV1 + Math.Round(Convert.ToDecimal(txtCAActual.Text), 0);
                    SumCAP1 = SumCAP1 + Math.Round(Convert.ToDecimal(txtCAActual1.Text), 0);
                    SumCVV1 = SumCVV1 + Math.Round(Convert.ToDecimal(txtCAVariance.Text), 0);
                    SumCVP1 = SumCVP1 + Math.Round(Convert.ToDecimal(txtCAVariance1.Text), 0);


                    ViewState["SumCV1"] = SumCV1;
                    ViewState["SumCP1"] = SumCP1;
                    ViewState["SumCAV1"] = SumCAV1;
                    ViewState["SumCAP1"] = SumCAP1;
                    ViewState["SumCVV1"] = SumCVV1;
                    ViewState["SumCVP1"] = SumCVP1;

                }
                //  string T11 = ViewState["SumCV1"].ToString();


                //3 Rep Sum
                for (int i = 0; i < RptDirectExp1.Items.Count; i++)
                {
                    Label txtDAPlan = (Label)RptDirectExp1.Items[i].FindControl("txtDAPlan");
                    Label txtDAPlan1 = (Label)RptDirectExp1.Items[i].FindControl("txtDAPlan1");
                    Label txtDAActual = (Label)RptDirectExp1.Items[i].FindControl("txtDAActual");
                    Label txtDAActual1 = (Label)RptDirectExp1.Items[i].FindControl("txtDAActual1");
                    Label txtDAVariance = (Label)RptDirectExp1.Items[i].FindControl("txtDAVariance");
                    Label txtDAVariance1 = (Label)RptDirectExp1.Items[i].FindControl("txtDAVariance1");


                    SumDV1 = SumDV1 + Math.Round(Convert.ToDecimal(txtDAPlan.Text), 0);
                    SumDP1 = SumDP1 + Math.Round(Convert.ToDecimal(txtDAPlan1.Text), 0);
                    SumDAV1 = SumDAV1 + Math.Round(Convert.ToDecimal(txtDAActual.Text), 0);
                    SumDAP1 = SumDAP1 + Math.Round(Convert.ToDecimal(txtDAActual1.Text), 0);
                    SumDVV1 = SumDVV1 + Math.Round(Convert.ToDecimal(txtDAVariance.Text), 0);
                    SumDVP1 = SumDVP1 + Math.Round(Convert.ToDecimal(txtDAVariance1.Text), 0);


                    ViewState["SumDV1"] = SumDV1;
                    ViewState["SumDP1"] = SumDP1;
                    ViewState["SumDAV1"] = SumDAV1;
                    ViewState["SumDAP1"] = SumDAP1;
                    ViewState["SumDVV1"] = SumDVV1;
                    ViewState["SumDVP1"] = SumDVP1;
                }
                //4 Rep Sum
                for (int i = 0; i < RptHire1.Items.Count; i++)
                {
                    Label txtHAPlan = (Label)RptHire1.Items[i].FindControl("txtHAPlan");
                    Label txtHAPlan1 = (Label)RptHire1.Items[i].FindControl("txtHAPlan1");
                    Label txtHAActual = (Label)RptHire1.Items[i].FindControl("txtHAActual");
                    Label txtHAActual1 = (Label)RptHire1.Items[i].FindControl("txtHAActual1");
                    Label txtHAVariance = (Label)RptHire1.Items[i].FindControl("txtHAVariance");
                    Label txtHAVariance1 = (Label)RptHire1.Items[i].FindControl("txtHAVariance1");


                    SumDV1 = SumDV1 + Math.Round(Convert.ToDecimal(txtHAPlan.Text), 0);
                    SumDP1 = SumDP1 + Math.Round(Convert.ToDecimal(txtHAPlan1.Text), 0);
                    SumDAV1 = SumDAV1 + Math.Round(Convert.ToDecimal(txtHAActual.Text), 0);
                    SumDAP1 = SumDAP1 + Math.Round(Convert.ToDecimal(txtHAActual1.Text), 0);
                    SumDVV1 = SumDVV1 + Math.Round(Convert.ToDecimal(txtHAVariance.Text), 0);
                    SumDVP1 = SumDVP1 + Math.Round(Convert.ToDecimal(txtHAVariance1.Text), 0);

                    ViewState["SumHV1"] = SumHV1;
                    ViewState["SumHP1"] = SumHP1;
                    ViewState["SumHAV1"] = SumHAV1;
                    ViewState["SumHAP1"] = SumHAP1;
                    ViewState["SumHVV1"] = SumHVV1;
                    ViewState["SumHVP1"] = SumHVP1;
                }
                //5 Rep Sum
                for (int i = 0; i < RptIndirect1.Items.Count; i++)
                {
                    Label txtIDAPlan = (Label)RptIndirect1.Items[i].FindControl("txtIDAPlan");
                    Label txtIDAPlan1 = (Label)RptIndirect1.Items[i].FindControl("txtIDAPlan1");
                    Label txtIDAActual = (Label)RptIndirect1.Items[i].FindControl("txtIDAActual");
                    Label txtIDAActual1 = (Label)RptIndirect1.Items[i].FindControl("txtIDAActual1");
                    Label txtIDAVariance = (Label)RptIndirect1.Items[i].FindControl("txtIDAVariance");
                    Label txtIDAVariance1 = (Label)RptIndirect1.Items[i].FindControl("txtIDAVariance1");



                    SumIDV1 = SumIDV1 + Math.Round(Convert.ToDecimal(txtIDAPlan.Text), 0);
                    SumIDP1 = SumIDP1 + Math.Round(Convert.ToDecimal(txtIDAPlan1.Text), 0);
                    SumIDAV1 = SumIDAV1 + Math.Round(Convert.ToDecimal(txtIDAActual.Text), 0);
                    SumIDAP1 = SumIDAP1 + Math.Round(Convert.ToDecimal(txtIDAActual1.Text), 0);
                    SumIDVV1 = SumIDVV1 + Math.Round(Convert.ToDecimal(txtIDAVariance.Text), 0);
                    SumIDVP1 = SumIDVP1 + Math.Round(Convert.ToDecimal(txtIDAVariance1.Text), 0);

                    ViewState["SumIDV1"] = SumIDV1;
                    ViewState["SumIDP1"] = SumIDP1;
                    ViewState["SumIDAV1"] = SumIDAV1;
                    ViewState["SumIDAP1"] = SumIDAP1;
                    ViewState["SumIDVV1"] = SumIDVV1;
                    ViewState["SumIDVP1"] = SumIDVP1;
                }

                Label LabelIDVA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDVA");
                Label LabelIDPA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDPA");
                Label LabelIDAA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDAA");
                Label LabelIDAPA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDAPA");
                Label LabelIDVVA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDVVA");
                Label LabelIDVPA = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("LabelIDVPA");

                T1 = Convert.ToDecimal(ViewState["SumEV1"]) + Convert.ToDecimal(ViewState["SumCV1"]) + Convert.ToDecimal(ViewState["SumDV1"]) + Convert.ToDecimal(ViewState["SumHV1"]) + Convert.ToDecimal(ViewState["SumIDV1"]);
                T2 = Convert.ToDecimal(ViewState["SumEP1"]) + Convert.ToDecimal(ViewState["SumCP1"]) + Convert.ToDecimal(ViewState["SumDP1"]) + Convert.ToDecimal(ViewState["SumHP1"]) + Convert.ToDecimal(ViewState["SumIDP1"]);
                T3 = Convert.ToDecimal(ViewState["SumEAV1"]) + Convert.ToDecimal(ViewState["SumCAV1"]) + Convert.ToDecimal(ViewState["SumDAV1"]) + Convert.ToDecimal(ViewState["SumHAV1"]) + Convert.ToDecimal(ViewState["SumIDAV1"]);
                T4 = Convert.ToDecimal(ViewState["SumEAP1"]) + Convert.ToDecimal(ViewState["SumCAP1"]) + Convert.ToDecimal(ViewState["SumDAP1"]) + Convert.ToDecimal(ViewState["SumHAP1"]) + Convert.ToDecimal(ViewState["SumIDAP1"]);
                T5 = Convert.ToDecimal(ViewState["SumEVV1"]) + Convert.ToDecimal(ViewState["SumCVV1"]) + Convert.ToDecimal(ViewState["SumDVV1"]) + Convert.ToDecimal(ViewState["SumHVV1"]) + Convert.ToDecimal(ViewState["SumIDVV1"]);
                T6 = Convert.ToDecimal(ViewState["SumEVP1"]) + Convert.ToDecimal(ViewState["SumCVP1"]) + Convert.ToDecimal(ViewState["SumDVP1"]) + Convert.ToDecimal(ViewState["SumDVP1"]) + Convert.ToDecimal(ViewState["SumIDVP1"]);

                LabelIDVA.Text = T1.ToString();
                LabelIDPA.Text = T2.ToString();
                LabelIDAA.Text = T3.ToString();
                LabelIDAPA.Text = T4.ToString();
                LabelIDVVA.Text = T5.ToString();
                LabelIDVPA.Text = T6.ToString();
                ////////////proft and loss
                Label Label1 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label1");
                Label Label2 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label2");
                Label Label3 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label3");
                Label Label4 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label4");
                Label Label5 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label5");
                Label Label6 = (Label)RptIndirect1.Controls[RptIndirect1.Controls.Count - 1].Controls[0].FindControl("Label6");

                decimal ppt = Convert.ToDecimal(ViewState["SumIV"]) - T1;
                decimal ppt1 = Convert.ToDecimal(ViewState["SumIP"]) - T2;
                decimal ppt2 = Convert.ToDecimal(ViewState["SumIAV"]) - T3;
                decimal ppt3 = Convert.ToDecimal(ViewState["SumIAP"]) - T4;
                decimal ppt4 = Convert.ToDecimal(ViewState["SumIVV"]) - T5;
                decimal ppt5 = Convert.ToDecimal(ViewState["SumIVP"]) - T6;

                Label1.Text = ppt.ToString();
                Label2.Text = ppt1.ToString();
                Label3.Text = ppt2.ToString();
                Label4.Text = ppt3.ToString();
                Label5.Text = ppt4.ToString();
                Label6.Text = ppt5.ToString();
                //PREVIOUS MONTH
                decimal SumPEV1 = 0, SumPEP1 = 0, SumPEAV1 = 0, SumPEAP1 = 0, SumPEVV1 = 0, SumPEVP1 = 0;
                decimal SumPCV1 = 0, SumPCP1 = 0, SumPCAV1 = 0, SumPCAP1 = 0, SumPCVV1 = 0, SumPCVP1 = 0;
                decimal SumPDV1 = 0, SumPDP1 = 0, SumPDAV1 = 0, SumPDAP1 = 0, SumPDVV1 = 0, SumPDVP1 = 0;
                decimal SumPHV1 = 0, SumPHP1 = 0, SumPHAV1 = 0, SumPHAP1 = 0, SumPHVV1 = 0, SumPHVP1 = 0;
                decimal SumPIDV1 = 0, SumPIDP1 = 0, SumPIDAV1 = 0, SumPIDAP1 = 0, SumPIDVV1 = 0, SumPIDVP1 = 0;
                decimal TP1 = 0, TP2 = 0, TP3 = 0, TP4 = 0, TP5 = 0, TP6 = 0;

                ///PREVIOUS TOTAL
                for (int i = 0; i < RptExpenditure2.Items.Count; i++)
                {
                    Label txtEBPlan = (Label)RptExpenditure2.Items[i].FindControl("txtEBPlan");
                    Label txtEBPlan1 = (Label)RptExpenditure2.Items[i].FindControl("txtEBPlan1");
                    Label txtEBActual = (Label)RptExpenditure2.Items[i].FindControl("txtEBActual");
                    Label txtEBActual1 = (Label)RptExpenditure2.Items[i].FindControl("txtEBActual1");
                    Label txtEBVariance = (Label)RptExpenditure2.Items[i].FindControl("txtEBVariance");
                    Label txtEBVariance1 = (Label)RptExpenditure2.Items[i].FindControl("txtEBVariance1");


                    SumPEV1 = SumPEV1 + Math.Round(Convert.ToDecimal(txtEBPlan.Text), 0);
                    SumPEP1 = SumPEP1 + Math.Round(Convert.ToDecimal(txtEBPlan1.Text), 0);
                    SumPEAV1 = SumPEAV1 + Math.Round(Convert.ToDecimal(txtEBActual.Text), 0);
                    SumPEAP1 = SumPEAP1 + Math.Round(Convert.ToDecimal(txtEBActual1.Text), 0);
                    SumPEVV1 = SumPEVV1 + Math.Round(Convert.ToDecimal(txtEBVariance.Text), 0);
                    SumPEVP1 = SumPEVP1 + Math.Round(Convert.ToDecimal(txtEBVariance1.Text), 0);


                    ViewState["SumPEV1"] = SumPEV1;
                    ViewState["SumPEP1"] = SumPEP1;
                    ViewState["SumPEAV1"] = SumPEAV1;
                    ViewState["SumPEAP1"] = SumPEAP1;
                    ViewState["SumPEVV1"] = SumPEVV1;
                    ViewState["SumPEVP1"] = SumPEVP1;
                }


                ///fOR 2nD SUM
                for (int i = 0; i < RptCon2.Items.Count; i++)
                {
                    Label txtCBPlan = (Label)RptCon2.Items[i].FindControl("txtCBPlan");
                    Label txtCBPlan1 = (Label)RptCon2.Items[i].FindControl("txtCBPlan1");
                    Label txtCBActual = (Label)RptCon2.Items[i].FindControl("txtCBActual");
                    Label txtCBActual1 = (Label)RptCon2.Items[i].FindControl("txtCBActual1");
                    Label txtCBVariance = (Label)RptCon2.Items[i].FindControl("txtCBVariance");
                    Label txtCBVariance1 = (Label)RptCon2.Items[i].FindControl("txtCBVariance1");


                    SumPCV1 = SumPCV1 + Math.Round(Convert.ToDecimal(txtCBPlan.Text), 0);
                    SumPCP1 = SumPCP1 + Math.Round(Convert.ToDecimal(txtCBPlan1.Text), 0);
                    SumPCAV1 = SumPCAV1 + Math.Round(Convert.ToDecimal(txtCBActual.Text), 0);
                    SumPCAP1 = SumPCAP1 + Math.Round(Convert.ToDecimal(txtCBActual1.Text), 0);
                    SumPCVV1 = SumPCVV1 + Math.Round(Convert.ToDecimal(txtCBVariance.Text), 0);
                    SumPCVP1 = SumPCVP1 + Math.Round(Convert.ToDecimal(txtCBVariance1.Text), 0);


                    ViewState["SumPCV1"] = SumPCV1;
                    ViewState["SumPCP1"] = SumPCP1;
                    ViewState["SumPCAV1"] = SumPCAV1;
                    ViewState["SumPCAP1"] = SumPCAP1;
                    ViewState["SumPCVV1"] = SumPCVV1;
                    ViewState["SumPCVP1"] = SumPCVP1;

                }

                //3 Rep Sum
                for (int i = 0; i < RptDirectExp2.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptDirectExp2.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptDirectExp2.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptDirectExp2.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptDirectExp2.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptDirectExp2.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptDirectExp2.Items[i].FindControl("txtVariance1");


                    SumPDV1 = SumPDV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumPDP1 = SumPDP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumPDAV1 = SumPDAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumPDAP1 = SumPDAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumPDVV1 = SumPDVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumPDVP1 = SumPDVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumPDV1"] = SumPDV1;
                    ViewState["SumPDP1"] = SumPDP1;
                    ViewState["SumPDAV1"] = SumPDAV1;
                    ViewState["SumPDAP1"] = SumPDAP1;
                    ViewState["SumPDVV1"] = SumPDVV1;
                    ViewState["SumPDVP1"] = SumPDVP1;
                }
                //4 Rep Sum
                for (int i = 0; i < RptHire2.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptDirectExp2.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptDirectExp2.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptDirectExp2.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptDirectExp2.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptDirectExp2.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptDirectExp2.Items[i].FindControl("txtVariance1");



                    SumPHV1 = SumPHV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumPHP1 = SumPHP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumPHAV1 = SumPHAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumPHAP1 = SumPHAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumPHVV1 = SumPHVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumPHVP1 = SumPHVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumPHV1"] = SumPHV1;
                    ViewState["SumPHP1"] = SumPHP1;
                    ViewState["SumPHAV1"] = SumPHAV1;
                    ViewState["SumPHAP1"] = SumPHAP1;
                    ViewState["SumPHVV1"] = SumPHVV1;
                    ViewState["SumPHVP1"] = SumPHVP1;
                }
                //5 Rep Sum
                for (int i = 0; i < RptIndirect2.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptIndirect2.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptIndirect2.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptIndirect2.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptIndirect2.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptIndirect2.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptIndirect2.Items[i].FindControl("txtVariance1");



                    SumPIDV1 = SumPIDV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumPIDP1 = SumPIDP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumPIDAV1 = SumPIDAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumPIDAP1 = SumPIDAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumPIDVV1 = SumPIDVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumPIDVP1 = SumPIDVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);

                    ViewState["SumPIDV1"] = SumPIDV1;
                    ViewState["SumPIDP1"] = SumPIDP1;
                    ViewState["SumPIDAV1"] = SumPIDAV1;
                    ViewState["SumPIDAP1"] = SumPIDAP1;
                    ViewState["SumPIDVV1"] = SumPIDVV1;
                    ViewState["SumPIDVP1"] = SumPIDVP1;
                }

                Label LabelIDVB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDVA");
                Label LabelIDPB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDPA");
                Label LabelIDAB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDAA");
                Label LabelIDAPB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDAPA");
                Label LabelIDVVB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDVVA");
                Label LabelIDVPB = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("LabelIDVPA");

                TP1 = Convert.ToDecimal(ViewState["SumPEV1"]) + Convert.ToDecimal(ViewState["SumPCV1"]) + Convert.ToDecimal(ViewState["SumPDV1"]) + Convert.ToDecimal(ViewState["SumPHV1"]) + Convert.ToDecimal(ViewState["SumPIDV1"]);





                TP2 = Convert.ToDecimal(ViewState["SumPEP1"]) + Convert.ToDecimal(ViewState["SumPCP1"]) + Convert.ToDecimal(ViewState["SumPDP1"]) + Convert.ToDecimal(ViewState["SumPHP1"]) + Convert.ToDecimal(ViewState["SumPIDP1"]);
                TP3 = Convert.ToDecimal(ViewState["SumPEAV1"]) + Convert.ToDecimal(ViewState["SumPCAV1"]) + Convert.ToDecimal(ViewState["SumPDAV1"]) + Convert.ToDecimal(ViewState["SumPHAV1"]) + Convert.ToDecimal(ViewState["SumPIDAV1"]);
                TP4 = Convert.ToDecimal(ViewState["SumPEAP1"]) + Convert.ToDecimal(ViewState["SumPCAP1"]) + Convert.ToDecimal(ViewState["SumPDAP1"]) + Convert.ToDecimal(ViewState["SumPHAP1"]) + Convert.ToDecimal(ViewState["SumPIDAP1"]);
                TP5 = Convert.ToDecimal(ViewState["SumPEVV1"]) + Convert.ToDecimal(ViewState["SumPCVV1"]) + Convert.ToDecimal(ViewState["SumPDVV1"]) + Convert.ToDecimal(ViewState["SumPHVV1"]) + Convert.ToDecimal(ViewState["SumPIDVV1"]);
                TP6 = Convert.ToDecimal(ViewState["SumPEVP1"]) + Convert.ToDecimal(ViewState["SumPCVP1"]) + Convert.ToDecimal(ViewState["SumPDVP1"]) + Convert.ToDecimal(ViewState["SumPHVP1"]) + Convert.ToDecimal(ViewState["SumPIDVP1"]);

                LabelIDVB.Text = TP1.ToString();
                LabelIDPB.Text = TP2.ToString();
                LabelIDAB.Text = TP3.ToString();
                LabelIDAPB.Text = TP4.ToString();
                LabelIDVVB.Text = TP5.ToString();
                LabelIDVPB.Text = TP6.ToString();
                ////////////proft and loss
                Label Label7 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label1");
                Label Label8 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label2");
                Label Label9 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label3");
                Label Label10 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label4");
                Label Label11 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label5");
                Label Label12 = (Label)RptIndirect2.Controls[RptIndirect2.Controls.Count - 1].Controls[0].FindControl("Label6");

                decimal pppt = Convert.ToDecimal(ViewState["SumEV"]) - TP1;
                decimal pppt1 = Convert.ToDecimal(ViewState["SumEP"]) - TP2;
                decimal pppt2 = Convert.ToDecimal(ViewState["SumEAV"]) - TP3;
                decimal pppt3 = Convert.ToDecimal(ViewState["SumEAP"]) - TP4;
                decimal pppt4 = Convert.ToDecimal(ViewState["SumEVV"]) - TP5;
                decimal pppt5 = Convert.ToDecimal(ViewState["SumEVP"]) - TP6;

                Label7.Text = pppt.ToString();
                Label8.Text = pppt1.ToString();
                Label9.Text = pppt2.ToString();
                Label10.Text = pppt3.ToString();
                Label11.Text = pppt4.ToString();
                Label12.Text = pppt5.ToString();

                ///TO MONTH DATA
                ///
                decimal SumTEV1 = 0, SumTEP1 = 0, SumTEAV1 = 0, SumTEAP1 = 0, SumTEVV1 = 0, SumTEVP1 = 0;
                decimal SumTCV1 = 0, SumTCP1 = 0, SumTCAV1 = 0, SumTCAP1 = 0, SumTCVV1 = 0, SumTCVP1 = 0;
                decimal SumTDV1 = 0, SumTDP1 = 0, SumTDAV1 = 0, SumTDAP1 = 0, SumTDVV1 = 0, SumTDVP1 = 0;
                decimal SumTHV1 = 0, SumTHP1 = 0, SumTHAV1 = 0, SumTHAP1 = 0, SumTHVV1 = 0, SumTHVP1 = 0;
                decimal SumTIDV1 = 0, SumTIDP1 = 0, SumTIDAV1 = 0, SumTIDAP1 = 0, SumTIDVV1 = 0, SumTIDVP1 = 0;
                decimal TT1 = 0, TT2 = 0, TT3 = 0, TT4 = 0, TT5 = 0, TT6 = 0;

                for (int i = 0; i < RptExpenditure3.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptExpenditure3.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptExpenditure3.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptExpenditure3.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptExpenditure3.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptExpenditure3.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptExpenditure3.Items[i].FindControl("txtVariance1");

                    SumTEV1 = SumTEV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumTEP1 = SumTEP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumTEAV1 = SumTEAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumTEAP1 = SumTEAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumTEVV1 = SumTEVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumTEVP1 = SumTEVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumTEV1"] = SumTEV1;
                    ViewState["SumTEP1"] = SumTEP1;
                    ViewState["SumTEAV1"] = SumTEAV1;
                    ViewState["SumTEAP1"] = SumTEAP1;
                    ViewState["SumTEVV1"] = SumTEVV1;
                    ViewState["SumTEVP1"] = SumTEVP1;
                }


                ///fOR 2nD SUM
                for (int i = 0; i < RptCon3.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptCon3.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptCon3.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptCon3.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptCon3.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptCon3.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptCon3.Items[i].FindControl("txtVariance1");

                    SumTCV1 = SumTCV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumTCP1 = SumTCP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumTCAV1 = SumTCAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumTCAP1 = SumTCAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumTCVV1 = SumTCVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumTCVP1 = SumTCVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumTCV1"] = SumTCV1;
                    ViewState["SumTCP1"] = SumTCP1;
                    ViewState["SumTCAV1"] = SumTCAV1;
                    ViewState["SumTCAP1"] = SumTCAP1;
                    ViewState["SumTCVV1"] = SumTCVV1;
                    ViewState["SumTCVP1"] = SumTCVP1;
                }

                //3 Rep Sum
                for (int i = 0; i < RptDirectExp3.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptDirectExp3.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptDirectExp3.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptDirectExp3.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptDirectExp3.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptDirectExp3.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptDirectExp3.Items[i].FindControl("txtVariance1");


                    SumTDV1 = SumTDV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumTDP1 = SumTDP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumTDAV1 = SumTDAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumTDAP1 = SumTDAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumTDVV1 = SumTDVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumTDVP1 = SumTDVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumTDV1"] = SumTDV1;
                    ViewState["SumTDP1"] = SumTDP1;
                    ViewState["SumTDAV1"] = SumTDAV1;
                    ViewState["SumTDAP1"] = SumTDAP1;
                    ViewState["SumTDVV1"] = SumTDVV1;
                    ViewState["SumTDVP1"] = SumTDVP1;
                }
                //4 Rep Sum
                for (int i = 0; i < RptHire3.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptHire3.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptHire3.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptHire3.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptHire3.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptHire3.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptHire3.Items[i].FindControl("txtVariance1");



                    SumTHV1 = SumTHV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumTHP1 = SumTHP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumTHAV1 = SumTHAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumTHAP1 = SumTHAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumTHVV1 = SumTHVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumTHVP1 = SumTHVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);


                    ViewState["SumTHV1"] = SumTHV1;
                    ViewState["SumTHP1"] = SumTHP1;
                    ViewState["SumTHAV1"] = SumTHAV1;
                    ViewState["SumTHAP1"] = SumTHAP1;
                    ViewState["SumTHVV1"] = SumTHVV1;
                    ViewState["SumTHVP1"] = SumTHVP1;
                }
                //5 Rep Sum
                for (int i = 0; i < RptIndirect3.Items.Count; i++)
                {
                    Label txtPPlan = (Label)RptIndirect3.Items[i].FindControl("txtPPlan");
                    Label txtPPlan1 = (Label)RptIndirect3.Items[i].FindControl("txtPPlan1");
                    Label txtActual = (Label)RptIndirect3.Items[i].FindControl("txtActual");
                    Label txtActual1 = (Label)RptIndirect3.Items[i].FindControl("txtActual1");
                    Label txtVariance = (Label)RptIndirect3.Items[i].FindControl("txtVariance");
                    Label txtVariance1 = (Label)RptIndirect3.Items[i].FindControl("txtVariance1");



                    SumTIDV1 = SumTIDV1 + Math.Round(Convert.ToDecimal(txtPPlan.Text), 0);
                    SumTIDP1 = SumTIDP1 + Math.Round(Convert.ToDecimal(txtPPlan1.Text), 0);
                    SumTIDAV1 = SumTIDAV1 + Math.Round(Convert.ToDecimal(txtActual.Text), 0);
                    SumTIDAP1 = SumTIDAP1 + Math.Round(Convert.ToDecimal(txtActual1.Text), 0);
                    SumTIDVV1 = SumTIDVV1 + Math.Round(Convert.ToDecimal(txtVariance.Text), 0);
                    SumTIDVP1 = SumTIDVP1 + Math.Round(Convert.ToDecimal(txtVariance1.Text), 0);

                    ViewState["SumTIDV1"] = SumTIDV1;
                    ViewState["SumTIDP1"] = SumTIDP1;
                    ViewState["SumTIDAV1"] = SumTIDAV1;
                    ViewState["SumTIDAP1"] = SumTIDAP1;
                    ViewState["SumTIDVV1"] = SumTIDVV1;
                    ViewState["SumTIDVP1"] = SumTIDVP1;
                }

                Label LabelIDVC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDVA");
                Label LabelIDPC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDPA");
                Label LabelIDAC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDAA");
                Label LabelIDAPC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDAPA");
                Label LabelIDVVC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDVVA");
                Label LabelIDVPC = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("LabelIDVPA");


                TT1 = Convert.ToDecimal(ViewState["SumTEV1"]) + Convert.ToDecimal(ViewState["SumTCV1"]) + Convert.ToDecimal(ViewState["SumTDV1"]) + Convert.ToDecimal(ViewState["SumTHV1"]) + Convert.ToDecimal(ViewState["SumTIDV1"]);
                TT2 = Convert.ToDecimal(ViewState["SumTEP1"]) + Convert.ToDecimal(ViewState["SumTCP1"]) + Convert.ToDecimal(ViewState["SumTDP1"]) + Convert.ToDecimal(ViewState["SumTHP1"]) + Convert.ToDecimal(ViewState["SumTIDP1"]);
                TT3 = Convert.ToDecimal(ViewState["SumTEAV1"]) + Convert.ToDecimal(ViewState["SumTCAV1"]) + Convert.ToDecimal(ViewState["SumTDAV1"]) + Convert.ToDecimal(ViewState["SumTHAV1"]) + Convert.ToDecimal(ViewState["SumTIDAV1"]);
                TT4 = Convert.ToDecimal(ViewState["SumTEAP1"]) + Convert.ToDecimal(ViewState["SumTCAP1"]) + Convert.ToDecimal(ViewState["SumTDAP1"]) + Convert.ToDecimal(ViewState["SumTHAP1"]) + Convert.ToDecimal(ViewState["SumTIDAP1"]);
                TT5 = Convert.ToDecimal(ViewState["SumTEVV1"]) + Convert.ToDecimal(ViewState["SumTCVV1"]) + Convert.ToDecimal(ViewState["SumTDVV1"]) + Convert.ToDecimal(ViewState["SumTHVV1"]) + Convert.ToDecimal(ViewState["SumTIDVV1"]);
                TT6 = Convert.ToDecimal(ViewState["SumTEVP1"]) + Convert.ToDecimal(ViewState["SumTCVP1"]) + Convert.ToDecimal(ViewState["SumTDVP1"]) + Convert.ToDecimal(ViewState["SumTHVP1"]) + Convert.ToDecimal(ViewState["SumTIDVP1"]);

                LabelIDVC.Text = TT1.ToString();
                LabelIDPC.Text = TT2.ToString();
                LabelIDAC.Text = TT3.ToString();
                LabelIDAPC.Text = TT4.ToString();
                LabelIDVVC.Text = TT5.ToString();
                LabelIDVPC.Text = TT6.ToString();
                ////////////proft and loss
                Label Label13 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label1");
                Label Label14 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label2");
                Label Label15 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label3");
                Label Label16 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label4");
                Label Label17 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label5");
                Label Label18 = (Label)RptIndirect3.Controls[RptIndirect3.Controls.Count - 1].Controls[0].FindControl("Label6");

                decimal ppppt = Convert.ToDecimal(ViewState["SumCV"]) - TT1;
                decimal ppppt1 = Convert.ToDecimal(ViewState["SumCP"]) - TT2;
                decimal ppppt2 = Convert.ToDecimal(ViewState["SumCAV"]) - TT3;
                decimal ppppt3 = Convert.ToDecimal(ViewState["SumCAP"]) - TT4;
                decimal ppppt4 = Convert.ToDecimal(ViewState["SumCVV"]) - TT5;
                decimal ppppt5 = Convert.ToDecimal(ViewState["SumCVP"]) - TT6;

                Label13.Text = ppppt.ToString();
                Label14.Text = ppppt1.ToString();
                Label15.Text = ppppt2.ToString();
                Label16.Text = ppppt3.ToString();
                Label17.Text = ppppt4.ToString();
                Label18.Text = ppppt5.ToString();





            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

    }
}
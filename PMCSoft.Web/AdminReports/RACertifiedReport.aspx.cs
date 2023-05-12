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
namespace PMCSoft.Web.AdminReports
{
    public partial class RACertifiedReport : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        string AListID = string.Empty;

        DataTable DT = new DataTable();
        string ItemID = "";
        protected void Page_Load(object sender, EventArgs e)
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
                    BindProject(); ;
                    //GridBind();

                }
            }
        }
        public void BindProject()
        {
            try
            {
                PMC.BindGetProjectForAdmin(ddlProject);
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GridBind()
        {
            Panel1.Visible = true;
            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetSubmitteddata");
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                GridView Gvcertified = e.Item.FindControl("Gvcertified") as GridView;
                HiddenField hdnTransID = e.Item.FindControl("hdnTransID") as HiddenField;
                Hashtable ht = new Hashtable();
                ht.Add("@RaBillTransId", hdnTransID.Value);
                DataTable dt = PMCApp.Get(ht, "GetCertifieddata");
                Gvcertified.DataSource = dt;
                Gvcertified.DataBind();

            }

        }
        public void cal()
        {
            try
            {
                decimal Sumbillamt = 0, Sumbillcertifiedamt = 0, Sumservicetax = 0, SumServicetaxonfoc = 0, SumMobilizationAdvanceReceived = 0, SumSecuredAdvanceReceived = 0;
                decimal Sumbilltotal = 0, SumTds = 0, SumRetentionMoneyDeducted = 0, Sumwct = 0, SumMobilizationAdvanceDeducted = 0, SumSecuredAdvanceAdjusted = 0, SumOtherDeduction = 0;
                decimal SumOtherDeduction1 = 0, SumOtherDeduction2 = 0, SumOtherDeduction3 = 0, SumOtherDeduction4 = 0;
                decimal SumTotalDeduction = 0, SumReceivable = 0, SumAmtReceivable = 0, SumNetReceivable = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label BillAmtRABill = (Label)Repeater1.Items[i].FindControl("BillAmtRABill");
                    Label BillAmount = (Label)Repeater1.Items[i].FindControl("BillAmount");
                    Label ServiceTex = (Label)Repeater1.Items[i].FindControl("ServiceTex");
                    Label ServiceTexonFoc = (Label)Repeater1.Items[i].FindControl("ServiceTexonFoc");
                    Label MobilizationAdvancereceived = (Label)Repeater1.Items[i].FindControl("MobilizationAdvancereceived");
                    Label SecuredAdvancereceived = (Label)Repeater1.Items[i].FindControl("SecuredAdvancereceived");
                    Label Total = (Label)Repeater1.Items[i].FindControl("Total");
                    Label tds = (Label)Repeater1.Items[i].FindControl("tds");
                    Label RetentionMoneyDeductd = (Label)Repeater1.Items[i].FindControl("RetentionMoneyDeductd");
                    Label WCT = (Label)Repeater1.Items[i].FindControl("WCT");
                    Label MobilizationAdvanceDeducted = (Label)Repeater1.Items[i].FindControl("MobilizationAdvanceDeducted");
                    Label SecuredAdvanceAdjusted = (Label)Repeater1.Items[i].FindControl("SecuredAdvanceAdjusted");
                    Label OtherDeduction = (Label)Repeater1.Items[i].FindControl("OtherDeduction");

                    Label TotalDeduction = (Label)Repeater1.Items[i].FindControl("TotalDeduction");
                    Label Receivable = (Label)Repeater1.Items[i].FindControl("Receivable");
                    Label lblamtreceived = (Label)Repeater1.Items[i].FindControl("lblamtreceived");
                    //  Label lblNetReceivable = (Label)Repeater1.Items[i].FindControl("lblNetReceivable");
                    Label NetReceivable = (Label)Repeater1.Items[i].FindControl("NetReceivable");



                    if (BillAmtRABill.Text != "")
                    {
                        BillAmtRABill.Text = BillAmtRABill.Text;
                    }
                    else
                    {
                        BillAmtRABill.Text = "0";
                    }

                    if (BillAmount.Text != "")
                    {
                        BillAmount.Text = BillAmount.Text;
                    }
                    else
                    {
                        BillAmount.Text = "0";
                    }
                    if (ServiceTex.Text != "")
                    {
                        ServiceTex.Text = ServiceTex.Text;
                    }
                    else
                    {
                        ServiceTex.Text = "0";
                    }
                    if (ServiceTexonFoc.Text != "")
                    {
                        ServiceTexonFoc.Text = ServiceTexonFoc.Text;
                    }
                    else
                    {
                        ServiceTexonFoc.Text = "0";
                    }
                    if (MobilizationAdvancereceived.Text != "")
                    {
                        MobilizationAdvancereceived.Text = MobilizationAdvancereceived.Text;
                    }
                    else
                    {
                        MobilizationAdvancereceived.Text = "0";
                    }
                    if (SecuredAdvancereceived.Text != "")
                    {
                        SecuredAdvancereceived.Text = SecuredAdvancereceived.Text;
                    }
                    else
                    {
                        SecuredAdvancereceived.Text = "0";
                    }
                    if (Total.Text != "")
                    {
                        Total.Text = Total.Text;
                    }
                    else
                    {
                        Total.Text = "0";
                    }
                    if (tds.Text != "")
                    {
                        tds.Text = tds.Text;
                    }
                    else
                    {
                        tds.Text = "0";
                    }
                    if (RetentionMoneyDeductd.Text != "")
                    {
                        RetentionMoneyDeductd.Text = RetentionMoneyDeductd.Text;
                    }
                    else
                    {
                        RetentionMoneyDeductd.Text = "0";
                    }
                    if (WCT.Text != "")
                    {
                        WCT.Text = WCT.Text;
                    }
                    else
                    {
                        WCT.Text = "0";
                    }
                    if (MobilizationAdvanceDeducted.Text != "")
                    {
                        MobilizationAdvanceDeducted.Text = MobilizationAdvanceDeducted.Text;
                    }
                    else
                    {
                        MobilizationAdvanceDeducted.Text = "0";
                    }
                    if (SecuredAdvanceAdjusted.Text != "")
                    {
                        SecuredAdvanceAdjusted.Text = SecuredAdvanceAdjusted.Text;
                    }
                    else
                    {
                        SecuredAdvanceAdjusted.Text = "0";
                    }
                    if (OtherDeduction.Text != "")
                    {
                        OtherDeduction.Text = OtherDeduction.Text;
                    }
                    else
                    {
                        OtherDeduction.Text = "0";
                    }

                    if (TotalDeduction.Text != "")
                    {
                        TotalDeduction.Text = TotalDeduction.Text;
                    }
                    else
                    {
                        TotalDeduction.Text = "0";
                    }
                    if (Receivable.Text != "")
                    {
                        Receivable.Text = Receivable.Text;
                    }
                    else
                    {
                        Receivable.Text = "0";
                    }
                    if (NetReceivable.Text != "")
                    {
                        NetReceivable.Text = NetReceivable.Text;
                    }
                    else
                    {
                        NetReceivable.Text = "0";
                    }

                    Sumbillamt = Sumbillamt + Math.Round(Convert.ToDecimal(BillAmtRABill.Text), 0);

                    Sumbillcertifiedamt = Sumbillcertifiedamt + Math.Round(Convert.ToDecimal(BillAmount.Text), 0);
                    Sumservicetax = Sumservicetax + Math.Round(Convert.ToDecimal(ServiceTex.Text), 0);
                    SumServicetaxonfoc = SumServicetaxonfoc + Math.Round(Convert.ToDecimal(ServiceTexonFoc.Text), 0);
                    SumMobilizationAdvanceReceived = SumMobilizationAdvanceReceived + Math.Round(Convert.ToDecimal(MobilizationAdvancereceived.Text), 0);

                    SumSecuredAdvanceReceived = SumSecuredAdvanceReceived + Math.Round(Convert.ToDecimal(SecuredAdvancereceived.Text), 0);
                    Sumbilltotal = Sumbilltotal + Math.Round(Convert.ToDecimal(Total.Text), 0);
                    SumTds = SumTds + Math.Round(Convert.ToDecimal(tds.Text), 0);
                    SumRetentionMoneyDeducted = SumRetentionMoneyDeducted + Math.Round(Convert.ToDecimal(RetentionMoneyDeductd.Text), 0);

                    Sumwct = Sumwct + Math.Round(Convert.ToDecimal(WCT.Text), 0);
                    SumMobilizationAdvanceDeducted = SumMobilizationAdvanceDeducted + Math.Round(Convert.ToDecimal(MobilizationAdvanceDeducted.Text), 0);

                    SumSecuredAdvanceAdjusted = SumSecuredAdvanceAdjusted + Math.Round(Convert.ToDecimal(SecuredAdvanceAdjusted.Text), 0);
                    SumOtherDeduction = SumOtherDeduction + Math.Round(Convert.ToDecimal(OtherDeduction.Text), 0);

                    SumTotalDeduction = SumTotalDeduction + Math.Round(Convert.ToDecimal(TotalDeduction.Text), 0);
                    SumReceivable = SumReceivable + Math.Round(Convert.ToDecimal(Receivable.Text), 0);

                    GridView Gvcertified = (GridView)Repeater1.Items[i].FindControl("Gvcertified");
                    for (int j = 0; j < Gvcertified.Rows.Count; j++)
                    {
                        Label AmountReceived = (Label)Gvcertified.Rows[j].FindControl("AmountReceived");
                        SumAmtReceivable = SumAmtReceivable + Math.Round(Convert.ToDecimal(AmountReceived.Text), 0);
                        ViewState["SumAmtReceivable"] = SumAmtReceivable;
                    }
                    SumNetReceivable = SumNetReceivable + Math.Round(Convert.ToDecimal(NetReceivable.Text), 0);
                    ViewState["Sumbillamt"] = Sumbillamt;
                    ViewState["Sumbillcertifiedamt"] = Sumbillcertifiedamt;
                    ViewState["Sumservicetax"] = Sumservicetax;
                    ViewState["SumServicetaxonfoc"] = SumServicetaxonfoc;
                    ViewState["SumMobilizationAdvanceReceived"] = SumMobilizationAdvanceReceived;
                    ViewState["SumSecuredAdvanceReceived"] = SumSecuredAdvanceReceived;
                    ViewState["Sumbilltotal"] = Sumbilltotal;

                    ViewState["SumTds"] = SumTds;
                    ViewState["SumRetentionMoneyDeducted"] = SumRetentionMoneyDeducted;
                    ViewState["Sumwct"] = Sumwct;
                    ViewState["SumMobilizationAdvanceDeducted"] = SumMobilizationAdvanceDeducted;
                    ViewState["SumSecuredAdvanceAdjusted"] = SumSecuredAdvanceAdjusted;
                    ViewState["SumOtherDeduction"] = SumOtherDeduction;
                    ViewState["SumOtherDeduction1"] = SumOtherDeduction1;
                    ViewState["SumOtherDeduction2"] = SumOtherDeduction2;
                    ViewState["SumOtherDeduction3"] = SumOtherDeduction3;
                    ViewState["SumOtherDeduction4"] = SumOtherDeduction4;
                    ViewState["SumTotalDeduction"] = SumTotalDeduction;
                    ViewState["SumReceivable"] = SumReceivable;
                    ViewState["SumAmtReceivable"] = SumAmtReceivable;
                    ViewState["SumNetReceivable"] = SumNetReceivable;


                }
                Label LblBillSubmittedamt = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("LblBillSubmittedamt");
                Label lblbillcertifiedamt = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblbillcertifiedamt");
                Label lblServiceTax = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblServiceTax");
                Label lblServiceTaxonFoc = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblServiceTaxonFoc");
                Label lblmobilizationAdvanceReceived = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblmobilizationAdvanceReceived");

                Label lblSecuredAdvanceReceived = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSecuredAdvanceReceived");
                Label lbltotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lbltotal");
                Label lbltds = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lbltds");
                Label lblReturntionmoneyDeduced = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblReturntionmoneyDeduced");
                Label lblwct = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblwct");
                Label lblMobilizationAdvanceDeducted = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblMobilizationAdvanceDeducted");
                Label lblSecuredAdvanceAdjust = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSecuredAdvanceAdjust");
                Label lblotherduction = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblotherduction");

                Label lblTotalduction = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTotalduction");
                Label lblreceivable = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblreceivable");
                Label lblamtreceived1 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblamtreceived");
                GridView Gvcertified1 = (GridView)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Gvcertified");
                Label lblNetReceivable = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblNetReceivable");

                LblBillSubmittedamt.Text = ViewState["Sumbillamt"].ToString();
                lblbillcertifiedamt.Text = ViewState["Sumbillcertifiedamt"].ToString();
                lblServiceTax.Text = ViewState["Sumservicetax"].ToString();
                lblServiceTaxonFoc.Text = ViewState["SumServicetaxonfoc"].ToString();
                lblmobilizationAdvanceReceived.Text = ViewState["SumMobilizationAdvanceReceived"].ToString();

                lblSecuredAdvanceReceived.Text = ViewState["SumSecuredAdvanceReceived"].ToString();
                lbltotal.Text = ViewState["Sumbilltotal"].ToString();
                lbltds.Text = ViewState["SumTds"].ToString();
                lblReturntionmoneyDeduced.Text = ViewState["SumRetentionMoneyDeducted"].ToString();

                lblwct.Text = ViewState["Sumwct"].ToString();
                lblMobilizationAdvanceDeducted.Text = ViewState["SumMobilizationAdvanceDeducted"].ToString();
                lblSecuredAdvanceAdjust.Text = ViewState["SumSecuredAdvanceAdjusted"].ToString();

                lblotherduction.Text = ViewState["SumOtherDeduction"].ToString();

                lblTotalduction.Text = ViewState["SumTotalDeduction"].ToString();
                lblreceivable.Text = ViewState["SumReceivable"].ToString();
                lblamtreceived1.Text = ViewState["SumAmtReceivable"].ToString();
                lblNetReceivable.Text = ViewState["SumNetReceivable"].ToString();
                ViewState["Sum"] = 1;



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
                if (ddlProject.SelectedValue != "-1")
                {
                    Panel1.Visible = true;
                    Hashtable ht = new Hashtable();
                    ht.Add("@ProjectId", ddlProject.SelectedValue);
                    DataTable DT = PMCApp.Get(ht, "GetSubmitteddata");


                    if (DT.Rows.Count > 0)
                    {


                        Repeater1.DataSource = DT;
                        Repeater1.DataBind();
                        cal();
                        btnPrint.Visible = true;
                    }
                    else
                    {


                        Repeater1.DataSource = DT;
                        Repeater1.DataBind();

                        string scripts = "alert('No record found. ');";
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

        protected void btnPrint_Click(object sender, EventArgs e)
        {

            string strURL = "PrintRACertifiedReport.aspx?";
            if (HttpContext.Current != null)
            {
                string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strProjName={1}",
                    ddlProject.SelectedValue.ToString(), ddlProject.SelectedItem.Text));

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
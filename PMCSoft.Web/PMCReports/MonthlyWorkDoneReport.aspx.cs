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
public partial class PMCReports_MonthlyWorkDoneReport : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
    DataTable DT = new DataTable();
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
        for (int i = 2014; i <= 2018; i++)
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
    protected void BtnReport_Click(object sender, EventArgs e)
    {

        RBindA();
    }
    public void RBindA()
    {
        Hashtable ht = new Hashtable();
        ht.Add("@ProjectId", ddlProject.SelectedValue);
        ht.Add("@PlanMonth", ddlMonth.SelectedValue);
        ht.Add("@PlanYear", ddlSDaysYear.SelectedValue);


        DataTable dt = PMCApp.Get(ht, "GetWDMActualReport");



        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        else
        {
            string scripts = "alert('No Record Found .');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label Label1 = e.Item.FindControl("Label1") as Label;
            Hashtable htR1 = new Hashtable();

            DataTable dtR1 = PMCApp.Get(htR1, "GetWDM");

            Repeater RptSub = e.Item.FindControl("RptSub") as Repeater;


            Hashtable ht = new Hashtable();
            ht.Add("@WDId", Label1.Text);
            DataTable dt = PMCApp.Get(ht, "GetWDD");

            if (dt.Rows.Count > 0)
            {
                RptSub.DataSource = dt;
                RptSub.DataBind();

              
            }





        }
        if (e.Item.ItemType == ListItemType.Footer)
        {
            SumValue();
         
            Label lbl = (Label)e.Item.FindControl("Label2220");
            Label Label22 = (Label)e.Item.FindControl("Label22");
            Label Label24 = (Label)e.Item.FindControl("Label24");
            Label Label26 = (Label)e.Item.FindControl("Label26");
            Label Label28 = (Label)e.Item.FindControl("Label28");
            Label Label30 = (Label)e.Item.FindControl("Label30");
            Label Label31 = (Label)e.Item.FindControl("Label31");
            Label Label32 = (Label)e.Item.FindControl("Label32");
            
            Label22.Text =ViewState["SumIAV"].ToString();
           Label24.Text= ViewState["SumIVV"].ToString();
             Label26.Text  = ViewState["SumEV"].ToString();
                Label28.Text  =  ViewState["SumEAV"].ToString();
                 Label30.Text   =    ViewState["SumEVV"].ToString();
                 Label31.Text = ViewState["SumEVP"].ToString();
                   Label32.Text  =   ViewState["SumCV"].ToString();
           
        }
    }
    protected void RptSub_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label LabelLblsub = e.Item.FindControl("LabelLblsub") as Label;

            Repeater RptSubDetail = e.Item.FindControl("RptSubDetail") as Repeater;

            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            ht.Add("@PlanMonth", ddlMonth.SelectedValue);
            ht.Add("@PlanYear", ddlSDaysYear.SelectedValue);
            ht.Add("@WDDMParticularId", LabelLblsub.Text);
            DataTable dt1 = PMCApp.Get(ht, "GetMonthlyWorkDoneReport");

            if (dt1.Rows.Count > 0)
            {
                RptSubDetail.DataSource = dt1;
                RptSubDetail.DataBind();
             
            }


        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        string strURL = "PrintMonthyWorkDoneReport.aspx?";
        if (HttpContext.Current != null)
        {
            string strURLWithData = strURL + EncryptQueryString(string.Format("strPRJID={0}&strProjName={1}&strFrommonth={2}&strFromYear={3}",
                ddlProject.SelectedValue.ToString(), ddlProject.SelectedItem.Text, ddlMonth.SelectedValue.ToString(), ddlSDaysYear.SelectedValue.ToString()));

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


    public void SumValue()
    {
        decimal SumIV = 0, SumIP = 0, SumIAV = 0, SumIAP = 0, SumIVV = 0, SumIVP = 0;
        decimal SumEV = 0, SumEP = 0, SumEAV = 0, SumEAP = 0, SumEVV = 0, SumEVP = 0;
        decimal SumCV = 0, SumCP = 0, SumCAV = 0, SumCAP = 0, SumCVV = 0, SumCVP = 0;

        for (int j = 0; j < Repeater1.Items.Count; j++)
        {

            Label Label1 = (Label)Repeater1.Items[j].FindControl("Label1");
        
            Repeater RptSub = (Repeater)Repeater1.Items[j].FindControl("RptSub");

            for (int k = 0; k < RptSub.Items.Count; k++)
            {
                Repeater RptSubDetail = (Repeater)RptSub.Items[k].FindControl("RptSubDetail");
                
                    for (int l = 0; l < RptSubDetail.Items.Count; l++)
                    {
                        Label txtUnit = (Label)RptSubDetail.Items[l].FindControl("txtUnit");
                        Label txtRate = (Label)RptSubDetail.Items[l].FindControl("txtRate");
                        Label txtAwardedValue = (Label)RptSubDetail.Items[l].FindControl("txtAwardedValue");
                        Label txtQty = (Label)RptSubDetail.Items[l].FindControl("txtQty");
                        Label txtAmt = (Label)RptSubDetail.Items[l].FindControl("txtAmt");
                        Label Label11 = (Label)RptSubDetail.Items[l].FindControl("Label11");
                        Label Label12 = (Label)RptSubDetail.Items[l].FindControl("Label12");
                        Label Label13 = (Label)RptSubDetail.Items[l].FindControl("Label13");
                        Label Label14 = (Label)RptSubDetail.Items[l].FindControl("Label14");
                        Label Label15 = (Label)RptSubDetail.Items[l].FindControl("Label15");
                        Label Label16 = (Label)RptSubDetail.Items[l].FindControl("Label16");
                        Label Label17 = (Label)RptSubDetail.Items[l].FindControl("Label17");
                        Label Label18 = (Label)RptSubDetail.Items[l].FindControl("Label18");
                        Label Label19 = (Label)RptSubDetail.Items[l].FindControl("Label19");

                        if (txtUnit.Text == "")
                        {
                            txtUnit.Text = "0.00";
                        }
                        else
                        {
                            txtUnit.Text = txtUnit.Text;
                        }
                        if (txtRate.Text == "")
                        {
                            txtRate.Text = "0.00";
                        }
                        else
                        {
                            txtRate.Text = txtRate.Text;
                        }
                        if (txtAwardedValue.Text == null)
                        {
                            txtAwardedValue.Text = "0.00";
                        }
                        else
                        {
                            txtAwardedValue.Text = txtAwardedValue.Text;
                        }
                        if (txtQty.Text =="")
                        {
                            txtQty.Text = "0.00";
                        }
                        else
                        {
                            txtQty.Text = txtQty.Text;
                        }
                        if (txtRate.Text == "")
                        {
                            txtRate.Text = "0.00";
                        }
                        else
                        {
                            txtRate.Text = txtRate.Text;
                        }
                        if (txtAmt.Text == "")
                        {
                            txtAmt.Text = "0.00";
                        }
                        else
                        {
                            txtAmt.Text = txtAmt.Text;
                        }
                        if (Label11.Text == "")
                        {
                            Label11.Text = "0.00";
                        }
                        else
                        {
                            Label11.Text = Label11.Text;
                        }
                        if (Label12.Text == "")
                        {
                            Label12.Text = "0.00";
                        }
                        else
                        {
                            Label12.Text = Label12.Text;
                        }
                        if (Label13.Text == "")
                        {
                            Label13.Text = "0.00";
                        }
                        else
                        {
                            Label13.Text = Label13.Text;
                        }
                        if (Label14.Text == "")
                        {
                            Label14.Text = "0.00";
                        }
                        else
                        {
                            Label14.Text = Label14.Text;
                        }
                        if (Label15.Text == "")
                        {
                            Label15.Text = "0.00";
                        }
                        else
                        {
                            Label15.Text = Label15.Text;
                        }
                        if (Label16.Text == "")
                        {
                            Label16.Text = "0.00";
                        }
                        else
                        {
                            Label16.Text = Label16.Text;
                        }
                        if (Label17.Text == "")
                        {
                            Label17.Text = "0.00";
                        }
                        else
                        {
                            Label17.Text = Label17.Text;
                        }
                        if (Label18.Text == "")
                        {
                            Label18.Text = "0.00";
                        }
                        else
                        {
                            Label18.Text = Label18.Text;
                        }
                        if (Label19.Text == "")
                        {
                            Label19.Text = "0.00";
                        }
                        else
                        {
                            Label19.Text = Label19.Text;
                        }
                       
                       
                        SumIV = SumIV + Math.Round(Convert.ToDecimal(txtUnit.Text), 0);
                        SumIP = SumIP + Math.Round(Convert.ToDecimal(txtRate.Text), 0);
                        SumIAV = SumIAV + Math.Round(Convert.ToDecimal(txtAwardedValue.Text), 0);
                        SumIAP = SumIAP + Math.Round(Convert.ToDecimal(txtQty.Text), 0);
                        SumIVV = SumIVV + Math.Round(Convert.ToDecimal(txtAmt.Text), 0);
                        SumIVP = SumIVP + Math.Round(Convert.ToDecimal(Label11.Text), 0);
                        SumEV = SumEV + Math.Round(Convert.ToDecimal(Label12.Text), 0);
                        SumEP = SumEP + Math.Round(Convert.ToDecimal(Label13.Text), 0);
                        SumEAV = SumEAV + Math.Round(Convert.ToDecimal(Label14.Text), 0);
                        SumEAP = SumEAP + Math.Round(Convert.ToDecimal(Label15.Text), 0);
                        SumEVV = SumEVV + Math.Round(Convert.ToDecimal(Label16.Text), 0);
                        SumEVP = SumEVP + Math.Round(Convert.ToDecimal(Label17.Text), 0);
                        SumCV = SumCV + Math.Round(Convert.ToDecimal(Label18.Text), 0);
                        SumCP = SumCP + Math.Round(Convert.ToDecimal(Label19.Text), 0);

                        ViewState["SumIV"] = SumIV;
                        ViewState["SumIP"] = SumIP;
                        ViewState["SumIAV"] = SumIAV;
                        ViewState["SumIAP"] = SumIAP;
                        ViewState["SumIVV"] = SumIVV;
                        ViewState["SumIVP"] = SumIVP;
                        ViewState["SumEV"] = SumEV;
                        ViewState["SumEP"] = SumEP;
                        ViewState["SumEAV"] = SumEAV;
                        ViewState["SumEAP"] = SumEAP;
                        ViewState["SumEVV"] = SumEVV;
                        ViewState["SumEVP"] = SumEVP;
                        ViewState["SumCV"] = SumCV;
                        ViewState["SumCP"] = SumCP;
                        
                       
                   
                    
                    
                }
                //Label Label20 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label20");
                //Label Label21 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label21");
                //Label Label22 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label22");
                //Label Label23 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label23");
                //Label Label24 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label24");
                //Label Label25 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label25");
                //Label Label26 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label26");
                //Label Label27 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label27");
                //Label Label28 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label28");
                //Label Label29 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label29");
                //Label Label30 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label30");
                //Label Label31 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label31");
                //Label Label32 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label32");
                //Label20.Text = ViewState["SumIV"].ToString();
            }
           // Label Label2220 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label2220");
           // Label2220.Text = "00";
        }

        //Control FooterTemplate = Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0];
        //Label lblFooter = FooterTemplate.FindControl("lblPPlanTotal") as Label;
        //lblFooter.Text = "Footer";
       // Label Label2220 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label2220");
        //Label Label21 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label21");
        //Label Label22 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label22");
        //Label Label23 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label23");
        //Label Label24 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label24");
        //Label Label25 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label25");
        //Label Label26 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label26");
        //Label Label27 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label27");
        //Label Label28 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label28");
        //Label Label29 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label29");
        //Label Label30 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label30");
        //Label Label31 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label31");
        //Label Label32 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label32");
        //if(  Label20.Text=="")
        //{
       // Label2220.Text = "10";
        //}
      
    }
    public void SumValueTotalWorkdone()
    {
        decimal SumIV = 0, SumIP = 0, SumIAV = 0, SumIAP = 0, SumIVV = 0, SumIVP = 0;
        decimal SumEV = 0, SumEP = 0, SumEAV = 0, SumEAP = 0, SumEVV = 0, SumEVP = 0;
        decimal SumCV = 0, SumCP = 0, SumCAV = 0, SumCAP = 0, SumCVV = 0, SumCVP = 0;

        for (int j = 0; j < Repeater1.Items.Count-2; j++)
        {

            Label Label1 = (Label)Repeater1.Items[j].FindControl("Label1");

            Repeater RptSub = (Repeater)Repeater1.Items[j].FindControl("RptSub");

            for (int k = 0; k < RptSub.Items.Count; k++)
            {
                Repeater RptSubDetail = (Repeater)RptSub.Items[k].FindControl("RptSubDetail");

                for (int l = 0; l < RptSubDetail.Items.Count; l++)
                {
                    Label txtUnit = (Label)RptSubDetail.Items[l].FindControl("txtUnit");
                    Label txtRate = (Label)RptSubDetail.Items[l].FindControl("txtRate");
                    Label txtAwardedValue = (Label)RptSubDetail.Items[l].FindControl("txtAwardedValue");
                    Label txtQty = (Label)RptSubDetail.Items[l].FindControl("txtQty");
                    Label txtAmt = (Label)RptSubDetail.Items[l].FindControl("txtAmt");
                    Label Label11 = (Label)RptSubDetail.Items[l].FindControl("Label11");
                    Label Label12 = (Label)RptSubDetail.Items[l].FindControl("Label12");
                    Label Label13 = (Label)RptSubDetail.Items[l].FindControl("Label13");
                    Label Label14 = (Label)RptSubDetail.Items[l].FindControl("Label14");
                    Label Label15 = (Label)RptSubDetail.Items[l].FindControl("Label15");
                    Label Label16 = (Label)RptSubDetail.Items[l].FindControl("Label16");
                    Label Label17 = (Label)RptSubDetail.Items[l].FindControl("Label17");
                    Label Label18 = (Label)RptSubDetail.Items[l].FindControl("Label18");
                    Label Label19 = (Label)RptSubDetail.Items[l].FindControl("Label19");

                    if (txtUnit.Text == "")
                    {
                        txtUnit.Text = "0.00";
                    }
                    else
                    {
                        txtUnit.Text = txtUnit.Text;
                    }
                    if (txtRate.Text == "")
                    {
                        txtRate.Text = "0.00";
                    }
                    else
                    {
                        txtRate.Text = txtRate.Text;
                    }
                    if (txtAwardedValue.Text == null)
                    {
                        txtAwardedValue.Text = "0.00";
                    }
                    else
                    {
                        txtAwardedValue.Text = txtAwardedValue.Text;
                    }
                    if (txtQty.Text == "")
                    {
                        txtQty.Text = "0.00";
                    }
                    else
                    {
                        txtQty.Text = txtQty.Text;
                    }
                    if (txtRate.Text == "")
                    {
                        txtRate.Text = "0.00";
                    }
                    else
                    {
                        txtRate.Text = txtRate.Text;
                    }
                    if (txtAmt.Text == "")
                    {
                        txtAmt.Text = "0.00";
                    }
                    else
                    {
                        txtAmt.Text = txtAmt.Text;
                    }
                    if (Label11.Text == "")
                    {
                        Label11.Text = "0.00";
                    }
                    else
                    {
                        Label11.Text = Label11.Text;
                    }
                    if (Label12.Text == "")
                    {
                        Label12.Text = "0.00";
                    }
                    else
                    {
                        Label12.Text = Label12.Text;
                    }
                    if (Label13.Text == "")
                    {
                        Label13.Text = "0.00";
                    }
                    else
                    {
                        Label13.Text = Label13.Text;
                    }
                    if (Label14.Text == "")
                    {
                        Label14.Text = "0.00";
                    }
                    else
                    {
                        Label14.Text = Label14.Text;
                    }
                    if (Label15.Text == "")
                    {
                        Label15.Text = "0.00";
                    }
                    else
                    {
                        Label15.Text = Label15.Text;
                    }
                    if (Label16.Text == "")
                    {
                        Label16.Text = "0.00";
                    }
                    else
                    {
                        Label16.Text = Label16.Text;
                    }
                    if (Label17.Text == "")
                    {
                        Label17.Text = "0.00";
                    }
                    else
                    {
                        Label17.Text = Label17.Text;
                    }
                    if (Label18.Text == "")
                    {
                        Label18.Text = "0.00";
                    }
                    else
                    {
                        Label18.Text = Label18.Text;
                    }
                    if (Label19.Text == "")
                    {
                        Label19.Text = "0.00";
                    }
                    else
                    {
                        Label19.Text = Label19.Text;
                    }


                    SumIV = SumIV + Math.Round(Convert.ToDecimal(txtUnit.Text), 0);
                    SumIP = SumIP + Math.Round(Convert.ToDecimal(txtRate.Text), 0);
                    SumIAV = SumIAV + Math.Round(Convert.ToDecimal(txtAwardedValue.Text), 0);
                    SumIAP = SumIAP + Math.Round(Convert.ToDecimal(txtQty.Text), 0);
                    SumIVV = SumIVV + Math.Round(Convert.ToDecimal(txtAmt.Text), 0);
                    SumIVP = SumIVP + Math.Round(Convert.ToDecimal(Label11.Text), 0);
                    SumEV = SumEV + Math.Round(Convert.ToDecimal(Label12.Text), 0);
                    SumEP = SumEP + Math.Round(Convert.ToDecimal(Label13.Text), 0);
                    SumEAV = SumEAV + Math.Round(Convert.ToDecimal(Label14.Text), 0);
                    SumEAP = SumEAP + Math.Round(Convert.ToDecimal(Label15.Text), 0);
                    SumEVV = SumEVV + Math.Round(Convert.ToDecimal(Label16.Text), 0);
                    SumEVP = SumEVP + Math.Round(Convert.ToDecimal(Label17.Text), 0);
                    SumCV = SumCV + Math.Round(Convert.ToDecimal(Label18.Text), 0);
                    SumCP = SumCP + Math.Round(Convert.ToDecimal(Label19.Text), 0);

                    ViewState["SumIV"] = SumIV;
                    ViewState["SumIP"] = SumIP;
                    ViewState["SumIAV"] = SumIAV;
                    ViewState["SumIAP"] = SumIAP;
                    ViewState["SumIVV"] = SumIVV;
                    ViewState["SumIVP"] = SumIVP;
                    ViewState["SumEV"] = SumEV;
                    ViewState["SumEP"] = SumEP;
                    ViewState["SumEAV"] = SumEAV;
                    ViewState["SumEAP"] = SumEAP;
                    ViewState["SumEVV"] = SumEVV;
                    ViewState["SumEVP"] = SumEVP;
                    ViewState["SumCV"] = SumCV;
                    ViewState["SumCP"] = SumCP;





                }
                //Label Label20 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label20");
                //Label Label21 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label21");
                //Label Label22 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label22");
                //Label Label23 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label23");
                //Label Label24 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label24");
                //Label Label25 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label25");
                //Label Label26 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label26");
                //Label Label27 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label27");
                //Label Label28 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label28");
                //Label Label29 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label29");
                //Label Label30 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label30");
                //Label Label31 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label31");
                //Label Label32 = (Label)RptSub.Controls[RptSub.Controls.Count - 1].Controls[0].FindControl("Label32");
                //Label20.Text = ViewState["SumIV"].ToString();
            }
            // Label Label2220 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label2220");
            // Label2220.Text = "00";
        }

        //Control FooterTemplate = Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0];
        //Label lblFooter = FooterTemplate.FindControl("lblPPlanTotal") as Label;
        //lblFooter.Text = "Footer";
        // Label Label2220 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label2220");
        //Label Label21 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label21");
        //Label Label22 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label22");
        //Label Label23 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label23");
        //Label Label24 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label24");
        //Label Label25 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label25");
        //Label Label26 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label26");
        //Label Label27 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label27");
        //Label Label28 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label28");
        //Label Label29 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label29");
        //Label Label30 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label30");
        //Label Label31 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label31");
        //Label Label32 = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("Label32");
        //if(  Label20.Text=="")
        //{
        // Label2220.Text = "10";
        //}

    }
}

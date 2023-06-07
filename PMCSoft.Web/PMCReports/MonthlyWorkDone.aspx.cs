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
    public partial class MonthlyWorkDone : System.Web.UI.Page
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
                        BindProjA();
                        LoadYears(ref ddlSDaysYear);
                        LoadYearsA(ref ddlSDaysYearA);
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
        void LoadYearsA(ref DropDownList DrpYears)
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
        public void BindProjA()
        {
            try
            {
                PMC.BindGetEmpProj(ddlProjectA, Session["UserID"].ToString());
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
        }
        protected void RptSub_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label LabelLblsub = e.Item.FindControl("LabelLblsub") as Label;

                Repeater RptSubDetail = e.Item.FindControl("RptSubDetail") as Repeater;

                Hashtable ht1 = new Hashtable();
                ht1.Add("@WDId", LabelLblsub.Text);
                DataTable dt1 = PMCApp.Get(ht1, "GetSubWDD");

                if (dt1.Rows.Count > 0)
                {
                    RptSubDetail.DataSource = dt1;
                    RptSubDetail.DataBind();
                }


            }
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();

        }
        protected void RptSub_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            RepeaterItem item = e.Item;

            if (e.CommandName == "ADDNEWParticulars")
            {
                ModalPopupExtender1.Show();
            }
        }

        protected void BtnAddNew_Click(object sender, EventArgs e)
        {


            for (int j = 0; j < Repeater1.Items.Count; j++)
            {

                Label Label1 = (Label)Repeater1.Items[j].FindControl("Label1");
                Repeater RptSub = (Repeater)Repeater1.Items[j].FindControl("RptSub");
                for (int k = 0; k < RptSub.Items.Count; k++)
                {

                    Label LabelLblsub = (Label)RptSub.Items[k].FindControl("LabelLblsub");
                    Label lblWDDName = (Label)RptSub.Items[k].FindControl("lblWDDName");
                    if (ddlProject.SelectedValue != "-1")
                    {
                        if (TxtExpenditure.Text != "")
                        {
                            Hashtable htchk = new Hashtable();
                            htchk.Add("@WDDId", ViewState["RepSubItemId"].ToString());
                            htchk.Add("@WDDName", TxtExpenditure.Text);
                            htchk.Add("@ProjectId", ddlProject.SelectedValue);
                            DataTable dtchk = PMCApp.Get(htchk, "ChechWDSD");
                            if (dtchk.Rows.Count > 0)
                            {
                                string scripts = "alert('Already Exists.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {
                                Hashtable hts = new Hashtable();
                                hts.Add("@WDDId", ViewState["RepSubItemId"].ToString());
                                hts.Add("@WDDName", TxtExpenditure.Text);
                                hts.Add("@Project", ddlProject.SelectedValue);
                                hts.Add("@companyId", Session["CompID"].ToString());
                                hts.Add("@CreatedBy", Session["UserId"].ToString());
                                PMCApp.Get(hts, "InsertWorkDoneSubDetail");
                                string scripts = "alert('Insert Successfully .');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                TxtExpenditure.Text = "";
                                Hashtable ht2 = new Hashtable();
                                ht2.Add("@WDId", Label1.Text);
                                DataTable dt2 = PMCApp.Get(ht2, "GetWDD");

                                if (dt2.Rows.Count > 0)
                                {
                                    RptSub.DataSource = dt2;
                                    RptSub.DataBind();


                                }
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Fill Particulars .');";
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


        }




        protected void Button_Click(object sender, EventArgs e)
        {
            try
            {
                //Get the reference of the clicked button.
                Button button = (sender as Button);

                //Get the command argument
                string commandArgument = button.CommandArgument;


                ModalPopupExtender1.Show();
                ViewState["RepSubItemId"] = commandArgument.ToString();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void BtnAddNewCancle_Click(object sender, EventArgs e)
        {
        }
        protected void BtnReport_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            DataTable dt = PMCApp.Get(ht, "GetWDM");

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }


        }
        public void RBind()
        {
            Hashtable ht = new Hashtable();

            DataTable dt = PMCApp.Get(ht, "GetWDM");

            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }


        protected void BtnWorkdonePlanSave_Click(object sender, EventArgs e)
        {
            try
            {
                int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0, check7 = 0;




                for (int j = 0; j < Repeater1.Items.Count; j++)
                {

                    Label Label1 = (Label)Repeater1.Items[j].FindControl("Label1");
                    Repeater RptSub = (Repeater)Repeater1.Items[j].FindControl("RptSub");

                    for (int k = 0; k < RptSub.Items.Count; k++)
                    {
                        Repeater RptSubDetail = (Repeater)RptSub.Items[k].FindControl("RptSubDetail");
                        if (RptSubDetail.Items.Count > 0)
                        {
                            for (int l = 0; l < RptSubDetail.Items.Count; l++)
                            {
                                TextBox txtUnit = (TextBox)RptSubDetail.Items[l].FindControl("txtUnit");
                                TextBox txtRate = (TextBox)RptSubDetail.Items[l].FindControl("txtRate");
                                TextBox txtAwardedValue = (TextBox)RptSubDetail.Items[l].FindControl("txtAwardedValue");
                                TextBox txtQty = (TextBox)RptSubDetail.Items[l].FindControl("txtQty");
                                TextBox txtAmt = (TextBox)RptSubDetail.Items[l].FindControl("txtAmt");
                                if (txtUnit.Text == "" || txtRate.Text == "" || txtAwardedValue.Text == "" || txtQty.Text == "" || txtAmt.Text == "")
                                {
                                    check2 = 1;
                                }
                            }
                        }
                    }
                }

                if (ddlProject.SelectedValue != "-1")
                {
                    if (ddlMonth.SelectedValue != "-1")
                    {

                        if (ddlSDaysYear.SelectedValue != "-1")
                        {

                            Hashtable htchk = new Hashtable();
                            htchk.Add("@ProjectId", ddlProject.SelectedValue);
                            htchk.Add("@PlanMonth", ddlMonth.SelectedValue);
                            htchk.Add("@PlanYear", ddlSDaysYear.SelectedValue);
                            DataTable dtchk = PMCApp.Get(htchk, "GetMonthDonePlanCheck");
                            if (dtchk.Rows.Count > 0)
                            {
                                string scripts = "alert('Already Exists ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {

                                if (check2 == 0)
                                {


                                    for (int j = 0; j < Repeater1.Items.Count; j++)
                                    {

                                        Label Label1 = (Label)Repeater1.Items[j].FindControl("Label1");
                                        Label lblIncome = (Label)Repeater1.Items[j].FindControl("lblIncome");
                                        Repeater RptSub = (Repeater)Repeater1.Items[j].FindControl("RptSub");
                                        if (RptSub.Items.Count > 0)
                                        {
                                            for (int k = 0; k < RptSub.Items.Count; k++)
                                            {
                                                Label LabelLblsub = (Label)RptSub.Items[k].FindControl("LabelLblsub");
                                                Label lblWDDName = (Label)RptSub.Items[k].FindControl("lblWDDName");
                                                Repeater RptSubDetail = (Repeater)RptSub.Items[k].FindControl("RptSubDetail");
                                                if (RptSubDetail.Items.Count > 0)
                                                {
                                                    for (int l = 0; l < RptSubDetail.Items.Count; l++)
                                                    {
                                                        Label LblSWDDId = (Label)RptSubDetail.Items[l].FindControl("LblSWDDId");
                                                        Label LBLPD = (Label)RptSubDetail.Items[l].FindControl("LBLPD");
                                                        TextBox txtUnit = (TextBox)RptSubDetail.Items[l].FindControl("txtUnit");
                                                        TextBox txtRate = (TextBox)RptSubDetail.Items[l].FindControl("txtRate");
                                                        TextBox txtAwardedValue = (TextBox)RptSubDetail.Items[l].FindControl("txtAwardedValue");
                                                        TextBox txtQty = (TextBox)RptSubDetail.Items[l].FindControl("txtQty");
                                                        TextBox txtAmt = (TextBox)RptSubDetail.Items[l].FindControl("txtAmt");

                                                        Hashtable ht1 = new Hashtable();
                                                        ht1.Add("@ProjectId", ddlProject.SelectedValue);
                                                        ht1.Add("@companyId", Session["CompID"].ToString());
                                                        ht1.Add("@PlanMonth", ddlMonth.SelectedValue);
                                                        ht1.Add("@PlanYear", ddlSDaysYear.SelectedValue);
                                                        ht1.Add("@WDMParticularId", Label1.Text);
                                                        ht1.Add("@WDMParticularName", lblIncome.Text);
                                                        ht1.Add("@WDDMParticularId", LabelLblsub.Text);
                                                        ht1.Add("@WDDMParticularName", lblWDDName.Text);
                                                        ht1.Add("@WDSubDID", LblSWDDId.Text);
                                                        ht1.Add("@WDSubParticularsName", LBLPD.Text);
                                                        ht1.Add("@Unit", txtUnit.Text);
                                                        ht1.Add("@Rate", txtRate.Text);
                                                        ht1.Add("@AwardedValue", txtAwardedValue.Text);
                                                        ht1.Add("@PlanQty", txtQty.Text);
                                                        ht1.Add("@PlanAmt", txtAmt.Text);
                                                        ht1.Add("@CreatedBy", Session["UserId"].ToString());
                                                        DataTable dt1 = PMCApp.Get(ht1, "InsertMonthlyWorkDonePlan");





                                                    }
                                                }
                                            }
                                        }
                                    }
                                    string scripts = "alert('Insert Successfully .');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    RBind();
                                }
                                else
                                {
                                    string scripts = "alert('please fill all Boxes then click ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }

                        }
                        else
                        {
                            string scripts = "alert('Kindly  fill Year ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly  fill Month ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly  fill Project Name ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }



            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        /// <summary>
        /// Thsis Is use for Actual Monthlye Work done
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnReportA_Click(object sender, EventArgs e)
        {
            RBindA();
        }
        public void RBindA()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProjectA.SelectedValue);
            ht.Add("@PlanMonth", ddlMonth.SelectedValue);
            ht.Add("@PlanYear", ddlSDaysYearA.SelectedValue);


            DataTable dt = PMCApp.Get(ht, "GetWDMActual");



            if (dt.Rows.Count > 0)
            {
                RptActualMaster.DataSource = dt;
                RptActualMaster.DataBind();
            }
            else
            {
                string scripts = "alert('No Record Found .');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void RptActualMaster_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label Label1 = e.Item.FindControl("Label1") as Label;
                Hashtable htR1 = new Hashtable();

                DataTable dtR1 = PMCApp.Get(htR1, "GetWDM");

                Repeater RptAcutalSub = e.Item.FindControl("RptAcutalSub") as Repeater;


                Hashtable ht = new Hashtable();

                ht.Add("@WDId", Label1.Text);
                DataTable dt = PMCApp.Get(ht, "GetWDDAtual");

                if (dt.Rows.Count > 0)
                {
                    RptAcutalSub.DataSource = dt;
                    RptAcutalSub.DataBind();


                }





            }
        }
        protected void RptAcutalSub_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label Label1 = e.Item.FindControl("Label1") as Label;

                Repeater RptActulSubDetail = e.Item.FindControl("RptActulSubDetail") as Repeater;

                Hashtable ht = new Hashtable();
                ht.Add("@ProjectId", ddlProjectA.SelectedValue);
                ht.Add("@PlanMonth", ddlMonth.SelectedValue);
                ht.Add("@PlanYear", ddlSDaysYearA.SelectedValue);
                ht.Add("@WDDMParticularId", Label1.Text);
                DataTable dt1 = PMCApp.Get(ht, "GetWDMActualDetail");

                if (dt1.Rows.Count > 0)
                {
                    RptActulSubDetail.DataSource = dt1;
                    RptActulSubDetail.DataBind();
                }


            }
        }

        protected void BtnActualMonthlyWorkDoneSave_Click(object sender, EventArgs e)
        {
            try
            {
                int check = 0;
                for (int j = 0; j < RptActualMaster.Items.Count; j++)
                {

                    Label Label1 = (Label)RptActualMaster.Items[j].FindControl("Label1");
                    Repeater RptAcutalSub = (Repeater)RptActualMaster.Items[j].FindControl("RptAcutalSub");

                    for (int k = 0; k < RptAcutalSub.Items.Count; k++)
                    {
                        Repeater RptActulSubDetail = (Repeater)RptAcutalSub.Items[k].FindControl("RptActulSubDetail");
                        if (RptActulSubDetail.Items.Count > 0)
                        {
                            for (int l = 0; l < RptActulSubDetail.Items.Count; l++)
                            {
                                Label txtUnit = (Label)RptActulSubDetail.Items[l].FindControl("txtUnit");
                                Label txtRate = (Label)RptActulSubDetail.Items[l].FindControl("txtRate");
                                Label txtAwardedValue = (Label)RptActulSubDetail.Items[l].FindControl("txtAwardedValue");
                                Label txtQty = (Label)RptActulSubDetail.Items[l].FindControl("txtQty");
                                Label txtAmt = (Label)RptActulSubDetail.Items[l].FindControl("txtAmt");
                                TextBox TxtActualQty = (TextBox)RptActulSubDetail.Items[l].FindControl("TxtActualQty");
                                TextBox TxtActualAmt = (TextBox)RptActulSubDetail.Items[l].FindControl("TxtActualAmt");
                                if (TxtActualQty.Text == "" || TxtActualAmt.Text == "")
                                {
                                    check = 1;
                                }
                            }
                        }
                    }
                }
                if (ddlProjectA.SelectedValue != "-1")
                {
                    if (ddlMonthA.SelectedValue != "-1")
                    {

                        if (ddlSDaysYearA.SelectedValue != "-1")
                        {

                            Hashtable htchk = new Hashtable();
                            htchk.Add("@ProjectId", ddlProjectA.SelectedValue);
                            htchk.Add("@PlanMonth", ddlMonthA.SelectedValue);
                            htchk.Add("@PlanYear", ddlSDaysYearA.SelectedValue);
                            DataTable dtchk = PMCApp.Get(htchk, "GetMonthDoneActualCheck");
                            if (dtchk.Rows.Count > 0)
                            {
                                string scripts = "alert('Already Exists ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {

                                if (check == 0)
                                {


                                    for (int j = 0; j < RptActualMaster.Items.Count; j++)
                                    {

                                        Label Label1 = (Label)RptActualMaster.Items[j].FindControl("Label1");
                                        Label lblActual = (Label)RptActualMaster.Items[j].FindControl("lblActual");
                                        Repeater RptAcutalSub = (Repeater)RptActualMaster.Items[j].FindControl("RptAcutalSub");
                                        if (RptAcutalSub.Items.Count > 0)
                                        {
                                            for (int k = 0; k < RptAcutalSub.Items.Count; k++)
                                            {
                                                Label Label1A = (Label)RptAcutalSub.Items[k].FindControl("Label1");
                                                Label lblActualA = (Label)RptAcutalSub.Items[k].FindControl("lblActual");
                                                Repeater RptActulSubDetail = (Repeater)RptAcutalSub.Items[k].FindControl("RptActulSubDetail");
                                                if (RptActulSubDetail.Items.Count > 0)
                                                {
                                                    for (int l = 0; l < RptActulSubDetail.Items.Count; l++)
                                                    {
                                                        Label Label1C = (Label)RptActulSubDetail.Items[l].FindControl("Label1");
                                                        Label lblActualC = (Label)RptActulSubDetail.Items[l].FindControl("lblActual");
                                                        Label txtUnit = (Label)RptActulSubDetail.Items[l].FindControl("txtUnit");
                                                        Label txtRate = (Label)RptActulSubDetail.Items[l].FindControl("txtRate");
                                                        Label txtAwardedValue = (Label)RptActulSubDetail.Items[l].FindControl("txtAwardedValue");
                                                        Label txtQty = (Label)RptActulSubDetail.Items[l].FindControl("txtQty");
                                                        Label txtAmt = (Label)RptActulSubDetail.Items[l].FindControl("txtAmt");
                                                        TextBox TxtActualQty = (TextBox)RptActulSubDetail.Items[l].FindControl("TxtActualQty");
                                                        TextBox TxtActualAmt = (TextBox)RptActulSubDetail.Items[l].FindControl("TxtActualAmt");


                                                        Hashtable ht1 = new Hashtable();
                                                        ht1.Add("@ProjectId", ddlProjectA.SelectedValue);
                                                        ht1.Add("@companyId", Session["CompID"].ToString());
                                                        ht1.Add("@PlanMonth", ddlMonthA.SelectedValue);
                                                        ht1.Add("@PlanYear", ddlSDaysYearA.SelectedValue);
                                                        ht1.Add("@WDMParticularId", Label1.Text);
                                                        ht1.Add("@WDMParticularName", lblActual.Text);
                                                        ht1.Add("@WDDMParticularId", Label1A.Text);
                                                        ht1.Add("@WDDMParticularName", lblActualA.Text);
                                                        ht1.Add("@WDSubDID", Label1C.Text);
                                                        ht1.Add("@WDSubParticularsName", lblActualC.Text);
                                                        ht1.Add("@Unit", txtUnit.Text);
                                                        ht1.Add("@Rate", txtRate.Text);
                                                        ht1.Add("@AwardedValue", txtAwardedValue.Text);
                                                        ht1.Add("@PlanQty", txtQty.Text);
                                                        ht1.Add("@PlanAmt", txtAmt.Text);
                                                        ht1.Add("@ActualQty", TxtActualQty.Text);
                                                        ht1.Add("@ActualAmt", TxtActualAmt.Text);
                                                        ht1.Add("@CreatedBy", Session["UserId"].ToString());
                                                        DataTable dt1 = PMCApp.Get(ht1, "InsertMonthlyWorkDoneActual");





                                                    }
                                                }
                                            }
                                        }
                                    }
                                    string scripts = "alert('Insert Successfully .');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    RBind();
                                }
                                else
                                {
                                    string scripts = "alert('please fill all Boxes then click ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }

                        }
                        else
                        {
                            string scripts = "alert('Kindly  fill Year ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly  fill Month ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly  fill Project Name ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }



            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

    }

}


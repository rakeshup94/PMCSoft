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
    public partial class PrintMonthyWorkDoneReport : System.Web.UI.Page
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
                        ViewState["ProjectId"] = PRJID.ToString();
                        arrIndMsg = arrMsgs[1].Split('=');
                        ProjName = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[2].Split('=');
                        FromMonth = arrIndMsg[1].ToString().Trim();
                        arrIndMsg = arrMsgs[3].Split('=');
                        FromYear = arrIndMsg[1].ToString().Trim();
                        LblProject.Text = ProjName.ToString();
                        Lblmonth.Text = FromMonth.ToString();
                        LblYear.Text = FromYear.ToString();

                        RBindA();


                        //FromMonth.Text = Date.ToString();
                        //lblProjectName.Text = ProjName.ToString();


                    }
                }
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
            ht.Add("@ProjectId", ViewState["ProjectId"].ToString());
            ht.Add("@PlanMonth", Lblmonth.Text);
            ht.Add("@PlanYear", LblYear.Text);


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
        }
        protected void RptSub_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label LabelLblsub = e.Item.FindControl("LabelLblsub") as Label;

                Repeater RptSubDetail = e.Item.FindControl("RptSubDetail") as Repeater;

                Hashtable ht = new Hashtable();
                ht.Add("@ProjectId", ViewState["ProjectId"].ToString());
                ht.Add("@PlanMonth", Lblmonth.Text);
                ht.Add("@PlanYear", LblYear.Text);
                ht.Add("@WDDMParticularId", LabelLblsub.Text);
                DataTable dt1 = PMCApp.Get(ht, "GetMonthlyWorkDoneReport");

                if (dt1.Rows.Count > 0)
                {
                    RptSubDetail.DataSource = dt1;
                    RptSubDetail.DataBind();
                }


            }
        }

        private string DecryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Encrypt();
        }



    }
}
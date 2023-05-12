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

public partial class Report_StockDetail : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
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
                    GetD();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void GetD()
    {
        try
        {
            string strReq = "";
            strReq = Request.RawUrl;
            strReq = strReq.Substring(strReq.IndexOf('?') + 1);

            if (!strReq.Equals(""))
            {
                strReq = DecryptQueryString(strReq);
                string[] arrMsgs = strReq.Split('&');
                string[] arrIndMsg;

                string PRJID = "", PRJName = "";
                arrIndMsg = arrMsgs[0].Split('=');
                PRJID = arrIndMsg[1].ToString().Trim();
                arrIndMsg = arrMsgs[1].Split('=');
                PRJName = arrIndMsg[1].ToString().Trim();
                ViewState["PRJID"] = PRJID.ToString();
                ViewState["PRJName"] = PRJName.ToString();
                lblProj.Text = PRJName.ToString();
            }
            gridBind();
           
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
  ////  public void GetProject(string PRJID)
  //  {
  //      try
  //      {
  //          PMC.BindGetUpdateRawMaterialStock(GridView5, PRJID);
  //          //GetMP();
  //      }
  //      catch (Exception ex)
  //      {
  //          string scripts = "alert('Some error occurs.');";
  //          ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
  //      }
  //  }
    private string DecryptQueryString(string strQueryString)
    {
        QueryStringEncryption.EncryptDecryptQueryString objEDQueryString = new QueryStringEncryption.EncryptDecryptQueryString();
        return objEDQueryString.Decrypt(strQueryString, "r0b1nr0y");
    }
    public string EncryptQueryString(string strQueryString)
    {
        QueryStringEncryption.EncryptDecryptQueryString objEDQueryString = new QueryStringEncryption.EncryptDecryptQueryString();
        return objEDQueryString.Encrypt(strQueryString, "r0b1nr0y");
    }
    //public void GetMP()
    //{
    //    try
    //    {
    //        decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0;
    //        for (int i = 0; i < GridView1.Rows.Count; i++)
    //        {
    //            Label txtSK = (Label)GridView1.Rows[i].FindControl("lblTotalStock");
    //            Label txtSEMI = (Label)GridView1.Rows[i].FindControl("lblTodayReceive");
    //            Label txtUNSK = (Label)GridView1.Rows[i].FindControl("lblTotalStockAmount");
    //            if (txtSK.Text != "")
    //            {
    //                txtSK.Text = Convert.ToString(Math.Round(Convert.ToDecimal(txtSK.Text), 2));
    //            }
    //            else
    //            {
    //                txtSK.Text = "0.00";
    //            }
    //            if (txtSEMI.Text != "")
    //            {
    //                txtSEMI.Text = Convert.ToString(Math.Round(Convert.ToDecimal(txtSEMI.Text), 2));
    //            }
    //            else
    //            {
    //                txtSEMI.Text = "0.00";
    //            }
    //            if (txtUNSK.Text != "")
    //            {
    //                txtUNSK.Text = Convert.ToString(Math.Round(Convert.ToDecimal(txtUNSK.Text), 2));
    //            }
    //            else
    //            {
    //                txtUNSK.Text = "0.00";
    //            }

    //            SumSK = SumSK + Math.Round(Convert.ToDecimal(txtSK.Text), 0);
    //            SumUNSK = SumUNSK + Math.Round(Convert.ToDecimal(txtUNSK.Text), 0);

    //            ViewState["SumSK"] = SumSK;
    //            ViewState["SumUNSK"] = SumUNSK;
    //        }
    //        //Label lblTSK = (Label)GridView1.Controls[GridView1.Controls.Count - 1].Controls[0].FindControl("lblTotalQty");
    //        //Label lblTUNSK = (Label)GridView1.Controls[GridView1.Controls.Count - 1].Controls[0].FindControl("lblTotalAmount");

    //        //lblTSK.Text = ViewState["SumSK"].ToString();
    //        //lblTSEMI.Text = ViewState["SumSEMI"].ToString();
    //        //lblTUNSK.Text = ViewState["SumUNSK"].ToString();
    //    }
    //    catch (Exception ex)
    //    {
    //        string scripts = "alert('Some error occurs.');";
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
    //    }
    //}
    public void gridBind()
    {
         Hashtable ht = new Hashtable();
            ht.Add("@email_Id",ViewState["PRJID"].ToString());
            DataTable dt = PMCApp.Get(ht, "GetAdminStock");
            GridView5.DataSource = dt;
            GridView5.DataBind();
    }
}
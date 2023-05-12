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

public partial class Report_MonthlyVWD : System.Web.UI.Page
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
                    BindProj();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void BindProj()
    {
        try
        {
            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
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
        }
    }
    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        PMC.BindGetFinYearDetail(Repeater1, ddlProject.SelectedValue.ToString());
        Get();
    }
    public void Get()
    {
        decimal SumPlan = 0, SumVWD = 0, SumEscl = 0, SumExtraItem = 0, SumTotal = 0, SumVariation = 0;
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            TextBox txtPlan = (TextBox)Repeater1.Items[i].FindControl("txtPlan");
            TextBox txtActualVWD = (TextBox)Repeater1.Items[i].FindControl("txtActualVWD");
            TextBox txtActualEscl = (TextBox)Repeater1.Items[i].FindControl("txtActualEscl");
            TextBox txtExtraItem = (TextBox)Repeater1.Items[i].FindControl("txtExtraItem");
            TextBox txtTotal = (TextBox)Repeater1.Items[i].FindControl("txtTotal");
            TextBox txtVariation = (TextBox)Repeater1.Items[i].FindControl("txtVariation");
            if (txtPlan.Text != "")
            {
                txtPlan.Text = txtPlan.Text;
            }
            else
            {
                txtPlan.Text = "0.00";
            }
            if (txtActualVWD.Text != "")
            {
                txtActualVWD.Text = txtActualVWD.Text;
            }
            else
            {
                txtActualVWD.Text = "0.00";
            }
            if (txtActualEscl.Text != "")
            {
                txtActualEscl.Text = txtActualEscl.Text;
            }
            else
            {
                txtActualEscl.Text = "0.00";
            }
            if (txtExtraItem.Text != "")
            {
                txtExtraItem.Text = txtExtraItem.Text;
            }
            else
            {
                txtExtraItem.Text = "0.00";
            }

            txtTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtActualVWD.Text) + Convert.ToDecimal(txtActualEscl.Text) + Convert.ToDecimal(txtExtraItem.Text)), 2));
            txtVariation.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtPlan.Text) - Convert.ToDecimal(txtActualVWD.Text)), 2));

            SumPlan = SumPlan + Math.Round(Convert.ToDecimal(txtPlan.Text), 2);
            SumVWD = SumVWD + Math.Round(Convert.ToDecimal(txtActualVWD.Text), 2);
            SumEscl = SumEscl + Math.Round(Convert.ToDecimal(txtActualEscl.Text), 2);
            SumExtraItem = SumExtraItem + Math.Round(Convert.ToDecimal(txtExtraItem.Text), 2);
            SumTotal = SumTotal + Math.Round(Convert.ToDecimal(txtTotal.Text), 2);
            SumVariation = SumVariation + Math.Round(Convert.ToDecimal(txtVariation.Text), 2);

            ViewState["SumPlan"] = SumPlan;
            ViewState["SumVWD"] = SumVWD;
            ViewState["SumEscl"] = SumEscl;
            ViewState["SumExtraItem"] = SumExtraItem;
            ViewState["SumTotal"] = SumTotal;
            ViewState["SumVariation"] = SumVariation;
        }
        Label lblPlan = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblPlan");
        Label lblActualVWD = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualVWD");
        Label lblActualEscl = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualEscl");
        Label lblActualExtraItem = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualExtraItem");
        Label lblActualTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblActualTotal");
        Label lblVariation = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblVariation");

        lblPlan.Text = ViewState["SumPlan"].ToString();
        lblActualVWD.Text = ViewState["SumVWD"].ToString();
        lblActualEscl.Text = ViewState["SumEscl"].ToString();
        lblActualExtraItem.Text = ViewState["SumExtraItem"].ToString();
        lblActualTotal.Text = ViewState["SumTotal"].ToString();
        lblVariation.Text = ViewState["SumVariation"].ToString();
    }
}

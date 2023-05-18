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

namespace PMCSoft.Web.User
{
    public partial class WorkProgrammeApproval : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        decimal S1 = 0, S2 = 0, S3 = 0, S4 = 0, TS1 = 0, TS2 = 0, TS3 = 0, TS4 = 0;
        string MRID = "";
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
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
                PMC.BindGetEmpProjDL(DataList1, Session["UserID"].ToString());
                //PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
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
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender3.Show();
                ModalPopupExtender1.Hide();
                hdnWPIDDisApproved.Value = hdnWPID.Value;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender2.Show();
                ModalPopupExtender1.Hide();
                hdnWPIDApproved.Value = hdnWPID.Value;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "WPView")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnWPID1 = (HiddenField)lnk.Parent.FindControl("hdnWPID1");
                    HiddenField hdnProjectID = (HiddenField)lnk.FindControl("hdnPRJID");

                    DT = PMCApp.GetDataTableWithThreeStringValue("GetWPForApproval", hdnProjectID.Value.ToString(), Session["UserID"].ToString(), hdnWPID1.Value);
                    if (DT.Rows.Count > 0)
                    {
                        lblNumber.Text = DT.Rows[0]["WPNumber"].ToString();
                        lblWorkProgrammeDate.Text = DT.Rows[0]["WPDate"].ToString();
                        hdnWPDate.Value = DT.Rows[0]["WPDate1"].ToString();
                        lblEngInCharge.Text = DT.Rows[0]["EngInCharge1"].ToString();
                        lblBlock.Text = DT.Rows[0]["Block"].ToString();
                        lblSupervisor.Text = DT.Rows[0]["Supervisor1"].ToString();
                        lblForeman.Text = DT.Rows[0]["Foreman1"].ToString();
                        lblEngineer.Text = DT.Rows[0]["Engineer1"].ToString();
                        hdnWPID.Value = DT.Rows[0]["WPID"].ToString();
                        hdnEngInCharge.Value = DT.Rows[0]["EngInCharge"].ToString();
                        hdnSupervisor.Value = DT.Rows[0]["Supervisor"].ToString();
                        hdnForeman.Value = DT.Rows[0]["Foreman"].ToString();
                        hdnEngineer.Value = DT.Rows[0]["Engineer"].ToString();

                        Repeater1.DataSource = DT;
                        Repeater1.DataBind();
                        Get();
                        ModalPopupExtender1.Show();
                    }
                    else
                    {
                        lblNumber.Text = "";
                        lblWorkProgrammeDate.Text = "";
                        hdnWPDate.Value = "";
                        lblEngInCharge.Text = "";
                        lblBlock.Text = "";
                        lblSupervisor.Text = "";
                        lblForeman.Text = "";
                        lblEngineer.Text = "";
                        hdnWPID.Value = "";
                        hdnEngInCharge.Value = "";
                        hdnSupervisor.Value = "";
                        hdnForeman.Value = "";
                        hdnEngineer.Value = "";

                        Repeater1.DataSource = DT;
                        Repeater1.DataBind();
                        ModalPopupExtender1.Hide();

                        string scripts = "alert('No record found. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lblProjectName = (Label)e.Item.FindControl("lblProjectName");
                    HiddenField hdnProjectID = (HiddenField)e.Item.FindControl("hdnProjectID");
                    GridView GridView1 = (GridView)e.Item.FindControl("GridView1");

                    PMC.BindGetWPDateForApproval(GridView1, hdnProjectID.Value.ToString(), Session["UserID"].ToString());
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnDisApproved_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtRemarkDisApproved.Text != "")
                {
                    PMC.UpdateWPStatusDis(hdnWPIDDisApproved.Value, txtRemarkDisApproved.Text);
                    PMC.BindGetEmpProjDL(DataList1, Session["UserID"].ToString());
                }
                else
                {
                    string scripts = "alert('Kindly fill remarks.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender3.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender3.Show();
            }
        }
        protected void btnCancelDisApproved_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender3.Hide();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender3.Show();
            }
        }
        protected void btnApproved_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtRemark.Text != "")
                {
                    PMC.UpdateWPStatusApp(hdnWPIDApproved.Value, txtRemark.Text);
                    PMC.BindGetEmpProjDL(DataList1, Session["UserID"].ToString());
                }
                else
                {
                    string scripts = "alert('Kindly fill remarks.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender2.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender2.Show();
            }
        }
        protected void btnApprovedCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender2.Hide();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender2.Show();
            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
        public void Get()
        {
            try
            {
                decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0, SumOT = 0, SumTotal = 0;
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label txtSK = (Label)Repeater1.Items[i].FindControl("lblSK");
                    Label txtSEMI = (Label)Repeater1.Items[i].FindControl("lblSEMI");
                    Label txtUNSK = (Label)Repeater1.Items[i].FindControl("lblUNSK");
                    Label txtOT = (Label)Repeater1.Items[i].FindControl("lblOT");
                    Label lblTotal = (Label)Repeater1.Items[i].FindControl("lblTotal");
                    if (txtSK.Text != "")
                    {
                        txtSK.Text = txtSK.Text;
                    }
                    else
                    {
                        txtSK.Text = "0";
                    }
                    if (txtSEMI.Text != "")
                    {
                        txtSEMI.Text = txtSEMI.Text;
                    }
                    else
                    {
                        txtSEMI.Text = "0";
                    }
                    if (txtUNSK.Text != "")
                    {
                        txtUNSK.Text = txtUNSK.Text;
                    }
                    else
                    {
                        txtUNSK.Text = "0";
                    }
                    if (txtOT.Text != "")
                    {
                        txtOT.Text = txtOT.Text;
                    }
                    else
                    {
                        txtOT.Text = "0";
                    }

                    lblTotal.Text = Convert.ToString(Math.Round((Convert.ToDecimal(txtSK.Text) + Convert.ToDecimal(txtSEMI.Text) + Convert.ToDecimal(txtUNSK.Text) + Convert.ToDecimal(txtOT.Text)), 2));

                    SumSK = SumSK + Math.Round(Convert.ToDecimal(txtSK.Text), 0);
                    SumSEMI = SumSEMI + Math.Round(Convert.ToDecimal(txtSEMI.Text), 0);
                    SumUNSK = SumUNSK + Math.Round(Convert.ToDecimal(txtUNSK.Text), 0);
                    SumOT = SumOT + Math.Round(Convert.ToDecimal(txtOT.Text), 0);
                    SumTotal = SumTotal + Math.Round(Convert.ToDecimal(lblTotal.Text), 0);

                    ViewState["SumSK"] = SumSK;
                    ViewState["SumSEMI"] = SumSEMI;
                    ViewState["SumUNSK"] = SumUNSK;
                    ViewState["SumOT"] = SumOT;
                    ViewState["SumTotal"] = SumTotal;
                }
                Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSK");
                Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumSEMI");
                Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumUNSK");
                Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblSumOT");
                Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblGTotal");

                lblTSK.Text = ViewState["SumSK"].ToString();
                lblTSEMI.Text = ViewState["SumSEMI"].ToString();
                lblTUNSK.Text = ViewState["SumUNSK"].ToString();
                lblTOT.Text = ViewState["SumOT"].ToString();
                lblGTotal.Text = ViewState["SumTotal"].ToString();
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}
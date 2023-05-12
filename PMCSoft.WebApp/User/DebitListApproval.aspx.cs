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

public partial class User_DebitListApproval : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
    string AListID = string.Empty;
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
                    BindProject();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void BindProject()
    {
        try
        {
            PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
            PMC.BindGetEmp(ddlEmployee, ddlProject.SelectedValue.ToString());
            PMC.BindGetDebitorList(GridView1, ddlProject.SelectedValue.ToString(), Session["UserID"].ToString());
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
            PMC.BindGetDebitorList(GridView1, ddlProject.SelectedValue.ToString(), Session["UserID"].ToString());
            PMC.BindGetEmp(ddlEmployee, ddlProject.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                TextBox txtSuggestAmount = (TextBox)GridView1.Rows[i].FindControl("txtSuggestAmount");
                RadioButtonList rbl = (RadioButtonList)GridView1.Rows[i].FindControl("rbl");
                if (rbl.SelectedValue == "1")
                {
                    txtSuggestAmount.Enabled = true;
                    txtSuggestAmount.ReadOnly = false;
                    txtSuggestAmount.BackColor = System.Drawing.Color.LemonChiffon;
                    txtSuggestAmount.BorderColor = System.Drawing.Color.Red;
                }
                else
                {
                    txtSuggestAmount.Enabled = false;
                    txtSuggestAmount.ReadOnly = true;
                    txtSuggestAmount.BackColor = System.Drawing.Color.LightGray;
                    txtSuggestAmount.BorderColor = System.Drawing.Color.Gray;
                }
            }
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
            Response.Redirect("~/User/Home.aspx");
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int check = 0, check1 = 0;
            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                RadioButtonList rbl = (RadioButtonList)GridView1.Rows[j].FindControl("rbl");
                if (rbl.SelectedValue == "1")
                {
                    if (ddlEmployee.SelectedValue == "-1")
                    {
                        check = 1;
                        break;
                    }
                    else
                    {
                        check = 0;
                    }
                }
                else
                {
                    check = 0;
                }
            }
            for (int k = 0; k < GridView1.Rows.Count; k++)
            {
                RadioButtonList rbl = (RadioButtonList)GridView1.Rows[k].FindControl("rbl");
                TextBox txtSuggestAmount = (TextBox)GridView1.Rows[k].FindControl("txtSuggestAmount");
                if (rbl.SelectedValue == "1")
                {
                    if (txtSuggestAmount.Text == "")
                    {
                        check1 = 1;
                        break;
                    }
                    else
                    {
                        check1 = 0;
                    }
                }
                else
                {
                    check1 = 0;
                }
            }
            if (ddlProject.SelectedValue != "-1")
            {
                if (check == 0)
                {
                    if (check1 == 0)
                    {
                        PMC.GetMaxIDForAppListID(Session["CompID"].ToString(), out AListID);

                        for (int i = 0; i < GridView1.Rows.Count; i++)
                        {
                            HiddenField hdnTransID = (HiddenField)GridView1.Rows[i].FindControl("hdnTransID");
                            HiddenField hdnVendorID = (HiddenField)GridView1.Rows[i].FindControl("hdnVendorID");
                            HiddenField hdnListID = (HiddenField)GridView1.Rows[i].FindControl("hdnListID");
                            HiddenField hdnCreatedBy = (HiddenField)GridView1.Rows[i].FindControl("hdnCreatedBy");
                            Label lblVendorName = (Label)GridView1.Rows[i].FindControl("lblVendorName");
                            Label lblAmount = (Label)GridView1.Rows[i].FindControl("lblAmount");
                            Label lblRemarks = (Label)GridView1.Rows[i].FindControl("lblRemarks");
                            RadioButtonList rbl = (RadioButtonList)GridView1.Rows[i].FindControl("rbl");
                            TextBox txtRemarks = (TextBox)GridView1.Rows[i].FindControl("txtRemarks");
                            TextBox txtSuggestAmount = (TextBox)GridView1.Rows[i].FindControl("txtSuggestAmount");

                            if (rbl.SelectedValue == "0")
                            {
                                ViewState["rbl"] = ddlEmployee.SelectedValue.ToString();
                                ViewState["SA"] = "0.00";
                                ViewState["AS"] = "A";
                            }
                            else if (rbl.SelectedValue == "1")
                            {
                                ViewState["rbl"] = ddlEmployee.SelectedValue.ToString();
                                ViewState["SA"] = txtSuggestAmount.Text;
                                ViewState["AS"] = "S";
                            }
                            else if (rbl.SelectedValue == "2")
                            {
                                ViewState["rbl"] = hdnCreatedBy.Value;
                                ViewState["SA"] = "0.00";
                                ViewState["AS"] = "D";
                            }

                            PMC.InsertDebitorsApproveList(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), hdnListID.Value, AListID.ToString(),
                                hdnVendorID.Value, lblVendorName.Text, lblAmount.Text, lblRemarks.Text, ViewState["rbl"].ToString(), txtRemarks.Text, ViewState["SA"].ToString(),
                                ViewState["AS"].ToString(), Session["UserID"].ToString(), hdnTransID.Value);
                        }
                        ddlProject.SelectedValue = "-1"; ddlEmployee.SelectedValue = "-1";
                        PMC.BindGetDebitorList(GridView1, ddlProject.SelectedValue.ToString(), Session["UserID"].ToString());

                        string scripts = "alert('Data insert successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill suggest amount.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select user.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly select project.');";
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

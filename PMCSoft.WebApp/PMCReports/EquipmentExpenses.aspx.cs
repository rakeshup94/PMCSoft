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

public partial class PMCReports_EquipmentExpenses : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
    DataTable DT = new DataTable();
    string ExpID = string.Empty;
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
            PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void BindR()
    {
        try
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("SNo", typeof(int)));
            dt.Columns.Add(new DataColumn("EquipmentDetail", typeof(string)));
            dt.Columns.Add(new DataColumn("PMRepairs", typeof(string)));
            dt.Columns.Add(new DataColumn("PMFuel", typeof(string)));
            dt.Columns.Add(new DataColumn("CMRepairs", typeof(string)));
            dt.Columns.Add(new DataColumn("CMFuel", typeof(string)));
            dt.Columns.Add(new DataColumn("UTRepairs", typeof(string)));
            dt.Columns.Add(new DataColumn("UTFuel", typeof(string)));
            dr = dt.NewRow();
            dr["SNo"] = 1;
            dr["EquipmentDetail"] = string.Empty;
            dr["PMRepairs"] = string.Empty;
            dr["PMFuel"] = string.Empty;
            dr["CMRepairs"] = string.Empty;
            dr["CMFuel"] = string.Empty;
            dr["UTRepairs"] = string.Empty;
            dr["UTFuel"] = string.Empty;
            dt.Rows.Add(dr);
            Session["Detail"] = dt;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
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
            BindR();
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        AddMore();
    }
    private void AddMore()
    {
        try
        {
            DataTable DL = new DataTable();
            DataRow dr1 = null;
            int x;
            if (Session["Detail"] != null)
            {
                DataTable dt = (DataTable)Session["Detail"];

                DataRow dr = null;
                dt.Clear();
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label lblSNo = (Label)Repeater1.Items[i].FindControl("lblSNo");
                    TextBox txtEquipmentDetail = (TextBox)Repeater1.Items[i].FindControl("txtEquipmentDetail");
                    TextBox txtPMRepairs = (TextBox)Repeater1.Items[i].FindControl("txtPMRepairs");
                    TextBox txtPMFuel = (TextBox)Repeater1.Items[i].FindControl("txtPMFuel");
                    TextBox txtCMRepairs = (TextBox)Repeater1.Items[i].FindControl("txtCMRepairs");
                    TextBox txtCMFuel = (TextBox)Repeater1.Items[i].FindControl("txtCMFuel");
                    TextBox txtUTRepairs = (TextBox)Repeater1.Items[i].FindControl("txtUTRepairs");
                    TextBox txtUTFuel = (TextBox)Repeater1.Items[i].FindControl("txtUTFuel");

                    dr = dt.NewRow();

                    dr["SNo"] = i + 1;
                    dr["EquipmentDetail"] = txtEquipmentDetail.Text;
                    dr["PMRepairs"] = txtPMRepairs.Text;
                    dr["PMFuel"] = txtPMFuel.Text;
                    dr["CMRepairs"] = txtCMRepairs.Text;
                    dr["CMFuel"] = txtCMFuel.Text;
                    dr["UTRepairs"] = txtUTRepairs.Text;
                    dr["UTFuel"] = txtUTFuel.Text;

                    dt.Rows.Add(dr);
                }

                dr = dt.NewRow();

                dr["SNo"] = dt.Rows.Count + 1;
                dr["EquipmentDetail"] = string.Empty;
                dr["PMRepairs"] = string.Empty;
                dr["PMFuel"] = string.Empty;
                dr["CMRepairs"] = string.Empty;
                dr["CMFuel"] = string.Empty;
                dr["UTRepairs"] = string.Empty;
                dr["UTFuel"] = string.Empty;

                dt.Rows.Add(dr);
                Session["Detail"] = dt;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                {
                    Label lblSNo = (Label)Repeater1.Items[t].FindControl("lblSNo");
                    TextBox txtEquipmentDetail = (TextBox)Repeater1.Items[t].FindControl("txtEquipmentDetail");
                    TextBox txtPMRepairs = (TextBox)Repeater1.Items[t].FindControl("txtPMRepairs");
                    TextBox txtPMFuel = (TextBox)Repeater1.Items[t].FindControl("txtPMFuel");
                    TextBox txtCMRepairs = (TextBox)Repeater1.Items[t].FindControl("txtCMRepairs");
                    TextBox txtCMFuel = (TextBox)Repeater1.Items[t].FindControl("txtCMFuel");
                    TextBox txtUTRepairs = (TextBox)Repeater1.Items[t].FindControl("txtUTRepairs");
                    TextBox txtUTFuel = (TextBox)Repeater1.Items[t].FindControl("txtUTFuel");

                    txtEquipmentDetail.Text = dt.Rows[t]["EquipmentDetail"].ToString();
                    txtPMRepairs.Text = dt.Rows[t]["PMRepairs"].ToString();
                    txtPMFuel.Text = dt.Rows[t]["PMFuel"].ToString();
                    txtCMRepairs.Text = dt.Rows[t]["CMRepairs"].ToString();
                    txtCMFuel.Text = dt.Rows[t]["CMFuel"].ToString();
                    txtUTRepairs.Text = dt.Rows[t]["UTRepairs"].ToString();
                    txtUTFuel.Text = dt.Rows[t]["UTFuel"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Home.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int check = 0;
            for (int j = 0; j < Repeater1.Items.Count; j++)
            {
                TextBox txtEquipmentDetail = (TextBox)Repeater1.Items[j].FindControl("txtEquipmentDetail");
                TextBox txtPMRepairs = (TextBox)Repeater1.Items[j].FindControl("txtPMRepairs");
                TextBox txtPMFuel = (TextBox)Repeater1.Items[j].FindControl("txtPMFuel");
                TextBox txtCMRepairs = (TextBox)Repeater1.Items[j].FindControl("txtCMRepairs");
                TextBox txtCMFuel = (TextBox)Repeater1.Items[j].FindControl("txtCMFuel");
                TextBox txtUTRepairs = (TextBox)Repeater1.Items[j].FindControl("txtUTRepairs");
                TextBox txtUTFuel = (TextBox)Repeater1.Items[j].FindControl("txtUTFuel");
                if (txtEquipmentDetail.Text == "" || txtPMRepairs.Text == "" || txtPMFuel.Text == "" || txtCMRepairs.Text == "" || txtCMFuel.Text == "" || txtUTRepairs.Text == "" || txtUTFuel.Text == "")
                {
                    check = 1;
                    break;
                }
            }
            if (check == 0)
            {
                PMC.GetMaxIDForExpID(Session["CompID"].ToString(), out ExpID);
                for (int k = 0; k < Repeater1.Items.Count; k++)
                {
                    TextBox txtEquipmentDetail = (TextBox)Repeater1.Items[k].FindControl("txtEquipmentDetail");
                    TextBox txtPMRepairs = (TextBox)Repeater1.Items[k].FindControl("txtPMRepairs");
                    TextBox txtPMFuel = (TextBox)Repeater1.Items[k].FindControl("txtPMFuel");
                    TextBox txtCMRepairs = (TextBox)Repeater1.Items[k].FindControl("txtCMRepairs");
                    TextBox txtCMFuel = (TextBox)Repeater1.Items[k].FindControl("txtCMFuel");
                    TextBox txtUTRepairs = (TextBox)Repeater1.Items[k].FindControl("txtUTRepairs");
                    TextBox txtUTFuel = (TextBox)Repeater1.Items[k].FindControl("txtUTFuel");

                    PMC.InsertEquipmentExpenses(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), ExpID.ToString(), txtDate.Text, 
                        txtEquipmentDetail.Text, "", txtPMRepairs.Text, txtPMFuel.Text, "", txtCMRepairs.Text, txtCMFuel.Text, "", txtUTRepairs.Text, 
                        txtUTFuel.Text, Session["UserID"].ToString());
                }
            }
            else
            {
                string scripts = "alert('Kindly fill all details. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
}

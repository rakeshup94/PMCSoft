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

public partial class Admin_AddItemGroupMaster : System.Web.UI.Page
{
    BAL.PMC PMC = new BAL.PMC();
    DataTable DT = new DataTable();
    string GroupID = "";
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
                    GetItemGroup();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void GetItemGroup()
    {
        try
        {
            PMC.BindGetItemGroup(GVGroup);
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Home.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text != "")
            {
                if (txtCode.Text != "")
                {
                    DT = PMCApp.GetDataTableWithOneStringValue("GetGroupName", txtName.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Group name is already exists.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        DT = PMCApp.GetDataTableWithTwoStringValue("GetGroupCode", txtName.Text, txtCode.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Group code is already exists.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            PMC.GetMaxIDForItemGroupID(Session["CompID"].ToString(), out GroupID);
                            PMC.InsertItemGroupMaster(Session["CompID"].ToString(), txtName.Text, txtCode.Text, Session["UserID"].ToString(), GroupID.ToString());
                            txtName.Text = ""; txtCode.Text = "";
                            GetItemGroup();
                            string scripts = "alert('Insert Successfully.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill group code.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly fill group name.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void GVGroup_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)GVGroup.Rows[e.RowIndex];
            TextBox txtGroupCode = (TextBox)row.FindControl("txtGroupCode");
            TextBox txtGroupName = (TextBox)row.FindControl("txtGroupName");
            HiddenField hdnTID = (HiddenField)row.FindControl("hdnTransID");

            if (txtGroupName.Text != "")
            {
                if (txtGroupCode.Text != "")
                {
                    DT = PMCApp.GetDataTableWithTwoStringValue("GetUnitCode", txtGroupName.Text, txtGroupCode.Text);
                    if (DT.Rows.Count > 0)
                    {
                        string scripts = "alert('Group code is already exists for this name.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                    else
                    {
                        PMC.UpdateUnit(txtGroupName.Text, txtGroupCode.Text, hdnTID.Value);
                        GVGroup.EditIndex = -1;
                        GetItemGroup();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill group code.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly fill group name.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void GVGroup_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVGroup.EditIndex = e.NewEditIndex;
        GetItemGroup();
    }
    protected void GVGroup_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVGroup.EditIndex = -1;
        GetItemGroup();
    }
}

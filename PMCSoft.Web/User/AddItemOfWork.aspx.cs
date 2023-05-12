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

public partial class User_AddItemOfWork : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
    DataTable DT = new DataTable();
    string ItemID = "";
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
                    GetItem();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void GetItem()
    {
        try
        {
            PMC.BindItem(GridView1);
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetItem();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetItem();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            TextBox txtItem = (TextBox)row.FindControl("txtItemOfWork");
            HiddenField Hiddenfield1 = (HiddenField)row.FindControl("Hiddenfield1");

            if (txtItem.Text != "")
            {
                DT = PMCApp.GetDataTableWithOneStringValue("GetItem", txtItem.Text);
                if (DT.Rows.Count > 0)
                {
                    string scripts = "alert('Item of work already exists.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                else
                {
                    PMC.UpdateItemOfWork(Hiddenfield1.Value, txtItem.Text);
                    GridView1.EditIndex = -1;
                    GetItem();
                }
            }
            else
            {
                string scripts = "alert('Kindly fill Item of work.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
        Response.Redirect("~/User/Home.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtItemName.Text != "")
            {
                DT = PMCApp.GetDataTableWithOneStringValue("GetItem", txtItemName.Text);
                if (DT.Rows.Count > 0)
                {
                    string scripts = "alert('This item of work is already exists.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                else
                {
                    PMC.GetMaxIDForItemID(Session["CompID"].ToString(), out ItemID);
                    PMC.InsertItemOfWork(Session["CompID"].ToString(), ItemID.ToString(), txtItemName.Text, Session["UserID"].ToString());

                    txtItemName.Text = "";
                    GetItem();
                    string scripts = "alert('Insert Successfully.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly fill item of work.');";
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

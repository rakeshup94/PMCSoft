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
public partial class Admin_Permission : System.Web.UI.Page
{
   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
           BindProject();
           GetMenuHeader();
        }
    }

    public void GetMenuHeader()
    {
        Hashtable ht = new Hashtable();
       

       DataTable dt = PMCApp.Get(ht, "GetMenuHeader");
       
        if (dt.Rows.Count > 0)
        {
            GridView4.DataSource = dt;
            GridView4.DataBind();
        }
        
    }

    
    public void BindProject()
    {
        try
        {
            Hashtable ht = new Hashtable();


            ATCommon.FillDrpDown(ddlProject, PMCApp.Get(ht, "GetProjectByAdmin"), "Select Project", "ProjectName", "PRJID", "0");
            ddluser.Items.Insert(0, new ListItem("Select User", "0"));

        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }



    }

    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        Hashtable ht = new Hashtable();

        ht.Add("@ProjectID", ddlProject.SelectedValue);
        ATCommon.FillDrpDown(ddluser, PMCApp.Get(ht, "GetEmpByProject"), "Select User", "Name", "EmpID", "0");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Home.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            int check = 0, check2 = 0;

            if (ddlProject.SelectedValue != "0")
            {
                if (ddluser.SelectedValue != "0")
                {
                    for (int j = 0; j < GridView4.Rows.Count; j++)
                    {
                        HiddenField hdnHeaderTransId = (HiddenField)GridView4.Rows[j].FindControl("hdnHeaderTransId");
                        CheckBox Chckheader = (CheckBox)GridView4.Rows[j].FindControl("Chckheader");
                       string ss= hdnHeaderTransId.Value;
                        if (Chckheader.Checked == true)
                        {
                            GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                            for (int k = 0; k < GVPermission.Rows.Count; k++)
                            {
                                HiddenField hdnTransID = (HiddenField)GVPermission.Rows[k].FindControl("hdnTransID");
                                CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[k].FindControl("chkSelectRow");
                                if (chkSelectRow.Checked == true)
                                {
                                    Hashtable ht = new Hashtable();
                                    
                                        
                                    ht.Add("@TransId", hdnTransID.Value);
                                    ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);
                                    ht.Add("@MenuHeaderValue", Chckheader.Checked);
                                    ht.Add("@PageTransId", hdnTransID.Value);
                                    ht.Add("@ProjectId", ddlProject.SelectedValue);
                                    ht.Add("@UserId", ddluser.SelectedValue);
                                    ht.Add("@Pagevalue", chkSelectRow.Checked);
                                    PMCApp.Get(ht, "InsertPagePermission");
                                   

                                }
                                else
                                {
                                    Hashtable ht = new Hashtable();


                                    ht.Add("@TransId", hdnTransID.Value);
                                    ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);
                                    ht.Add("@MenuHeaderValue", Chckheader.Checked);
                                    ht.Add("@PageTransId", hdnTransID.Value);
                                    ht.Add("@ProjectId", ddlProject.SelectedValue);
                                    ht.Add("@UserId", ddluser.SelectedValue);
                                    ht.Add("@Pagevalue", chkSelectRow.Checked);
                                    PMCApp.Get(ht, "InsertPagePermission");
                                   
                                }

                            }
                            
                        
                              

                           
                        }
                       if (Chckheader.Checked == false)
                        {
                            GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                            for (int k = 0; k < GVPermission.Rows.Count; k++)
                            {
                                HiddenField hdnTransID = (HiddenField)GVPermission.Rows[k].FindControl("hdnTransID");
                                CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[k].FindControl("chkSelectRow");
                                if (chkSelectRow.Checked == false)
                                {
                                    Hashtable ht = new Hashtable();
                                    
                                        
                                    ht.Add("@TransId", hdnTransID.Value);
                                    ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);
                                    ht.Add("@MenuHeaderValue", Chckheader.Checked);
                                    ht.Add("@PageTransId", hdnTransID.Value);
                                    ht.Add("@ProjectId", ddlProject.SelectedValue);
                                    ht.Add("@UserId", ddluser.SelectedValue);
                                    ht.Add("@Pagevalue", chkSelectRow.Checked);
                                    PMCApp.Get(ht, "InsertPagePermission");

                                }
                               

                            }
                            
                        
                              

                           
                        
                        }
                     

                    }
                    string scripts = "alert('Insert Successfully.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    GetMenuHeader();
                }
                else
                {
                    string scripts = "alert('Kindly Select User ');";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly Select Project ');";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

        catch (Exception ex)
        {
            string scripts = "alert('Some error occured data not saved.......!!!!!!! ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }

  
   
    protected void Chckheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chk.Parent.Parent;
        GridView GV = (GridView)row.FindControl("GVPermission");
        HiddenField hdnHeaderTransId = (HiddenField)row.FindControl("hdnHeaderTransId");
       

        if (chk.Checked == true)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);
            DataTable dt = PMCApp.Get(ht, "GetSubMenu");
            if (dt.Rows.Count > 0)
            {
                GV.DataSource = dt;
                GV.DataBind();
            }
        }
        else
        {
            chk.Checked = false;
            for (int k = 0; k < GV.Rows.Count; k++)
            {
                CheckBox chkSelectAll = (CheckBox)GV.Rows[k].FindControl("chkSelectRow");
                CheckBox chkSelectRow = (CheckBox)GV.Rows[k].FindControl("chkSelectRow");
                chkSelectAll.Checked = false;
                chkSelectRow.Checked = false;
            }

        }
    }
    protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hdnHeaderTransId = e.Row.FindControl("hdnHeaderTransId") as HiddenField;
                GridView GVPermission = e.Row.FindControl("GVPermission") as GridView;
                Hashtable ht = new Hashtable();
                ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);
                DataTable dt = PMCApp.Get(ht, "GetSubMenu");
                if (dt.Rows.Count > 0)
                {
                    GVPermission.DataSource = dt;
                    GVPermission.DataBind();
                }
                
                
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }

    protected void ddluser_SelectedIndexChanged(object sender, EventArgs e)
    {
        for (int j = 0; j < GridView4.Rows.Count; j++)
        {
            HiddenField hdnHeaderTransId = (HiddenField)GridView4.Rows[j].FindControl("hdnHeaderTransId");
            CheckBox Chckheader = (CheckBox)GridView4.Rows[j].FindControl("Chckheader");
            Hashtable ht = new Hashtable();
            ht.Add("@ProjectId", ddlProject.SelectedValue);
            ht.Add("@UserId", ddluser.SelectedValue);
            ht.Add("@MenuHeaderId", hdnHeaderTransId.Value);


            DataTable dt = PMCApp.Get(ht, "GetMenuHeaderAdmin");

            if (dt.Rows.Count > 0)
            {
                for (int k = 0; k < dt.Rows.Count; k++)
                {
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Project" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add Project" && dt.Rows[k]["PageValue"].Equals("True"))
                            {
                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Project" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Project" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Project" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }

                        }

                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Project" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add Project" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;
                            }
                        }
                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Item Of Work" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add Item of Work" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Item of Work" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }

                        }

                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Item Of Work" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");

                            if (dt.Rows[k]["PageName"].ToString() == "Add Item of Work" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }

                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Work Programe" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Work Programe" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Work Programe" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Work Programe" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Work Programe" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Approval" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Approval" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Morning Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Morning Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }


                        }

                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Work Programe" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff Attendance" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add Staff Attendance" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Staff Attendance" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff Attendance" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Finance" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add Party/Vendor" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Party/Vendor" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Type" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Type" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List of Approval" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List of Approval" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Reciept" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Reciept" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Aquisition" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Aquisition" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Finance" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Inventory" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Material Received" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Received" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Stock Opening" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Stock Opening" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Stock Opening" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Stock Opening" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }



                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Inventory" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "PMC Report" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Month VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Month VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }



                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "PMC Report" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "RA Bill" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Add New RA Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add New RA Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Submited Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Submited Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Certified Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Certified Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }



                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "RA Bill" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }
                    if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                    {
                        Chckheader.Checked = true;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                chkSelectRow.Checked = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                chkSelectRow.Checked = false;

                            }


                        }
                    }
                    else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                    {
                        Chckheader.Checked = false;
                        GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                        for (int l = 0; l < GVPermission.Rows.Count; l++)
                        {
                            HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                            CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                            chkSelectRow.Checked = false;
                        }

                    }

                }
            }
            else
            {
                Chckheader.Checked = false;
                GridView GVPermission = (GridView)GridView4.Rows[j].FindControl("GVPermission");
                for (int l = 0; l < GVPermission.Rows.Count; l++)
                {
                    HiddenField hdnTransID = (HiddenField)GVPermission.Rows[l].FindControl("hdnTransID");
                    CheckBox chkSelectRow = (CheckBox)GVPermission.Rows[l].FindControl("chkSelectRow");
                    chkSelectRow.Checked = false;
                }
            }
        }
    }
}

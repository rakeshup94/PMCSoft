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
public partial class Inventory_EnterStockDetails : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
    string AListID = string.Empty;

    DataTable DT = new DataTable();
    string ItemID = "";
    protected void Page_Load(object sender, EventArgs e)
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
    public void BindProject()
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

    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Panel1.Visible = true;
            BindGrid();
            GetStockOpeningDate();
        }
        catch (Exception ex)
        {

        }
    }
    public void GetStockOpeningDate()
    {
        try
        {
            Hashtable ht = new Hashtable();
            ht.Add("@projectId", ddlProject.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetLastStockOpeningDateByProject");
            if (dt.Rows.Count > 0)
            {
                lblDate.Text = dt.Rows[0]["StockOpeningDate"].ToString();
                lblDate1.Visible = true;
            }
            else
            {
                lblDate.Text = "";
                lblDate1.Visible = false;
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void BindGrid()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("SNo", typeof(int)));
        dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
        dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
        dt.Columns.Add(new DataColumn("Unit", typeof(string)));
        dt.Columns.Add(new DataColumn("ItemMake", typeof(string)));
        dt.Columns.Add(new DataColumn("PartNo", typeof(string)));
        dt.Columns.Add(new DataColumn("Qty", typeof(string)));
        dt.Columns.Add(new DataColumn("Rate", typeof(string)));
        dt.Columns.Add(new DataColumn("Description", typeof(string)));
        dr = dt.NewRow();
        dr["SNo"] = 1;
        dr["ItemCode"] = string.Empty;
        dr["ItemName"] = string.Empty;
        dr["Unit"] = string.Empty;
        dr["ItemMake"] = string.Empty;
        dr["PartNo"] = string.Empty;
        dr["Qty"] = string.Empty;
        dr["Rate"] = string.Empty;
        dr["Description"] = string.Empty;
        dt.Rows.Add(dr);

        Session["Detail"] = dt;
        GVMaterialReceive.DataSource = dt;
        GVMaterialReceive.DataBind();
    }
    protected void GVMaterialReceive_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlItemCode = e.Row.FindControl("ddlItemCode") as DropDownList;
                DropDownList ddlItemName = e.Row.FindControl("ddlItemName") as DropDownList;
                DropDownList ddlUnit = e.Row.FindControl("ddlUnit") as DropDownList;
                
                // PMC.BindGetGroupDDL(ddlItemCode);
                DataTable dt = (DataTable)PMC.BindItemGroup();
                if (dt.Rows.Count > 0)
                {
                    ddlItemCode.DataSource = dt;
                    ddlItemCode.DataTextField = "GroupName";
                    ddlItemCode.DataValueField = "ItemGroupID";
                    ddlItemCode.DataBind();
                    ddlItemCode.Items.Insert(0, new ListItem("Select Item Group", "-1"));
                 
                    ddlItemName.Items.Insert(0, new ListItem("Select Item", "-1"));
                    ddlUnit.Items.Insert(0, new ListItem("Select Unit", "-1"));
                }





            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlItemCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {


            GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;
            DropDownList ddl = (DropDownList)sender;
            DropDownList ddlsecond = gvr.FindControl("ddlItemName") as DropDownList;
            // So in this you can get second drodpdown and bind your data

            ddlsecond.DataSource = PMC.BindItemName(ddl.SelectedValue);
            ddlsecond.DataTextField = "ItemName";
            ddlsecond.DataValueField = "ItemID";
            ddlsecond.DataBind();
            ddlsecond.Items.Insert(0, new ListItem("Select Item", "-1"));

            
            
                
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }

    }
    protected void ddlItemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;
            DropDownList ddl = (DropDownList)sender;
            DropDownList ddlsecond = gvr.FindControl("ddlUnit") as DropDownList;
            // So in this you can get second drodpdown and bind your data

            ddlsecond.DataSource = PMC.BindUnitName(ddl.SelectedValue);
            ddlsecond.DataTextField = "UnitName";
            ddlsecond.DataValueField = "UnitID";
            ddlsecond.DataBind();
            ddlsecond.Items.Insert(0, new ListItem("Select Unit", "-1"));
            Label TxtItemMake = gvr.FindControl("TxtItemMake") as Label;
            Label TxtpartNo = gvr.FindControl("TxtpartNo") as Label;
            Hashtable ht = new Hashtable(); 
            ht.Add("@ItemID", ddl.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetItemBypartno");
            if (dt.Rows.Count > 0)
            {
                TxtItemMake.Text = dt.Rows[0]["Make"].ToString();
                TxtpartNo.Text = dt.Rows[0]["PartNo"].ToString();
            }
           
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
            int check = 0, check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0, check7 = 0;
            int check8 = 0, check9 = 0, check10 = 0, check11 = 0;
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemCode");
                if (ddlItemCode.SelectedValue == "-1")
                {
                    check = 1;
                    break;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemName");
                if (ddlItemName.SelectedValue == "-1")
                {
                    check1 = 1;
                    break;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlUnit");
                if (ddlUnit.SelectedValue == "-1")
                {
                    check2 = 1;
                    break;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                Label TxtItemMake = (Label)GVMaterialReceive.Rows[j].FindControl("TxtItemMake");
                if (TxtItemMake.Text == "")
                {
                    check3 = 1;
                    break;
                }
                else
                {
                    check3 = 0;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                Label TxtpartNo = (Label)GVMaterialReceive.Rows[j].FindControl("TxtpartNo");
                if (TxtpartNo.Text == "")
                {
                    check4 = 1;
                    break;
                }
                else
                {
                    check4 = 0;
                }

            }

            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtQuantity");
                if (txtQuantity.Text == "")
                {
                    check5 = 1;
                    break;
                }
                else
                {
                    check5 = 0;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                TextBox txtRate = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRate");
                if (txtRate.Text == "")
                {
                    check6 = 1;
                    break;
                }
                else
                {
                    check6 = 0;
                }

            }
            for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
            {
                TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRemarks");
                if (txtRemarks.Text == "")
                {
                    check7 = 1;
                    break;
                }
                else
                {
                    check7 = 0;
                }

            }

            if (ddlProject.SelectedValue != "-1")
            {
                if (lblDate.Text != "")
                {
                    if (check == 0)
                    {
                        if (check1 == 0)
                        {
                            if (check2 == 0)
                            {
                                if (check3 == 0)
                                {
                                    if (check4 == 0)
                                    {
                                        if (check5 == 0)
                                        {
                                            if (check6 == 0)
                                            {
                                                if (check7 == 0)
                                                {
                                                    for (int j = 0; j < GVMaterialReceive.Rows.Count; j++)
                                                    {
                                                        DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemCode");
                                                        DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlItemName");
                                                        DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[j].FindControl("ddlUnit");
                                                        Label TxtItemMake = (Label)GVMaterialReceive.Rows[j].FindControl("TxtItemMake");
                                                        Label TxtpartNo = (Label)GVMaterialReceive.Rows[j].FindControl("TxtpartNo");
                                                        TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtQuantity");
                                                        TextBox txtRate = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRate");
                                                        TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[j].FindControl("txtRemarks");

                                                        Hashtable ht1 = new Hashtable();
                                                        ht1.Add("@ItemGroupID", ddlItemCode.SelectedValue);
                                                        ht1.Add("@ItemID", ddlItemName.SelectedValue);
                                                        ht1.Add("@UnitID", ddlUnit.SelectedValue);
                                                        ht1.Add("@LastOpeningDate", lblDate.Text);
                                                        ht1.Add("@ProjectId", ddlProject.SelectedValue);

                                                        DataTable dt = PMCApp.Get(ht1, "CheckStockItem");
                                                        if (dt.Rows.Count > 0)
                                                        {
                                                            string scripts = "alert('Already exists .');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                        else
                                                        {
                                                            PMC.GetMaxIDForOpeningStockFunction(Session["CompID"].ToString(), out ItemID);
                                                            Hashtable ht = new Hashtable();
                                                            ht.Add("@CompanyId", Session["CompID"].ToString());
                                                            ht.Add("@OpeningStockId", ItemID.ToString());
                                                            ht.Add("@ProjectId", ddlProject.SelectedValue);
                                                            ht.Add("@LastOpeningDate", lblDate.Text);

                                                            ht.Add("@ItemGroupID", ddlItemCode.SelectedValue);
                                                            ht.Add("@ItemID", ddlItemName.SelectedValue);
                                                            ht.Add("@UnitID", ddlUnit.SelectedValue);
                                                            ht.Add("@Make", TxtItemMake.Text);
                                                            ht.Add("@PartNo", TxtpartNo.Text);

                                                            ht.Add("@Qty", txtQuantity.Text);
                                                            ht.Add("@Rate", txtRate.Text);
                                                            ht.Add("@Description", txtRemarks.Text);
                                                            ht.Add("@CreatedBy", Session["UserId"].ToString());

                                                            PMCApp.Get(ht, "InsertOpeningStock");
                                                        }

                                                    }
                                                    string scripts1 = "alert('Insert Successfully .');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                    ddlProject.SelectedValue = "-1"; lblDate.Text = "";
                                                    BindGrid();
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly Fill Description. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly Fill Rate. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly Fill Qty. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Fill Part No ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly Fill Item Make. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly Select Unit. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Select Item Name. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Select Item Group. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }


                }
                else
                {
                    string scripts = "alert('Last Opening Date Not Show. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }


            }
            else
            {
                string scripts = "alert('Kindly Select Project. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }

    }
    protected void btnAddMore_Click(object sender, EventArgs e)
    {
         
         
        TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtQuantity");
            TextBox txtRate = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtRate");
         TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[0].FindControl("txtRemarks");
            if (txtQuantity.Text == "" || txtRate.Text == "" || txtRemarks.Text == "")
            {
                string scripts = "alert('Fill All Value .');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            else
            {
                AddMore();
            }
           
      
               
            }
           
       


    private void AddMore()
    {
        try
        {
            DataTable DL = new DataTable();
            DataTable Dlitem = new DataTable();
            DataTable Dlqty = new DataTable();
            DataRow dr1 = null;
            DataRow dr2 = null;
            DataRow dr3 = null;

            int x;
            if (Session["Detail"] != null)
            {
                DataTable dt = (DataTable)Session["Detail"];

                DataRow dr = null;
                dt.Clear();
                for (int i = 0; i < GVMaterialReceive.Rows.Count; i++)
                {
                    DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlItemCode");
                    DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlItemName");
                    DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[i].FindControl("ddlUnit");
                    Label TxtItemMake = (Label)GVMaterialReceive.Rows[i].FindControl("TxtItemMake");
                    Label TxtpartNo = (Label)GVMaterialReceive.Rows[i].FindControl("TxtpartNo");
                    TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtQuantity");
                    TextBox txtRate = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtRate");
                    TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[i].FindControl("txtRemarks");

                    dr = dt.NewRow();

                    dr["SNo"] = i + 1;
                    dr["ItemCode"] = ddlItemCode.SelectedItem.Text;
                    dr["ItemName"] = ddlItemName.SelectedItem.Text;
                    dr["Unit"] = ddlUnit.SelectedItem.Text;
                    dr["Qty"] = txtQuantity.Text;
                    dr["ItemMake"] = TxtItemMake.Text;
                    dr["PartNo"] = TxtpartNo.Text;
                    dr["Rate"] = txtRate.Text;
                    dr["Description"] = txtRemarks.Text;
                    dt.Rows.Add(dr);

                    GetDL(i);

                    DL = ViewState["DL" + i.ToString()] as DataTable;

                    for (x = 0; x < ddlItemCode.Items.Count; x++)
                    {
                        dr1 = DL.NewRow();
                        dr1["Text"] = ddlItemCode.Items[x].Text.ToString();
                        dr1["Id"] = ddlItemCode.Items[x].Value.ToString();
                        DL.Rows.Add(dr1);
                    }
                    ViewState["DL" + i.ToString()] = DL;
                   
                }

                dr = dt.NewRow();


                dr["SNo"] = dt.Rows.Count + 1;
                dr["ItemCode"] = string.Empty;
                dr["ItemName"] = string.Empty;
                dr["Unit"] = string.Empty;
                dr["Qty"] = string.Empty;
                dr["ItemMake"] = string.Empty;
                dr["PartNo"] = string.Empty;
                dr["Rate"] = string.Empty;
                dr["Description"] = string.Empty;
                dt.Rows.Add(dr);
                Session["Detail"] = dt;
                GVMaterialReceive.DataSource = dt;
                GVMaterialReceive.DataBind();

                for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                {
                    Label lblSNo = (Label)GVMaterialReceive.Rows[t].FindControl("lblSNo");
                    DropDownList ddlItemCode = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlItemCode");
                    DropDownList ddlItemName = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlItemName");
                    DropDownList ddlUnit = (DropDownList)GVMaterialReceive.Rows[t].FindControl("ddlUnit");
                    Label TxtItemMake = (Label)GVMaterialReceive.Rows[t].FindControl("TxtItemMake");
                    Label TxtpartNo = (Label)GVMaterialReceive.Rows[t].FindControl("TxtpartNo");

                    TextBox txtQuantity = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtQuantity");
                    TextBox txtRate = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtRate");
                    TextBox txtRemarks = (TextBox)GVMaterialReceive.Rows[t].FindControl("txtRemarks");
                    ddlItemCode.Items.FindByText(dt.Rows[t]["ItemCode"].ToString()).Selected = true;
                    
                    ddlItemName.DataSource = PMC.BindItemName(ddlItemCode.SelectedValue);
                    ddlItemName.DataTextField = "ItemName";
                    ddlItemName.DataValueField = "ItemID";
                    ddlItemName.DataBind();
                    ddlItemName.Items.Insert(0, new ListItem("Select Item", "-1"));
                  
                    ddlItemName.Items.FindByText(dt.Rows[t]["ItemName"].ToString()).Selected = true;
                    
                    ddlUnit.DataSource = PMC.BindUnitName(ddlItemName.SelectedValue);
                    ddlUnit.DataTextField = "UnitName";
                    ddlUnit.DataValueField = "UnitID";
                    ddlUnit.DataBind();
                    ddlUnit.Items.Insert(0, new ListItem("Select Unit", "-1"));
                  
                    ddlUnit.Items.FindByText(dt.Rows[t]["Unit"].ToString()).Selected = true;

                    
                    TxtItemMake.Text = dt.Rows[t]["ItemMake"].ToString();
                    TxtpartNo.Text = dt.Rows[t]["PartNo"].ToString();
                    txtQuantity.Text = dt.Rows[t]["Qty"].ToString();
                    txtRate.Text = dt.Rows[t]["Rate"].ToString();
                    txtRemarks.Text = dt.Rows[t]["Description"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    private void GetDL(int i)
    {
        try
        {
            DataTable DL = new DataTable();
            DL.Columns.Add(new DataColumn("Text", typeof(string)));
            DL.Columns.Add(new DataColumn("Id", typeof(string)));
            ViewState["DL" + i.ToString()] = DL;
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    private void Getddlunit(int i)
    {
        try
        {
            DataTable ddlunitdt = new DataTable();
            ddlunitdt.Columns.Add(new DataColumn("Text", typeof(string)));
            ddlunitdt.Columns.Add(new DataColumn("Id", typeof(string)));
            ViewState["ddlunitdt" + i.ToString()] = ddlunitdt;
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    private void GetRBL(int i)
    {
        try
        {
            DataTable datatableRBL = new DataTable();
            datatableRBL.Columns.Add(new DataColumn("Text", typeof(string)));
            datatableRBL.Columns.Add(new DataColumn("Id", typeof(string)));
            ViewState["RBL" + i.ToString()] = datatableRBL;
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


}

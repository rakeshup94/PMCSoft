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

public partial class User_ViewEditWorkProgramme : System.Web.UI.Page
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
            lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
            PMC.BindGetEmpProjDL(DataList1, Session["UserID"].ToString());
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

                PMC.BindGetViewWPDate(GridView1, hdnProjectID.Value.ToString(), Session["UserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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

                DT = PMCApp.GetDataTableWithThreeStringValue("GetViewWPForApproval", hdnProjectID.Value.ToString(), Session["UserID"].ToString(), hdnWPID1.Value);
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
                    hdnProjID.Value = hdnProjectID.Value;
                    ViewState["WPID"] = DT.Rows[0]["WPID"].ToString();
                    ViewState["EngInCharge"] = DT.Rows[0]["EngInCharge"].ToString();
                    ViewState["ItemID"] = DT.Rows[0]["ItemID"].ToString();
                    ViewState["ItemOfWork"] = DT.Rows[0]["ItemOfWork"].ToString();
                    ViewState["Supervisor"] = DT.Rows[0]["Supervisor"].ToString();
                    ViewState["Foreman"] = DT.Rows[0]["Foreman"].ToString();
                    ViewState["Engineer"] = DT.Rows[0]["Engineer"].ToString();
                    ViewState["ForwardTo"] = DT.Rows[0]["ForwardTo"].ToString();
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
                    hdnProjID.Value = "";

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
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            ModalPopupExtender1.Hide();
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
            int check = 0;
            for (int j = 0; j < Repeater1.Items.Count; j++)
            {
                TextBox txtSK = (TextBox)Repeater1.Items[j].FindControl("txtSK");
                TextBox txtSEMI = (TextBox)Repeater1.Items[j].FindControl("txtSEMI");
                TextBox txtUNSK = (TextBox)Repeater1.Items[j].FindControl("txtUNSK");
                TextBox txtOT = (TextBox)Repeater1.Items[j].FindControl("txtOT");
                if (txtSK.Text == "" || txtSEMI.Text == "" || txtUNSK.Text == "" || txtOT.Text == "")
                {
                    check = 1;
                    break;
                }
            }
            if (check == 0)
            {
                for (int k = 0; k < Repeater1.Items.Count; k++)
                {
                    HiddenField hdnItemID = (HiddenField)Repeater1.Items[k].FindControl("hdnItemID");
                    HiddenField hdnTransID = (HiddenField)Repeater1.Items[k].FindControl("hdnTransID");
                    Label lblItemOfWork = (Label)Repeater1.Items[k].FindControl("lblItemOfWork");
                    Label lblArea = (Label)Repeater1.Items[k].FindControl("lblArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[k].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[k].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[k].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[k].FindControl("txtOT");

                    PMC.UpdateWorkProgramme(txtSK.Text, txtSEMI.Text, txtUNSK.Text, txtOT.Text, hdnProjID.Value, hdnWPID.Value, hdnTransID.Value);
                    ModalPopupExtender1.Hide();
                }
                GetD();
                Panel1.Visible = false;
                string scripts = "alert('Work programme update successfully.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
            else
            {
                string scripts = "alert('Kindly fill labour detail.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            ModalPopupExtender1.Show();
        }
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        try
        {
            decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0, SumOT = 0, SumTotal = 0;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");
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

            ViewState["Sum"] = 1;
            ModalPopupExtender1.Show();
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void Get()
    {
        try
        {
            decimal SumSK = 0, SumSEMI = 0, SumUNSK = 0, SumOT = 0, SumTotal = 0;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");
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
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            //==== This case will fire when link button placed
            //==== inside repeater having command name "Delete" is clicked.

            case ("DeleteWp"):

                int id = Convert.ToInt32(e.CommandArgument);
                Hashtable ht = new Hashtable();
                ht.Add("@TransId", id);
                PMCApp.Get(ht, "DeleteWorkPrograms");
                foreach (DataListItem li in DataList1.Items)
                {

                    Label lblProjectName = (Label)li.FindControl("lblProjectName");
                    HiddenField hdnProjectID = (HiddenField)li.FindControl("hdnProjectID");
                    GridView GridView1 = (GridView)li.FindControl("GridView1");
                    ModalPopupExtender1.Show();
                    PMC.BindGetViewWPDate(GridView1, hdnProjectID.Value.ToString(), Session["UserID"].ToString());
                    DT = PMCApp.GetDataTableWithThreeStringValue("GetViewWPForApproval", hdnProjID.Value.ToString(), Session["UserID"].ToString(), ViewState["WPID"].ToString());
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
                        hdnProjID.Value = hdnProjID.Value;
                        ViewState["WPID"] = DT.Rows[0]["WPID"].ToString();
                        ViewState["EngInCharge"] = DT.Rows[0]["EngInCharge"].ToString();
                        ViewState["ItemID"] = DT.Rows[0]["ItemID"].ToString();
                        ViewState["ItemOfWork"] = DT.Rows[0]["ItemOfWork"].ToString();
                        ViewState["Supervisor"] = DT.Rows[0]["Supervisor"].ToString();
                        ViewState["Foreman"] = DT.Rows[0]["Foreman"].ToString();
                        ViewState["Engineer"] = DT.Rows[0]["Engineer"].ToString();
                        ViewState["ForwardTo"] = DT.Rows[0]["ForwardTo"].ToString();
                        Repeater1.DataSource = DT;
                        Repeater1.DataBind();
                        Get();
                        ModalPopupExtender2.Hide();
                        ModalPopupExtender1.Show();
                        txtotaddmore.Text = "";
                        txtsemiaddmore.Text = "";
                        txtunskaddmore.Text = "";
                        TxtAreaaddmore.Text = "";
                        txtskaddmore.Text = "";
                        ModalPopupExtender1.Show();
                    }
                  

                }
                break;
        }
    }

    

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
        GetDDLADDMORE();
        
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
    public void GetDDLADDMORE()
    {
       
        Hashtable ht = new Hashtable();

        ATCommon.FillDrpDown(ddlitemworkaddmore, PMCApp.Get(ht, "GetItemOfWork"), "Select", "ItemOfWork", "ItemID", "0");
    }
    protected void BtnSaveADD_Click(object sender, EventArgs e)
    {
        try
        {
          
        ModalPopupExtender1.Show();
        ModalPopupExtender2.Show();
        int check = 0;
        if (ddlitemworkaddmore.SelectedValue != "0")
        {
            if (TxtAreaaddmore.Text != "")
            {
                if (txtskaddmore.Text != "")
                {
                    if (txtsemiaddmore.Text != "")
                    {
                        if (txtunskaddmore.Text != "")
                        {
                            if (txtotaddmore.Text != "")
                            {
                                PMC.InsertWorkProgramme(Session["CompID"].ToString(), hdnProjID.Value, ViewState["WPID"].ToString(), HiddenField2.Value,
                                                                                         ViewState["EngInCharge"].ToString(), lblBlock.Text, ddlitemworkaddmore.SelectedValue, ddlitemworkaddmore.SelectedItem.Text, TxtAreaaddmore.Text,
                                                                     txtskaddmore.Text, txtsemiaddmore.Text, txtunskaddmore.Text, txtotaddmore.Text, ViewState["Supervisor"].ToString(), ViewState["Foreman"].ToString(),
                                                                    ViewState["Engineer"].ToString(), Session["UserID"].ToString(), lblNumber.Text, ViewState["ForwardTo"].ToString());

                                DT = PMCApp.GetDataTableWithThreeStringValue("GetViewWPForApproval", hdnProjID.Value.ToString(), Session["UserID"].ToString(), ViewState["WPID"].ToString());
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
                                    hdnProjID.Value = hdnProjID.Value;
                                    ViewState["WPID"] = DT.Rows[0]["WPID"].ToString();
                                    ViewState["EngInCharge"] = DT.Rows[0]["EngInCharge"].ToString();
                                    ViewState["ItemID"] = DT.Rows[0]["ItemID"].ToString();
                                    ViewState["ItemOfWork"] = DT.Rows[0]["ItemOfWork"].ToString();
                                    ViewState["Supervisor"] = DT.Rows[0]["Supervisor"].ToString();
                                    ViewState["Foreman"] = DT.Rows[0]["Foreman"].ToString();
                                    ViewState["Engineer"] = DT.Rows[0]["Engineer"].ToString();
                                    ViewState["ForwardTo"] = DT.Rows[0]["ForwardTo"].ToString();
                                    Repeater1.DataSource = DT;
                                    Repeater1.DataBind();
                                    Get();
                                    ModalPopupExtender2.Hide();
                                    ModalPopupExtender1.Show();
                                    txtotaddmore.Text = "";
                                    txtsemiaddmore.Text = "";
                                    txtunskaddmore.Text = "";
                                    TxtAreaaddmore.Text = "";
                                    txtskaddmore.Text = "";
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly Fill OT. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Fill UNSK. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly Fill SEMI. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly Fill SK. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly Fill Area. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        else
        {
            string scripts = "alert('Kindly select Item Of Work. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
 }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
       
    }
    protected void BtnCanceladd_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Hide();
        ModalPopupExtender1.Show();
    }
    
    }


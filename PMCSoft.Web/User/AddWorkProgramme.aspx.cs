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
 
using System.Text;

public partial class Admin_AddWorkProgramme : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
    DataTable DT = new DataTable();
    string No = "", WPID = "";
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

                    BindR();

                }
            }
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
            dt.Columns.Add(new DataColumn("ItemOfWork", typeof(string)));
            dt.Columns.Add(new DataColumn("Area", typeof(string)));
            dt.Columns.Add(new DataColumn("SK", typeof(string)));
            dt.Columns.Add(new DataColumn("SEMI", typeof(string)));
            dt.Columns.Add(new DataColumn("UNSK", typeof(string)));
            dt.Columns.Add(new DataColumn("OT", typeof(string)));
            dr = dt.NewRow();
            dr["SNo"] = 1;
            dr["ItemOfWork"] = string.Empty;
            dr["Area"] = string.Empty;
            dr["SK"] = string.Empty;
            dr["SEMI"] = string.Empty;
            dr["UNSK"] = string.Empty;
            dr["OT"] = string.Empty;
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
    public void GetD()
    {
        try
        {
            lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
            PMC.GetNoOfItemWork(out No);
            lblNumber.Text = No.ToString();
            PMC.BindGetEmpProj(ddlProject, Session["UserID"].ToString());

            PMC.BindGetGeneralEmpIDWithEmp(ddlEngInCharge, ddlProject.SelectedValue.ToString());
            PMC.BindGetGeneralEmpIDWithEmp(ddlSupervisor, ddlProject.SelectedValue.ToString());
            PMC.BindGetGeneralEmpIDWithEmp(ddlForeman, ddlProject.SelectedValue.ToString());
            PMC.BindGetGeneralEmpIDWithEmp(ddlEngineer, ddlProject.SelectedValue.ToString());
            PMC.BindGetEmp(ddlForwardTo, ddlProject.SelectedValue.ToString());


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
            int check = 0;
            if (lblNumber.Text != "")
            {
                if (lblDate.Text != "")
                {
                    if (HiddenField2.Value != "")
                    {
                        if (ddlProject.SelectedValue != "-1")
                        {
                            if (ddlEngInCharge.SelectedValue != "-1")
                            {
                                if (txtBlock.Text != "")
                                {
                                    if (ddlForwardTo.SelectedValue != "-1")
                                    {
                                        if (ddlSupervisor.SelectedValue != "-1")
                                        {
                                            if (ddlForeman.SelectedValue != "-1")
                                            {
                                                if (ddlEngineer.SelectedValue != "-1")
                                                {
                                                    for (int j = 0; j < Repeater1.Items.Count; j++)
                                                    {
                                                        DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[j].FindControl("ddlItemOfWork");
                                                        if (ddlItemOfWork.SelectedValue == "-1")
                                                        {
                                                            check = 1;
                                                            break;
                                                        }
                                                    }
                                                    if (check == 0)
                                                    {
                                                        DT = PMCApp.GetDataTableWithOneStringValue("GETDWP", ddlProject.SelectedValue.ToString());
                                                        if (DT.Rows.Count > 0)
                                                        {
                                                            string scripts = "alert('Work programme already exists for this project.');";
                                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        }
                                                        else
                                                        {
                                                            if (ViewState["Sum"] != null)
                                                            {
                                                                PMC.GetMaxIDForWPID(Session["CompID"].ToString(), out WPID);
                                                                for (int k = 0; k < Repeater1.Items.Count; k++)
                                                                {
                                                                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[k].FindControl("ddlItemOfWork");
                                                                    TextBox txtArea = (TextBox)Repeater1.Items[k].FindControl("txtArea");
                                                                    TextBox txtSK = (TextBox)Repeater1.Items[k].FindControl("txtSK");
                                                                    TextBox txtSEMI = (TextBox)Repeater1.Items[k].FindControl("txtSEMI");
                                                                    TextBox txtUNSK = (TextBox)Repeater1.Items[k].FindControl("txtUNSK");
                                                                    TextBox txtOT = (TextBox)Repeater1.Items[k].FindControl("txtOT");

                                                                    PMC.InsertWorkProgramme(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), WPID.ToString(), HiddenField2.Value,
                                                                    ddlEngInCharge.SelectedValue.ToString(), txtBlock.Text, ddlItemOfWork.SelectedValue.ToString(), ddlItemOfWork.SelectedItem.Text, txtArea.Text,
                                                                    txtSK.Text, txtSEMI.Text, txtUNSK.Text, txtOT.Text, ddlSupervisor.SelectedValue.ToString(), ddlForeman.SelectedValue.ToString(),
                                                                    ddlEngineer.SelectedValue.ToString(), Session["UserID"].ToString(), lblNumber.Text, ddlForwardTo.SelectedValue.ToString());
                                                                }

                                                                BindR();
                                                                txtBlock.Text = ""; ddlProject.SelectedValue = "-1"; ddlEngInCharge.SelectedValue = "-1"; ddlSupervisor.SelectedValue = "-1";
                                                                ddlForeman.SelectedValue = "-1"; ddlEngineer.SelectedValue = "-1"; ddlForwardTo.SelectedValue = "-1";

                                                                string scripts = "alert('Work Programme Insert Successfully.');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                            else
                                                            {
                                                                string scripts = "alert('Kindly calculate the programme.');";
                                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        string scripts = "alert('Kindly fill item of work. ');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                    }
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly select engineer. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly select foreman. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly select supervisor. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly select forward to. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill block. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly select ENG. In Charge. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select project name. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill date. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill date. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Work programme number not generate. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
            DropDownList ddlIW = e.Item.FindControl("ddlItemOfWork") as DropDownList;

            PMC.BindItemOfWork(ddlIW);


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
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");

                    dr = dt.NewRow();

                    dr["SNo"] = i + 1;
                    dr["ItemOfWork"] = ddlItemOfWork.SelectedItem.Text;
                    dr["Area"] = txtArea.Text;
                    dr["SK"] = txtSK.Text;
                    dr["SEMI"] = txtSEMI.Text;
                    dr["UNSK"] = txtUNSK.Text;
                    dr["OT"] = txtOT.Text;

                    dt.Rows.Add(dr);

                    GetDL(i);

                    DL = ViewState["DL" + i.ToString()] as DataTable;

                    for (x = 0; x < ddlItemOfWork.Items.Count; x++)
                    {
                        dr1 = DL.NewRow();
                        dr1["Text"] = ddlItemOfWork.Items[x].Text.ToString();
                        dr1["Id"] = ddlItemOfWork.Items[x].Value.ToString();
                        DL.Rows.Add(dr1);
                    }
                    ViewState["DL" + i.ToString()] = DL;
                }

                dr = dt.NewRow();

                dr["SNo"] = dt.Rows.Count + 1;
                dr["ItemOfWork"] = string.Empty;
                dr["Area"] = string.Empty;
                dr["SK"] = string.Empty;
                dr["SEMI"] = string.Empty;
                dr["UNSK"] = string.Empty;
                dr["OT"] = string.Empty;

                dt.Rows.Add(dr);
                Session["Detail"] = dt;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                {
                    Label lblSNo = (Label)Repeater1.Items[t].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[t].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[t].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[t].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[t].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[t].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[t].FindControl("txtOT");

                    ddlItemOfWork.Items.FindByText(dt.Rows[t]["ItemOfWork"].ToString()).Selected = true;

                    txtArea.Text = dt.Rows[t]["Area"].ToString();
                    txtSK.Text = dt.Rows[t]["SK"].ToString();
                    txtSEMI.Text = dt.Rows[t]["SEMI"].ToString();
                    txtUNSK.Text = dt.Rows[t]["UNSK"].ToString();
                    txtOT.Text = dt.Rows[t]["OT"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {


            Hashtable ht = new Hashtable();
            ht.Add("@PRJID", ddlProject.SelectedValue);
            DataTable dt = PMCApp.Get(ht, "GetdatewiseRecord");
            if (dt.Rows.Count > 0)
            {
                ddlProject.SelectedValue = dt.Rows[0]["PRJID"].ToString();
                PMC.BindGetGeneralEmpIDWithEmp(ddlEngInCharge, ddlProject.SelectedValue.ToString());
                ddlEngInCharge.Items.FindByValue(dt.Rows[0]["EngInCharge"].ToString()).Selected = true;
                PMC.BindGetEmp(ddlForwardTo, ddlProject.SelectedValue.ToString());

                ddlForwardTo.Items.FindByValue(dt.Rows[0]["ForwardTo"].ToString()).Selected = true;
                PMC.BindGetGeneralEmpIDWithEmp(ddlSupervisor, ddlProject.SelectedValue.ToString());
                ddlSupervisor.Items.FindByValue(dt.Rows[0]["Supervisor"].ToString()).Selected = true;
                PMC.BindGetGeneralEmpIDWithEmp(ddlForeman, ddlProject.SelectedValue.ToString());
                ddlForeman.Items.FindByValue(dt.Rows[0]["Foreman"].ToString()).Selected = true;
                PMC.BindGetGeneralEmpIDWithEmp(ddlEngineer, ddlProject.SelectedValue.ToString());
                ddlEngineer.Items.FindByValue(dt.Rows[0]["Engineer"].ToString()).Selected = true;
                ViewState["Itemid"] = dt.Rows[0]["ItemId"].ToString();
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
                PMC.GetNoOfItemWork(out No);
                lblNumber.Text = No.ToString();
                txtBlock.Text = dt.Rows[0]["Block"].ToString();

                Hashtable ht1 = new Hashtable();
                ht1.Add("@PRJID", ddlProject.SelectedValue);

                DataTable dt1 = PMCApp.Get(ht1, "GetWorkProgGrid");
                Repeater1.DataSource = dt1;
                Repeater1.DataBind();
              
                GetDetail();







            }










        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void GetDetail()
    {
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            DropDownList ddlIW = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
            Label lblSNo = (Label)Repeater1.Items[i].FindControl("lblSNo");
            DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
            TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
            TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
            TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
            TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
            TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");
            Hashtable ht1 = new Hashtable();
            ht1.Add("@PRJID", ddlProject.SelectedValue);

            DataTable dt1 = PMCApp.Get(ht1, "GetWorkProgGrid");
            ddlIW.Items.FindByValue(dt1.Rows[i]["ItemID"].ToString()).Selected = true;
           
            Session["Detail1"] = dt1;
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
            Label lblTSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTSK");
            Label lblTSEMI = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTSEMI");
            Label lblTUNSK = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTUNSK");
            Label lblTOT = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTOT");
            Label lblGTotal = (Label)Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblGTotal");

            lblTSK.Text = ViewState["SumSK"].ToString();
            lblTSEMI.Text = ViewState["SumSEMI"].ToString();
            lblTUNSK.Text = ViewState["SumUNSK"].ToString();
            lblTOT.Text = ViewState["SumOT"].ToString();
            lblGTotal.Text = ViewState["SumTotal"].ToString();

            ViewState["Sum"] = 1;
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {



        SetRowData();
        if (Session["Detail"] != null)
        {

            RepeaterItem item = e.Item;

            if (e.CommandName == "DeleteWp")
            {
                DataTable dtCurrentTable = (DataTable)Session["Detail"];
                DataTable dtCurrentTable1 = (DataTable)Session["Detail"];
                if (dtCurrentTable.Rows.Count >= e.Item.ItemIndex)
                {
                    dtCurrentTable.Rows[item.ItemIndex].Delete();
                    dtCurrentTable.AcceptChanges();

                    ViewState["CurrentTable"] = dtCurrentTable;
                    
                }
               
                Repeater1.DataSource = dtCurrentTable;
                Repeater1.DataBind();
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label lblSNo = (Label)Repeater1.Items[i].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");

                }


                    for (int t = 0; t < dtCurrentTable.Rows.Count; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)Repeater1.Items[t].FindControl("lblSNo");
                        DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[t].FindControl("ddlItemOfWork");
                        TextBox txtArea = (TextBox)Repeater1.Items[t].FindControl("txtArea");
                        TextBox txtSK = (TextBox)Repeater1.Items[t].FindControl("txtSK");
                        TextBox txtSEMI = (TextBox)Repeater1.Items[t].FindControl("txtSEMI");
                        TextBox txtUNSK = (TextBox)Repeater1.Items[t].FindControl("txtUNSK");
                        TextBox txtOT = (TextBox)Repeater1.Items[t].FindControl("txtOT");

                        ddlItemOfWork.Items.FindByText(dtCurrentTable.Rows[t]["ItemOfWork"].ToString()).Selected = true;

                        txtArea.Text = dtCurrentTable.Rows[t]["Area"].ToString();
                        txtSK.Text = dtCurrentTable.Rows[t]["SK"].ToString();
                        txtSEMI.Text = dtCurrentTable.Rows[t]["SEMI"].ToString();
                        txtUNSK.Text = dtCurrentTable.Rows[t]["UNSK"].ToString();
                        txtOT.Text = dtCurrentTable.Rows[t]["OT"].ToString();
                    
                }


            }
        }
    }








               
        
    
    private void SetRowData()
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
                DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
                TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
                TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");

                dr = dt.NewRow();

                dr["SNo"] = i + 1;
                dr["ItemOfWork"] = ddlItemOfWork.SelectedItem.Text;
                dr["Area"] = txtArea.Text;
                dr["SK"] = txtSK.Text;
                dr["SEMI"] = txtSEMI.Text;
                dr["UNSK"] = txtUNSK.Text;
                dr["OT"] = txtOT.Text;

                dt.Rows.Add(dr);

                GetDL(i);

                DL = ViewState["DL" + i.ToString()] as DataTable;

                for (x = 0; x < ddlItemOfWork.Items.Count; x++)
                {
                    dr1 = DL.NewRow();
                    dr1["Text"] = ddlItemOfWork.Items[x].Text.ToString();
                    dr1["Id"] = ddlItemOfWork.Items[x].Value.ToString();
                    DL.Rows.Add(dr1);
                }
                ViewState["DL" + i.ToString()] = DL;
            }

            dr = dt.NewRow();

           
            Session["Detail"] = dt;
           
            
        }
        else
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
   
    private void Value()
    {
        try
        {
            DataTable DL = new DataTable();
            DataRow dr1 = null;
            int x;
            if (Session["Detail"] != null)
            {
                DataTable dt = (DataTable)Session["Detail"];

                //DataRow dr = null;
                //dt.Clear();
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label lblSNo = (Label)Repeater1.Items[i].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");

                    

                    GetDL(i);

                    DL = ViewState["DL" + i.ToString()] as DataTable;

                    for (x = 0; x < ddlItemOfWork.Items.Count; x++)
                    {
                        dr1 = DL.NewRow();
                        dr1["Text"] = ddlItemOfWork.Items[x].Text.ToString();
                        dr1["Id"] = ddlItemOfWork.Items[x].Value.ToString();
                        DL.Rows.Add(dr1);
                    }
                    ViewState["DL" + i.ToString()] = DL;
                }

                
                
                for (int t = 0; t < dt.Rows.Count; t++) //Set Previous only for DropDownList
                {
                    Label lblSNo = (Label)Repeater1.Items[t].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[t].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[t].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[t].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[t].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[t].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[t].FindControl("txtOT");

                
                    ddlItemOfWork.Items.FindByText(dt.Rows[t]["ItemOfWork"].ToString()).Selected = true;
                    txtArea.Text = dt.Rows[t]["Area"].ToString();
                    txtSK.Text = dt.Rows[t]["SK"].ToString();
                    txtSEMI.Text = dt.Rows[t]["SEMI"].ToString();
                    txtUNSK.Text = dt.Rows[t]["UNSK"].ToString();
                    txtOT.Text = dt.Rows[t]["OT"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    private void SetPreviousData()
    {

        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];

            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count-1; i++)
                {


                    Label lblSNo = (Label)Repeater1.Items[rowIndex].FindControl("lblSNo");
                    TextBox txtArea = (TextBox)Repeater1.Items[rowIndex].FindControl("txtArea");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[rowIndex].FindControl("ddlItemOfWork");
                    TextBox txtSK = (TextBox)Repeater1.Items[rowIndex].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[rowIndex].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[rowIndex].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[rowIndex].FindControl("txtOT");





                    ddlItemOfWork.Items.FindByText(dt.Rows[i]["ItemOfWork"].ToString()).Selected = true;
                    txtArea.Text = dt.Rows[i]["Area"].ToString();
                    txtSK.Text = dt.Rows[i]["SK"].ToString();
                    txtSEMI.Text = dt.Rows[i]["SEMI"].ToString();
                    txtUNSK.Text = dt.Rows[i]["UNSK"].ToString();
                    txtOT.Text = dt.Rows[i]["OT"].ToString();
                    rowIndex++;

                }

            }

        }

    }
    private void Value1()
    {
        try
        {
            DataTable DL = new DataTable();
            DataRow dr1 = null;
            int x;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];

                DataRow dr = null;
                dt.Clear();
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label lblSNo = (Label)Repeater1.Items[i].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[i].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[i].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[i].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[i].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[i].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[i].FindControl("txtOT");

                    dr = dt.NewRow();

                    dr["SNo"] = i + 1;
                    dr["ItemOfWork"] = ddlItemOfWork.SelectedItem.Text;
                    dr["Area"] = txtArea.Text;
                    dr["LabourSK"] = txtSK.Text;
                    dr["LabourSEMI"] = txtSEMI.Text;
                    dr["UNSK"] = txtUNSK.Text;
                    dr["OT"] = txtOT.Text;

                    dt.Rows.Add(dr);

                    GetDL(i);

                    DL = ViewState["DL" + i.ToString()] as DataTable;

                    for (x = 0; x < ddlItemOfWork.Items.Count; x++)
                    {
                        dr1 = DL.NewRow();
                        dr1["Text"] = ddlItemOfWork.Items[x].Text.ToString();
                        dr1["Id"] = ddlItemOfWork.Items[x].Value.ToString();
                        DL.Rows.Add(dr1);
                    }
                    ViewState["DL" + i.ToString()] = DL;
                }

                dr = dt.NewRow();

                dr["SNo"] = dt.Rows.Count;
                dr["ItemOfWork"] = string.Empty;
                dr["Area"] = string.Empty;
                dr["SK"] = string.Empty;
                dr["SEMI"] = string.Empty;
                dr["UNSK"] = string.Empty;
                dr["OT"] = string.Empty;

                dt.Rows.Equals(dr);
                Session["Detail"] = dt;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                DataTable dt1 = (DataTable)Session["Detail1"];
                for (int t = 0; t < dt1.Rows.Count; t++) //Set Previous only for DropDownList
                {
                    Label lblSNo = (Label)Repeater1.Items[t].FindControl("lblSNo");
                    DropDownList ddlItemOfWork = (DropDownList)Repeater1.Items[t].FindControl("ddlItemOfWork");
                    TextBox txtArea = (TextBox)Repeater1.Items[t].FindControl("txtArea");
                    TextBox txtSK = (TextBox)Repeater1.Items[t].FindControl("txtSK");
                    TextBox txtSEMI = (TextBox)Repeater1.Items[t].FindControl("txtSEMI");
                    TextBox txtUNSK = (TextBox)Repeater1.Items[t].FindControl("txtUNSK");
                    TextBox txtOT = (TextBox)Repeater1.Items[t].FindControl("txtOT");

                    

                    ddlItemOfWork.Items.FindByText(dt1.Rows[t]["ItemOfWork"].ToString()).Selected = true;
                    txtArea.Text = dt1.Rows[t]["Area"].ToString();
                    txtSK.Text = dt1.Rows[t]["LabourSK"].ToString();
                    txtSEMI.Text = dt1.Rows[t]["LabourSEMI"].ToString();
                    txtUNSK.Text = dt1.Rows[t]["LabourUNSK"].ToString();
                    txtOT.Text = dt1.Rows[t]["LabourOT"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs. ');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }

}



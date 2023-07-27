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
    public partial class PaymentReceipt : BasePage
    {
         ();
        DataTable DT = new DataTable();
        string TypeID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetD();
                    BindR();
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
                lblDate1.Text = DateTime.Now.ToString("dd/MM/yyyy");
                HiddenField2.Value = DateTime.Now.ToString("MM/dd/yyyy");
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
                dt.Columns.Add(new DataColumn("PaymentType", typeof(string)));
                dt.Columns.Add(new DataColumn("BankName", typeof(string)));
                dt.Columns.Add(new DataColumn("CheckNo", typeof(string)));
                dt.Columns.Add(new DataColumn("Amount", typeof(string)));
                dr = dt.NewRow();
                dr["SNo"] = 1;
                dr["PaymentType"] = string.Empty;
                dr["BankName"] = string.Empty;
                dr["CheckNo"] = string.Empty;
                dr["Amount"] = string.Empty;
                dt.Rows.Add(dr);
                Session["Detail"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
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
        protected void btnAddMore_Click(object sender, EventArgs e)
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
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        Label lblSNo = (Label)GridView1.Rows[i].FindControl("lblSNo");
                        DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[i].FindControl("ddlPaymentType");
                        TextBox txtBankName = (TextBox)GridView1.Rows[i].FindControl("txtBankName");
                        TextBox txtCheckNo = (TextBox)GridView1.Rows[i].FindControl("txtCheckNo");
                        TextBox txtAmount = (TextBox)GridView1.Rows[i].FindControl("txtAmount");

                        dr = dt.NewRow();

                        dr["SNo"] = i + 1;
                        dr["PaymentType"] = ddlPaymentType.SelectedItem.Text;
                        dr["BankName"] = txtBankName.Text;
                        dr["CheckNo"] = txtCheckNo.Text;
                        dr["Amount"] = txtAmount.Text;

                        dt.Rows.Add(dr);

                        GetDL(i);

                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlPaymentType.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlPaymentType.Items[x].Text.ToString();
                            dr1["Id"] = ddlPaymentType.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }
                        ViewState["DL" + i.ToString()] = DL;
                    }

                    dr = dt.NewRow();

                    dr["SNo"] = dt.Rows.Count + 1;
                    dr["PaymentType"] = string.Empty;
                    dr["BankName"] = string.Empty;
                    dr["CheckNo"] = string.Empty;
                    dr["Amount"] = string.Empty;

                    dt.Rows.Add(dr);
                    Session["Detail"] = dt;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)GridView1.Rows[t].FindControl("lblSNo");
                        DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[t].FindControl("ddlPaymentType");
                        TextBox txtBankName = (TextBox)GridView1.Rows[t].FindControl("txtBankName");
                        TextBox txtCheckNo = (TextBox)GridView1.Rows[t].FindControl("txtCheckNo");
                        TextBox txtAmount = (TextBox)GridView1.Rows[t].FindControl("txtAmount");

                        ddlPaymentType.Items.FindByText(dt.Rows[t]["PaymentType"].ToString()).Selected = true;

                        txtBankName.Text = dt.Rows[t]["BankName"].ToString();
                        txtCheckNo.Text = dt.Rows[t]["CheckNo"].ToString();
                        txtAmount.Text = dt.Rows[t]["Amount"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs. ');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlPaymentType = e.Row.FindControl("ddlPaymentType") as DropDownList;

                    PMC.BindDDLPaymentType(ddlPaymentType);
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
                int check = 0, check1 = 0;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[i].FindControl("ddlPaymentType");
                    if (ddlPaymentType.SelectedValue == "-1")
                    {
                        check = 1;
                        break;
                    }
                }
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    TextBox txtAmount = (TextBox)GridView1.Rows[i].FindControl("txtAmount");
                    if (txtAmount.Text == "")
                    {
                        check1 = 1;
                        break;
                    }
                }
                if (ddlProject.SelectedValue != "-1")
                {
                    if (txtRABillNo.Text != "")
                    {
                        if (check == 0)
                        {
                            if (check1 == 0)
                            {
                                PMC.GetMaxIDForPRID(Session["CompID"].ToString(), out TypeID);
                                for (int j = 0; j < GridView1.Rows.Count; j++)
                                {
                                    DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[j].FindControl("ddlPaymentType");
                                    TextBox txtBankName = (TextBox)GridView1.Rows[j].FindControl("txtBankName");
                                    TextBox txtCheckNo = (TextBox)GridView1.Rows[j].FindControl("txtCheckNo");
                                    TextBox txtAmount = (TextBox)GridView1.Rows[j].FindControl("txtAmount");

                                    PMC.InsertPaymentReceipt(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), TypeID.ToString(),
                                        txtRABillNo.Text, ddlPaymentType.SelectedValue.ToString(), ddlPaymentType.SelectedItem.Text, txtBankName.Text,
                                        txtCheckNo.Text, txtAmount.Text, Session["UserID"].ToString());
                                }
                                ddlProject.SelectedValue = "-1"; txtRABillNo.Text = "";
                                BindR();
                                string scripts = "alert('Insert successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill amount.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select payment type.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill R.A Bill No..');";
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
}
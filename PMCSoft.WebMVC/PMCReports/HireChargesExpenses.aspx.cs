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


namespace PMCSoft.Web.PMCReports
{
    public partial class HireChargesExpenses : BasePage
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string ItemID = "";
        string ExpID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProj();
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
        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
        public void BindGrid()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("SNo", typeof(int)));
            dt.Columns.Add(new DataColumn("DESCRIPTION", typeof(string)));
            dt.Columns.Add(new DataColumn("MODEL", typeof(string)));
            dt.Columns.Add(new DataColumn("VENDORNAME", typeof(string)));

            dt.Columns.Add(new DataColumn("DateofInstallation", typeof(string)));
            dt.Columns.Add(new DataColumn("Qty", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dt.Columns.Add(new DataColumn("Nature", typeof(string)));
            dr = dt.NewRow();
            dr["SNo"] = 1;
            dr["DESCRIPTION"] = string.Empty;
            dr["MODEL"] = string.Empty;
            dr["VENDORNAME"] = string.Empty;
            dr["DateofInstallation"] = string.Empty;
            dr["Qty"] = string.Empty;
            dr["Amount"] = string.Empty;
            dr["Nature"] = string.Empty;
            dt.Rows.Add(dr);

            Session["Detail"] = dt;
            GvHireChargesExpenses.DataSource = dt;
            GvHireChargesExpenses.DataBind();
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
                    for (int i = 0; i < GvHireChargesExpenses.Rows.Count; i++)
                    {

                        TextBox txtDESCRIPTION = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtDESCRIPTION");
                        TextBox txtMODEL = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtMODEL");
                        DropDownList ddlVendor = (DropDownList)GvHireChargesExpenses.Rows[i].FindControl("ddlVendor");
                        TextBox txtDateofInstallation = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtDateofInstallation");
                        TextBox txtQTY = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtQTY");
                        TextBox txtAMOUNT = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtAMOUNT");
                        TextBox txtNature = (TextBox)GvHireChargesExpenses.Rows[i].FindControl("txtNature");

                        dr = dt.NewRow();


                        dr["SNo"] = i + 1;
                        dr["DESCRIPTION"] = txtDESCRIPTION.Text;
                        dr["MODEL"] = txtMODEL.Text;
                        dr["VENDORNAME"] = ddlVendor.SelectedItem.Text;
                        dr["DateofInstallation"] = txtDateofInstallation.Text;
                        dr["Qty"] = txtQTY.Text;
                        dr["Amount"] = txtAMOUNT.Text;
                        dr["Nature"] = txtNature.Text;
                        dt.Rows.Add(dr);
                        GetDL(i);

                        DL = ViewState["DL" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlVendor.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlVendor.Items[x].Text.ToString();
                            dr1["Id"] = ddlVendor.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }



                    }

                    dr = dt.NewRow();

                    dr["SNo"] = dt.Rows.Count + 1;
                    dr["DESCRIPTION"] = string.Empty;
                    dr["MODEL"] = string.Empty;
                    dr["VENDORNAME"] = string.Empty;
                    dr["DateofInstallation"] = string.Empty;
                    dr["Qty"] = string.Empty;
                    dr["Amount"] = string.Empty;
                    dr["Nature"] = string.Empty;
                    dt.Rows.Add(dr);

                    Session["Detail"] = dt;
                    GvHireChargesExpenses.DataSource = dt;
                    GvHireChargesExpenses.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        TextBox txtDESCRIPTION = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtDESCRIPTION");
                        TextBox txtMODEL = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtMODEL");
                        DropDownList ddlVendor = (DropDownList)GvHireChargesExpenses.Rows[t].FindControl("ddlVendor");
                        TextBox txtDateofInstallation = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtDateofInstallation");
                        TextBox txtQTY = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtQTY");
                        TextBox txtAMOUNT = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtAMOUNT");
                        TextBox txtNature = (TextBox)GvHireChargesExpenses.Rows[t].FindControl("txtNature");

                        txtDESCRIPTION.Text = dt.Rows[t]["DESCRIPTION"].ToString();
                        txtMODEL.Text = dt.Rows[t]["MODEL"].ToString();
                        ddlVendor.Items.FindByText(dt.Rows[t]["VENDORNAME"].ToString()).Selected = true;

                        txtDateofInstallation.Text = dt.Rows[t]["DateofInstallation"].ToString();
                        txtQTY.Text = dt.Rows[t]["Qty"].ToString();

                        txtAMOUNT.Text = dt.Rows[t]["Amount"].ToString();
                        txtNature.Text = dt.Rows[t]["Nature"].ToString();

                        //InsertHIRECHARGESEXPENSES//insert procedur 
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

        protected void GvHireChargesExpenses_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlVendor = e.Row.FindControl("ddlVendor") as DropDownList;
                    PMC.BindGetVendorID(ddlVendor, ddlProject.SelectedValue.ToString());
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
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtDESCRIPTION = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtDESCRIPTION");
                    if (txtDESCRIPTION.Text == "")
                    {
                        check = 1;
                        break;
                    }
                    else
                    {
                        check = 0;
                    }

                }
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtMODEL = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtMODEL");
                    if (txtMODEL.Text == "")
                    {
                        check1 = 1;
                        break;
                    }
                    else
                    {
                        check1 = 0;
                    }

                }
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    DropDownList ddlVendor = (DropDownList)GvHireChargesExpenses.Rows[j].FindControl("ddlVendor");
                    if (ddlVendor.SelectedValue == "-1")
                    {
                        check2 = 1;
                        break;
                    }
                    else
                    {
                        check2 = 0;
                    }

                }

                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtDateofInstallation = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtDateofInstallation");
                    if (txtDateofInstallation.Text == "")
                    {
                        check3 = 1;
                        break;
                    }
                    else
                    {
                        check3 = 0;
                    }

                }
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtQTY = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtQTY");
                    if (txtQTY.Text == "")
                    {
                        check4 = 1;
                        break;
                    }
                    else
                    {
                        check4 = 0;
                    }

                }
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtAMOUNT = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtAMOUNT");
                    if (txtAMOUNT.Text == "")
                    {
                        check5 = 1;
                        break;
                    }
                    else
                    {
                        check5 = 0;
                    }

                }
                for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                {
                    TextBox txtNature = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtNature");
                    if (txtNature.Text == "")
                    {
                        check6 = 1;
                        break;
                    }
                    else
                    {
                        check6 = 0;
                    }

                }
                if (ddlProject.SelectedValue != "-1")
                {
                    if (txtDate.Text != "")
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
                                                    for (int j = 0; j < GvHireChargesExpenses.Rows.Count; j++)
                                                    {
                                                        TextBox txtDESCRIPTION = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtDESCRIPTION");
                                                        TextBox txtMODEL = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtMODEL");
                                                        DropDownList ddlVendor = (DropDownList)GvHireChargesExpenses.Rows[j].FindControl("ddlVendor");
                                                        TextBox txtDateofInstallation = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtDateofInstallation");
                                                        TextBox txtQTY = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtQTY");
                                                        TextBox txtAMOUNT = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtAMOUNT");
                                                        TextBox txtNature = (TextBox)GvHireChargesExpenses.Rows[j].FindControl("txtNature");

                                                        PMC.GetMaxIDForHireChargesExpensesFunction(Session["CompID"].ToString(), out ItemID);
                                                        Hashtable ht = new Hashtable();
                                                        ht.Add("@CompanyId", Session["CompID"].ToString());

                                                        ht.Add("@ProjectId", ddlProject.SelectedValue);
                                                        ht.Add("@HireChargesId", ItemID.ToString());
                                                        ht.Add("@HireChargesDate", txtDate.Text);
                                                        ht.Add("@Description", txtDESCRIPTION.Text);
                                                        ht.Add("@Model", txtMODEL.Text);
                                                        ht.Add("@VendorId", ddlVendor.SelectedValue);
                                                        ht.Add("@DateOfInstallation", txtDateofInstallation.Text);
                                                        ht.Add("@Qty", txtQTY.Text);
                                                        ht.Add("@Amount", txtAMOUNT.Text);
                                                        ht.Add("@PurposeOfWork", txtNature.Text);

                                                        ht.Add("@CreatedBy", Session["UserId"].ToString());
                                                        ht.Add("@ModifiedBy", Session["UserId"].ToString());
                                                        PMCApp.Get(ht, "InsertHIRECHARGESEXPENSES");
                                                        string scripts = "alert('Insert Successfully .');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        ddlProject.SelectedValue = "-1"; ddlVendor.SelectedValue = "-1"; txtDateofInstallation.Text = ""; txtMODEL.Text = ""; txtDateofInstallation.Text = ""; txtQTY.Text = ""; txtAMOUNT.Text = ""; txtNature.Text = "";
                                                        BindGrid();

                                                    }
                                                }
                                                else
                                                {
                                                    string scripts = "alert('Kindly Fill Nature / Purpose of work for which the equipment is on  Hire. ');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly Fill Amount. ');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly Fill Quantity. ');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly Fill Date of Installation. ');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }

                                }
                                else
                                {
                                    string scripts = "alert('Kindly Select Vendor. ');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }

                            }
                            else
                            {
                                string scripts = "alert('Kindly Fill Model. ');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly Fill Description. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }


                    }
                    else
                    {
                        string scripts = "alert('Kindly Select Date. ');";
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






        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Home.aspx");
        }
    }
}
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
using System.Text;
using System.Collections.ObjectModel;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Net;
using System.Net.Mail;
using System.IO;

using PMCSoft.Infrastructure.Data;

namespace PMCSoft.Web.User
{
    public partial class AddDebitList : BasePage
    {
        BALPMC PMC = new BALPMC();
        string ListID = string.Empty, VenID = "";
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {


                    BindProject();
                    BindProj();
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
                PMC.BindGetEmpProj(ddlProject1, Session["UserID"].ToString());
                GetSProj();
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
                dt.Columns.Add(new DataColumn("Vendor", typeof(string)));
                dt.Columns.Add(new DataColumn("Amount", typeof(string)));
                dt.Columns.Add(new DataColumn("PaymentType", typeof(string)));
                dt.Columns.Add(new DataColumn("Remarks", typeof(string)));
                dr = dt.NewRow();

                dr["SNo"] = 1;
                dr["Vendor"] = string.Empty;
                dr["Amount"] = string.Empty;
                dr["PaymentType"] = string.Empty;
                dr["Remarks"] = string.Empty;
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
                BindR();
                PMC.BindGetEmp(ddlEmployee, ddlProject.SelectedValue.ToString());
                Panel1.Visible = true;
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlVendor = e.Row.FindControl("ddlVendor") as DropDownList;
                    DropDownList ddlPaymentType = e.Row.FindControl("ddlPaymentType") as DropDownList;

                    PMC.BindGetVendorID(ddlVendor, ddlProject.SelectedValue.ToString());

                    DT = PMCApp.GetDropDownDetail("GetDebtorPaymentType");
                    if (DT.Rows.Count > 0)
                    {
                        ddlPaymentType.DataTextField = DT.Columns["PaymentType"].ColumnName;
                        ddlPaymentType.DataValueField = DT.Columns["TransID"].ColumnName;
                        ddlPaymentType.DataSource = DT;
                        ddlPaymentType.DataBind();
                        ddlPaymentType.Items.Insert(0, new ListItem("Select Type", "-1"));
                    }
                    else
                    {
                        ddlPaymentType.DataTextField = DT.Columns["PaymentType"].ColumnName;
                        ddlPaymentType.DataValueField = DT.Columns["TransID"].ColumnName;
                        ddlPaymentType.DataSource = DT;
                        ddlPaymentType.DataBind();
                        ddlPaymentType.Items.Insert(0, new ListItem("Select Type", "-1"));
                    }
                }
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
        private void GetDL1(int i)
        {
            try
            {
                DataTable DL1 = new DataTable();
                DL1.Columns.Add(new DataColumn("Text", typeof(string)));
                DL1.Columns.Add(new DataColumn("Id", typeof(string)));
                ViewState["DL1" + i.ToString()] = DL1;
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
                        DropDownList ddlVendor = (DropDownList)GridView1.Rows[i].FindControl("ddlVendor");
                        TextBox txtAmount = (TextBox)GridView1.Rows[i].FindControl("txtAmount");
                        DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[i].FindControl("ddlPaymentType");
                        TextBox txtRemarks = (TextBox)GridView1.Rows[i].FindControl("txtRemarks");

                        dr = dt.NewRow();

                        dr["SNo"] = i + 1;
                        dr["Vendor"] = ddlVendor.SelectedItem.Text;
                        dr["Amount"] = txtAmount.Text;
                        dr["PaymentType"] = ddlPaymentType.SelectedItem.Text;
                        dr["Remarks"] = txtRemarks.Text;

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
                        ViewState["DL" + i.ToString()] = DL;

                        GetDL1(i);

                        DL = ViewState["DL1" + i.ToString()] as DataTable;

                        for (x = 0; x < ddlPaymentType.Items.Count; x++)
                        {
                            dr1 = DL.NewRow();
                            dr1["Text"] = ddlPaymentType.Items[x].Text.ToString();
                            dr1["Id"] = ddlPaymentType.Items[x].Value.ToString();
                            DL.Rows.Add(dr1);
                        }
                        ViewState["DL1" + i.ToString()] = DL;
                    }

                    dr = dt.NewRow();

                    dr["SNo"] = dt.Rows.Count + 1;
                    dr["Vendor"] = string.Empty;
                    dr["Amount"] = string.Empty;
                    dr["PaymentType"] = string.Empty;
                    dr["Remarks"] = string.Empty;

                    dt.Rows.Add(dr);
                    Session["Detail"] = dt;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    for (int t = 0; t < dt.Rows.Count - 1; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)GridView1.Rows[t].Cells[0].FindControl("lblSNo");
                        DropDownList ddlVendor = (DropDownList)GridView1.Rows[t].Cells[1].FindControl("ddlVendor");
                        TextBox txtAmount = (TextBox)GridView1.Rows[t].Cells[2].FindControl("txtAmount");
                        DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[t].Cells[3].FindControl("ddlPaymentType");
                        TextBox txtRemarks = (TextBox)GridView1.Rows[t].Cells[4].FindControl("txtRemarks");

                        ddlVendor.Items.FindByText(dt.Rows[t]["Vendor"].ToString()).Selected = true;
                        ddlPaymentType.Items.FindByText(dt.Rows[t]["PaymentType"].ToString()).Selected = true;

                        txtAmount.Text = dt.Rows[t]["Amount"].ToString();
                        txtRemarks.Text = dt.Rows[t]["Remarks"].ToString();
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
                int check = 0;
                for (int j = 0; j < GridView1.Rows.Count; j++)
                {
                    DropDownList ddlVendor = (DropDownList)GridView1.Rows[j].FindControl("ddlVendor");
                    if (ddlVendor.SelectedValue == "-1")
                    {
                        check = 1;
                        break;
                    }
                }
                if (ddlProject.SelectedValue != "-1")
                {
                    if (ddlEmployee.SelectedValue != "-1")
                    {
                        if (check == 0)
                        {
                            PMC.GetMaxIDForListID(Session["CompID"].ToString(), out ListID);
                            for (int a = 0; a < GridView1.Rows.Count; a++)
                            {
                                DropDownList ddlVendor = (DropDownList)GridView1.Rows[a].FindControl("ddlVendor");
                                TextBox txtAmount = (TextBox)GridView1.Rows[a].FindControl("txtAmount");
                                TextBox txtRemarks = (TextBox)GridView1.Rows[a].FindControl("txtRemarks");
                                DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[a].FindControl("ddlPaymentType");

                                PMC.InsertDebtorList(Session["CompID"].ToString(), ddlProject.SelectedValue.ToString(), ListID.ToString(),
                                    ddlVendor.SelectedValue.ToString(), ddlVendor.SelectedItem.Text, txtAmount.Text, txtRemarks.Text,
                                    ddlEmployee.SelectedValue.ToString(), Session["UserID"].ToString(), ddlPaymentType.SelectedItem.Text);
                            }
                            BindR();
                            ddlProject.SelectedValue = "-1";
                            PMC.BindGetEmp(ddlEmployee, ddlProject.SelectedValue.ToString());
                            Panel1.Visible = true;

                            string scripts = "alert('Debtors list insert successfully. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                        else
                        {
                            string scripts = "alert('Kindly select party / vendor name. ');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select user. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select project. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                DataTable DL = new DataTable();
                DataRow dr1 = null;
                SetRowData();
                if (Session["Detail"] != null)
                {
                    DataTable myDTbl = ((DataTable)Session["Detail"]);
                    if (myDTbl.Rows.Count <= 1)
                    {
                        e.Cancel = true;
                        return;
                    }
                    myDTbl.Rows[e.RowIndex].Delete();
                    for (int i = 0; i < myDTbl.Rows.Count; i++)
                    {
                        myDTbl.Rows[i]["SNo"] = i + 1;
                    }
                    this.GridView1.DataSource = myDTbl.DefaultView;
                    this.GridView1.DataBind();

                    for (int t = 0; t < myDTbl.Rows.Count; t++) //Set Previous only for DropDownList
                    {
                        Label lblSNo = (Label)GridView1.Rows[t].Cells[0].FindControl("lblSNo");
                        TextBox txtAmount = (TextBox)GridView1.Rows[t].Cells[2].FindControl("txtAmount");
                        TextBox txtRemarks = (TextBox)GridView1.Rows[t].Cells[3].FindControl("txtRemarks");
                        DropDownList ddlVendor = (DropDownList)GridView1.Rows[t].Cells[1].FindControl("ddlVendor");

                        txtAmount.Text = myDTbl.Rows[t]["Amount"].ToString();
                        txtRemarks.Text = myDTbl.Rows[t]["Remarks"].ToString();

                        ddlVendor.Items.FindByText(myDTbl.Rows[t]["Vendor"].ToString()).Selected = true;
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private void SetRowData()
        {
            try
            {
                DataTable DL = new DataTable();
                DataRow dr1 = null;
                int rowIndex = 0;

                if (Session["Detail"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)Session["Detail"];
                    DataRow drCurrentRow = null;
                    if (dtCurrentTable.Rows.Count > 0)
                    {
                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {
                            TextBox txtAmount = (TextBox)GridView1.Rows[rowIndex].Cells[2].FindControl("txtAmount");
                            TextBox txtRemarks = (TextBox)GridView1.Rows[rowIndex].Cells[4].FindControl("txtRemarks");
                            DropDownList ddlVendor =
                              (DropDownList)GridView1.Rows[rowIndex].Cells[1].FindControl("ddlVendor");
                            DropDownList ddlPaymentType =
                              (DropDownList)GridView1.Rows[rowIndex].Cells[3].FindControl("ddlPaymentType");
                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["SNo"] = i + 1;
                            dtCurrentTable.Rows[i - 1]["Amount"] = txtAmount.Text;
                            dtCurrentTable.Rows[i - 1]["Remarks"] = txtRemarks.Text;
                            dtCurrentTable.Rows[i - 1]["Vendor"] = ddlVendor.SelectedItem.Text;
                            dtCurrentTable.Rows[i - 1]["PaymentType"] = ddlPaymentType.SelectedItem.Text;
                            rowIndex++;

                            GetDL(i);

                            DL = ViewState["DL" + i.ToString()] as DataTable;

                            for (int x = 0; x < ddlVendor.Items.Count; x++)
                            {
                                dr1 = DL.NewRow();
                                dr1["Text"] = ddlVendor.Items[x].Text.ToString();
                                dr1["Id"] = ddlVendor.Items[x].Value.ToString();
                                DL.Rows.Add(dr1);
                            }
                            ViewState["DL" + i.ToString()] = DL;
                        }
                        for (int t = 0; t < dtCurrentTable.Rows.Count - 1; t++) //Set Previous only for DropDownList
                        {
                            Label lblSNo = (Label)GridView1.Rows[t].Cells[0].FindControl("lblSNo");
                            TextBox txtAmount = (TextBox)GridView1.Rows[t].Cells[2].FindControl("txtAmount");
                            TextBox txtRemarks = (TextBox)GridView1.Rows[t].Cells[4].FindControl("txtRemarks");
                            DropDownList ddlVendor = (DropDownList)GridView1.Rows[t].Cells[1].FindControl("ddlVendor");
                            DropDownList ddlPaymentType = (DropDownList)GridView1.Rows[t].Cells[3].FindControl("ddlPaymentType");

                            ddlVendor.Items.FindByText(dtCurrentTable.Rows[t]["Vendor"].ToString()).Selected = true;
                            ddlPaymentType.Items.FindByText(dtCurrentTable.Rows[t]["PaymentType"].ToString()).Selected = true;
                        }
                        Session["Detail"] = dtCurrentTable;
                    }
                }
                else
                {
                    string scripts = "alert('Some error occurs. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlType.SelectedValue == "S")
                {
                    PMC.BindGetDebtorSuggestedList(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString());
                }
                else
                {
                    GetProj();
                }

            }
            catch (Exception ex)
            {
            }
        }
        protected void ddlProject1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlType.SelectedValue = "-1";
                GetSProj();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetSProj()
        {
            try
            {
                if (ddlType.SelectedValue == "S")
                {
                    PMC.BindGetDebitorsSuggestedListDateWise(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString(), txtDate.Text);
                }
                else
                {
                    //PMC.BindGetDebitorsApproveList(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString(), txtDate.Text);
                    PMC.BindGetDebitorsListDateWise(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString(), txtDate.Text);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void GetProj()
        {
            try
            {
                PMC.BindGetDebitorsList(GridView2, ddlProject1.SelectedValue.ToString(), ddlType.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlProject1.SelectedValue != "-1")
                {
                    if (ddlType.SelectedValue != "-1")
                    {
                        GetSProj();

                    }
                    else
                    {
                        string scripts = "alert('Kindly select approval type. ');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select project. ');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
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
            if (e.CommandName == "AddVendor")
            {
                Button btn = (Button)e.CommandSource;
                Button btnAddVendor = (Button)btn.Parent.FindControl("btnAddVendor");

                GetCountry();
                PMC.BindGetPartyVendorType(ddlVendorType);
                ModalPopupExtender1.Show();
            }
        }
        public void GetCountry()
        {
            try
            {
                PMC.BindCountryDdl(ddlCountry);
                ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnVCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ModalPopupExtender1.Hide();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public bool isNumeric(string val, System.Globalization.NumberStyles NumberStyle)
        {
            if (val.Length > 0)
            {
                Double result;
                return Double.TryParse(val, NumberStyle,
                    System.Globalization.CultureInfo.CurrentCulture, out result);
            }
            else
            {
                return true;
            }
        }
        protected void btnVSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int check = 0, r = 0;
                string ch = string.Empty;
                if (txtEmail.Text.Length > 0)
                {
                    if (this.IsValidEmail(txtEmail.Text))
                    {
                        check = 0;
                    }
                    else
                    {
                        check = 1;
                    }
                }
                else
                {
                    check = 0;
                }
                if (txtName.Text != "")
                {
                    if (ddlCountry.SelectedValue != "-1")
                    {
                        if (ddlState.SelectedValue != "-1")
                        {
                            if (ddlCity.SelectedValue != "-1")
                            {
                                if (this.isNumeric(txtMobileNo.Text, System.Globalization.NumberStyles.Integer))
                                {
                                    if (check == 0)
                                    {
                                        if (ddlVendorType.SelectedValue != "-1")
                                        {
                                            DT = PMCApp.GetDataTableWithOneStringValue("GetVendor", txtMobileNo.Text);
                                            if (DT.Rows.Count > 0)
                                            {
                                                string scripts1 = "alert('This vendor is already exists.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                ModalPopupExtender1.Show();
                                            }
                                            else
                                            {
                                                PMC.GetMaxIDForVenID(Session["CompID"].ToString(), out VenID);

                                                PMC.InsertVendorDetail(Session["CompID"].ToString(), Session["PRJID"].ToString(), VenID.ToString(), txtName.Text,
                                                    txtAddress.Text, ddlCountry.SelectedValue.ToString(), ddlState.SelectedValue.ToString(),
                                                    ddlCity.SelectedValue.ToString(), txtMobileNo.Text, txtEmail.Text, ddlVendorType.SelectedItem.Text,
                                                    Session["UserID"].ToString(), ddlVendorType.SelectedValue.ToString(), TxtPanNo.Text, TxtTinNo.Text,
                                                    TxtEccNo.Text, TxtVat.Text);

                                                ClearData();

                                                string scripts1 = "alert('Vendor data insert successfully.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts1, true);
                                                ModalPopupExtender1.Hide();
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly select vendor type.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            ModalPopupExtender1.Show();
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill valid email.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        ModalPopupExtender1.Show();
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill valid mobile no.');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    ModalPopupExtender1.Show();
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly select city.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                ModalPopupExtender1.Show();
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select state.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            ModalPopupExtender1.Show();
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly select country.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill vendor name.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        public void ClearData()
        {
            try
            {
                txtName.Text = ""; txtAddress.Text = ""; ddlCountry.SelectedValue = "-1"; ddlState.SelectedValue = "-1";
                ddlCity.SelectedValue = "-1"; txtMobileNo.Text = ""; txtEmail.Text = ""; ddlVendorType.SelectedValue = "-1";
                TxtPanNo.Text = ""; TxtTinNo.Text = ""; TxtEccNo.Text = ""; TxtVat.Text = "";
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindStateDdl(ddlState, ddlCountry.SelectedValue.ToString());
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PMC.BindCityDdl(ddlCity, ddlState.SelectedValue.ToString());
                ModalPopupExtender1.Show();
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                ModalPopupExtender1.Show();
            }
        }
        private bool IsValidEmail(string emailAddress)
        {
            return Regex.IsMatch(emailAddress, @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");
        }
    }
}
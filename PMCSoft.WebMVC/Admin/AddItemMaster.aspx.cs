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

namespace PMCSoft.Web.Admin
{
    public partial class AddItemMaster : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        DataTable DT = new DataTable();
        string ItemID = "";
        string GroupID = "";
        string UnitID = "";
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
                        BindGetGroupDDL();
                        BindGetGroupDDLGrid();
                        //BindGetItemDetail();
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindGetGroupDDL()
        {
            try
            {
                PMC.BindGetGroupDDL(ddlGroup);
                PMC.BindGetUnitDetail(ddlUnit);

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        public void BindGetGroupDDLGrid()
        {
            try
            {
                PMC.BindGetGroupDDL(ddlitemGropgrid);

            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

        public void BindGetItemDetail()
        {
            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@ItemGroupID", ddlitemGropgrid.SelectedValue);
                DataTable dt = PMCApp.Get(ht, "GetItemDetailByid");
                GridView1.DataSource = dt;
                GridView1.DataBind();
                // PMC.BindGetItemDetail(GridView1);
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
                if (ddlGroup.SelectedValue != "-1")
                {
                    if (txtItemName.Text != "")
                    {
                        if (ddlUnit.SelectedValue != "-1")
                        {
                            if (txtItemMake.Text != "")
                            {
                                if (txtItemPartNo.Text != "")
                                {
                                    DT = PMCApp.GetDataTableWithFiveStringValue("GetItemName", ddlGroup.SelectedValue.ToString(), txtItemName.Text,
                                        ddlUnit.SelectedValue.ToString(), txtItemMake.Text, txtItemPartNo.Text);
                                    if (DT.Rows.Count > 0)
                                    {
                                        string scripts = "alert('Item detail is already exists.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                    else
                                    {
                                        PMC.GetMaxIDForItemsID(Session["CompID"].ToString(), out ItemID);
                                        PMC.InsertItemMaster(Session["CompID"].ToString(), ItemID.ToString(), ddlGroup.SelectedValue.ToString(), txtItemName.Text,
                                            ddlUnit.SelectedValue.ToString(), txtItemMake.Text, txtItemPartNo.Text, Session["UserID"].ToString());

                                        ddlGroup.SelectedValue = "-1"; ddlUnit.SelectedValue = "-1"; txtItemName.Text = ""; txtItemMake.Text = "";
                                        txtItemPartNo.Text = "";
                                        string scripts = "alert('Insert successfully.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        BindGetItemDetail();
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill item part no.');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill item make.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly select unit.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill item name.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly select item group.');";
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
            try
            {
                if (e.CommandName == "EditDetail")
                {
                    LinkButton lnk = (LinkButton)e.CommandSource;
                    HiddenField hdnTransID = (HiddenField)lnk.Parent.FindControl("hdnTransID");

                    ViewState["Transid"] = hdnTransID.Value;
                    HiddenField hdnItemGroupID = (HiddenField)lnk.Parent.FindControl("hdnItemGroupID");
                    ViewState["GroupId"] = hdnItemGroupID.Value;

                    HiddenField hdnUnitID = (HiddenField)lnk.Parent.FindControl("hdnUnitID");
                    ViewState["UnitId"] = hdnUnitID.Value;
                    ModalPopupExtender1.Show();
                    Hashtable ht = new Hashtable();
                    ht.Add("@TransID", hdnTransID.Value);
                    ht.Add("@CompanyID", Session["CompID"].ToString());
                    DataTable DT = PMCApp.Get(ht, "GetItemMasterDetail");
                    LblEditGroup.Text = DT.Rows[0]["GroupName"].ToString();
                    TxtEditItem.Text = DT.Rows[0]["ItemName"].ToString();
                    lblEditUnit.Text = DT.Rows[0]["UnitName"].ToString();
                    lblEditMake.Text = DT.Rows[0]["Make"].ToString();
                    txtEditPartNo.Text = DT.Rows[0]["PartNo"].ToString();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void EditSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (TxtEditItem.Text == "")
                {
                    ModalPopupExtender1.Show();
                    string scripts = "alert('Kindly fill Item.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
                else if (txtEditPartNo.Text == "")
                {
                    string scripts = "alert('Kindly fill PartNo.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender1.Show();
                }
                if (TxtEditItem.Text != "")
                {
                    if (txtEditPartNo.Text != "")
                    {
                        Hashtable ht1 = new Hashtable();
                        ht1.Add("@ItemGroupID", ViewState["GroupId"].ToString());
                        ht1.Add("@UnitID", ViewState["UnitId"].ToString());
                        ht1.Add("@Make", lblEditMake.Text);
                        DataTable dt1 = PMCApp.Get(ht1, "ChecKItemName");
                        if (dt1.Rows.Count > 0)
                        {

                            string scripts = "alert('already exists.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            ModalPopupExtender1.Show();
                        }
                        else
                        {
                            Hashtable ht = new Hashtable();
                            ht.Add("@TransID", ViewState["Transid"].ToString());
                            ht.Add("@ItemName", TxtEditItem.Text);
                            ht.Add("@PartNo", txtEditPartNo.Text);
                            ht.Add("@ModifiedBy", Session["UserId"].ToString());
                            PMCApp.Get(ht, "UpdateItmMaster");
                            string scripts11 = "alert('Update Successfully.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts11, true);
                            BindGetItemDetail();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void EditCancel_Click(object sender, EventArgs e)
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

        protected void ddlitemGropgrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGetItemDetail();
        }
        protected void btnAddNewGroupname_Click(object sender, EventArgs e)
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
                            ModalPopupExtender2.Show();

                        }
                        else
                        {
                            DT = PMCApp.GetDataTableWithTwoStringValue("GetGroupCode", txtName.Text, txtCode.Text);
                            if (DT.Rows.Count > 0)
                            {
                                string scripts = "alert('Group code is already exists.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                ModalPopupExtender2.Show();
                            }
                            else
                            {
                                PMC.GetMaxIDForItemGroupID(Session["CompID"].ToString(), out GroupID);
                                PMC.InsertItemGroupMaster(Session["CompID"].ToString(), txtName.Text, txtCode.Text, Session["UserID"].ToString(), GroupID.ToString());
                                txtName.Text = ""; txtCode.Text = "";
                                PMC.BindGetGroupDDL(ddlGroup);

                                string scripts = "alert('Insert Successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill group code.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender2.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill group name.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender2.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }

        }
        protected void BtnCancelAddNewGroupName_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
        }
        protected void LnkAddNewGroupName_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
        }
        protected void LnkAddNewUnit_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Show();
        }
        protected void btnAddNewsave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtaddnewUnitName.Text != "")
                {
                    if (txtaddnewUnitcode.Text != "")
                    {
                        DT = PMCApp.GetDataTableWithOneStringValue("GetUnitName", txtaddnewUnitName.Text);
                        if (DT.Rows.Count > 0)
                        {
                            string scripts = "alert('Unit name is already exists.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            ModalPopupExtender3.Show();
                        }
                        else
                        {
                            DT = PMCApp.GetDataTableWithTwoStringValue("GetUnitCode", txtaddnewUnitName.Text, txtaddnewUnitcode.Text);
                            if (DT.Rows.Count > 0)
                            {
                                string scripts = "alert('Unit code is already exists.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                ModalPopupExtender3.Show();
                            }
                            else
                            {
                                PMC.GetMaxIDForUnitID(Session["CompID"].ToString(), out UnitID);
                                PMC.InsertUnitMaster(txtaddnewUnitName.Text, txtaddnewUnitcode.Text, Session["UserID"].ToString(), UnitID.ToString(), Session["CompID"].ToString());
                                PMC.BindGetUnitDetail(ddlUnit);
                                txtaddnewUnitName.Text = ""; txtaddnewUnitcode.Text = "";

                                string scripts = "alert('Insert Successfully.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill unit code.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        ModalPopupExtender3.Show();
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill unit name.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    ModalPopupExtender3.Show();
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void BtnAddNewCancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Hide();
        }
    }
}
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
using System.Text.RegularExpressions;
using PMCSoft.Infrastructure.Data;
 

public partial class Admin_AddNewProject : System.Web.UI.Page
{
    BALPMC PMC = new BALPMC();
    DataTable DT = new DataTable();
    string ProjID = string.Empty;
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
                    PMC.GetMaxIDForProjID(Session["CompID"].ToString(), out ProjID);
                    txtProjectID.Text = ProjID;
                    BindR();
                    GetCountry();
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
            PMC.BindGetProjectParticulars(GridView1);
            PMC.BindGetAvailibilityOfDocuments(GridView2);
            PMC.BindGetInsuranceLicenses(GridView3);
            PMC.BindGetOtherDepositBond(GridView4);
            PMC.BindGetFacilitiesProvided(GridView5);
            PMC.BindGetMobilizationAdvance(GridView6);
            PMC.BindGetBillingParticulars(GridView7);
            PMC.BindGetPaymentTerms(GridView8);
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void GetCountry()
    {
        try
        {
            PMC.BindCountryDdl(ddlClientCountry);
            ddlClientState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlClientCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlProjectManagerCountry);
            ddlProjectManagerState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlProjectManagerCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlArchitectCountry);
            ddlArchitectState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlArchitectCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlStructuralConsultantCountry);
            ddlStructuralConsultantState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlStructuralConsultantCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlMechanicalCountry);
            ddlMechanicalState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlMechanicalCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlElectricalCountry);
            ddlElectricalState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlElectricalCity.Items.Insert(0, new ListItem("Select City", "-1"));

            PMC.BindCountryDdl(ddlPlumbingCountry);
            ddlPlumbingState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlPlumbingCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    private bool IsValidEmail(string emailAddress)
    {
        return Regex.IsMatch(emailAddress, @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");
    }

    protected void btnParticularsSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //int checkEmail = 0;
            if (txtOriginalContractValue.Text != "")
            {
                txtOriginalContractValue.Text = txtOriginalContractValue.Text;
            }
            else
            {
                txtOriginalContractValue.Text = "0.00";
            }
            if (txtRevisedContractValue.Text != "")
            {
                txtRevisedContractValue.Text = txtRevisedContractValue.Text;
            }
            else
            {
                txtRevisedContractValue.Text = "0.00";
            }
            if (txtExpectedContractValue.Text != "")
            {
                txtExpectedContractValue.Text = txtExpectedContractValue.Text;
            }
            else
            {
                txtExpectedContractValue.Text = "0.00";
            }
            if (txtProjectName.Text != "")
            {
                if (txtLocation.Text != "")
                {
                    if (txtDateOfAward.Text != "")
                    {
                        if (txtLOIDate.Text != "")
                        {
                            if (txtNameOfRegion.Text != "")
                            {
                                if (ddlClientCountry.SelectedValue != "-1" || ddlProjectManagerCountry.SelectedValue != "-1" || ddlArchitectCountry.SelectedValue != "-1" || ddlStructuralConsultantCountry.SelectedValue != "-1" || ddlMechanicalCountry.SelectedValue != "-1" || ddlElectricalCountry.SelectedValue != "-1" || ddlPlumbingCountry.SelectedValue != "-1")
                                {
                                    if (ddlClientState.SelectedValue != "-1" || ddlProjectManagerState.SelectedValue != "-1" || ddlArchitectState.SelectedValue != "-1" || ddlStructuralConsultantState.SelectedValue != "-1" || ddlMechanicalState.SelectedValue != "-1" || ddlElectricalState.SelectedValue != "-1" || ddlPlumbingState.SelectedValue != "-1")
                                    {
                                        if (ddlClientCity.SelectedValue != "-1" || ddlProjectManagerCity.SelectedValue != "-1" || ddlArchitectCity.SelectedValue != "-1" || ddlStructuralConsultantCity.SelectedValue != "-1" || ddlMechanicalCity.SelectedValue != "-1" || ddlElectricalCity.SelectedValue != "-1" || ddlPlumbingCity.SelectedValue != "-1")
                                        {
                                            if (txtStipulatedDateOfStart.Text != "" || txtActualDateOfStart.Text != "" || txtStipulatedDateOfFinish.Text != "")
                                            {
                                                DT = PMCApp.GetDataTableWithOneStringValue("GetProjectParticularsDetailA", txtProjectID.Text);
                                                if (DT.Rows.Count > 0)
                                                {
                                                    string scripts = "alert('Project particulars detail is already exists.');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                                else
                                                {
                                                    PMC.InsertProjectParticularsDetailA(Session["CompID"].ToString(), txtProjectID.Text, txtProjectName.Text, txtProjectClause.Text,
                                                        txtProjectAmendments.Text, txtLocation.Text, txtLocationClause.Text, txtLocationAmendments.Text, txtDateOfAward.Text,
                                                        txtDateofAwardClause.Text, txtDateOfAwardAmendments.Text, txtLOINo.Text, txtLOINoClause.Text, txtLOINoAmendments.Text,
                                                        txtLOIDate.Text, txtLOIDateClause.Text, txtLOIDateAmendments.Text, txtNameOfRegion.Text, txtNameOfRegionClause.Text,
                                                        txtNameOfRegionAmendments.Text, txtProjectInchargeName.Text, txtProjectInChargeMobileNo.Text, txtProjectInChargeClause.Text,
                                                        txtProjectInChargeAmendments.Text, txtClientName.Text, txtClientAddress.Text, txtClientMobileNo.Text, txtClientClause.Text,
                                                        txtClientAmendments.Text, txtProjectManagerName.Text, txtProjectManagerAddress.Text, txtProjectManagerMobileNo.Text,
                                                        txtProjectManagerClause.Text, txtProjectManagerAmendments.Text, txtArchitectName.Text, txtArchitectAddress.Text,
                                                        txtArchitectMobileNo.Text, txtArchitectClause.Text, txtArchitectAmendments.Text, txtStructuralConsultantName.Text,
                                                        txtStructuralConsultantAddress.Text, txtStructuralConsultantMobileNo.Text, txtStructuralConsultantClause.Text,
                                                        txtStructuralConsultantAmendments.Text, txtMechanicalName.Text, txtMechanicalAddress.Text, txtMechanicalMobileNo.Text,
                                                        txtMechanicalClause.Text, txtMechanicalAmendments.Text, txtElectricalName.Text, txtElectricalAddress.Text, txtElectricalMobileNo.Text,
                                                        txtElectricalClause.Text, txtElectricalAmendments.Text, txtPlumbingName.Text, txtPlumbingAddress.Text, txtPlumbingMobileNo.Text,
                                                        txtPlumbingClause.Text, txtPlumbingAmendments.Text, Session["UserID"].ToString(), ddlClientCountry.SelectedValue.ToString(),
                                                        ddlClientState.SelectedValue.ToString(), ddlClientCity.SelectedValue.ToString(), ddlProjectManagerCountry.SelectedValue.ToString(),
                                                        ddlProjectManagerState.SelectedValue.ToString(), ddlProjectManagerCity.SelectedValue.ToString(), ddlArchitectCountry.SelectedValue.ToString(),
                                                        ddlArchitectState.SelectedValue.ToString(), ddlArchitectCity.SelectedValue.ToString(), ddlStructuralConsultantCountry.SelectedValue.ToString(),
                                                        ddlStructuralConsultantState.SelectedValue.ToString(), ddlStructuralConsultantCity.SelectedValue.ToString(),
                                                        ddlMechanicalCountry.SelectedValue.ToString(), ddlMechanicalState.SelectedValue.ToString(), ddlMechanicalCity.SelectedValue.ToString(),
                                                        ddlElectricalCountry.SelectedValue.ToString(), ddlMechanicalState.SelectedValue.ToString(), ddlMechanicalCity.SelectedValue.ToString(),
                                                        ddlPlumbingCountry.SelectedValue.ToString(), ddlPlumbingState.SelectedValue.ToString(), ddlPlumbingCity.SelectedValue.ToString(),
                                                        txtStipulatedDateOfStart.Text, txtActualDateOfStart.Text, txtStipulatedDateOfFinish.Text, txtStipulatedDateClause.Text,
                                                        txtStipulatedDateAmendments.Text, txtActualDateClause.Text, txtActualDateAmendments.Text, txtStipulatedDateFinishClause.Text,
                                                        txtStipulatedDateFinishAmendments.Text
                                                        ,
                                                        txtClientZipCode.Text, txtProjectManagerZipCode.Text, txtArchitectZipCode.Text,
                                                        txtStructuralConsultantZipCode.Text, txtMechanicalZipCode.Text, txtElectricalZipCode.Text, txtPlumbingZipCode.Text, txtClientPhoneNo.Text,
                                                        txtProjectManagerPhoneNo.Text, txtArchitectPhoneNo.Text, txtStructuralConsultantPhoneNo.Text, txtMechanicalPhoneNo.Text,
                                                        txtElectricalPhoneNo.Text, txtPlumbingPhoneNo.Text, txtOriginalContractValue.Text, txtOCVWord.Text, txtOCVClause.Text,
                                                        txtOCVAmendments.Text, txtRevisedContractValue.Text, txtRCVWord.Text, txtRCVClause.Text, txtRCVAmendments.Text, txtExpectedContractValue.Text,
                                                        txtECVWord.Text, txtECVClause.Text, txtECVAmendments.Text, txtClientEmail.Text, txtClientFaxNo.Text, txtProjectManagerEmail.Text,
                                                        txtProjectManagerFaxNo.Text, txtArchitectEmail.Text, txtArchitectFaxNo.Text, txtStructuralEmail.Text, txtStructuralFaxNo.Text,
                                                        txtMechanicalEmail.Text, txtMechanicalFaxNo.Text, txtElectricalEmail.Text, txtElectricalFaxNo.Text, txtPlumbingEmail.Text, txtPlumbingFaxNo.Text
                                                        );

                                                    for (int i = 0; i < GridView1.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView1.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView1.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView1.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView1.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView1.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertProjectParticularDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView2.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView2.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView2.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView2.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView2.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView2.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertAvailibilityOfDocumentsDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView3.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView3.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView3.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView3.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView3.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView3.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertInsuranceLicensesDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView4.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView4.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView4.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView4.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView4.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView4.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertOtherDepositBondDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView5.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView5.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView5.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView5.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView5.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView5.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertFacilitiesProvidedDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView6.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView6.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView6.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView6.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView6.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView6.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertMobilizationAdvanceDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView7.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView7.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView7.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView7.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView7.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView7.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertBillingParticularsDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }
                                                    for (int i = 0; i < GridView8.Rows.Count; i++)
                                                    {
                                                        HiddenField hdnProjectParticularsTransID = (HiddenField)GridView8.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                        Label lblParticulars = (Label)GridView8.Rows[i].FindControl("lblParticulars");
                                                        TextBox txtContractProvision = (TextBox)GridView8.Rows[i].FindControl("txtContractProvision");
                                                        TextBox txtClause = (TextBox)GridView8.Rows[i].FindControl("txtClause");
                                                        TextBox txtAmendments = (TextBox)GridView8.Rows[i].FindControl("txtAmendments");

                                                        PMC.InsertPaymentTermsDetail(Session["CompID"].ToString(), txtProjectID.Text, hdnProjectParticularsTransID.Value,
                                                            lblParticulars.Text, txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString());
                                                    }

                                                    PMC.GetMaxIDForProjDetailID(Session["CompID"].ToString(), out ProjID);
                                                    txtProjectID.Text = ProjID;
                                                    BindR();

                                                    ClearField();
                                                    string scripts = "alert('Project insert successfully.');";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                }
                                            }
                                            else
                                            {
                                                string scripts = "alert('Kindly fill start date and finish date.');";
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                            }
                                        }
                                        else
                                        {
                                            string scripts = "alert('Kindly fill city.');";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                        }
                                    }
                                    else
                                    {
                                        string scripts = "alert('Kindly fill state.');";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                    }
                                }
                                else
                                {
                                    string scripts = "alert('Kindly fill country.');";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                }
                            }
                            else
                            {
                                string scripts = "alert('Kindly fill region name.');";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                            }
                        }
                        else
                        {
                            string scripts = "alert('Kindly fill LOI Date.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        }
                    }
                    else
                    {
                        string scripts = "alert('Kindly fill date of award.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                    }
                }
                else
                {
                    string scripts = "alert('Kindly fill location.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            else
            {
                string scripts = "alert('Kindly fill Project Name.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    public void ClearField()
    {
        try
        {
            ddlClientCountry.SelectedValue = "-1"; ddlClientState.SelectedValue = "-1"; ddlClientCity.SelectedValue = "-1"; ddlProjectManagerCountry.SelectedValue = "-1";
            ddlProjectManagerState.SelectedValue = "-1"; ddlProjectManagerCity.SelectedValue = "-1"; ddlArchitectCountry.SelectedValue = "-1"; ddlArchitectState.SelectedValue = "-1";
            ddlArchitectCity.SelectedValue = "-1"; ddlStructuralConsultantCountry.SelectedValue = "-1"; ddlStructuralConsultantState.SelectedValue = "-1"; ddlStructuralConsultantCity.SelectedValue = "-1";
            ddlMechanicalCountry.SelectedValue = "-1"; ddlMechanicalState.SelectedValue = "-1"; ddlMechanicalCity.SelectedValue = "-1"; ddlElectricalCountry.SelectedValue = "-1";
            ddlElectricalState.SelectedValue = "-1"; ddlElectricalCity.SelectedValue = "-1"; ddlPlumbingCountry.SelectedValue = "-1"; ddlPlumbingState.SelectedValue = "-1"; ddlPlumbingCity.SelectedValue = "-1";

            txtProjectName.Text = ""; txtProjectClause.Text = ""; txtProjectAmendments.Text = ""; txtLocation.Text = "";
            txtLocationClause.Text = ""; txtLocationAmendments.Text = ""; txtDateOfAward.Text = ""; txtDateofAwardClause.Text = "";
            txtDateOfAwardAmendments.Text = ""; txtLOINo.Text = ""; txtLOINoClause.Text = ""; txtLOINoAmendments.Text = "";
            txtLOIDate.Text = ""; txtLOIDateClause.Text = ""; txtLOIDateAmendments.Text = ""; txtNameOfRegion.Text = "";
            txtNameOfRegionClause.Text = ""; txtNameOfRegionAmendments.Text = ""; txtProjectInchargeName.Text = ""; txtProjectInChargeMobileNo.Text = "";
            txtProjectInChargeClause.Text = ""; txtProjectInChargeAmendments.Text = ""; txtClientName.Text = ""; txtClientMobileNo.Text = "";
            txtClientAddress.Text = ""; txtClientZipCode.Text = ""; txtProjectManagerName.Text = ""; txtProjectManagerAddress.Text = "";
            txtProjectManagerZipCode.Text = ""; txtProjectManagerMobileNo.Text = ""; txtArchitectName.Text = ""; txtStructuralConsultantName.Text = "";
            txtStructuralConsultantAddress.Text = ""; txtStructuralConsultantZipCode.Text = ""; txtStructuralConsultantMobileNo.Text = "";
            txtClientClause.Text = ""; txtClientAmendments.Text = ""; txtProjectManagerClause.Text = ""; txtProjectManagerAmendments.Text = "";
            txtArchitectClause.Text = ""; txtArchitectAmendments.Text = ""; txtStructuralConsultantClause.Text = ""; txtStructuralConsultantAmendments.Text = "";
            txtMechanicalName.Text = ""; txtMechanicalAddress.Text = ""; txtMechanicalZipCode.Text = ""; txtMechanicalMobileNo.Text = ""; txtMechanicalClause.Text = "";
            txtMechanicalAmendments.Text = ""; txtElectricalName.Text = ""; txtElectricalZipCode.Text = ""; txtElectricalMobileNo.Text = ""; txtElectricalClause.Text = "";
            txtElectricalAmendments.Text = ""; txtPlumbingName.Text = ""; txtPlumbingAddress.Text = ""; txtPlumbingZipCode.Text = ""; txtPlumbingMobileNo.Text = "";
            txtPlumbingClause.Text = ""; txtPlumbingAmendments.Text = ""; txtStipulatedDateOfStart.Text = ""; txtActualDateOfStart.Text = ""; 
            txtStipulatedDateOfFinish.Text = ""; txtStipulatedDateClause.Text = ""; txtStipulatedDateAmendments.Text = ""; txtActualDateClause.Text = "";
            txtActualDateAmendments.Text = ""; txtStipulatedDateFinishClause.Text = ""; txtStipulatedDateFinishAmendments.Text = ""; txtClientZipCode.Text = ""; 
            txtProjectManagerZipCode.Text = ""; txtArchitectZipCode.Text = ""; txtStructuralConsultantZipCode.Text = ""; txtMechanicalZipCode.Text = ""; 
            txtElectricalZipCode.Text = ""; txtPlumbingZipCode.Text = ""; txtClientPhoneNo.Text = ""; txtProjectManagerPhoneNo.Text = ""; txtArchitectPhoneNo.Text = ""; 
            txtStructuralConsultantPhoneNo.Text = ""; txtMechanicalPhoneNo.Text = ""; txtElectricalPhoneNo.Text = ""; txtPlumbingPhoneNo.Text = ""; 
            txtOriginalContractValue.Text = ""; txtOCVWord.Text = ""; txtOCVClause.Text = ""; txtOCVAmendments.Text = ""; txtRevisedContractValue.Text = ""; 
            txtRCVWord.Text = ""; txtRCVClause.Text = ""; txtRCVAmendments.Text = ""; txtExpectedContractValue.Text = ""; txtECVWord.Text = "";
            txtECVClause.Text = ""; txtECVAmendments.Text = ""; txtClientEmail.Text = ""; txtClientFaxNo.Text = ""; txtProjectManagerEmail.Text = "";
            txtProjectManagerFaxNo.Text = ""; txtArchitectEmail.Text = ""; txtArchitectFaxNo.Text = ""; txtStructuralEmail.Text = ""; txtStructuralFaxNo.Text = "";
            txtMechanicalEmail.Text = ""; txtMechanicalFaxNo.Text = ""; txtElectricalEmail.Text = ""; txtElectricalFaxNo.Text = ""; txtPlumbingEmail.Text = "";
            txtPlumbingFaxNo.Text = "";
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnParticularsCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Home.aspx");
    }
    protected void ddlClientCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlClientState, ddlClientCountry.SelectedValue.ToString());
            ddlClientCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlClientState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlClientCity, ddlClientState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlProjectManagerCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlProjectManagerState, ddlProjectManagerCountry.SelectedValue.ToString());
            ddlProjectManagerCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlProjectManagerState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlProjectManagerCity, ddlProjectManagerState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlArchitectCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlArchitectState, ddlArchitectCountry.SelectedValue.ToString());
            ddlArchitectCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlArchitectState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlArchitectCity, ddlArchitectState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlStructuralConsultantCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlStructuralConsultantState, ddlStructuralConsultantCountry.SelectedValue.ToString());
            ddlStructuralConsultantCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlStructuralConsultantState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlStructuralConsultantCity, ddlStructuralConsultantState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlMechanicalCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlMechanicalState, ddlMechanicalCountry.SelectedValue.ToString());
            ddlMechanicalCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlMechanicalState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlMechanicalCity, ddlMechanicalState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlElectricalCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlElectricalState, ddlElectricalCountry.SelectedValue.ToString());
            ddlElectricalCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlElectricalState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlElectricalCity, ddlElectricalState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlPlumbingCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindStateDdl(ddlPlumbingState, ddlPlumbingCountry.SelectedValue.ToString());
            ddlPlumbingCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ddlPlumbingState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            PMC.BindCityDdl(ddlPlumbingCity, ddlPlumbingState.SelectedValue.ToString());
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void ImgRefresh_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            PMC.GetMaxIDForProjID(Session["CompID"].ToString(), out ProjID);
            txtProjectID.Text = ProjID;
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
}

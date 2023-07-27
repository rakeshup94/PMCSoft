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
    public partial class ViewEditProject : BasePage
    {
          ();
        DataTable DT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string strReq = "";
                    strReq = Request.RawUrl;
                    strReq = strReq.Substring(strReq.IndexOf('?') + 1);

                    if (!strReq.Equals(""))
                    {
                        strReq = DecryptQueryString(strReq);
                        string[] arrMsgs = strReq.Split('&');
                        string[] arrIndMsg;

                        string PRJID = "";
                        arrIndMsg = arrMsgs[0].Split('=');
                        PRJID = arrIndMsg[1].ToString().Trim();
                        ViewState["PRJID"] = PRJID.ToString();
                    }
                    GetProjectParticularADetail(ViewState["PRJID"].ToString());
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private string DecryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Decrypt();
        }
        public string EncryptQueryString(string strQueryString)
        {
               ();
            return  strQueryString.Encrypt();
        }
        public void GetProjectParticularADetail(string ProjectID)
        {
            try
            {
                DT = PMCApp.GetDataTableWithOneStringValue("GetProjectParticularADetail", ProjectID.ToString());
                if (DT.Rows.Count > 0)
                {
                    txtProjectName.Text = DT.Rows[0]["NameOfProject"].ToString();
                    txtProjectClause.Text = DT.Rows[0]["ProjectClause"].ToString();
                    txtProjectAmendments.Text = DT.Rows[0]["ProjectAmendments"].ToString();
                    txtLocation.Text = DT.Rows[0]["Location"].ToString();
                    txtLocationClause.Text = DT.Rows[0]["LocationClause"].ToString();
                    txtLocationAmendments.Text = DT.Rows[0]["LocationAmendments"].ToString();
                    txtDateOfAward.Text = DT.Rows[0]["DateOfAward"].ToString();
                    txtDateofAwardClause.Text = DT.Rows[0]["AwardClause"].ToString();
                    txtDateOfAwardAmendments.Text = DT.Rows[0]["AwardAmendments"].ToString();
                    txtLOINo.Text = DT.Rows[0]["LOINo"].ToString();
                    txtLOINoClause.Text = DT.Rows[0]["LOINoClause"].ToString();
                    txtLOINoAmendments.Text = DT.Rows[0]["LOINoAmendments"].ToString();
                    txtLOIDate.Text = DT.Rows[0]["LOIDate"].ToString();
                    txtLOIDateClause.Text = DT.Rows[0]["LOIDateClause"].ToString();
                    txtLOIDateAmendments.Text = DT.Rows[0]["LOIDateAmendments"].ToString();
                    txtNameOfRegion.Text = DT.Rows[0]["NameOfRegion"].ToString();
                    txtNameOfRegionClause.Text = DT.Rows[0]["RegionClause"].ToString();
                    txtNameOfRegionAmendments.Text = DT.Rows[0]["RegionAmendments"].ToString();
                    txtProjectInchargeName.Text = DT.Rows[0]["ProjectInchargeName"].ToString();
                    txtProjectInChargeMobileNo.Text = DT.Rows[0]["ProjectInchargeMobileNo"].ToString();
                    txtProjectInChargeClause.Text = DT.Rows[0]["InchargeClause"].ToString();
                    txtProjectInChargeAmendments.Text = DT.Rows[0]["InchargeAmendments"].ToString();
                    txtClientName.Text = DT.Rows[0]["ClientName"].ToString();
                    txtClientAddress.Text = DT.Rows[0]["ClientAddress"].ToString();
                    txtClientMobileNo.Text = DT.Rows[0]["ClientMobileNo"].ToString();
                    txtClientClause.Text = DT.Rows[0]["ClientClause"].ToString();
                    txtClientAmendments.Text = DT.Rows[0]["ClientAmendments"].ToString();
                    txtProjectManagerName.Text = DT.Rows[0]["ProjectManagerName"].ToString();
                    txtProjectManagerAddress.Text = DT.Rows[0]["ProjectManagerAddress"].ToString();
                    txtProjectManagerMobileNo.Text = DT.Rows[0]["ProjectManagerMobileNo"].ToString();
                    txtProjectManagerClause.Text = DT.Rows[0]["ProjectManagerClause"].ToString();
                    txtProjectManagerAmendments.Text = DT.Rows[0]["ProjectManagerAmendments"].ToString();
                    txtArchitectName.Text = DT.Rows[0]["ArchitectName"].ToString();
                    txtArchitectAddress.Text = DT.Rows[0]["ArchitectAddress"].ToString();
                    txtArchitectMobileNo.Text = DT.Rows[0]["ArchitectMobileNo"].ToString();
                    txtArchitectClause.Text = DT.Rows[0]["ArchitectClause"].ToString();
                    txtArchitectAmendments.Text = DT.Rows[0]["ArchitectAmendments"].ToString();
                    txtStructuralConsultantName.Text = DT.Rows[0]["StructuralConsultantName"].ToString();
                    txtStructuralConsultantAddress.Text = DT.Rows[0]["StructuralConsultantAddress"].ToString();
                    txtStructuralConsultantMobileNo.Text = DT.Rows[0]["StructuralConsultantMobileNo"].ToString();
                    txtStructuralConsultantClause.Text = DT.Rows[0]["StructuralClause"].ToString();
                    txtStructuralConsultantAmendments.Text = DT.Rows[0]["StructuralAmendments"].ToString();
                    txtMechanicalName.Text = DT.Rows[0]["MechanicalName"].ToString();
                    txtMechanicalAddress.Text = DT.Rows[0]["MechanicalAddress"].ToString();
                    txtMechanicalMobileNo.Text = DT.Rows[0]["MechanicalMobileNo"].ToString();
                    txtMechanicalClause.Text = DT.Rows[0]["MechanicalClause"].ToString();
                    txtMechanicalAmendments.Text = DT.Rows[0]["MechanicalAmendments"].ToString();
                    txtElectricalName.Text = DT.Rows[0]["ElectricalName"].ToString();
                    txtElectricalAddress.Text = DT.Rows[0]["ElectricalAddress"].ToString();
                    txtElectricalMobileNo.Text = DT.Rows[0]["ElectricalMobileNo"].ToString();
                    txtElectricalClause.Text = DT.Rows[0]["ElectricalClause"].ToString();
                    txtElectricalAmendments.Text = DT.Rows[0]["ElectricalAmendments"].ToString();
                    txtPlumbingName.Text = DT.Rows[0]["PlumbingName"].ToString();
                    txtPlumbingAddress.Text = DT.Rows[0]["PlumbingAddress"].ToString();
                    txtPlumbingMobileNo.Text = DT.Rows[0]["PlumbingMobileNo"].ToString();
                    txtPlumbingClause.Text = DT.Rows[0]["PlumbingClause"].ToString();
                    txtPlumbingAmendments.Text = DT.Rows[0]["PlumbingAmendments"].ToString();
                    txtClientZipCode.Text = DT.Rows[0]["ClientZipCode"].ToString();
                    txtProjectManagerZipCode.Text = DT.Rows[0]["ProjectManagerZipCode"].ToString();
                    txtArchitectZipCode.Text = DT.Rows[0]["ArchitectZipCode"].ToString();
                    txtStructuralConsultantZipCode.Text = DT.Rows[0]["StructuralZipCode"].ToString();
                    txtMechanicalZipCode.Text = DT.Rows[0]["MechanicalZipCode"].ToString();
                    txtElectricalZipCode.Text = DT.Rows[0]["ElectricalZipCode"].ToString();
                    txtPlumbingZipCode.Text = DT.Rows[0]["PlumbingZipCode"].ToString();
                    txtClientPhoneNo.Text = DT.Rows[0]["ClientPhoneNo"].ToString();
                    txtProjectManagerPhoneNo.Text = DT.Rows[0]["ProjectManagerPhoneNo"].ToString();
                    txtArchitectPhoneNo.Text = DT.Rows[0]["ArchitectPhoneNo"].ToString();
                    txtStructuralConsultantPhoneNo.Text = DT.Rows[0]["StructuralPhoneNo"].ToString();
                    txtMechanicalPhoneNo.Text = DT.Rows[0]["MechanicalPhoneNo"].ToString();
                    txtElectricalPhoneNo.Text = DT.Rows[0]["ElectricalPhoneNo"].ToString();
                    txtPlumbingPhoneNo.Text = DT.Rows[0]["PlumbingPhoneNo"].ToString();
                    txtOriginalContractValue.Text = DT.Rows[0]["OriginalContractValue"].ToString();
                    txtOCVWord.Text = DT.Rows[0]["OCVWord"].ToString();
                    txtOCVClause.Text = DT.Rows[0]["OCVClause"].ToString();
                    txtOCVAmendments.Text = DT.Rows[0]["OCVAmendments"].ToString();
                    txtRevisedContractValue.Text = DT.Rows[0]["RevisedContractValue"].ToString();
                    txtRCVWord.Text = DT.Rows[0]["RCVWord"].ToString();
                    txtRCVClause.Text = DT.Rows[0]["RCVClause"].ToString();
                    txtRCVAmendments.Text = DT.Rows[0]["RCVAmendments"].ToString();
                    txtExpectedContractValue.Text = DT.Rows[0]["ExpectedContractValue"].ToString();
                    txtECVWord.Text = DT.Rows[0]["ECVWord"].ToString();
                    txtECVClause.Text = DT.Rows[0]["ECVClause"].ToString();
                    txtECVAmendments.Text = DT.Rows[0]["ECVAmendments"].ToString();
                    txtClientEmail.Text = DT.Rows[0]["ClientEmail"].ToString();
                    txtClientFaxNo.Text = DT.Rows[0]["ClientFax"].ToString();
                    txtProjectManagerEmail.Text = DT.Rows[0]["ProjectManagerEmail"].ToString();
                    txtProjectManagerFaxNo.Text = DT.Rows[0]["ProjectManagerFax"].ToString();
                    txtArchitectEmail.Text = DT.Rows[0]["ArchitectEmail"].ToString();
                    txtArchitectFaxNo.Text = DT.Rows[0]["ArchitectFax"].ToString();
                    txtStructuralEmail.Text = DT.Rows[0]["StructuralEmail"].ToString();
                    txtStructuralFaxNo.Text = DT.Rows[0]["StructuralFax"].ToString();
                    txtMechanicalEmail.Text = DT.Rows[0]["MechanicalEmail"].ToString();
                    txtMechanicalFaxNo.Text = DT.Rows[0]["MechanicalFax"].ToString();
                    txtElectricalEmail.Text = DT.Rows[0]["ElectricalEmail"].ToString();
                    txtElectricalFaxNo.Text = DT.Rows[0]["ElectricalFax"].ToString();
                    txtPlumbingEmail.Text = DT.Rows[0]["PlumbingEmail"].ToString();
                    txtPlumbingFaxNo.Text = DT.Rows[0]["PlumbingFax"].ToString();

                    GetCountry();

                    ddlClientCountry.SelectedValue = DT.Rows[0]["ClientCountry"].ToString();
                    PMC.BindStateDdl(ddlClientState, ddlClientCountry.SelectedValue.ToString());
                    ddlClientState.SelectedValue = DT.Rows[0]["ClientState"].ToString();
                    PMC.BindCityDdl(ddlClientCity, ddlClientState.SelectedValue.ToString());
                    ddlClientCity.SelectedValue = DT.Rows[0]["ClientCity"].ToString();

                    ddlProjectManagerCountry.SelectedValue = DT.Rows[0]["ProjectManagerCountry"].ToString();
                    PMC.BindStateDdl(ddlProjectManagerState, ddlProjectManagerCountry.SelectedValue.ToString());
                    ddlProjectManagerState.SelectedValue = DT.Rows[0]["ProjectManagerState"].ToString();
                    PMC.BindCityDdl(ddlProjectManagerCity, ddlProjectManagerState.SelectedValue.ToString());
                    ddlProjectManagerCity.SelectedValue = DT.Rows[0]["ProjectManagerCity"].ToString();

                    ddlArchitectCountry.SelectedValue = DT.Rows[0]["ArchitectCountry"].ToString();
                    PMC.BindStateDdl(ddlArchitectState, ddlArchitectCountry.SelectedValue.ToString());
                    ddlArchitectState.SelectedValue = DT.Rows[0]["ArchitectState"].ToString();
                    PMC.BindCityDdl(ddlArchitectCity, ddlArchitectState.SelectedValue.ToString());
                    ddlArchitectCity.SelectedValue = DT.Rows[0]["ArchitectCity"].ToString();

                    ddlStructuralConsultantCountry.SelectedValue = DT.Rows[0]["StructuralCountry"].ToString();
                    PMC.BindStateDdl(ddlStructuralConsultantState, ddlStructuralConsultantCountry.SelectedValue.ToString());
                    ddlStructuralConsultantState.SelectedValue = DT.Rows[0]["StructuralState"].ToString();
                    PMC.BindCityDdl(ddlStructuralConsultantCity, ddlStructuralConsultantState.SelectedValue.ToString());
                    ddlStructuralConsultantCity.SelectedValue = DT.Rows[0]["StructuralCity"].ToString();

                    ddlMechanicalCountry.SelectedValue = DT.Rows[0]["MechanicalCountry"].ToString();
                    PMC.BindStateDdl(ddlMechanicalState, ddlMechanicalCountry.SelectedValue.ToString());
                    ddlMechanicalState.SelectedValue = DT.Rows[0]["MechanicalState"].ToString();
                    PMC.BindCityDdl(ddlMechanicalCity, ddlMechanicalState.SelectedValue.ToString());
                    ddlMechanicalCity.SelectedValue = DT.Rows[0]["MechanicalCity"].ToString();

                    ddlElectricalCountry.SelectedValue = DT.Rows[0]["ElectricalCountry"].ToString();
                    PMC.BindStateDdl(ddlElectricalState, ddlElectricalCountry.SelectedValue.ToString());
                    ddlElectricalState.SelectedValue = DT.Rows[0]["ElectricalState"].ToString();
                    PMC.BindCityDdl(ddlElectricalCity, ddlElectricalState.SelectedValue.ToString());
                    ddlElectricalCity.SelectedValue = DT.Rows[0]["ElectricalCity"].ToString();

                    ddlPlumbingCountry.SelectedValue = DT.Rows[0]["PlumbingCountry"].ToString();
                    PMC.BindStateDdl(ddlPlumbingState, ddlPlumbingCountry.SelectedValue.ToString());
                    ddlPlumbingState.SelectedValue = DT.Rows[0]["PlumbingState"].ToString();
                    PMC.BindCityDdl(ddlPlumbingCity, ddlPlumbingState.SelectedValue.ToString());
                    ddlPlumbingCity.SelectedValue = DT.Rows[0]["PlumbingCity"].ToString();

                    txtStipulatedDateOfStart.Text = DT.Rows[0]["StipulatedDateOfStart"].ToString();
                    txtActualDateOfStart.Text = DT.Rows[0]["ActualDateOfStart"].ToString();
                    txtStipulatedDateOfFinish.Text = DT.Rows[0]["StipulatedDateOfFinish"].ToString();

                    txtStipulatedDateClause.Text = DT.Rows[0]["StipulatedDateStartClause"].ToString();
                    txtStipulatedDateAmendments.Text = DT.Rows[0]["StipulatedDateStartAmendments"].ToString();
                    txtActualDateClause.Text = DT.Rows[0]["ActualDateStartClause"].ToString();
                    txtActualDateAmendments.Text = DT.Rows[0]["ActualDateStartAmendments"].ToString();
                    txtStipulatedDateFinishClause.Text = DT.Rows[0]["StipulatedDateFinishClause"].ToString();
                    txtStipulatedDateFinishAmendments.Text = DT.Rows[0]["StipulatedDateFinishAmendments"].ToString();

                    PMC.GetProjectParticulatsDetail(GridView1, ProjectID.ToString());
                    PMC.GetDetailAvailibilityOfDocuments(GridView2, ProjectID.ToString());
                    PMC.GetInsuranceLicensesDetail(GridView3, ProjectID.ToString());
                    PMC.GetOtherDepositBondDetail(GridView4, ProjectID.ToString());
                    PMC.GetFacilitiesProvidedDetail(GridView5, ProjectID.ToString());
                    PMC.GetMobilizationAdvanceDetail(GridView6, ProjectID.ToString());
                    PMC.GetBillingParticularsDetail(GridView7, ProjectID.ToString());
                    PMC.GetPaymentTermsDetail(GridView8, ProjectID.ToString());
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void btnParticularsSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["PRJID"] != null)
                {
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
                                                        PMC.UpdateParojectParticularsDetailA(txtProjectName.Text, txtProjectClause.Text, txtProjectAmendments.Text, txtLocation.Text, txtLocationClause.Text,
                                                            txtLocationAmendments.Text, txtDateOfAward.Text, txtDateofAwardClause.Text, txtDateOfAwardAmendments.Text, txtLOINo.Text, txtLOINoClause.Text,
                                                            txtLOINoAmendments.Text, txtLOIDate.Text, txtLOIDateClause.Text, txtLOIDateAmendments.Text, txtNameOfRegion.Text, txtNameOfRegionClause.Text,
                                                            txtNameOfRegionAmendments.Text, txtProjectInchargeName.Text, txtProjectInChargeMobileNo.Text, txtProjectInChargeClause.Text, txtProjectInChargeAmendments.Text,
                                                            txtClientName.Text, txtClientAddress.Text, txtClientMobileNo.Text, txtClientClause.Text, txtClientAmendments.Text, txtProjectManagerName.Text,
                                                            txtProjectManagerAddress.Text, txtProjectManagerMobileNo.Text, txtProjectManagerClause.Text, txtProjectManagerAmendments.Text, txtArchitectName.Text,
                                                            txtArchitectAddress.Text, txtArchitectMobileNo.Text, txtArchitectClause.Text, txtArchitectAmendments.Text, txtStructuralConsultantName.Text,
                                                            txtStructuralConsultantAddress.Text, txtStructuralConsultantMobileNo.Text, txtStructuralConsultantClause.Text, txtStructuralConsultantAmendments.Text,
                                                            txtMechanicalName.Text, txtMechanicalAddress.Text, txtMechanicalMobileNo.Text, txtMechanicalClause.Text, txtMechanicalAmendments.Text, txtElectricalName.Text,
                                                            txtElectricalAddress.Text, txtElectricalMobileNo.Text, txtElectricalClause.Text, txtElectricalAmendments.Text, txtPlumbingName.Text, txtPlumbingAddress.Text,
                                                            txtPlumbingMobileNo.Text, txtPlumbingClause.Text, txtPlumbingAmendments.Text, Session["UserID"].ToString(), ddlClientCountry.SelectedValue.ToString(),
                                                            ddlClientState.SelectedValue.ToString(), ddlClientCity.SelectedValue.ToString(), ddlProjectManagerCountry.SelectedValue.ToString(), ddlProjectManagerState.SelectedValue.ToString(),
                                                            ddlProjectManagerCity.SelectedValue.ToString(), ddlArchitectCountry.SelectedValue.ToString(), ddlArchitectState.SelectedValue.ToString(),
                                                            ddlArchitectCity.SelectedValue.ToString(), ddlStructuralConsultantCountry.SelectedValue.ToString(), ddlStructuralConsultantState.SelectedValue.ToString(),
                                                            ddlStructuralConsultantCity.SelectedValue.ToString(), ddlMechanicalCountry.SelectedValue.ToString(), ddlMechanicalState.SelectedValue.ToString(),
                                                            ddlMechanicalCity.SelectedValue.ToString(), ddlElectricalCountry.SelectedValue.ToString(), ddlMechanicalState.SelectedValue.ToString(),
                                                            ddlMechanicalCity.SelectedValue.ToString(), ddlPlumbingCountry.SelectedValue.ToString(), ddlPlumbingState.SelectedValue.ToString(),
                                                            ddlPlumbingCity.SelectedValue.ToString(), txtStipulatedDateOfStart.Text, txtActualDateOfStart.Text, txtStipulatedDateOfFinish.Text,
                                                            txtStipulatedDateClause.Text, txtStipulatedDateAmendments.Text, txtActualDateClause.Text, txtActualDateAmendments.Text, txtStipulatedDateFinishClause.Text,
                                                            txtStipulatedDateFinishAmendments.Text, ViewState["PRJID"].ToString(), txtClientZipCode.Text, txtProjectManagerZipCode.Text, txtArchitectZipCode.Text,
                                                            txtStructuralConsultantZipCode.Text, txtMechanicalZipCode.Text, txtElectricalZipCode.Text, txtPlumbingZipCode.Text, txtClientPhoneNo.Text,
                                                            txtProjectManagerPhoneNo.Text, txtArchitectPhoneNo.Text, txtStructuralConsultantPhoneNo.Text, txtMechanicalPhoneNo.Text, txtElectricalPhoneNo.Text,
                                                            txtPlumbingPhoneNo.Text, txtOriginalContractValue.Text, txtOCVWord.Text, txtOCVClause.Text, txtOCVAmendments.Text, txtRevisedContractValue.Text,
                                                            txtRCVWord.Text, txtRCVClause.Text, txtRCVAmendments.Text, txtExpectedContractValue.Text, txtECVWord.Text, txtECVClause.Text, txtECVAmendments.Text,
                                                            txtClientEmail.Text, txtClientFaxNo.Text, txtProjectManagerEmail.Text, txtProjectManagerFaxNo.Text, txtArchitectEmail.Text, txtArchitectFaxNo.Text,
                                                            txtStructuralEmail.Text, txtStructuralFaxNo.Text, txtMechanicalEmail.Text, txtMechanicalFaxNo.Text, txtElectricalEmail.Text, txtElectricalFaxNo.Text,
                                                            txtPlumbingEmail.Text, txtPlumbingFaxNo.Text);

                                                        for (int i = 0; i < GridView1.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView1.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView1.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView1.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView1.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView1.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblProjectParticularsDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView2.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView2.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView2.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView2.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView2.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView2.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdateAvailibilityOfDocumentsDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView3.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView3.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView3.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView3.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView3.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView3.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblInsuranceLicensesDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView4.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView4.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView4.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView4.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView4.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView4.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblOtherDepositBondDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView5.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView5.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView5.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView5.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView5.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView5.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblFacilitiesProvidedDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView6.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView6.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView6.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView6.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView6.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView6.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblMobilizationAdvanceDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView7.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView7.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView7.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView7.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView7.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView7.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblBillingParticularsDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }
                                                        for (int i = 0; i < GridView8.Rows.Count; i++)
                                                        {
                                                            HiddenField hdnProjectParticularsTransID = (HiddenField)GridView8.Rows[i].FindControl("hdnProjectParticularsTransID");
                                                            Label lblParticulars = (Label)GridView8.Rows[i].FindControl("lblParticulars");
                                                            TextBox txtContractProvision = (TextBox)GridView8.Rows[i].FindControl("txtContractProvision");
                                                            TextBox txtClause = (TextBox)GridView8.Rows[i].FindControl("txtClause");
                                                            TextBox txtAmendments = (TextBox)GridView8.Rows[i].FindControl("txtAmendments");

                                                            PMC.UpdatetblPaymentTermsDetail(txtContractProvision.Text, txtClause.Text, txtAmendments.Text, Session["UserID"].ToString(),
                                                                ViewState["PRJID"].ToString(), hdnProjectParticularsTransID.Value);
                                                        }

                                                        string scripts = "alert('Project detail update successfully.');";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                                                        Response.Redirect("~/Admin/ViewUpdateProject.aspx");
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
        protected void btnParticularsCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ViewUpdateProject.aspx");
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
    }
}
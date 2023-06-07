using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
 
using PMCSoft.Infrastructure.Data;
namespace PMCSoft.Web
{
    public partial class ProjectMasterPage : System.Web.UI.MasterPage
    {
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
                    Hashtable ht = new Hashtable();
                    ht.Add("@UserId", Session["UserId"]);
                    ht.Add("@ProjectId'", Session["PRJID"]);
              
                    DataTable dt = PMCApp.Get(ht, "PagePermission");
           

                    //DataTable dt = PMCApp.Get(ht, "GetMenuHeaderAdmin");

                    for (int k = 0; k < dt.Rows.Count; k++)
                    {
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Item Of Work" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {
                            IdItemOfWork.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Add Item of Work" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAddItemOfWork.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Item of Work" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAddItemOfWork.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Item Of Work" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdItemOfWork.Visible = false;
                            IdAddItemOfWork.Visible = false;


                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Work Programe" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdWorkPrograme.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Work Programe" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdDailyWorkPrograme.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Work Programe" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdDailyWorkPrograme.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Work Programe" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdViewEditWorkProgramme.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View/Edit Work Programe" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdViewEditWorkProgramme.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Approval" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdWorkProgrammeApproval.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Approval" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdWorkProgrammeApproval.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Morning Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdDailyMorningReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Daily Morning Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdDailyMorningReport.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Work Programe" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdWorkPrograme.Visible = false;
                            IdDailyWorkPrograme.Visible = false;
                            IdViewEditWorkProgramme.Visible = false;
                            IdWorkProgrammeApproval.Visible = false;
                            IdDailyMorningReport.Visible = false;



                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff Attendance" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdStaffAttendance.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Add Staff Attendance" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAddStaffAttendance.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Staff Attendance" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAddStaffAttendance.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff Attendance" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdStaffAttendance.Visible = false;
                            IdAddStaffAttendance.Visible = false;


                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Finance" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdFinance.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Add Party/Vendor" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAddVendor.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add Party/Vendor" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAddVendor.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Type" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAddPaymentType.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Type" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAddPaymentType.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAddDebitList.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAddDebitList.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List of Approval" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdDebitListApproval.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List of Approval" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdDebitListApproval.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Reciept" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdPaymentReceipt.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Reciept" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdPaymentReceipt.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Requisition" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdAdvanceRequisition.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Requisition" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdAdvanceRequisition.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                Idissuepdcrequest.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                Idissuepdcrequest.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Finance" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdFinance.Visible = false;
                            IdAddVendor.Visible = false;
                            IdAddPaymentType.Visible = false;
                            IdAddDebitList.Visible = false;
                            IdDebitListApproval.Visible = false;
                            IdPaymentReceipt.Visible = false;
                            IdAdvanceRequisition.Visible = false;
                            Idissuepdcrequest.Visible = false;


                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Inventory" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdInventory.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Material Received" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMaterialReceive.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Received" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMaterialReceive.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Stock Opening" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdEnterStockDetails.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Stock Opening" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdEnterStockDetails.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Stock Opening" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdViewOpeningStockDetail.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Stock Opening" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdViewOpeningStockDetail.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Inventory" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdInventory.Visible = false;
                            IdMaterialReceive.Visible = false;
                            IdEnterStockDetails.Visible = false;
                            IdViewOpeningStockDetail.Visible = false;

                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "PMC Report" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdPmcReport.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Month VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMonthlyVWD.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Month VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMonthlyVWD.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "PMC Report" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdPmcReport.Visible = false;
                            IdMonthlyVWD.Visible = false;

                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "RA Bill" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdRABil.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Add New RA Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdNewRABill.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Add New RA Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdNewRABill.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Submited Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdRABillSubmitted.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Submited Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdRABillSubmitted.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Certified Bill" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdRABillCertified.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "List of Certified Bill" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdRABillCertified.Visible = false;

                            }

                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "RA Bill" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdRABil.Visible = false;
                            IdNewRABill.Visible = false;
                            IdRABillSubmitted.Visible = false;
                            IdRABillCertified.Visible = false;

                        }
                        if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                        {

                            IdReport.Visible = true;
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdWorkProgrammeReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdWorkProgrammeReport.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMorningReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMorningReport.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdStaffAttendanceReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdStaffAttendanceReport.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMaterialReciveByProject.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMaterialReciveByProject.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMaterialReciveByProjectDate.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMaterialReciveByProjectDate.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMaterialReciveProjectAndVendor.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMaterialReciveProjectAndVendor.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMonthlyVWDReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMonthlyVWDReport.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdRaChart.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdRaChart.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdViewDebitorList.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Debtor List" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdViewDebitorList.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Receipt Report" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdPaymentReceiptReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Payment Receipt Report" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdPaymentReceiptReport.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Requisition" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdViewAdvanceRequisition.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "Advanced Requisition" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdViewAdvanceRequisition.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdPDCRequisition.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "PDC" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdPDCRequisition.Visible = false;

                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthy VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                            {

                                IdMonthlyVWDReport.Visible = true;
                            }
                            if (dt.Rows[k]["PageName"].ToString() == "View Monthy VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                            {
                                IdMonthlyVWDReport.Visible = false;

                            }


                        }
                        else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                        {
                            IdReport.Visible = false;
                            IdWorkProgrammeReport.Visible = false;
                            IdMorningReport.Visible = false;
                            IdStaffAttendanceReport.Visible = false;
                            IdViewDebitorList.Visible = false;
                            IdPaymentReceiptReport.Visible = false;
                            IdViewAdvanceRequisition.Visible = false;
                            IdPDCRequisition.Visible = false;
                            IdMaterialReciveByProject.Visible = false;
                            IdMaterialReciveByProjectDate.Visible = false;
                            IdMaterialReciveProjectAndVendor.Visible = false;
                            IdMonthlyVWDReport.Visible = false;
                            IdRaChart.Visible = false;

                        }







                    }



                }
            }
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            try
            {
                string Value = "1";

                Response.Redirect("~/Login.aspx?Value=" + "1");
            }
            catch (Exception ex)
            { }
        }
        protected void ImgImage_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/User/Home.aspx");
            }
            catch (Exception ex)
            { }
        }
        protected void ImgSetting_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/User/ChangePassword.aspx");
            }
            catch (Exception ex)
            { }
        }
    }
}
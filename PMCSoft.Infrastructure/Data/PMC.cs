using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DAL;

/// <summary>
/// Summary description for HR
/// </summary>
namespace PMCSoft.Infrastructure.Data
{
    public class PMC
    {
        DataTable DT = new DataTable();
        public PMC()
        {

        }
        public void InsertLogOut(string EmpID, string CompanyID, string LoginID, string ProjID)
        {
            int Result = DALL.SPInsert("InsertLogOut", new SqlParameter("@FValue", EmpID), new SqlParameter("@SValue", CompanyID),
                new SqlParameter("@TValue", LoginID), new SqlParameter("@FourthValue", ProjID));
        }
        public void InsertLoginInformation(string EmpID, string CompanyID, string ProjID)
        {
            int Result = DALL.SPInsert("InsertLogin", new SqlParameter("@UserId", EmpID), new SqlParameter("@CompanyID", CompanyID),
                new SqlParameter("@PrjID", ProjID), new SqlParameter("@logintime", Convert.ToDateTime(DateTime.Now)));
        }
        public void InsertDataForThreeString(string EmpID, string CompanyID, string TransID)
        {
            int Result = DALL.SPInsert("UpdateLogStatus", new SqlParameter("@FValue", EmpID), new SqlParameter("@SValue", CompanyID),
                new SqlParameter("@TValue", TransID));
        }
        public void BindCountryDdl(DropDownList ddl)
        {
            BindData.BindDDL("GetCountries", ddl, "CnName", "CountryID");
            ddl.Items.Insert(0, new ListItem("Select Country", "-1"));
        }
        public void BindStateDdl(DropDownList ddl, string CountryID)
        {
            BindData.BindDDL("GetState", ddl, "StateName", "StateID", new SqlParameter("@FValue", CountryID));
            ddl.Items.Insert(0, new ListItem("Select State", "-1"));
        }
        public void BindCityDdl(DropDownList ddl, string StateID)
        {
            BindData.BindDDL("GetCity", ddl, "CityName", "CityID", new SqlParameter("@FValue", StateID));
            ddl.Items.Insert(0, new ListItem("Select City", "-1"));
        }
        public void GetMaxIDForProjID(string CompanyID, out string ProjID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForProjID", CompanyID, out ProjID);
        }
        public void InsertProjectMasterDetail(string CompanyID, string PRJID, string ProjectName, string ClientName, string Address, string Country,
            string State, string City, string DateOfLOI, string DateOfAgreementWithClient, string ScopeOfWork, string OriginalContractValue,
            string RevisedContractValue, string EstimatedTotalCostOfWork, string StipulatedDateOfStart, string ActualDateOfStart,
            string ReasonsForDelayedStart, string StipulatedDateofCompletion, string RevisedDateOfCompletion, string EstimatedDateOfCompletion,
            string TimeLapsedFromStipulatedDateOfStart, string BalanceTimePeriodAvailable, string DateOfValueOfWorkDone, string ValueOfWorkDone,
            string BalanceValueOfWork, string ReasonForDelay, string ActionTakenForControllingDelays, string StatusOfExtensionOfTime, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertProjectMasterDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ProjectName", ProjectName), new SqlParameter("@ClientName", ClientName), new SqlParameter("@Address", Address),
                new SqlParameter("@Country", Country), new SqlParameter("@State", State), new SqlParameter("@City", City),
                new SqlParameter("@DateOfLOI", Convert.ToDateTime(DateOfLOI)), new SqlParameter("@DateOfAgreementWithClient", Convert.ToDateTime(DateOfAgreementWithClient)),
                new SqlParameter("@ScopeOfWork", ScopeOfWork), new SqlParameter("@OriginalContractValue", Convert.ToDecimal(OriginalContractValue)),
                new SqlParameter("@RevisedContractValue", Convert.ToDecimal(RevisedContractValue)), new SqlParameter("@EstimatedTotalCostOfWork", Convert.ToDecimal(EstimatedTotalCostOfWork)),
                new SqlParameter("@StipulatedDateOfStart", Convert.ToDateTime(StipulatedDateOfStart)), new SqlParameter("@ActualDateOfStart", Convert.ToDateTime(ActualDateOfStart)),
                new SqlParameter("@ReasonsForDelayedStart", ReasonsForDelayedStart), new SqlParameter("@StipulatedDateofCompletion", Convert.ToDateTime(StipulatedDateofCompletion)),
                new SqlParameter("@RevisedDateOfCompletion", Convert.ToDateTime(RevisedDateOfCompletion)), new SqlParameter("@EstimatedDateOfCompletion", Convert.ToDateTime(EstimatedDateOfCompletion)),
                new SqlParameter("@TimeLapsedFromStipulatedDateOfStart", TimeLapsedFromStipulatedDateOfStart), new SqlParameter("@BalanceTimePeriodAvailable", BalanceTimePeriodAvailable),
                new SqlParameter("@DateOfValueOfWorkDone", Convert.ToDateTime(DateOfValueOfWorkDone)), new SqlParameter("@ValueOfWorkDone", Convert.ToDecimal(ValueOfWorkDone)),
                new SqlParameter("@BalanceValueOfWork", Convert.ToDecimal(BalanceValueOfWork)), new SqlParameter("@ReasonForDelay", ReasonForDelay),
                new SqlParameter("@ActionTakenForControllingDelays", ActionTakenForControllingDelays), new SqlParameter("@StatusOfExtensionOfTime", StatusOfExtensionOfTime),
                new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void BindProjectDdl(DropDownList ddl)
        {
            BindData.BindDDL("GetProjectName", ddl, "ProjectName", "PRJID");
            ddl.Items.Insert(0, new ListItem("Select Project", "-1"));
        }
        public void BindEmpDdl(DropDownList ddl, string PRJID)
        {
            BindData.BindDDL("GetEmpName", ddl, "Name", "EmpID", new SqlParameter("@FValue", PRJID));
            ddl.Items.Insert(0, new ListItem("Select User", "-1"));
        }
        public void InsertUnitMaster(string UnitName, string UnitCode, string CreatedBy, string UnitID, string CompanyID)
        {
            int Result = DALL.SPInsert("InsertUnitMaster", new SqlParameter("@UnitName", UnitName), new SqlParameter("@UnitCode", UnitCode),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@UnitID", UnitID), new SqlParameter("@CompanyID", CompanyID));
        }
        public void BindUnit(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetUnit", GV);
        }
        public void UpdateUnit(string UnitName, string UnitCode, string TransID)
        {
            int Result = DALL.SPInsert("UpdateUnit", new SqlParameter("@UnitName", UnitName), new SqlParameter("@UnitCode", UnitCode),
                new SqlParameter("@TransID", Convert.ToInt16(TransID)));
        }
        public void BindUnitddl(DropDownList ddl)
        {
            BindData.BindDDL("GetUnit", ddl, "UnitName", "UnitCode");
            ddl.Items.Insert(0, new ListItem("Select Unit", "-1"));
        }
        public void GetMaxIDForDeptID(string CompanyID, out string DeptID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForDeptID", CompanyID, out DeptID);
        }
        public void InsertDepartment(string DeptID, string DepartmentName, string CreatedBy, string CompanyID)
        {
            int Result = DALL.SPInsert("InsertDepartment", new SqlParameter("@DeptID", DeptID), new SqlParameter("@DepartmentName", DepartmentName),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@CompanyID", CompanyID));
        }
        public void UpdateDept(string DeptID, string DepartmentName)
        {
            int Result = DALL.SPInsert("UpdateDept", new SqlParameter("@SValue", DeptID), new SqlParameter("@FValue", DepartmentName));
        }
        public void BindDepartment(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetDepartment", GV);
        }
        public void BindDepartmentDDL(DropDownList DDL)
        {
            BindData.BindDDL("GetDepartment", DDL, "DepartmentName", "DeptID");
            DDL.Items.Insert(0, new ListItem("Select Department", "-1"));
        }
        public void GetMaxIDForDesgID(string CompanyID, out string DesgID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForDesgID", CompanyID, out DesgID);
        }
        public void InsertDesignation(string CompanyID, string DeptID, string DesgID, string Designation, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertDesignation", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@DeptID", DeptID),
                new SqlParameter("@DesgID", DesgID), new SqlParameter("@Designation", Designation), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void BindDesignation(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetDesignation", GV);
        }
        public void UpdateDesg(string Designation, string DeptID, string DesgID)
        {
            int Result = DALL.SPInsert("UpdateDesg", new SqlParameter("@FValue", Designation), new SqlParameter("@SValue", DeptID),
                new SqlParameter("@TValue", DesgID));
        }
        public void BindDesignationDDL(DropDownList DDL, string DeptID)
        {
            BindData.BindDDL("GetDesignationDetail", DDL, "Designation", "DesgID", new SqlParameter("@DeptID", DeptID));
            DDL.Items.Insert(0, new ListItem("Select Designation", "-1"));
        }
        public void InsertEmployeeMaster(string CompanyID, string ProjectID, string EmpID, string FName, string LName, string Address, string Country,
            string State, string City, string ZipCode, string MobileNo, string Email, string Password, string AccountType, string DateOfBirth,
            string AltEmail, string ReportingTo, string CreatedBy, string DeptID, string DesgID, string DOJ, string OfficialEmpID, string EmpType)
        {
            int Result = DALL.SPInsert("InsertEmployeeMaster", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@ProjectID", ProjectID),
                new SqlParameter("@EmpID", EmpID), new SqlParameter("@FName", FName), new SqlParameter("@LName", LName), new SqlParameter("@Address", Address),
                new SqlParameter("@Country", Country), new SqlParameter("@State", State), new SqlParameter("@City", City), new SqlParameter("@ZipCode", ZipCode),
                new SqlParameter("@MobileNo", MobileNo), new SqlParameter("@Email", Email), new SqlParameter("@Password", Password),
                new SqlParameter("@AccountType", AccountType), new SqlParameter("@DateOfBirth", Convert.ToDateTime(DateOfBirth)),
                new SqlParameter("@AltEmail", AltEmail), new SqlParameter("@ReportingTo", ReportingTo), new SqlParameter("@CreatedBy", CreatedBy),
                new SqlParameter("@DeptID", DeptID), new SqlParameter("@DesgID", DesgID), new SqlParameter("@DOJ", Convert.ToDateTime(DOJ)),
                new SqlParameter("@OfficialEmpID", OfficialEmpID), new SqlParameter("@EmpType", EmpType));
        }
        public void GetMaxIDForEmpID(string CompanyID, out string EmpID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForEmpID", CompanyID, out EmpID);
        }
        public void GetMaxIDForGenEmpID(string CompanyID, out string EmpID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForGenEmpID", CompanyID, out EmpID);
        }
        public void InsertUserVerificationCode(string CompanyID, string EmpID, string UserEmail, string CodeID)
        {
            int Result = DALL.SPInsert("InsertUserVerificationCode", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@EmpID", EmpID),
                new SqlParameter("@UserEmail", UserEmail), new SqlParameter("@CodeID", CodeID));
        }
        public void BindReportingTo(DropDownList DDL)
        {
            BindData.BindDDL("GetReportingTo", DDL, "EmpName", "EmpID");
            DDL.Items.Insert(0, new ListItem("Select Reporting To", "-1"));
        }
        public void BindProject(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetProjectName", GV);
        }
        public void InsertGeneralStaffMaster(string CompanyID, string ProjectID, string EmpID, string FName, string LName, string MobileNo, string DateOfBirth,
            string CreatedBy, string DeptID, string DesgID, string DOJ, string OfficialEmpID, string EmployeeType)
        {
            int Result = DALL.SPInsert("InsertGeneralStaffMaster", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@ProjectID", ProjectID),
                new SqlParameter("@EmpID", EmpID), new SqlParameter("@FName", FName), new SqlParameter("@LName", LName),
                new SqlParameter("@MobileNo", MobileNo), new SqlParameter("@DateOfBirth", Convert.ToDateTime(DateOfBirth)),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@DeptID", DeptID), new SqlParameter("@DesgID", DesgID),
                new SqlParameter("@DOJ", Convert.ToDateTime(DOJ)), new SqlParameter("@OfficialEmpID", OfficialEmpID),
                new SqlParameter("@EmployeeType", EmployeeType));
        }
        public void BindItemOfWork(DropDownList DDL)
        {
            BindData.BindDDL("GetItemOfWork", DDL, "ItemOfWork", "ItemID");
            DDL.Items.Insert(0, new ListItem("Select Item Of Work", "-1"));
        }
        public void GetNoOfItemWork(out string Number)
        {
            ReturnOutPutValue.OutputOneInt("GetNoOfItemWork", out Number);
        }
        public void GetMaxIDForWPID(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForWPID", CompanyID, out WPID);
        }
        public void GetMaxIDForIncomeFunction(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForIncomeMaster", CompanyID, out WPID);
        }
        public void GetMaxIDForExpenditureFunction(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForExpenditureMaster", CompanyID, out WPID);
        }
        public void GetMaxIDForconsumblesFunction(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForConsumblesMaster", CompanyID, out WPID);
        }
        public void GetMaxIDForDirectExpensesFunction(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForDirectExpensesMaster", CompanyID, out WPID);

        }
        public void GetMaxIDForHireChargesExpensesFunctionMaster(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForHireChargesExpensesMaster", CompanyID, out WPID);
        }
        public void GetMaxIDForIndirectExpensesFunction(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForHireIndirectExpensesMaster", CompanyID, out WPID);
        }
        public void InsertWorkProgramme(string CompanyID, string PRJID, string WPID, string WPDate, string EngInCharge, string Block, string ItemID,
            string ItemOfWork, string Area, string LabourSK, string LabourSEMI, string LabourUNSK, string LabourOT, string Supervisor, string Foreman,
            string Engineer, string CreatedBy, string WPNumber, string ForwardTo)
        {
            int Result = DALL.SPInsert("InsertWorkProgramme", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@WPID", WPID), new SqlParameter("@WPDate", Convert.ToDateTime(WPDate)), new SqlParameter("@EngInCharge", EngInCharge),
                new SqlParameter("@Block", Block), new SqlParameter("@ItemID", ItemID), new SqlParameter("@ItemOfWork", ItemOfWork),
                new SqlParameter("@Area", Area), new SqlParameter("@LabourSK", Convert.ToInt16(LabourSK)), new SqlParameter("@LabourSEMI", Convert.ToInt16(LabourSEMI)),
                new SqlParameter("@LabourUNSK", Convert.ToInt16(LabourUNSK)), new SqlParameter("@LabourOT", Convert.ToInt16(LabourOT)), new SqlParameter("@Supervisor", Supervisor),
                new SqlParameter("@Foreman", Foreman), new SqlParameter("@Engineer", Engineer), new SqlParameter("@CreatedBy", CreatedBy),
                new SqlParameter("@WPNumber", WPNumber), new SqlParameter("@ForwardTo", ForwardTo));
        }
        public void BindGetPID(DropDownList ddl, string EmpID)
        {
            BindData.BindDDL("GetPID", ddl, "ProjectName", "ProjectID", new SqlParameter("@FValue", EmpID));
            ddl.Items.Insert(0, new ListItem("Select Project", "-1"));
        }
        public void BindEmployee(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetEmpID", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGenaralEmployee(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetGeneralEmpID", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetGeneralEmpID(DropDownList ddl, string EmpID)
        {
            BindData.BindDDL("GetGeneralEmpID", ddl, "EmpName", "EmpID", new SqlParameter("@FValue", EmpID));
            ddl.Items.Insert(0, new ListItem("Select User", "-1"));
        }
        public void GetMaxIDForItemID(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForItemID", CompanyID, out ItemID);
        }
        public void InsertItemOfWork(string CompanyID, string ItemID, string ItemOfWork, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertItemOfWork", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@ItemID", ItemID),
                new SqlParameter("@ItemOfWork", ItemOfWork), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void BindItem(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetIOk", GV);
        }
        public void UpdateItemOfWork(string ItemID, string ItemOfWork)
        {
            int Result = DALL.SPInsert("UpdateItemOfWork", new SqlParameter("@SValue", ItemID), new SqlParameter("@FValue", ItemOfWork));
        }
        public void GetMaxIDForMRID(string CompanyID, out string MRID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForMRID", CompanyID, out MRID);
        }
        public void GetCountProject(out string P)
        {
            ReturnOutPutValue.OutputOneInt("GetCountProject", out P);
        }
        public void BindGetProj(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetProj", GV);
        }
        public void BindGetECount(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetECount", GV);
        }
        public void InsertDailyMorningReport(string CompanyID, string PRJID, string WPID, string MRID, string WPDate, string MRDate, string EngInCharge,
            string Block, string ItemID, string ItemOfWork, string Area, string LabourSK, string LabourSEMI, string LabourUNSK, string LabourOT,
            string ALabourSK, string ALabourSEMI, string ALabourUNSK, string ALabourOT, string Supervisor, string Foreman, string Engineer,
            string CreatedBy, string WPNumber)
        {
            int Result = DALL.SPInsert("InsertDailyMorningReport", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@WPID", WPID), new SqlParameter("@MRID", MRID), new SqlParameter("@WPDate", Convert.ToDateTime(WPDate)),
                new SqlParameter("@MRDate", Convert.ToDateTime(MRDate)), new SqlParameter("@EngInCharge", EngInCharge), new SqlParameter("@Block", Block),
                new SqlParameter("@ItemID", ItemID), new SqlParameter("@ItemOfWork", ItemOfWork), new SqlParameter("@Area", Area),
                new SqlParameter("@LabourSK", Convert.ToInt16(LabourSK)), new SqlParameter("@LabourSEMI", Convert.ToInt16(LabourSEMI)),
                new SqlParameter("@LabourUNSK", Convert.ToInt16(LabourUNSK)), new SqlParameter("@LabourOT", Convert.ToInt16(LabourOT)),
                new SqlParameter("@ALabourSK", Convert.ToInt16(ALabourSK)), new SqlParameter("@ALabourSEMI", Convert.ToInt16(ALabourSEMI)),
                new SqlParameter("@ALabourUNSK", Convert.ToInt16(ALabourUNSK)), new SqlParameter("@ALabourOT", Convert.ToInt16(ALabourOT)),
                new SqlParameter("@Supervisor", Supervisor), new SqlParameter("@Foreman", Foreman), new SqlParameter("@Engineer", Engineer),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@WPNumber", WPNumber));
        }
        public void InsertGeneralStaffAttendance(string CompanyID, string PRJID, string EmpID, string OfficialEMPID, string EmpName, string DeptID,
            string DesgID, string MobileNo, string CreatedBy, string AttnID, string EmpType)
        {
            int Result = DALL.SPInsert("InsertGeneralStaffAttendance", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@EmpID", EmpID), new SqlParameter("@OfficialEMPID", OfficialEMPID), new SqlParameter("@EmpName", EmpName),
                new SqlParameter("@DeptID", DeptID), new SqlParameter("@DesgID", DesgID), new SqlParameter("@MobileNo", MobileNo),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@AttnID", AttnID), new SqlParameter("@EmpType", EmpType));
        }
        public void GetMaxIDForATID(string CompanyID, out string ATID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForATID", CompanyID, out ATID);
        }
        //public void InsertVendorDetail(string CompanyID, string PRJID, string VendorID, string Name, string Address, string Country, string State,
        //    string City, string MobileNo, string Email, string VendorType, string CreatedBy, string VendorTypeCode)
        //{
        //    int Result = DALL.SPInsert("InsertVendorDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
        //        new SqlParameter("@VendorID", VendorID), new SqlParameter("@Name", Name), new SqlParameter("@Address", Address),
        //        new SqlParameter("@Country", Country), new SqlParameter("@State", State), new SqlParameter("@City", City),
        //        new SqlParameter("@MobileNo", MobileNo), new SqlParameter("@Email", Email), new SqlParameter("@VendorType", VendorType),
        //        new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@VendorTypeCode", VendorTypeCode));
        //}
        public void InsertVendorDetail(string CompanyID, string PRJID, string VendorID, string Name, string Address, string Country, string State,
           string City, string MobileNo, string Email, string VendorType, string CreatedBy, string VendorTypeCode, string PanNo, string TinNo, string EccNo, string vat)
        {
            int Result = DALL.SPInsert("InsertVendorDetails", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@VendorID", VendorID), new SqlParameter("@Name", Name), new SqlParameter("@Address", Address),
                new SqlParameter("@Country", Country), new SqlParameter("@State", State), new SqlParameter("@City", City),
                new SqlParameter("@MobileNo", MobileNo), new SqlParameter("@Email", Email), new SqlParameter("@VendorType", VendorType),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@VendorTypeCode", VendorTypeCode),
                 new SqlParameter("@PanNo", PanNo), new SqlParameter("@TinNo", TinNo), new SqlParameter("@EccNo", EccNo), new SqlParameter("@Vat", vat));
        }
        public void GetMaxIDForVenID(string CompanyID, out string VenID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForVenID", CompanyID, out VenID);
        }
        public void BindGetVendorDetail(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetVendorDetail", GV);
        }
        public void BindGetVendorDetailByProject(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetVendorDetailByProject", GV, new SqlParameter("@FValue", PRJID));
        }
        public void UpdateVendor(string PRJID, string VendorID, string Name, string Address, string Country, string State,
            string City, string MobileNo, string Email, string VendorType, string VendorTypeCode)
        {
            int Result = DALL.SPInsert("UpdateVendor", new SqlParameter("@PRJID", PRJID), new SqlParameter("@VendorID", VendorID),
                new SqlParameter("@Name", Name), new SqlParameter("@Address", Address), new SqlParameter("@Country", Country),
                new SqlParameter("@State", State), new SqlParameter("@City", City), new SqlParameter("@MobileNo", MobileNo),
                new SqlParameter("@Email", Email), new SqlParameter("@VendorType", VendorType), new SqlParameter("@VendorTypeCode", VendorTypeCode));
        }
        public void BindGetVendorID(DropDownList ddl, string PRJID)
        {
            BindData.BindDDL("GetVendorID", ddl, "Name", "VendorID", new SqlParameter("@FValue", PRJID));
            ddl.Items.Insert(0, new ListItem("Select Party / Vendor", "-1"));
        }
        public void BindGetEmp(DropDownList ddl, string PRJID)
        {
            BindData.BindDDL("GetEmp", ddl, "EmpName", "EmpID", new SqlParameter("@FValue", PRJID));
            ddl.Items.Insert(0, new ListItem("Select User", "-1"));
        }
        public void InsertDebitorsList(string CompanyID, string PRJID, string ListID, string VendorID, string Name, string Amount, string Remarks,
            string ForwardTo, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertDebitorsList", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ListID", ListID), new SqlParameter("@VendorID", VendorID), new SqlParameter("@Name", Name),
                new SqlParameter("@Amount", Convert.ToDecimal(Amount)), new SqlParameter("@Remarks", Remarks), new SqlParameter("@ForwardTo", ForwardTo),
                new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForListID(string CompanyID, out string ListID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForListID", CompanyID, out ListID);
        }
        public void BindGetDebitorList(GridView GV, string PRJID, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetDebitorList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", EmpID));
        }
        public void InsertDebitorsApproveList(string CompanyID, string PRJID, string ListID, string ApproveListID, string VendorID, string Name,
            string Amount, string Remarks, string ForwardTo, string ApprovalRemarks, string SuggestAmount, string ApprovalStatus, string CreatedBy,
            string ListTransID)
        {
            int Result = DALL.SPInsert("InsertDebitorsApproveList", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ListID", ListID), new SqlParameter("@ApproveListID", ApproveListID), new SqlParameter("@VendorID", VendorID),
                new SqlParameter("@Name", Name), new SqlParameter("@Amount", Convert.ToDecimal(Amount)), new SqlParameter("@Remarks", Remarks),
                new SqlParameter("@ForwardTo", ForwardTo), new SqlParameter("@ApprovalRemarks", ApprovalRemarks), new SqlParameter("@SuggestAmount", SuggestAmount),
                new SqlParameter("@ApprovalStatus", ApprovalStatus), new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@ListTransID", ListTransID));
        }
        public void GetMaxIDForAppListID(string CompanyID, out string AListID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForAppListID", CompanyID, out AListID);
        }
        public void BindGetDebitorsApproveList(GridView GV, string PRJID, string AStatus, string Date)
        {
            BindData.BindGridViewWithSNo("GetDebitorsApproveList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus),
                new SqlParameter("@TValue", Date));
        }
        public void BindGetEmpployee(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetEmpployee", GV);
        }
        public void UpdateEmployee(string ProjectID, string FName, string LName, string Address, string Country, string State, string City,
            string ZipCode, string MobileNo, string DateOfBirth, string AltEmail, string ReportingTo, string DeptID, string DesgID, string DOJ,
            string EmpType, string EmpID)
        {
            int Result = DALL.SPInsert("UpdateEmployee", new SqlParameter("@ProjectID", ProjectID), new SqlParameter("@FName", FName),
                new SqlParameter("@LName", LName), new SqlParameter("@Address", Address), new SqlParameter("@Country", Country),
                new SqlParameter("@State", State), new SqlParameter("@City", City), new SqlParameter("@ZipCode", ZipCode), new SqlParameter("@MobileNo", MobileNo),
                new SqlParameter("@DateOfBirth", Convert.ToDateTime(DateOfBirth)), new SqlParameter("@AltEmail", AltEmail),
                new SqlParameter("@ReportingTo", ReportingTo), new SqlParameter("@DeptID", DeptID), new SqlParameter("@DesgID", DesgID),
                new SqlParameter("@DOJ", Convert.ToDateTime(DOJ)), new SqlParameter("@EmpType", EmpType), new SqlParameter("@EmpID", EmpID));
        }
        public void UpdateEmpStatus(string EmpID)
        {
            int Result = DALL.SPInsert("UpdateEmpStatus", new SqlParameter("@FValue", EmpID));
        }
        public void BindGetEmpProj(DropDownList ddl, string EmpID)
        {
            BindData.BindDDL("GetEmpProj", ddl, "ProjectName", "ProjectID", new SqlParameter("@FValue", EmpID));
            ddl.Items.Insert(0, new ListItem("Select Project", "-1"));
        }
        public void BindGetEmpProjGV(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetEmpProj", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetGeneralStaff(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetGeneralStaff", GV);
        }
        public void UpdateGeneralStaff(string EmpID)
        {
            int Result = DALL.SPInsert("UpdateGeneralStaff", new SqlParameter("@FValue", EmpID));
        }
        public void UpdateGeneralStaffMaster(string ProjectID, string FName, string LName, string DateOfBirth, string DeptID, string DesgID,
            string DOJ, string EmployeeType, string EmpID)
        {
            int Result = DALL.SPInsert("UpdateGeneralStaffMaster", new SqlParameter("@ProjectID", ProjectID), new SqlParameter("@FName", FName),
                new SqlParameter("@LName", LName), new SqlParameter("@DateOfBirth", DateOfBirth), new SqlParameter("@DeptID", DeptID),
                new SqlParameter("@DesgID", DesgID), new SqlParameter("@DOJ", DOJ), new SqlParameter("@EmployeeType", EmployeeType),
                new SqlParameter("@EmpID", EmpID));
        }
        public void BindGetGeneralEmpIDWithEmp(DropDownList ddl, string EmpID)
        {
            BindData.BindDDL("GetGeneralEmpIDWithEmp", ddl, "EmpName", "EmpID", new SqlParameter("@FValue", EmpID));
            ddl.Items.Insert(0, new ListItem("Select User", "-1"));
        }
        public void BindGetAttendance(GridView GV, string PRJID, string Date)
        {
            BindData.BindGridViewWithSNo("GetAttendance", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", Date));
        }
        public void BindGetDMR(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetDMR", GV);
        }
        public void BindGetStaffAttendance(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetStaffAttendance", GV);
        }
        public void BindGetPaymentType(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetPaymentType", GV);
        }
        public void InsertPaymentType(string CompanyID, string TypeID, string PaymentType, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertPaymentType", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@TypeID", TypeID),
                new SqlParameter("@PaymentType", PaymentType), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForTypeID(string CompanyID, out string TypeID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForTypeID", CompanyID, out TypeID);
        }
        public void UpdatePaymentType(string PaymentType, string TypeID)
        {
            int Result = DALL.SPInsert("UpdatePaymentType", new SqlParameter("@PaymentType", PaymentType), new SqlParameter("@TypeID", TypeID));
        }
        public void BindDDLPaymentType(DropDownList ddl)
        {
            BindData.BindDDL("GetPaymentType", ddl, "PaymentType", "TypeID");
            ddl.Items.Insert(0, new ListItem("Select Payment Type", "-1"));
        }
        public void InsertPaymentReceipt(string CompanyID, string PRJID, string ReceiptID, string RABillNo, string TypeID, string PaymentType,
            string BankName, string ChequeNo, string Amount, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertPaymentReceipt", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ReceiptID", ReceiptID), new SqlParameter("@RABillNo", RABillNo), new SqlParameter("@TypeID", TypeID),
                new SqlParameter("@PaymentType", PaymentType), new SqlParameter("@BankName", BankName), new SqlParameter("@ChequeNo", ChequeNo),
                new SqlParameter("@Amount", Convert.ToDecimal(Amount)), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForPRID(string CompanyID, out string TypeID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForPRID", CompanyID, out TypeID);
        }
        public void InsertVendorType(string CompanyID, string TypeID, string VendorType, string CreatedBy, string ModifiedBy)
        {
            int Result = DALL.SPInsert("InsertVendorType", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@TypeID", TypeID),
                new SqlParameter("@VendorType", VendorType), new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@ModifiedBy", ModifiedBy));
        }
        public void GetMaxIDForVenTypeID(string CompanyID, out string TypeID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForVenTypeID", CompanyID, out TypeID);
        }
        public void BindGetPartyVendorType(DropDownList ddl)
        {
            BindData.BindDDL("GetPartyVendorType", ddl, "VendorType", "TypeID");
            ddl.Items.Insert(0, new ListItem("Select Party/Vendor Type", "-1"));
        }
        public void InsertRSSFeeds(string Title, string Description, string CreatedBy, string FileName, string FileNameOriginal, string FileSize,
            string CircularNo, string DeptID, string DesgID)
        {
            int Result = DALL.SPInsert("InsertRSSFeeds", new SqlParameter("@Title", Title), new SqlParameter("@Description", Description),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@FileName", FileName), new SqlParameter("@FileNameOriginal", FileNameOriginal),
                new SqlParameter("@FileSize", Convert.ToDecimal(FileSize)), new SqlParameter("@CircularNo", CircularNo), new SqlParameter("@DeptID", DeptID),
                new SqlParameter("@DesgID", DesgID));
        }
        public void GetRSSFeeds(DataList DL)
        {
            BindData.BindDataList("GetRSSFeeds", DL);
        }
        public void GetRSSFeedsGV(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetManagementInfo", GV);
        }
        public void UpdateRSS(string TransID)
        {
            int Result = DALL.SPInsert("UpdateRSS", new SqlParameter("@FValue", TransID));
        }
        public void BindGetProject(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetProject", GV);
        }
        public void GetEmpProjCount(string EmpID, out string P)
        {
            ReturnOutPutValue.OutputOneIntOneString("GetEmpProjCount", EmpID, out P);
        }
        public void BindGetDMRProjEmp(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetDMRProjEmp", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetProjStaffAttendance(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetProjStaffAttendance", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetEmpProject(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetEmpProject", GV, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetItemGroup(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetItemGroup", GV);
        }
        public void InsertItemGroupMaster(string CompanyID, string GroupName, string GroupCode, string CreatedBy, string ItemGroupID)
        {
            int Result = DALL.SPInsert("InsertItemGroupMaster", new SqlParameter("@GroupName", GroupName), new SqlParameter("@GroupCode", GroupCode),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@ItemGroupID", ItemGroupID));
        }
        public void BindGetGroupDDL(DropDownList DDL)
        {
            BindData.BindDDL("GetGroup", DDL, "GroupName", "ItemGroupID");
            DDL.Items.Insert(0, new ListItem("Select Group Name", "-1"));
        }
        public void GetMaxIDForItemGroupID(string CompanyID, out string GroupID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForItemGroupID", CompanyID, out GroupID);
        }
        public void GetMaxIDForItemsID(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForItemsID", CompanyID, out ItemID);
        }
        public void InsertItemMaster(string CompanyID, string ItemID, string ItemGroupID, string ItemName, string UnitID, string Make, string PartNo,
            string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertItemMaster", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@ItemID", ItemID),
                new SqlParameter("@ItemGroupID", ItemGroupID), new SqlParameter("@ItemName", ItemName), new SqlParameter("@UnitID", UnitID),
                new SqlParameter("@Make", Make), new SqlParameter("@PartNo", PartNo), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForUnitID(string CompanyID, out string UnitID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForUnitID", CompanyID, out UnitID);
        }
        public void BindGetUnitDetail(DropDownList DDL)
        {
            BindData.BindDDL("GetUnitDetail", DDL, "UnitName", "UnitID");
            DDL.Items.Insert(0, new ListItem("Select Unit", "-1"));
        }
        public void BindGetItemDetail(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetItemDetail", GV);
        }
        public void GetMaxIDForTypeAdvanceRequisitionFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForTypeOfAdvanceRequisition", CompanyID, out ItemID);
        }
        public void GetMaxIDForSecurityAdvanceRequisitionFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForSecurityOfAdvanceRequisition", CompanyID, out ItemID);
        }
        public void GetMaxIDForAdvanceRequisitionFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDAdvanceRequisition", CompanyID, out ItemID);
        }
        public void BindTypeAdvanceRequisition(DropDownList DDL)
        {
            BindData.BindDDL("GetTypeAdvanceRequisitionRepeter", DDL, "Type", "TypeId");
            DDL.Items.Insert(0, new ListItem("Select Type", "-1"));
        }
        public void GetRSSNotification(DataList DL, string EmpID)
        {
            BindData.BindDataList("GetRSSNotification", DL, new SqlParameter("@FValue", EmpID));
        }
        public void BindGetWPDateForApproval(GridView GV, string PRJID, string FrwdTo)
        {
            BindData.BindGridViewWithSNo("GetWPDateForApproval", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", FrwdTo));
        }
        public void BindGetEmpProjDL(DataList DL, string EmpID)
        {
            BindData.BindDataList("GetEmpProj", DL, new SqlParameter("@FValue", EmpID));
        }
        public void UpdateWPStatusApp(string WPID, string Remark)
        {
            int Result = DALL.SPInsert("UpdateWPStatusApp", new SqlParameter("@FValue", WPID), new SqlParameter("@SValue", Remark));
        }
        public void UpdateWPStatusDis(string WPID, string Remark)
        {
            int Result = DALL.SPInsert("UpdateWPStatusDis", new SqlParameter("@FValue", WPID), new SqlParameter("@SValue", Remark));
        }
        public void BindGetViewWPDateForApproval(GridView GV, string PRJID, string FrwdTo)
        {
            BindData.BindGridViewWithSNo("GetViewWPDateForApproval", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", FrwdTo));
        }
        public void UpdateWorkProgramme(string LabourSK, string LabourSEMI, string LabourUNSK, string LabourOT, string PRJID, string WPID, string TransID)
        {
            int Result = DALL.SPInsert("UpdateWorkProgramme", new SqlParameter("@LabourSK", Convert.ToDecimal(LabourSK)), new SqlParameter("@LabourSEMI", Convert.ToDecimal(LabourSEMI)),
                new SqlParameter("@LabourUNSK", Convert.ToDecimal(LabourUNSK)), new SqlParameter("@LabourOT", Convert.ToDecimal(LabourOT)),
                new SqlParameter("@PRJID", PRJID), new SqlParameter("@WPID", WPID), new SqlParameter("@TransID", TransID));
        }
        public void insertBankMaster(string CompanyID, string BankName, string CreatedBy)
        {
            int Result = DALL.SPInsert("prc_Bankmaster", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@BankName", BankName),
                new SqlParameter("@CreatedBy", CreatedBy));
        }
        public object getbank(string BankName)
        {
            object oo;
            oo = DALL.SPReturnDatatable("Prc_CheckBankExistence", new SqlParameter("@BankName", BankName));
            return oo;
        }
        public object getallBankName()
        {
            object oo;
            oo = DALL.SPReturnDatatable("Prc_BindBanlDropDownlist");
            return oo;
        }
        public void insertBranchMaster(string CompanyID, string BankID, string BranchName, string Address, string Country, string State, string City, string ZipCode, string CreatedBy)
        {
            int Result = DALL.SPInsert("prc_BankBranchmaster", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@BankID", BankID),
                new SqlParameter("@BranchName", BranchName), new SqlParameter("@Address", Address), new SqlParameter("@Country", Country),
                 new SqlParameter("@State", State), new SqlParameter("@City", City), new SqlParameter("@ZipCode", ZipCode),
                  new SqlParameter("@CreatedBy", CreatedBy));
        }
        public object getBranchName(string BranchName, string BankID)
        {
            object oo;
            oo = DALL.SPReturnDatatable("Prc_CheckBranchExistence", new SqlParameter("@BranchName", BranchName), new SqlParameter("@BankID", BankID));
            return oo;
        }
        public object BindBank()
        {
            object oo;
            oo = DALL.SPReturnDatatable("prc_bindBank");
            return oo;
        }
        public object BindBranchName(string BankID)
        {
            object oo;
            oo = DALL.SPReturnDatatable("prc_bindBranch", new SqlParameter("@BankID", BankID));
            return oo;
        }
        public object BindvendorName(string PRJID)
        {
            object oo;
            oo = DALL.SPReturnDatatable("prc_BindVendor", new SqlParameter("@PRJID", PRJID));
            return oo;
        }
        public void insertPDCrequest(string CompanyID, string PRJID, string IssueID, string VendorID, string BankID, string BranchID,
        string ChequeNo, string Amount, string IssueDate, string ForwardTo, string CreatedBy, string ModifiedBy)
        {
            int Result = DALL.SPInsert("prc_addpdcrequest", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID), new SqlParameter("@IssueID", IssueID),
                 new SqlParameter("@VendorID", VendorID), new SqlParameter("@BankID", BankID),
                 new SqlParameter("@BranchID", BranchID), new SqlParameter("@ChequeNo", ChequeNo), new SqlParameter("@Amount", Convert.ToDecimal(Amount)),
                  new SqlParameter("@IssueDate", Convert.ToDateTime(IssueDate)), new SqlParameter("@ForwardTo", ForwardTo), new SqlParameter("@CreatedBy", CreatedBy),
                  new SqlParameter("@ModifiedBy", ModifiedBy));
        }

        public void genrateIssueID(string PRJID)
        {
            int Result = DALL.SPInsert("prc_genrateuniqpdc", new SqlParameter("@PRJID", PRJID));
        }
        public void GetMaxIDForMaterialReceiveFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDMaterialReceive", CompanyID, out ItemID);
        }
        public void InsertEquipmentExpenses(string CompanyID, string PRJID, string ExpID, string ExpDate, string EquipmentDetail, string PMDate,
            string PMRepairs, string PMFuel, string CMDate, string CMRepairs, string CMFuel, string UTDate, string UTRepairs, string UTFuel,
            string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertEquipmentExpenses", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ExpID", ExpID), new SqlParameter("@ExpDate", Convert.ToDateTime(ExpDate)), new SqlParameter("@EquipmentDetail", EquipmentDetail),
                new SqlParameter("@PMDate", Convert.ToDateTime(PMDate)), new SqlParameter("@PMRepairs", PMRepairs), new SqlParameter("@PMFuel", PMFuel),
                new SqlParameter("@CMDate", Convert.ToDateTime(CMDate)), new SqlParameter("@CMRepairs", CMRepairs), new SqlParameter("@CMFuel", CMFuel),
                new SqlParameter("@UTDate", Convert.ToDateTime(UTDate)), new SqlParameter("@UTRepairs", UTRepairs), new SqlParameter("@UTFuel", UTFuel),
                new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForExpID(string CompanyID, out string ExpID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForExpID", CompanyID, out ExpID);
        }
        public void Bindprc_GetallBank(GridView GV)
        {
            BindData.BindGridViewWithSNo("prc_GetallBank", GV);
        }
        public void BindGetProjectParticulars(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetProjectParticulars", GV);
        }
        public void BindGetAvailibilityOfDocuments(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetAvailibilityOfDocuments", GV);
        }
        public void BindGetInsuranceLicenses(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetInsuranceLicenses", GV);
        }
        public void BindGetOtherDepositBond(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetOtherDepositBond", GV);
        }
        public void BindGetFacilitiesProvided(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetFacilitiesProvided", GV);
        }
        public void BindGetMobilizationAdvance(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetMobilizationAdvance", GV);
        }
        public void BindGetBillingParticulars(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetBillingParticulars", GV);
        }
        public void BindGetPaymentTerms(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetPaymentTerms", GV);
        }
        public void Bindprc_GetallBankBranch(GridView GVS)
        {
            BindData.BindGridViewWithSNo("prc_GetallBankBranch", GVS);
        }
        public void editBankBranch(string BranchID, string Address)
        {
            int Result = DALL.SPInsert("prc_editBankBranch", new SqlParameter("@BranchID", BranchID), new SqlParameter("@Address", Address));
        }
        public void editBank(string BankID, string BankName)
        {
            int Result = DALL.SPInsert("prc_editBank", new SqlParameter("@BankID", BankID), new SqlParameter("@BankName", BankName));
        }
        public void GetMaxIDForHireChargesExpensesFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDHireChargesExpenses", CompanyID, out ItemID);
        }
        public void InsertProjectParticularsDetailA(string CompanyID, string PRJID, string NameOfProject, string ProjectClause, string ProjectAmendments,
            string Location, string LocationClause, string LocationAmendments, string DateOfAward, string AwardClause, string AwardAmendments, string LOINo,
            string LOINoClause, string LOINoAmendments, string LOIDate, string LOIDateClause, string LOIDateAmendments, string NameOfRegion, string RegionClause,
            string RegionAmendments, string ProjectInchargeName, string ProjectInchargeMobileNo, string InchargeClause, string InchargeAmendments,
            string ClientName, string ClientAddress, string ClientMobileNo, string ClientClause, string ClientAmendments, string ProjectManagerName,
            string ProjectManagerAddress, string ProjectManagerMobileNo, string ProjectManagerClause, string ProjectManagerAmendments, string ArchitectName,
            string ArchitectAddress, string ArchitectMobileNo, string ArchitectClause, string ArchitectAmendments, string StructuralConsultantName,
            string StructuralConsultantAddress, string StructuralConsultantMobileNo, string StructuralClause, string StructuralAmendments, string MechanicalName,
            string MechanicalAddress, string MechanicalMobileNo, string MechanicalClause, string MechanicalAmendments, string ElectricalName,
            string ElectricalAddress, string ElectricalMobileNo, string ElectricalClause, string ElectricalAmendments, string PlumbingName, string PlumbingAddress,
            string PlumbingMobileNo, string PlumbingClause, string PlumbingAmendments, string CreatedBy, string ClientCountry, string ClientState,
             string ClientCity, string ProjectManagerCountry, string ProjectManagerState, string ProjectManagerCity, string ArchitectCountry,
             string ArchitectState, string ArchitectCity, string StructuralCountry, string StructuralState, string StructuralCity, string MechanicalCountry,
             string MechanicalState, string MechanicalCity, string ElectricalCountry, string ElectricalState, string ElectricalCity, string PlumbingCountry,
             string PlumbingState, string PlumbingCity, string StipulatedDateOfStart, string ActualDateOfStart, string StipulatedDateOfFinish, string StipulatedDateStartClause,
            string StipulatedDateStartAmendments, string ActualDateStartClause, string ActualDateStartAmendments, string StipulatedDateFinishClause,
            string StipulatedDateFinishAmendments
            , string ClientZipCode, string ProjectManagerZipCode, string ArchitectZipCode, string StructuralZipCode, string MechanicalZipCode,
            string ElectricalZipCode, string PlumbingZipCode
            , string ClientPhoneNo, string ProjectManagerPhoneNo, string ArchitectPhoneNo, string StructuralPhoneNo,
            string MechanicalPhoneNo, string ElectricalPhoneNo, string PlumbingPhoneNo, string OriginalContractValue, string OCVWord, string OCVClause, string OCVAmendments,
            string RevisedContractValue, string RCVWord, string RCVClause, string RCVAmendments, string ExpectedContractValue, string ECVWord, string ECVClause,
            string ECVAmendments, string ClientEmail, string ClientFax, string ProjectManagerEmail, string ProjectManagerFax, string ArchitectEmail,
            string ArchitectFax, string StructuralEmail, string StructuralFax, string MechanicalEmail, string MechanicalFax, string ElectricalEmail,
            string ElectricalFax, string PlumbingEmail, string PlumbingFax
            )
        {
            int Result = DALL.SPInsert("InsertProjectParticularsDetailA", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@NameOfProject", NameOfProject), new SqlParameter("@ProjectClause", ProjectClause), new SqlParameter("@ProjectAmendments", ProjectAmendments),
                new SqlParameter("@Location", Location), new SqlParameter("@LocationClause", LocationClause), new SqlParameter("@LocationAmendments", LocationAmendments),
                new SqlParameter("@DateOfAward", Convert.ToDateTime(DateOfAward)), new SqlParameter("@AwardClause", AwardClause),
                new SqlParameter("@AwardAmendments", AwardAmendments), new SqlParameter("@LOINo", LOINo), new SqlParameter("@LOINoClause", LOINoClause),
                new SqlParameter("@LOINoAmendments", LOINoAmendments), new SqlParameter("@LOIDate", Convert.ToDateTime(LOIDate)), new SqlParameter("@LOIDateClause", LOIDateClause),
                new SqlParameter("@LOIDateAmendments", LOIDateAmendments), new SqlParameter("@NameOfRegion", NameOfRegion), new SqlParameter("@RegionClause", RegionClause),
                new SqlParameter("@RegionAmendments", RegionAmendments), new SqlParameter("@ProjectInchargeName", ProjectInchargeName), new SqlParameter("@ProjectInchargeMobileNo", ProjectInchargeMobileNo),
                new SqlParameter("@InchargeClause", InchargeClause), new SqlParameter("@InchargeAmendments", InchargeAmendments), new SqlParameter("@ClientName", ClientName),
                new SqlParameter("@ClientAddress", ClientAddress), new SqlParameter("@ClientMobileNo", ClientMobileNo), new SqlParameter("@ClientClause", ClientClause),
                new SqlParameter("@ClientAmendments", ClientAmendments), new SqlParameter("@ProjectManagerName", ProjectManagerName), new SqlParameter("@ProjectManagerAddress", ProjectManagerAddress),
                new SqlParameter("@ProjectManagerMobileNo", ProjectManagerMobileNo), new SqlParameter("@ProjectManagerClause", ProjectManagerClause),
                new SqlParameter("@ProjectManagerAmendments", ProjectManagerAmendments), new SqlParameter("@ArchitectName", ArchitectName), new SqlParameter("@ArchitectAddress", ArchitectAddress),
                new SqlParameter("@ArchitectMobileNo", ArchitectMobileNo), new SqlParameter("@ArchitectClause", ArchitectClause), new SqlParameter("@ArchitectAmendments", ArchitectAmendments),
                new SqlParameter("@StructuralConsultantName", StructuralConsultantName), new SqlParameter("@StructuralConsultantAddress", StructuralConsultantAddress),
                new SqlParameter("@StructuralConsultantMobileNo", StructuralConsultantMobileNo), new SqlParameter("@StructuralClause", StructuralClause),
                new SqlParameter("@StructuralAmendments", StructuralAmendments), new SqlParameter("@MechanicalName", MechanicalName), new SqlParameter("@MechanicalAddress", MechanicalAddress),
                new SqlParameter("@MechanicalMobileNo", MechanicalMobileNo), new SqlParameter("@MechanicalClause", MechanicalClause), new SqlParameter("@MechanicalAmendments", MechanicalAmendments),
                new SqlParameter("@ElectricalName", ElectricalName), new SqlParameter("@ElectricalAddress", ElectricalAddress), new SqlParameter("@ElectricalMobileNo", ElectricalMobileNo),
                new SqlParameter("@ElectricalClause", ElectricalClause), new SqlParameter("@ElectricalAmendments", ElectricalAmendments), new SqlParameter("@PlumbingName", PlumbingName),
                new SqlParameter("@PlumbingAddress", PlumbingAddress), new SqlParameter("@PlumbingMobileNo", PlumbingMobileNo), new SqlParameter("@PlumbingClause", PlumbingClause),
                new SqlParameter("@PlumbingAmendments", PlumbingAmendments), new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@ClientCountry", ClientCountry),
                new SqlParameter("@ClientState", ClientState), new SqlParameter("@ClientCity", ClientCity), new SqlParameter("@ProjectManagerCountry", ProjectManagerCountry),
                new SqlParameter("@ProjectManagerState", ProjectManagerState), new SqlParameter("@ProjectManagerCity", ProjectManagerCity),
                new SqlParameter("@ArchitectCountry", ArchitectCountry), new SqlParameter("@ArchitectState", ArchitectState), new SqlParameter("@ArchitectCity", ArchitectCity),
                new SqlParameter("@StructuralCountry", StructuralCountry), new SqlParameter("@StructuralState", StructuralState), new SqlParameter("@StructuralCity", StructuralCity),
                new SqlParameter("@MechanicalCountry", MechanicalCountry), new SqlParameter("@MechanicalState", MechanicalState), new SqlParameter("@MechanicalCity", MechanicalCity),
                new SqlParameter("@ElectricalCountry", ElectricalCountry), new SqlParameter("@ElectricalState", ElectricalState), new SqlParameter("@ElectricalCity", ElectricalCity),
                new SqlParameter("@PlumbingCountry", PlumbingCountry), new SqlParameter("@PlumbingState", PlumbingState), new SqlParameter("@PlumbingCity", PlumbingCity),
                new SqlParameter("@StipulatedDateOfStart", Convert.ToDateTime(StipulatedDateOfStart)), new SqlParameter("@ActualDateOfStart", Convert.ToDateTime(ActualDateOfStart)),
                new SqlParameter("@StipulatedDateOfFinish", Convert.ToDateTime(StipulatedDateOfFinish)), new SqlParameter("@StipulatedDateStartClause", StipulatedDateStartClause),
                new SqlParameter("@StipulatedDateStartAmendments", StipulatedDateStartAmendments), new SqlParameter("@ActualDateStartClause", ActualDateStartClause),
                new SqlParameter("@ActualDateStartAmendments", ActualDateStartAmendments),
                new SqlParameter("@StipulatedDateFinishClause", StipulatedDateFinishClause), new SqlParameter("@StipulatedDateFinishAmendments", StipulatedDateFinishAmendments)
                ,
                new SqlParameter("@ClientZipCode", ClientZipCode), new SqlParameter("@ProjectManagerZipCode", ProjectManagerZipCode), new SqlParameter("@ArchitectZipCode", ArchitectZipCode),
             new SqlParameter("@StructuralZipCode", StructuralZipCode), new SqlParameter("@MechanicalZipCode", MechanicalZipCode),
                new SqlParameter("@ElectricalZipCode", ElectricalZipCode), new SqlParameter("@PlumbingZipCode", PlumbingZipCode)
                , new SqlParameter("@ClientPhoneNo", ClientPhoneNo),
                new SqlParameter("@ProjectManagerPhoneNo", ProjectManagerPhoneNo), new SqlParameter("@ArchitectPhoneNo", ArchitectPhoneNo), new SqlParameter("@StructuralPhoneNo", StructuralPhoneNo),
                new SqlParameter("@MechanicalPhoneNo", MechanicalPhoneNo), new SqlParameter("@ElectricalPhoneNo", ElectricalPhoneNo), new SqlParameter("@PlumbingPhoneNo", PlumbingPhoneNo),
                new SqlParameter("@OriginalContractValue", Convert.ToDecimal(OriginalContractValue)), new SqlParameter("@OCVWord", OCVWord), new SqlParameter("@OCVClause", OCVClause),
                new SqlParameter("@OCVAmendments", OCVAmendments), new SqlParameter("@RevisedContractValue", Convert.ToDecimal(RevisedContractValue)), new SqlParameter("@RCVWord", RCVWord),
                new SqlParameter("@RCVClause", RCVClause), new SqlParameter("@RCVAmendments", RCVAmendments), new SqlParameter("@ExpectedContractValue", Convert.ToDecimal(ExpectedContractValue)),
                new SqlParameter("@ECVWord", ECVWord), new SqlParameter("@ECVClause", ECVClause), new SqlParameter("@ECVAmendments", ECVAmendments),
                new SqlParameter("@ClientEmail", ClientEmail), new SqlParameter("@ClientFax", ClientFax), new SqlParameter("@ProjectManagerEmail", ProjectManagerEmail),
                new SqlParameter("@ProjectManagerFax", ProjectManagerFax),
                new SqlParameter("@ArchitectEmail", ArchitectEmail), new SqlParameter("@ArchitectFax", ArchitectFax), new SqlParameter("@StructuralEmail", StructuralEmail),
                new SqlParameter("@StructuralFax", StructuralFax), new SqlParameter("@MechanicalEmail", MechanicalEmail), new SqlParameter("@MechanicalFax", MechanicalFax),
                new SqlParameter("@ElectricalEmail", ElectricalEmail), new SqlParameter("@ElectricalFax", ElectricalFax), new SqlParameter("@PlumbingEmail", PlumbingEmail),
                new SqlParameter("@PlumbingFax", PlumbingFax)
                );
        }
        public void InsertProjectParticularDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertProjectParticularDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertAvailibilityOfDocumentsDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertAvailibilityOfDocumentsDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertInsuranceLicensesDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertInsuranceLicensesDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertOtherDepositBondDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertOtherDepositBondDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertFacilitiesProvidedDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertFacilitiesProvidedDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertMobilizationAdvanceDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertMobilizationAdvanceDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertBillingParticularsDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertBillingParticularsDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void InsertPaymentTermsDetail(string CompanyID, string PRJID, string PTID, string Particulars, string Details, string Clause,
            string Amendments, string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertPaymentTermsDetail", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@PTID", PTID), new SqlParameter("@Particulars", Particulars), new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForProjDetailID(string CompanyID, out string ProjID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForProjDetailID", CompanyID, out ProjID);
        }
        public void CreateIssueID(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GenrateIssueID", CompanyID, out ItemID);
        }
        public void GetProjectParticulatsDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetProjectParticulatsDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetDetailAvailibilityOfDocuments(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetDetailAvailibilityOfDocuments", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetInsuranceLicensesDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetInsuranceLicensesDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetOtherDepositBondDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetOtherDepositBondDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetFacilitiesProvidedDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetFacilitiesProvidedDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetMobilizationAdvanceDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetMobilizationAdvanceDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetBillingParticularsDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetBillingParticularsDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void GetPaymentTermsDetail(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetPaymentTermsDetail", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void UpdateParojectParticularsDetailA(string NameOfProject, string ProjectClause, string ProjectAmendments, string Location,
            string LocationClause, string LocationAmendments, string DateOfAward, string AwardClause, string AwardAmendments, string LOINo, string LOINoClause,
            string LOINoAmendments, string LOIDate, string LOIDateClause, string LOIDateAmendments, string NameOfRegion, string RegionClause,
            string RegionAmendments, string ProjectInchargeName, string ProjectInchargeMobileNo, string InchargeClause, string InchargeAmendments,
            string ClientName, string ClientAddress, string ClientMobileNo, string ClientClause, string ClientAmendments, string ProjectManagerName,
            string ProjectManagerAddress, string ProjectManagerMobileNo, string ProjectManagerClause, string ProjectManagerAmendments, string ArchitectName,
            string ArchitectAddress, string ArchitectMobileNo, string ArchitectClause, string ArchitectAmendments, string StructuralConsultantName,
            string StructuralConsultantAddress, string StructuralConsultantMobileNo, string StructuralClause, string StructuralAmendments, string MechanicalName,
            string MechanicalAddress, string MechanicalMobileNo, string MechanicalClause, string MechanicalAmendments, string ElectricalName,
            string ElectricalAddress, string ElectricalMobileNo, string ElectricalClause, string ElectricalAmendments, string PlumbingName, string PlumbingAddress,
            string PlumbingMobileNo, string PlumbingClause, string PlumbingAmendments, string ModifiedBy, string ClientCountry, string ClientState,
            string ClientCity, string ProjectManagerCountry, string ProjectManagerState, string ProjectManagerCity, string ArchitectCountry, string ArchitectState,
            string ArchitectCity, string StructuralCountry, string StructuralState, string StructuralCity, string MechanicalCountry, string MechanicalState,
            string MechanicalCity, string ElectricalCountry, string ElectricalState, string ElectricalCity, string PlumbingCountry, string PlumbingState,
            string PlumbingCity, string StipulatedDateOfStart, string ActualDateOfStart, string StipulatedDateOfFinish, string StipulatedDateStartClause,
            string StipulatedDateStartAmendments, string ActualDateStartClause, string ActualDateStartAmendments, string StipulatedDateFinishClause,
            string StipulatedDateFinishAmendments, string PRJID, string ClientZipCode, string ProjectManagerZipCode, string ArchitectZipCode, string StructuralZipCode,
            string MechanicalZipCode, string ElectricalZipCode, string PlumbingZipCode, string ClientPhoneNo, string ProjectManagerPhoneNo, string ArchitectPhoneNo,
            string StructuralPhoneNo, string MechanicalPhoneNo, string ElectricalPhoneNo, string PlumbingPhoneNo, string OriginalContractValue, string OCVWord,
            string OCVClause, string OCVAmendments, string RevisedContractValue, string RCVWord, string RCVClause, string RCVAmendments, string ExpectedContractValue,
            string ECVWord, string ECVClause, string ECVAmendments, string ClientEmail, string ClientFax, string ProjectManagerEmail, string ProjectManagerFax,
            string ArchitectEmail, string ArchitectFax, string StructuralEmail, string StructuralFax, string MechanicalEmail, string MechanicalFax, string ElectricalEmail,
            string ElectricalFax, string PlumbingEmail, string PlumbingFax)
        {
            int Result = DALL.SPInsert("UpdateParojectParticularsDetailA", new SqlParameter("@NameOfProject", NameOfProject), new SqlParameter("@ProjectClause", ProjectClause),
                new SqlParameter("@ProjectAmendments", ProjectAmendments), new SqlParameter("@Location", Location), new SqlParameter("@LocationClause", LocationClause),
                new SqlParameter("@LocationAmendments", LocationAmendments), new SqlParameter("@DateOfAward", Convert.ToDateTime(DateOfAward)),
                new SqlParameter("@AwardClause", AwardClause), new SqlParameter("@AwardAmendments", AwardAmendments), new SqlParameter("@LOINo", LOINo),
                new SqlParameter("@LOINoClause", LOINoClause), new SqlParameter("@LOINoAmendments", LOINoAmendments), new SqlParameter("@LOIDate", Convert.ToDateTime(LOIDate)),
                new SqlParameter("@LOIDateClause", LOIDateClause), new SqlParameter("@LOIDateAmendments", LOIDateAmendments), new SqlParameter("@NameOfRegion", NameOfRegion), new SqlParameter("@RegionClause", RegionClause),
                    new SqlParameter("@RegionAmendments", RegionAmendments), new SqlParameter("@ProjectInchargeName", ProjectInchargeName), new SqlParameter("@ProjectInchargeMobileNo", ProjectInchargeMobileNo),
                    new SqlParameter("@InchargeClause", InchargeClause), new SqlParameter("@InchargeAmendments", InchargeAmendments), new SqlParameter("@ClientName", ClientName),
                    new SqlParameter("@ClientAddress", ClientAddress), new SqlParameter("@ClientMobileNo", ClientMobileNo), new SqlParameter("@ClientClause", ClientClause),
                    new SqlParameter("@ClientAmendments", ClientAmendments), new SqlParameter("@ProjectManagerName", ProjectManagerName), new SqlParameter("@ProjectManagerAddress", ProjectManagerAddress),
                    new SqlParameter("@ProjectManagerMobileNo", ProjectManagerMobileNo), new SqlParameter("@ProjectManagerClause", ProjectManagerClause),
                    new SqlParameter("@ProjectManagerAmendments", ProjectManagerAmendments), new SqlParameter("@ArchitectName", ArchitectName), new SqlParameter("@ArchitectAddress", ArchitectAddress),
                    new SqlParameter("@ArchitectMobileNo", ArchitectMobileNo), new SqlParameter("@ArchitectClause", ArchitectClause), new SqlParameter("@ArchitectAmendments", ArchitectAmendments),
                    new SqlParameter("@StructuralConsultantName", StructuralConsultantName), new SqlParameter("@StructuralConsultantAddress", StructuralConsultantAddress),
                    new SqlParameter("@StructuralConsultantMobileNo", StructuralConsultantMobileNo), new SqlParameter("@StructuralClause", StructuralClause),
                    new SqlParameter("@StructuralAmendments", StructuralAmendments), new SqlParameter("@MechanicalName", MechanicalName), new SqlParameter("@MechanicalAddress", MechanicalAddress),
                    new SqlParameter("@MechanicalMobileNo", MechanicalMobileNo), new SqlParameter("@MechanicalClause", MechanicalClause), new SqlParameter("@MechanicalAmendments", MechanicalAmendments),
                    new SqlParameter("@ElectricalName", ElectricalName), new SqlParameter("@ElectricalAddress", ElectricalAddress), new SqlParameter("@ElectricalMobileNo", ElectricalMobileNo),
                    new SqlParameter("@ElectricalClause", ElectricalClause), new SqlParameter("@ElectricalAmendments", ElectricalAmendments), new SqlParameter("@PlumbingName", PlumbingName),
                    new SqlParameter("@PlumbingAddress", PlumbingAddress), new SqlParameter("@PlumbingMobileNo", PlumbingMobileNo), new SqlParameter("@PlumbingClause", PlumbingClause),
                    new SqlParameter("@PlumbingAmendments", PlumbingAmendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@ClientCountry", ClientCountry),
                    new SqlParameter("@ClientState", ClientState), new SqlParameter("@ClientCity", ClientCity), new SqlParameter("@ProjectManagerCountry", ProjectManagerCountry),
                    new SqlParameter("@ProjectManagerState", ProjectManagerState), new SqlParameter("@ProjectManagerCity", ProjectManagerCity),
                    new SqlParameter("@ArchitectCountry", ArchitectCountry), new SqlParameter("@ArchitectState", ArchitectState), new SqlParameter("@ArchitectCity", ArchitectCity),
                    new SqlParameter("@StructuralCountry", StructuralCountry), new SqlParameter("@StructuralState", StructuralState), new SqlParameter("@StructuralCity", StructuralCity),
                    new SqlParameter("@MechanicalCountry", MechanicalCountry), new SqlParameter("@MechanicalState", MechanicalState), new SqlParameter("@MechanicalCity", MechanicalCity),
                    new SqlParameter("@ElectricalCountry", ElectricalCountry), new SqlParameter("@ElectricalState", ElectricalState), new SqlParameter("@ElectricalCity", ElectricalCity),
                    new SqlParameter("@PlumbingCountry", PlumbingCountry), new SqlParameter("@PlumbingState", PlumbingState), new SqlParameter("@PlumbingCity", PlumbingCity),
                    new SqlParameter("@StipulatedDateOfStart", Convert.ToDateTime(StipulatedDateOfStart)), new SqlParameter("@ActualDateOfStart", Convert.ToDateTime(ActualDateOfStart)),
                    new SqlParameter("@StipulatedDateOfFinish", Convert.ToDateTime(StipulatedDateOfFinish)), new SqlParameter("@StipulatedDateStartClause", StipulatedDateStartClause),
                    new SqlParameter("@StipulatedDateStartAmendments", StipulatedDateStartAmendments), new SqlParameter("@ActualDateStartClause", ActualDateStartClause), new SqlParameter("@ActualDateStartAmendments", ActualDateStartAmendments),
                    new SqlParameter("@StipulatedDateFinishClause", StipulatedDateFinishClause), new SqlParameter("@StipulatedDateFinishAmendments", StipulatedDateFinishAmendments),
                    new SqlParameter("@PRJID", PRJID), new SqlParameter("@ClientZipCode", ClientZipCode), new SqlParameter("@ProjectManagerZipCode", ProjectManagerZipCode),
                    new SqlParameter("@ArchitectZipCode", ArchitectZipCode), new SqlParameter("@StructuralZipCode", StructuralZipCode), new SqlParameter("@MechanicalZipCode", MechanicalZipCode),
                    new SqlParameter("@ElectricalZipCode", ElectricalZipCode), new SqlParameter("@PlumbingZipCode", PlumbingZipCode), new SqlParameter("@ClientPhoneNo", ClientPhoneNo),
                    new SqlParameter("@ProjectManagerPhoneNo", ProjectManagerPhoneNo), new SqlParameter("@ArchitectPhoneNo", ArchitectPhoneNo), new SqlParameter("@StructuralPhoneNo", StructuralPhoneNo),
                    new SqlParameter("@MechanicalPhoneNo", MechanicalPhoneNo), new SqlParameter("@ElectricalPhoneNo", ElectricalPhoneNo), new SqlParameter("@PlumbingPhoneNo", PlumbingPhoneNo),
                    new SqlParameter("@OriginalContractValue", Convert.ToDecimal(OriginalContractValue)), new SqlParameter("@OCVWord", OCVWord), new SqlParameter("@OCVClause", OCVClause),
                    new SqlParameter("@OCVAmendments", OCVAmendments), new SqlParameter("@RevisedContractValue", Convert.ToDecimal(RevisedContractValue)), new SqlParameter("@RCVWord", RCVWord),
                    new SqlParameter("@RCVClause", RCVClause), new SqlParameter("@RCVAmendments", RCVAmendments), new SqlParameter("@ExpectedContractValue", Convert.ToDecimal(ExpectedContractValue)),
                    new SqlParameter("@ECVWord", ECVWord), new SqlParameter("@ECVClause", ECVClause), new SqlParameter("@ECVAmendments", ECVAmendments),
                    new SqlParameter("@ClientEmail", ClientEmail), new SqlParameter("@ClientFax", ClientFax), new SqlParameter("@ProjectManagerEmail", ProjectManagerEmail),
                    new SqlParameter("@ProjectManagerFax", ProjectManagerFax), new SqlParameter("@ArchitectEmail", ArchitectEmail), new SqlParameter("@ArchitectFax", ArchitectFax),
                    new SqlParameter("@StructuralEmail", StructuralEmail), new SqlParameter("@StructuralFax", StructuralFax), new SqlParameter("@MechanicalEmail", MechanicalEmail),
                    new SqlParameter("@MechanicalFax", MechanicalFax), new SqlParameter("@ElectricalEmail", ElectricalEmail), new SqlParameter("@ElectricalFax", ElectricalFax),
                    new SqlParameter("@PlumbingEmail", PlumbingEmail), new SqlParameter("@PlumbingFax", PlumbingFax));
        }
        public void UpdatetblProjectParticularsDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblProjectParticularsDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdateAvailibilityOfDocumentsDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdateAvailibilityOfDocumentsDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblInsuranceLicensesDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblInsuranceLicensesDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblOtherDepositBondDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblOtherDepositBondDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblFacilitiesProvidedDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblFacilitiesProvidedDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblMobilizationAdvanceDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblMobilizationAdvanceDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblBillingParticularsDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblBillingParticularsDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void UpdatetblPaymentTermsDetail(string Details, string Clause, string Amendments, string ModifiedBy, string PRJID, string TransID)
        {
            int Result = DALL.SPInsert("UpdatetblPaymentTermsDetail", new SqlParameter("@Details", Details), new SqlParameter("@Clause", Clause),
                new SqlParameter("@Amendments", Amendments), new SqlParameter("@ModifiedBy", ModifiedBy), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@TransID", TransID));
        }
        public void BindProjectDetail(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetProjects", GV);
        }
        public void BindGetViewWPDate(GridView GV, string PRJID, string FrwdTo)
        {
            BindData.BindGridViewWithSNo("GetViewWPDate", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", FrwdTo));
        }
        public void BindGetDebitorsList(GridView GV, string PRJID, string AStatus)
        {
            BindData.BindGridViewWithSNo("GetDebitorsList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus));
        }
        public void BindGetDebtorList(GridView GV, string PRJID, string AStatus)
        {
            BindData.BindGridViewWithSNo("GetDebtorList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus));
        }
        public void BindGetPaymentReceipt(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetPaymentReceipt", GV, new SqlParameter("@FValue", PRJID));
        }
        public void BindGetAdvanceRequisition(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetAdvanceRequisition", GV, new SqlParameter("@FValue", PRJID));
        }
        public object BindItemGroup()
        {
            object oo;
            oo = DALL.SPReturnDatatable("GetGroup");
            return oo;
        }
        public object BindItemName(string ItemGroupID)
        {
            object oo;
            oo = DALL.SPReturnDatatable("GetItemByGroupId", new SqlParameter("@ItemGroupID", ItemGroupID));
            return oo;
        }
        public object BindUnitName(string ItemID)
        {
            object oo;
            oo = DALL.SPReturnDatatable("GetUnitBind", new SqlParameter("@ItemID", ItemID));
            return oo;
        }
        public void BindGetPDC(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetPDC", GV, new SqlParameter("@FValue", PRJID));
        }
        public void BindGetFinYearMonths(Repeater RP)
        {
            BindData.BindRepeter("GetFinYearMonths", RP);
        }
        public void InsertMonthlyVWD(string CompanyID, string PRJID, string AsOnDate, string Dates, string FiscMonths, string Month, string Year,
            string PlanRs, string ActualVWD, string ActualEscl, string ActualExtraItem, string ActualTotal, string Variation, string Remarks,
            string CreatedBy)
        {
            int Result = DALL.SPInsert("InsertMonthlyVWD", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@AsOnDate", Convert.ToDateTime(AsOnDate)), new SqlParameter("@Dates", Convert.ToDateTime(Dates)),
                new SqlParameter("@FiscMonths", FiscMonths), new SqlParameter("@Month", Month), new SqlParameter("@Year", Year),
                new SqlParameter("@PlanRs", Convert.ToDecimal(PlanRs)), new SqlParameter("@ActualVWD", Convert.ToDecimal(ActualVWD)),
                new SqlParameter("@ActualEscl", Convert.ToDecimal(ActualEscl)), new SqlParameter("@ActualExtraItem", Convert.ToDecimal(ActualExtraItem)),
                new SqlParameter("@ActualTotal", Convert.ToDecimal(ActualTotal)), new SqlParameter("@Variation", Convert.ToDecimal(Variation)),
                new SqlParameter("@Remarks", Remarks), new SqlParameter("@CreatedBy", CreatedBy));
        }
        public void GetMaxIDForOpeningStockFunction(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDOpeningStock", CompanyID, out ItemID);
        }
        public void BindGetCurrentMonth(Repeater RP)
        {
            BindData.BindRepeterWithSNo("GetCurrentMonth", RP);
        }
        public void BindGetFinYearDetail(Repeater RP, string PRJID)
        {
            BindData.BindRepeterWithSNo("GetFinYearDetail", RP, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetProjectForAdmin(DropDownList ddl)
        {
            BindData.BindDDL("GetProjectForAdmin", ddl, "ProjectName", "PRJID");
            ddl.Items.Insert(0, new ListItem("Select Project", "-1"));
        }
        public void GetMaxIDForItemIssue(string CompanyID, out string ItemID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDItemIssue", CompanyID, out ItemID);
        }
        public void BindGetDailyAttendance(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetDailyAttendance", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetAdminProject(GridView GV)
        {
            BindData.BindGridView("GetAdminProject", GV);
        }
        public void BindGetRawMaterialStock(GridView GV, string PRJID)
        {
            BindData.BindGridView("GetRawMaterialStock", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetRawMaterialStockDetail(GridView GV, string PRJID)
        {
            BindData.BindGridView("GetAdminStock", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetUpdateRawMaterialStock(GridView GV, string PRJID)
        {
            BindData.BindGridViewWithSNo("GetUpdateRawMaterialStock", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetTotalLaber(GridView GV)
        {
            BindData.BindGridViewWithSNo("GetTotalLabour", GV);
        }
        public void BindGetRawMaterialStock1(GridView GV, string PRJID)
        {
            BindData.BindGridView("GetAdminStock", GV, new SqlParameter("@email_Id", PRJID));
        }
        public void BindGetEmpLabour(GridView GV, string EmpID)
        {
            BindData.BindGridViewWithSNo("GetTotalLabourBYEmpId", GV, new SqlParameter("@FValue", EmpID));
        }
        public void GetMaxIDForRaBillCertified(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForRABILLCertified", CompanyID, out WPID);
        }
        public void GetMaxIDForRaBillNo(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForRABILL", CompanyID, out WPID);
        }
        public void GetMaxIDForRaBillGoToCertified(string CompanyID, out string WPID)
        {
            ReturnOutPutValue.CheckMaxID("GetMaxIDForRABILLForCertified", CompanyID, out WPID);
        }
        public void BindGetDebitorsListDateWise(GridView GV, string PRJID, string AStatus, string Date)
        {
            BindData.BindGridViewWithSNo("GetDebitorsListDateWise", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus), 
                new SqlParameter("@TValue", Date));
        }
        public void BindGetDebitorsSuggestedList(GridView GV, string PRJID, string AStatus, string Date)
        {
            BindData.BindGridViewWithSNo("GetDebitorsSuggestedList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus),
                new SqlParameter("@TValue", Date));
        }
        public void BindGetDebitorsSuggestedListDateWise(GridView GV, string PRJID, string AStatus, string Date)
        {
            BindData.BindGridViewWithSNo("GetDebitorsSuggestedListDateWise", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus),
                new SqlParameter("@TValue", Date));
        }
        public void InsertDebtorList(string CompanyID, string PRJID, string ListID, string VendorID, string Name, string Amount, string Remarks,
            string ForwardTo, string CreatedBy, string PaymentType)
        {
            int Result = DALL.SPInsert("InsertDebtorList", new SqlParameter("@CompanyID", CompanyID), new SqlParameter("@PRJID", PRJID),
                new SqlParameter("@ListID", ListID), new SqlParameter("@VendorID", VendorID), new SqlParameter("@Name", Name),
                new SqlParameter("@Amount", Convert.ToDecimal(Amount)), new SqlParameter("@Remarks", Remarks), new SqlParameter("@ForwardTo", ForwardTo),
                new SqlParameter("@CreatedBy", CreatedBy), new SqlParameter("@PaymentType", PaymentType));
        }
        public void BindGetDebtorSuggestedList(GridView GV, string PRJID, string AStatus)
        {
            BindData.BindGridViewWithSNo("GetDebtorSuggestedList", GV, new SqlParameter("@FValue", PRJID), new SqlParameter("@SValue", AStatus));
        }
    }
}
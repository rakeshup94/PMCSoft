namespace PMCSoft.Core.Entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class PMCSoftContext : DbContext
    {
        public PMCSoftContext()
            : base("name=PMCSoftContext")
        {
        }

        public virtual DbSet<AdminPermission> AdminPermissions { get; set; }
        public virtual DbSet<NewStaffCostFoc> NewStaffCostFocs { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<StaffCost> StaffCosts { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<tblAccountType> tblAccountTypes { get; set; }
        public virtual DbSet<tblAcctPCBill> tblAcctPCBills { get; set; }
        public virtual DbSet<tblAdminMenuHeader> tblAdminMenuHeaders { get; set; }
        public virtual DbSet<tblApprovalLevelForPCBill> tblApprovalLevelForPCBills { get; set; }
        public virtual DbSet<tblApprovalLevelForWorkOrder> tblApprovalLevelForWorkOrders { get; set; }
        public virtual DbSet<tblAvailibilityOfDocumentsDetail> tblAvailibilityOfDocumentsDetails { get; set; }
        public virtual DbSet<tblAvailibilityOfDocumentsMaster> tblAvailibilityOfDocumentsMasters { get; set; }
        public virtual DbSet<tblBackDatePermission> tblBackDatePermissions { get; set; }
        public virtual DbSet<tblBankBranchMaster> tblBankBranchMasters { get; set; }
        public virtual DbSet<tblBankMaster> tblBankMasters { get; set; }
        public virtual DbSet<tblBillingParticularsDetail> tblBillingParticularsDetails { get; set; }
        public virtual DbSet<tblBillingParticularsMaster> tblBillingParticularsMasters { get; set; }
        public virtual DbSet<tblBulkMaterialDescriptionMaster> tblBulkMaterialDescriptionMasters { get; set; }
        public virtual DbSet<tblBulkMaterialFixedDescriptionMaster> tblBulkMaterialFixedDescriptionMasters { get; set; }
        public virtual DbSet<tblBulkMaterialsDetail> tblBulkMaterialsDetails { get; set; }
        public virtual DbSet<tblClientMaster> tblClientMasters { get; set; }
        public virtual DbSet<tblCompanyMaster> tblCompanyMasters { get; set; }
        public virtual DbSet<tblConsumableExpensesReportDetail> tblConsumableExpensesReportDetails { get; set; }
        public virtual DbSet<tblConsumableExpensesReportMaster> tblConsumableExpensesReportMasters { get; set; }
        public virtual DbSet<tblConsumble> tblConsumbles { get; set; }
        public virtual DbSet<tblDailyMorningReport> tblDailyMorningReports { get; set; }
        public virtual DbSet<tblDailyWorkProgramme> tblDailyWorkProgrammes { get; set; }
        public virtual DbSet<tblDatabaseBackup> tblDatabaseBackups { get; set; }
        public virtual DbSet<tblDebitorsApproveList> tblDebitorsApproveLists { get; set; }
        public virtual DbSet<tblDebitorsList> tblDebitorsLists { get; set; }
        public virtual DbSet<tblDebtorPaymentType> tblDebtorPaymentTypes { get; set; }
        public virtual DbSet<tblDepartment> tblDepartments { get; set; }
        public virtual DbSet<tblDesignation> tblDesignations { get; set; }
        public virtual DbSet<tblDetailMonthlyLabourDetail> tblDetailMonthlyLabourDetails { get; set; }
        public virtual DbSet<tblDetailMonthlyLabourMaster> tblDetailMonthlyLabourMasters { get; set; }
        public virtual DbSet<tblDetailMonthlyLabourSummary> tblDetailMonthlyLabourSummaries { get; set; }
        public virtual DbSet<tblDirectExpens> tblDirectExpenses { get; set; }
        public virtual DbSet<tblDirectExpensesMaster> tblDirectExpensesMasters { get; set; }
        public virtual DbSet<tblEmployeeMaster> tblEmployeeMasters { get; set; }
        public virtual DbSet<tblEquipmentDetail> tblEquipmentDetails { get; set; }
        public virtual DbSet<tblEquipmentExpens> tblEquipmentExpenses { get; set; }
        public virtual DbSet<tblEquipmentMaster> tblEquipmentMasters { get; set; }
        public virtual DbSet<tblErrorLog> tblErrorLogs { get; set; }
        public virtual DbSet<tblErrorLogWithoutLogin> tblErrorLogWithoutLogins { get; set; }
        public virtual DbSet<tblExpenditure> tblExpenditures { get; set; }
        public virtual DbSet<tblFacilitiesProvidedDetail> tblFacilitiesProvidedDetails { get; set; }
        public virtual DbSet<tblFacilitiesProvidedMaster> tblFacilitiesProvidedMasters { get; set; }
        public virtual DbSet<tblForgotCode> tblForgotCodes { get; set; }
        public virtual DbSet<tblGeneralStaffAttendance> tblGeneralStaffAttendances { get; set; }
        public virtual DbSet<tblGeneralStaffMaster> tblGeneralStaffMasters { get; set; }
        public virtual DbSet<tblHireChargesItemWise> tblHireChargesItemWises { get; set; }
        public virtual DbSet<tblHireChargesMaster> tblHireChargesMasters { get; set; }
        public virtual DbSet<tblIncomeMaster> tblIncomeMasters { get; set; }
        public virtual DbSet<tblIndirectExpens> tblIndirectExpenses { get; set; }
        public virtual DbSet<tblInDirectExpensesMaster> tblInDirectExpensesMasters { get; set; }
        public virtual DbSet<tblInsuranceLicensesDetail> tblInsuranceLicensesDetails { get; set; }
        public virtual DbSet<tblInsuranceLicensesMaster> tblInsuranceLicensesMasters { get; set; }
        public virtual DbSet<tblIssuePDCRequest> tblIssuePDCRequests { get; set; }
        public virtual DbSet<tblItemGroupMaster> tblItemGroupMasters { get; set; }
        public virtual DbSet<tblItemMaster> tblItemMasters { get; set; }
        public virtual DbSet<tblItemOfWork> tblItemOfWorks { get; set; }
        public virtual DbSet<tblLabourDetail> tblLabourDetails { get; set; }
        public virtual DbSet<tblLabourMaster> tblLabourMasters { get; set; }
        public virtual DbSet<tblLogInformation> tblLogInformations { get; set; }
        public virtual DbSet<tblMasterstaffSalary> tblMasterstaffSalaries { get; set; }
        public virtual DbSet<tblMasterWork> tblMasterWorks { get; set; }
        public virtual DbSet<tblMenu> tblMenus { get; set; }
        public virtual DbSet<tblMidAmendPCWOItemDetail> tblMidAmendPCWOItemDetails { get; set; }
        public virtual DbSet<tblMidAmendPCWONotesDetail> tblMidAmendPCWONotesDetails { get; set; }
        public virtual DbSet<tblMidAmendUploadFile> tblMidAmendUploadFiles { get; set; }
        public virtual DbSet<tblMidAmendWOPCDetail> tblMidAmendWOPCDetails { get; set; }
        public virtual DbSet<tblMidAmendWORemark> tblMidAmendWORemarks { get; set; }
        public virtual DbSet<tblMidDailyWorkProgramme> tblMidDailyWorkProgrammes { get; set; }
        public virtual DbSet<tblMidPCBill> tblMidPCBills { get; set; }
        public virtual DbSet<tblMidPCBillItem> tblMidPCBillItems { get; set; }
        public virtual DbSet<tblMidPCWOItemDetail> tblMidPCWOItemDetails { get; set; }
        public virtual DbSet<tblMidPCWOItemDetailForAuth> tblMidPCWOItemDetailForAuths { get; set; }
        public virtual DbSet<tblMidPCWOItemDetailForPIC> tblMidPCWOItemDetailForPICs { get; set; }
        public virtual DbSet<tblMidPCWONotesDetail> tblMidPCWONotesDetails { get; set; }
        public virtual DbSet<tblMidPCWONotesDetailForAuth> tblMidPCWONotesDetailForAuths { get; set; }
        public virtual DbSet<tblMidPCWONotesDetailForPIC> tblMidPCWONotesDetailForPICs { get; set; }
        public virtual DbSet<tblMidWOPCDetail> tblMidWOPCDetails { get; set; }
        public virtual DbSet<tblMidWORemarkForPIC> tblMidWORemarkForPICs { get; set; }
        public virtual DbSet<tblMobilizationAdvanceDetail> tblMobilizationAdvanceDetails { get; set; }
        public virtual DbSet<tblMobilizationAdvanceMaster> tblMobilizationAdvanceMasters { get; set; }
        public virtual DbSet<tblMonthlyDirectExpens> tblMonthlyDirectExpenses { get; set; }
        public virtual DbSet<tblMonthlyHireCharge> tblMonthlyHireCharges { get; set; }
        public virtual DbSet<tblMonthlyIncome> tblMonthlyIncomes { get; set; }
        public virtual DbSet<tblMonthlyInDirectExpens> tblMonthlyInDirectExpenses { get; set; }
        public virtual DbSet<tblMonthlyPurchase> tblMonthlyPurchases { get; set; }
        public virtual DbSet<tblMonthlyVWD> tblMonthlyVWDs { get; set; }
        public virtual DbSet<tblOtherDepositBondDetail> tblOtherDepositBondDetails { get; set; }
        public virtual DbSet<tblOtherDepositBondMaster> tblOtherDepositBondMasters { get; set; }
        public virtual DbSet<tblPaymentReceipt> tblPaymentReceipts { get; set; }
        public virtual DbSet<tblPaymentTermsDetail> tblPaymentTermsDetails { get; set; }
        public virtual DbSet<tblPaymentTermsMaster> tblPaymentTermsMasters { get; set; }
        public virtual DbSet<tblPaymentType> tblPaymentTypes { get; set; }
        public virtual DbSet<tblPCBill> tblPCBills { get; set; }
        public virtual DbSet<tblPCBillArrear> tblPCBillArrears { get; set; }
        public virtual DbSet<tblPCBillFileUpload> tblPCBillFileUploads { get; set; }
        public virtual DbSet<tblPCBillFromPMC> tblPCBillFromPMCs { get; set; }
        public virtual DbSet<tblPCBillFromSITE> tblPCBillFromSITEs { get; set; }
        public virtual DbSet<tblPCBillItem> tblPCBillItems { get; set; }
        public virtual DbSet<tblPcReconciliationClaimedAndPaid> tblPcReconciliationClaimedAndPaids { get; set; }
        public virtual DbSet<tblPcReconciliationClaimedAndPaidMaster> tblPcReconciliationClaimedAndPaidMasters { get; set; }
        public virtual DbSet<tblPCRemark> tblPCRemarks { get; set; }
        public virtual DbSet<tblPCWOItemDetail> tblPCWOItemDetails { get; set; }
        public virtual DbSet<tblPCWONotesDetail> tblPCWONotesDetails { get; set; }
        public virtual DbSet<tblPICPCBill> tblPICPCBills { get; set; }
        public virtual DbSet<tblPlanDetail> tblPlanDetails { get; set; }
        public virtual DbSet<tblPlanMaster> tblPlanMasters { get; set; }
        public virtual DbSet<tblPowerConsumptionDetail> tblPowerConsumptionDetails { get; set; }
        public virtual DbSet<tblPowerConsumptionMaster> tblPowerConsumptionMasters { get; set; }
        public virtual DbSet<tblPowerConsumptionOneTimeExpMaster> tblPowerConsumptionOneTimeExpMasters { get; set; }
        public virtual DbSet<tblProjectCode> tblProjectCodes { get; set; }
        public virtual DbSet<tblProjectMaster> tblProjectMasters { get; set; }
        public virtual DbSet<tblProjectMasterDetail> tblProjectMasterDetails { get; set; }
        public virtual DbSet<tblProjectParticularsDetail> tblProjectParticularsDetails { get; set; }
        public virtual DbSet<tblProjectParticularsDetailA> tblProjectParticularsDetailAs { get; set; }
        public virtual DbSet<tblProjectParticularsMaster> tblProjectParticularsMasters { get; set; }
        public virtual DbSet<tblPurchaseConsumptionMaster> tblPurchaseConsumptionMasters { get; set; }
        public virtual DbSet<tblRateType> tblRateTypes { get; set; }
        public virtual DbSet<tblReconciliationStatementDetail> tblReconciliationStatementDetails { get; set; }
        public virtual DbSet<tblReconciliationStatementMaster> tblReconciliationStatementMasters { get; set; }
        public virtual DbSet<tblRegion> tblRegions { get; set; }
        public virtual DbSet<tblRegistrationType> tblRegistrationTypes { get; set; }
        public virtual DbSet<tblRole> tblRoles { get; set; }
        public virtual DbSet<tblRoleMenu> tblRoleMenus { get; set; }
        public virtual DbSet<tblRSSFeed> tblRSSFeeds { get; set; }
        public virtual DbSet<tblStaffCostCalculation> tblStaffCostCalculations { get; set; }
        public virtual DbSet<tblStockMaterialMasterByClient> tblStockMaterialMasterByClients { get; set; }
        public virtual DbSet<tblUnitMaster> tblUnitMasters { get; set; }
        public virtual DbSet<tblUploadFile> tblUploadFiles { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }
        public virtual DbSet<tblUserRole> tblUserRoles { get; set; }
        public virtual DbSet<tblUserVerification> tblUserVerifications { get; set; }
        public virtual DbSet<tblVendorDocumentUploadFile> tblVendorDocumentUploadFiles { get; set; }
        public virtual DbSet<tblVendorMaster> tblVendorMasters { get; set; }
        public virtual DbSet<tblWOPCDetail> tblWOPCDetails { get; set; }
        public virtual DbSet<tblWORemark> tblWORemarks { get; set; }
        public virtual DbSet<tblWorkType> tblWorkTypes { get; set; }
        public virtual DbSet<AdminPermissionPage> AdminPermissionPages { get; set; }
        public virtual DbSet<HireChargesExpens> HireChargesExpenses { get; set; }
        public virtual DbSet<PermissionPage> PermissionPages { get; set; }
        public virtual DbSet<tblActulPlan> tblActulPlans { get; set; }
        public virtual DbSet<tblAdvanceRequisition> tblAdvanceRequisitions { get; set; }
        public virtual DbSet<tblCityList> tblCityLists { get; set; }
        public virtual DbSet<tblCountry> tblCountries { get; set; }
        public virtual DbSet<tblItemIssue> tblItemIssues { get; set; }
        public virtual DbSet<tblMaterialReceive> tblMaterialReceives { get; set; }
        public virtual DbSet<tblMenuHeader> tblMenuHeaders { get; set; }
        public virtual DbSet<tblMenuX> tblMenuXes { get; set; }
        public virtual DbSet<tblMonthlyLabourAsSubmittedRaBill> tblMonthlyLabourAsSubmittedRaBills { get; set; }
        public virtual DbSet<tblMonthlyLabourMonthAndUpToDateMaster> tblMonthlyLabourMonthAndUpToDateMasters { get; set; }
        public virtual DbSet<tblMonthlyWorkDoneActual> tblMonthlyWorkDoneActuals { get; set; }
        public virtual DbSet<tblMonthlyWorkDonePlan> tblMonthlyWorkDonePlans { get; set; }
        public virtual DbSet<tblMonthlyWorkDonePlanDetail> tblMonthlyWorkDonePlanDetails { get; set; }
        public virtual DbSet<tblMonthlyWorkDonePlanMaster> tblMonthlyWorkDonePlanMasters { get; set; }
        public virtual DbSet<tblPlan> tblPlans { get; set; }
        public virtual DbSet<tblProjectPage> tblProjectPages { get; set; }
        public virtual DbSet<tblRABill> tblRABills { get; set; }
        public virtual DbSet<tblRABillCertified> tblRABillCertifieds { get; set; }
        public virtual DbSet<tblRABillSubmitted> tblRABillSubmitteds { get; set; }
        public virtual DbSet<tblSecurityForAdvanceRequisition> tblSecurityForAdvanceRequisitions { get; set; }
        public virtual DbSet<tblState> tblStates { get; set; }
        public virtual DbSet<tblStock> tblStocks { get; set; }
        public virtual DbSet<tblStockOpeningDate> tblStockOpeningDates { get; set; }
        public virtual DbSet<tblStoreOpening> tblStoreOpenings { get; set; }
        public virtual DbSet<tblTypeOfAdvanceRequisition> tblTypeOfAdvanceRequisitions { get; set; }
        public virtual DbSet<tblVendorTypeMaster> tblVendorTypeMasters { get; set; }
        public virtual DbSet<tblWorkDoneDetail> tblWorkDoneDetails { get; set; }
        public virtual DbSet<tblWorkDoneMaster> tblWorkDoneMasters { get; set; }
        public virtual DbSet<tblWorkDoneSubDetail> tblWorkDoneSubDetails { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdminPermission>()
                .Property(e => e.PageName)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermission>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.PMONTH)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.PYEAR)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.PcID)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<NewStaffCostFoc>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .Property(e => e.PageName)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.PcID)
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.Status)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<StaffCost>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAccountType>()
                .Property(e => e.AccountType)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.ForwardToSITE)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.ForwardToPMC)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblAcctPCBill>()
                .Property(e => e.BillReceive)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdminMenuHeader>()
                .Property(e => e.MenuHeaderName)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdminMenuHeader>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.ApprovalLevel2)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.ApprovalLevel3)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.ApprovalLevel4)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForPCBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.ApprovalLevel2)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.ApprovalLevel3)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblApprovalLevelForWorkOrder>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblAvailibilityOfDocumentsMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBackDatePermission>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBackDatePermission>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBackDatePermission>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.BankID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.BranchID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.BranchName)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankBranchMaster>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.BankID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.BankName)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBankMaster>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBillingParticularsMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.DetailId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialDescriptionMaster>()
                .Property(e => e.LabourId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialFixedDescriptionMaster>()
                .Property(e => e.SNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialFixedDescriptionMaster>()
                .Property(e => e.DescriptionName)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialFixedDescriptionMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialFixedDescriptionMaster>()
                .Property(e => e.Id)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.RabillId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.RaBillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.DescriptionId)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblBulkMaterialsDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Initial)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Logo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Note)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.PanNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.TanNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.GSTNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.PhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.FaxNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.TimeZone)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Culture)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Logitude)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.Latitude)
                .IsUnicode(false);

            modelBuilder.Entity<tblClientMaster>()
                .Property(e => e.WebAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.CompanyName)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.AccountType)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblCompanyMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.ConExpId)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.ItemName)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportMaster>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportMaster>()
                .Property(e => e.Createdby)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumableExpensesReportMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblConsumble>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.WPID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.MRID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.EngInCharge)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Block)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.ItemOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Area)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Supervisor)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Foreman)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Engineer)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.WPNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyMorningReport>()
                .Property(e => e.Productive)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.WPID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.EngInCharge)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Block)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.ItemOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Area)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Supervisor)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Foreman)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Engineer)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.WPNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.WPStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Remark)
                .IsUnicode(false);

            modelBuilder.Entity<tblDailyWorkProgramme>()
                .Property(e => e.Productive)
                .IsUnicode(false);

            modelBuilder.Entity<tblDatabaseBackup>()
                .Property(e => e.DatabaseName)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ListID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ApproveListID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ApprovalRemarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.ListTransID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsApproveList>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.ListID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebitorsList>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<tblDebtorPaymentType>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<tblDepartment>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDepartment>()
                .Property(e => e.DepartmentName)
                .IsUnicode(false);

            modelBuilder.Entity<tblDepartment>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDepartment>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDepartment>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.DesgID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.Designation)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDesignation>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.DetailId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourDetail>()
                .Property(e => e.LabourId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.DetailId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourMaster>()
                .Property(e => e.LabourId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourSummary>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourSummary>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourSummary>()
                .Property(e => e.DetailId)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourSummary>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDetailMonthlyLabourSummary>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpensesMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpensesMaster>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpensesMaster>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpensesMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblDirectExpensesMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.FName)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.LName)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.AccountType)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.AltEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.ReportingTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.DesgID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.OfficialEmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEmployeeMaster>()
                .Property(e => e.EmpType)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentDetail>()
                .Property(e => e.EquipmentNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.ExpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.EquipmentDetail)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.EquipmentName)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.EquipmentNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.EquipmentStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblEquipmentMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblErrorLog>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblErrorLog>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblErrorLog>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblErrorLog>()
                .Property(e => e.ErrorLog)
                .IsUnicode(false);

            modelBuilder.Entity<tblErrorLogWithoutLogin>()
                .Property(e => e.ErrorLog)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblExpenditure>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblFacilitiesProvidedMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.UserEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.CodeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblForgotCode>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.OfficialEMPID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.EmpName)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.DesgID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.AttnID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffAttendance>()
                .Property(e => e.EmpType)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.FName)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.LName)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.DesgID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.OfficialEmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblGeneralStaffMaster>()
                .Property(e => e.EmployeeType)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesItemWise>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesMaster>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesMaster>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblHireChargesMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblIncomeMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblIndirectExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblInDirectExpensesMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInDirectExpensesMaster>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInDirectExpensesMaster>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblInDirectExpensesMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblInDirectExpensesMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblInsuranceLicensesMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.IssueID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.BankID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.BranchID)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.ChequeNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblIssuePDCRequest>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.GroupName)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.GroupCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemGroupMaster>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.ItemName)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.Make)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.PartNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemMaster>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .Property(e => e.ItemOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemOfWork>()
                .HasMany(e => e.tblItemOfWork1)
                .WithOptional(e => e.tblItemOfWork2)
                .HasForeignKey(e => e.CategoryId);

            modelBuilder.Entity<tblLabourDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourDetail>()
                .Property(e => e.LabourNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.LabourName)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.LabourNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.LabourType)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.LabourStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblLabourMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblLogInformation>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblLogInformation>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblLogInformation>()
                .Property(e => e.UserId)
                .IsUnicode(false);

            modelBuilder.Entity<tblLogInformation>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMasterstaffSalary>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblMasterstaffSalary>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMasterWork>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblMasterWork>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMenu>()
                .Property(e => e.MenuIcon)
                .IsUnicode(false);

            modelBuilder.Entity<tblMenu>()
                .HasMany(e => e.tblMenu1)
                .WithOptional(e => e.tblMenu2)
                .HasForeignKey(e => e.ParentId);

            modelBuilder.Entity<tblMenu>()
                .HasMany(e => e.tblRoleMenus)
                .WithRequired(e => e.tblMenu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWOItemDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendPCWONotesDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.UploadID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.FileNameSys)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.FileStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendUploadFile>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWOPCDetail>()
                .Property(e => e.FinYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.AppFrom)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.AppTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidAmendWORemark>()
                .Property(e => e.Reamarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.WPID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.EngInCharge)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Block)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.ItemOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Area)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Supervisor)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Foreman)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Engineer)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.WPNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.WPStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Remark)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidDailyWorkProgramme>()
                .Property(e => e.Productive)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.AccFile)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.PreparedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.CheckedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.Accountant)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.ApprovedForPaymentBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.SignatureOfPC)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.PartType)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.PartTypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCBillItem>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForAuth>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWOItemDetailForPIC>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForAuth>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidPCWONotesDetailForPIC>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWOPCDetail>()
                .Property(e => e.FinYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.AppFrom)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.AppTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMidWORemarkForPIC>()
                .Property(e => e.Reamarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMobilizationAdvanceMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.TrackerID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyDirectExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.TrackerID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyHireCharge>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.TrackerID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyIncome>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.TrackerID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyInDirectExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.TrackerID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.Year)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyPurchase>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.FiscMonths)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyVWD>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblOtherDepositBondMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.ReceiptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.RABillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.TypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.BankName)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.ChequeNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentReceipt>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentTermsMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentType>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentType>()
                .Property(e => e.TypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentType>()
                .Property(e => e.PaymentType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentType>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPaymentType>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.AccFile)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.PreparedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.CheckedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.Accountant)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.ApprovedForPaymentBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.SignatureOfPC)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillArrear>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.FilePath)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.FileType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.FileSize)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFileUpload>()
                .Property(e => e.FileNameSystem)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.AccFile)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.PreparedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.CheckedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.Accountant)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.ApprovedForPaymentBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.SignatureOfPC)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromPMC>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.AccFile)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.PreparedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.CheckedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.Accountant)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.ApprovedForPaymentBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.SignatureOfPC)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillFromSITE>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.PartType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.PartTypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCBillItem>()
                .Property(e => e.GSTTaxPer)
                .HasPrecision(18, 3);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.PCId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.PMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.PYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.Rabillid)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.RabillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaid>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaidMaster>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaidMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaidMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaidMaster>()
                .Property(e => e.Createdby)
                .IsUnicode(false);

            modelBuilder.Entity<tblPcReconciliationClaimedAndPaidMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.RemarkFrom)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.RemarkTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCRemark>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.Item)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWOItemDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPCWONotesDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.BillID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.PCID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.NatureOfWorkID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.WorkOrderNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.ForwardToSITE)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.ForwardToAcct)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.RegType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.RABillType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.RABillNo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.ApprovalStatusAcct)
                .IsUnicode(false);

            modelBuilder.Entity<tblPICPCBill>()
                .Property(e => e.ApprovalStatusSite)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanDetail>()
                .Property(e => e.PlanNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.PlanName)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.PlanNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.PlanType)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.PlanStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlanMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.ComapnyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.PCId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionMaster>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionOneTimeExpMaster>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionOneTimeExpMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionOneTimeExpMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionOneTimeExpMaster>()
                .Property(e => e.Createdby)
                .IsUnicode(false);

            modelBuilder.Entity<tblPowerConsumptionOneTimeExpMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.RegionID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.ProjectCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectCode>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.ProjectName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.FinalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.StipulatedDateFinishClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMaster>()
                .Property(e => e.StipulatedDateFinishAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ProjectName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ScopeOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ReasonsForDelayedStart)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.TimeLapsedFromStipulatedDateOfStart)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.BalanceTimePeriodAvailable)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ReasonForDelay)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.ActionTakenForControllingDelays)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.StatusOfExtensionOfTime)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectMasterDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.PTID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.Clause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.Amendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetail>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.NameOfProject)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.Location)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LocationClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LocationAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.AwardClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.AwardAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LOINo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LOINoClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LOINoAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LOIDateClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.LOIDateAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.NameOfRegion)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.RegionClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.RegionAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectInchargeName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectInchargeMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.InchargeClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.InchargeAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralConsultantName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralConsultantAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralConsultantMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingMobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingCountry)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingState)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingCity)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StipulatedDateStartClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StipulatedDateStartAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ActualDateStartClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ActualDateStartAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StipulatedDateFinishClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StipulatedDateFinishAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.OCVWord)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.OCVClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.OCVAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.RCVWord)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.RCVClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.RCVAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ECVWord)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ECVClause)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ECVAmendments)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ClientFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ProjectManagerFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ArchitectFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.StructuralFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.MechanicalFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.ElectricalFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsDetailA>()
                .Property(e => e.PlumbingFax)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsMaster>()
                .Property(e => e.Particulars)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectParticularsMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPurchaseConsumptionMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPurchaseConsumptionMaster>()
                .Property(e => e.ParticularID)
                .IsUnicode(false);

            modelBuilder.Entity<tblPurchaseConsumptionMaster>()
                .Property(e => e.Particular)
                .IsUnicode(false);

            modelBuilder.Entity<tblPurchaseConsumptionMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblPurchaseConsumptionMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRateType>()
                .Property(e => e.RateType)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.RCId)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.RMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.RYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.RabillId)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.RabillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.Formula)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementMaster>()
                .Property(e => e.Recon_Desc)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblReconciliationStatementMaster>()
                .Property(e => e.Formula)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.RegionID)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.RegionName)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.RegionCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegion>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegistrationType>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegistrationType>()
                .Property(e => e.TypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegistrationType>()
                .Property(e => e.RegistrationType)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegistrationType>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRegistrationType>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRole>()
                .Property(e => e.RoleName)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.FileNameOriginal)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.CircularNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.DeptID)
                .IsUnicode(false);

            modelBuilder.Entity<tblRSSFeed>()
                .Property(e => e.DesgID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStaffCostCalculation>()
                .Property(e => e.Details)
                .IsUnicode(false);

            modelBuilder.Entity<tblStaffCostCalculation>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockMaterialMasterByClient>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockMaterialMasterByClient>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockMaterialMasterByClient>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockMaterialMasterByClient>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockMaterialMasterByClient>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.UnitName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.UnitCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUnitMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.UploadID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.FileNameSys)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.FileStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUploadFile>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.MiddleName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.EmpID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.UserEmail)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.CodeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblUserVerification>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.UploadID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.FileNameSys)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.FileStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorDocumentUploadFile>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.MobileNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.VendorType)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.VendorTypeCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.PanNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.TinNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.EccNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.Vat)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.RegistrationType)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.PinCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.SalesTaxNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.CSTNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.ServiceTaxNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.PhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.BlackListStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.PFNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.ESINo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.AadharNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.ContactPerson)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.ContactNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.GSTNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorMaster>()
                .Property(e => e.WorkTypeCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.ProjectID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.ApprovalStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.PICApproval)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.ForwardToPIC)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.CMDApproval)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.ApprovedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWOPCDetail>()
                .Property(e => e.FinYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.PRJID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.WOID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.WONo)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.VendorID)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.AppFrom)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.AppTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.ForwardTo)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWORemark>()
                .Property(e => e.Reamarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkType>()
                .Property(e => e.WorkTypeCode)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkType>()
                .Property(e => e.WorkTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkType>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermissionPage>()
                .Property(e => e.MenuHeadervalue)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermissionPage>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermissionPage>()
                .Property(e => e.UserId)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermissionPage>()
                .Property(e => e.Pagevalue)
                .IsUnicode(false);

            modelBuilder.Entity<AdminPermissionPage>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.HireChargesId)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.Model)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.VendorId)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.DateOfInstallation)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.PurposeOfWork)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.HireChargeMonth)
                .IsUnicode(false);

            modelBuilder.Entity<HireChargesExpens>()
                .Property(e => e.HireChargeYear)
                .IsUnicode(false);

            modelBuilder.Entity<PermissionPage>()
                .Property(e => e.MenuHeadervalue)
                .IsUnicode(false);

            modelBuilder.Entity<PermissionPage>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<PermissionPage>()
                .Property(e => e.UserId)
                .IsUnicode(false);

            modelBuilder.Entity<PermissionPage>()
                .Property(e => e.Pagevalue)
                .IsUnicode(false);

            modelBuilder.Entity<PermissionPage>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.ActualPlanMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.ActualPlanYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.ParticularsId)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.ParticularsName)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblActulPlan>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.ARId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.VendorId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.TypeId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.VendorAddress)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.AnysecurityCreated)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.SecurityId)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.Reasion)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblAdvanceRequisition>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblCityList>()
                .Property(e => e.CityID)
                .IsUnicode(false);

            modelBuilder.Entity<tblCityList>()
                .Property(e => e.StateID)
                .IsUnicode(false);

            modelBuilder.Entity<tblCityList>()
                .Property(e => e.CityName)
                .IsUnicode(false);

            modelBuilder.Entity<tblCountry>()
                .Property(e => e.CountryID)
                .IsUnicode(false);

            modelBuilder.Entity<tblCountry>()
                .Property(e => e.CnName)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.ItemIssueId)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.IssueTower)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.Make)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.PartNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblItemIssue>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.MaterialReceiveId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Gate_Entry_No)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.PO_No)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Received_By)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Vendor_ID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Bill_Challan_No)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Item_Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMaterialReceive>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMenuHeader>()
                .Property(e => e.MenuHeaderName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMenuHeader>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.RABillId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.RaBillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.MLRMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.MLRYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.MLID)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.Pds)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourAsSubmittedRaBill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.RABILLId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.MUMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.MUYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.MonthlyLaberId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyLabourMonthAndUpToDateMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.PlanMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.PlanYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.WDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.WDDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.WDSubParticularsName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDoneActual>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.PlanMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.PlanYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.WDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.WDDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.WDSubParticularsName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.Unit)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlan>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.WDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.WDDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanMaster>()
                .Property(e => e.WDMParticularName)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblMonthlyWorkDonePlanMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.ParticularsId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.PlanMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.PlanYear)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.ParticularsName)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblPlan>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectPage>()
                .Property(e => e.PageName)
                .IsUnicode(false);

            modelBuilder.Entity<tblProjectPage>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.RaBillId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.RaBillMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.RaBillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.SubmittedStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.CertifiedStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABill>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.RaBillCertifiedId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.ChequeNoRTGS)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.CertifiedStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillCertified>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.RaBillId)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.RaBillMonth)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.RaBillNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.SubmittedStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.CertifiedStatus)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblRABillSubmitted>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.SecurityID)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.PaymentSecurity)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblSecurityForAdvanceRequisition>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblState>()
                .Property(e => e.StateID)
                .IsUnicode(false);

            modelBuilder.Entity<tblState>()
                .Property(e => e.CountryID)
                .IsUnicode(false);

            modelBuilder.Entity<tblState>()
                .Property(e => e.StateName)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.Vendor_ID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblStock>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockOpeningDate>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockOpeningDate>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockOpeningDate>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblStockOpeningDate>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.OpeningStockId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.ItemGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.ItemID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.UnitID)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.Make)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.PartNo)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblStoreOpening>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.TypeId)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblTypeOfAdvanceRequisition>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.CompanyID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.TypeID)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.VendorType)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblVendorTypeMaster>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneDetail>()
                .Property(e => e.WDDName)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneMaster>()
                .Property(e => e.WDName)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneMaster>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneMaster>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneMaster>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneMaster>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneSubDetail>()
                .Property(e => e.WDDName)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneSubDetail>()
                .Property(e => e.ProjectId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneSubDetail>()
                .Property(e => e.CompanyId)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneSubDetail>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<tblWorkDoneSubDetail>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);
        }
    }
}

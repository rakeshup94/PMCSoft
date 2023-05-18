namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblProjectMasterDetail")]
    public partial class tblProjectMasterDetail
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        public string ProjectName { get; set; }

        public string ClientName { get; set; }

        public string Address { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        public DateTime? DateOfLOI { get; set; }

        public DateTime? DateOfAgreementWithClient { get; set; }

        public string ScopeOfWork { get; set; }

        public decimal? OriginalContractValue { get; set; }

        public decimal? RevisedContractValue { get; set; }

        public decimal? EstimatedTotalCostOfWork { get; set; }

        public DateTime? StipulatedDateOfStart { get; set; }

        public DateTime? ActualDateOfStart { get; set; }

        public string ReasonsForDelayedStart { get; set; }

        public DateTime? StipulatedDateofCompletion { get; set; }

        public DateTime? RevisedDateOfCompletion { get; set; }

        public DateTime? EstimatedDateOfCompletion { get; set; }

        [StringLength(50)]
        public string TimeLapsedFromStipulatedDateOfStart { get; set; }

        [StringLength(50)]
        public string BalanceTimePeriodAvailable { get; set; }

        public DateTime? DateOfValueOfWorkDone { get; set; }

        public decimal? ValueOfWorkDone { get; set; }

        public decimal? BalanceValueOfWork { get; set; }

        public string ReasonForDelay { get; set; }

        public string ActionTakenForControllingDelays { get; set; }

        [StringLength(50)]
        public string StatusOfExtensionOfTime { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

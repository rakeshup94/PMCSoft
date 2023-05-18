namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblDetailMonthlyLabourSummary")]
    public partial class tblDetailMonthlyLabourSummary
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public int? MasterTransId { get; set; }

        [StringLength(50)]
        public string DetailId { get; set; }

        public decimal? EstimatedAmt { get; set; }

        public decimal? UpToDateLabour { get; set; }

        public decimal? ActualLabour { get; set; }

        public decimal? WorkDone { get; set; }

        public decimal? SubContractorWD { get; set; }

        public decimal? InhouseWD { get; set; }

        public decimal? LabourFactor { get; set; }

        public DateTime? MonthStartDate { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? Createddate { get; set; }
    }
}

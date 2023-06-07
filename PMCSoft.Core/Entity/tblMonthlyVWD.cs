namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyVWD")]
    public partial class tblMonthlyVWD
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        public DateTime? AsOnDate { get; set; }

        public DateTime? Dates { get; set; }

        [StringLength(50)]
        public string FiscMonths { get; set; }

        public int? Month { get; set; }

        public int? Year { get; set; }

        public decimal? PlanRs { get; set; }

        public decimal? ActualVWD { get; set; }

        public decimal? ActualEscl { get; set; }

        public decimal? ActualExtraItem { get; set; }

        public decimal? ActualTotal { get; set; }

        public decimal? Variation { get; set; }

        public decimal? VwdS { get; set; }

        public decimal? EsclationS { get; set; }

        public decimal? ExtraItemS { get; set; }

        public decimal? TotalS { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }
    }
}

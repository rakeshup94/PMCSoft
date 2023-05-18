namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NewStaffCostFoc")]
    public partial class NewStaffCostFoc
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PMONTH { get; set; }

        [StringLength(50)]
        public string PYEAR { get; set; }

        [StringLength(20)]
        public string PcID { get; set; }

        public string Details { get; set; }

        public decimal? QuantityFirst { get; set; }

        public decimal? QuantitySec { get; set; }

        public decimal? RateFirst { get; set; }

        public decimal? RateSec { get; set; }

        public decimal? AmountFirst { get; set; }

        public decimal? AmountSec { get; set; }

        public decimal? StaffSalAndAminationFirst { get; set; }

        public decimal? StaffSalAndAminationSec { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

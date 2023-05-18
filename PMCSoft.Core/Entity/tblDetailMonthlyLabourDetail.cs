namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblDetailMonthlyLabourDetail")]
    public partial class tblDetailMonthlyLabourDetail
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string DetailId { get; set; }

        public int? MasterTransId { get; set; }

        public DateTime? MonthStartDate { get; set; }

        public string Name { get; set; }

        public int? Mandays { get; set; }

        public decimal? NormalWages { get; set; }

        public decimal? OTAmt { get; set; }

        public decimal? TotalAmt { get; set; }

        public decimal? LabourOTCompared { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        [StringLength(50)]
        public string LabourId { get; set; }
    }
}

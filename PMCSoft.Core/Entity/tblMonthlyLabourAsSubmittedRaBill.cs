namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyLabourAsSubmittedRaBill")]
    public partial class tblMonthlyLabourAsSubmittedRaBill
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string RABillId { get; set; }

        [StringLength(50)]
        public string RaBillNo { get; set; }

        [StringLength(50)]
        public string MLRMonth { get; set; }

        [StringLength(50)]
        public string MLRYear { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string MLID { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? ContractRate { get; set; }

        public decimal? BOQQty { get; set; }

        public decimal? WDMonthlyQty { get; set; }

        public decimal? AmtMonthly { get; set; }

        public decimal? UptoDateWdqty { get; set; }

        public decimal? UptoDateWdAmt { get; set; }

        public decimal? LabRate { get; set; }

        public decimal? TheoLabExpenMonthly { get; set; }

        public decimal? TheoLabExpenCum { get; set; }

        [StringLength(50)]
        public string Pds { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

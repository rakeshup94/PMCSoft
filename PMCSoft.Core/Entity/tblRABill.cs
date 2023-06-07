namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblRABill")]
    public partial class tblRABill
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string RaBillId { get; set; }

        [StringLength(50)]
        public string RaBillMonth { get; set; }

        [StringLength(50)]
        public string RaBillNo { get; set; }

        public DateTime? Billperiod { get; set; }

        public DateTime? BillperiodTo { get; set; }

        public DateTime? Billsubmitteddate { get; set; }

        public decimal? BillAmount { get; set; }

        public decimal? ServiceTex { get; set; }

        public decimal? ServiceTexonFoc { get; set; }

        public decimal? MobilizationAdvancereceived { get; set; }

        public decimal? SecuredAdvancereceived { get; set; }

        public decimal? Total { get; set; }

        [Column("TDS@2")]
        public decimal? TDS_2 { get; set; }

        [Column("RetentionMoneyDeductd@5")]
        public decimal? RetentionMoneyDeductd_5 { get; set; }

        [Column("WCT@4")]
        public decimal? WCT_4 { get; set; }

        public decimal? MobilizationAdvanceDeducted { get; set; }

        public decimal? SecuredAdvanceAdjusted { get; set; }

        public decimal? OtherDeduction { get; set; }

        public decimal? OtherDeduction1 { get; set; }

        public decimal? OtherDeduction2 { get; set; }

        public decimal? OtherDeduction3 { get; set; }

        public decimal? OtherDeduction4 { get; set; }

        public decimal? TotalDeduction { get; set; }

        public decimal? NetReceivable { get; set; }

        [StringLength(50)]
        public string Remarks { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string SubmittedStatus { get; set; }

        [StringLength(50)]
        public string CertifiedStatus { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public decimal? LabourCess { get; set; }

        public decimal? Escalation { get; set; }

        public decimal? WCT { get; set; }

        public decimal? GSTVal { get; set; }

        public decimal? GSTValOnFOC { get; set; }
    }
}

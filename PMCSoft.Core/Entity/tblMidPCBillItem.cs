namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMidPCBillItem")]
    public partial class tblMidPCBillItem
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string BillID { get; set; }

        [StringLength(50)]
        public string PCID { get; set; }

        public string WorkOrderNo { get; set; }

        public string Item { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? PreviousQty { get; set; }

        public decimal? CurrentQty { get; set; }

        public decimal? TotalQty { get; set; }

        public decimal? FullRate { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        public decimal? PartRate { get; set; }

        [StringLength(50)]
        public string PartType { get; set; }

        [StringLength(50)]
        public string PartTypeID { get; set; }

        public int? ID { get; set; }

        public decimal? UpdateQty { get; set; }

        public decimal? UpdateFullRate { get; set; }

        public decimal? UpdatePartRate { get; set; }

        public decimal? Amount { get; set; }

        public decimal? Advance { get; set; }

        public decimal? Security { get; set; }

        public decimal? SecurityPer { get; set; }

        public decimal? IncomeTax { get; set; }

        public decimal? IncomeTaxPer { get; set; }

        public decimal? Labour { get; set; }

        public decimal? Material { get; set; }

        public decimal? Other { get; set; }

        public decimal? TotalA { get; set; }

        public decimal? TotalB { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public decimal? ServiceTaxPer { get; set; }

        public decimal? ServiceTaxAmt { get; set; }

        public decimal? HoldAmount { get; set; }

        public decimal? ServiceTaxPayable { get; set; }

        public decimal? GSTTaxPer { get; set; }

        public decimal? GSTTaxAmt { get; set; }
    }
}

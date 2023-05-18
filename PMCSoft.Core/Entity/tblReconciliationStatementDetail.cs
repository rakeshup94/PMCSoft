namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblReconciliationStatementDetail")]
    public partial class tblReconciliationStatementDetail
    {
        [Key]
        public int TransId { get; set; }

        public string PRJID { get; set; }

        public string CompanyId { get; set; }

        [StringLength(50)]
        public string RCId { get; set; }

        [StringLength(50)]
        public string RMonth { get; set; }

        [StringLength(50)]
        public string RYear { get; set; }

        public DateTime? Rdate { get; set; }

        [StringLength(50)]
        public string RabillId { get; set; }

        [StringLength(50)]
        public string RabillNo { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string Formula { get; set; }

        public decimal? value8 { get; set; }

        public decimal? value10 { get; set; }

        public decimal? value12 { get; set; }

        public decimal? value16 { get; set; }

        public decimal? value20 { get; set; }

        public decimal? value25 { get; set; }

        public decimal? value28 { get; set; }

        public decimal? value32 { get; set; }

        public decimal? TotalQty { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? Createddate { get; set; }

        [StringLength(10)]
        public string Status { get; set; }
    }
}

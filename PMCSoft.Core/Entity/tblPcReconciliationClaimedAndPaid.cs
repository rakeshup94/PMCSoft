namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPcReconciliationClaimedAndPaid")]
    public partial class tblPcReconciliationClaimedAndPaid
    {
        [Key]
        public int TransId { get; set; }

        public string ProjectId { get; set; }

        public string CompanyId { get; set; }

        public string PCId { get; set; }

        [StringLength(50)]
        public string PMonth { get; set; }

        [StringLength(50)]
        public string PYear { get; set; }

        public DateTime? Pdate { get; set; }

        [StringLength(50)]
        public string Rabillid { get; set; }

        [StringLength(50)]
        public string RabillNo { get; set; }

        public string Description { get; set; }

        public decimal? BOQQTY { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? BOQRate { get; set; }

        public decimal? PCRate { get; set; }

        public decimal? CertClaimedLastRaBill { get; set; }

        public decimal? PaidToPc { get; set; }

        public decimal? WorkDoneByDept { get; set; }

        public decimal? Total { get; set; }

        public decimal? RDifference { get; set; }

        public decimal? DifferenceIn { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblRABillCertified")]
    public partial class tblRABillCertified
    {
        [Key]
        public int TransId { get; set; }

        public int? RaBillTransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string RaBillCertifiedId { get; set; }

        public decimal? Receivable { get; set; }

        public decimal? AmountReceived { get; set; }

        [StringLength(50)]
        public string ChequeNoRTGS { get; set; }

        public DateTime? ChequeNoRTGSDate { get; set; }

        public decimal? NetReceivable { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CertifiedStatus { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public string Remarks { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }
    }
}

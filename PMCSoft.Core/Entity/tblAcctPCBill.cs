namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblAcctPCBill")]
    public partial class tblAcctPCBill
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

        [StringLength(50)]
        public string NatureOfWorkID { get; set; }

        public DateTime? RABillDate { get; set; }

        public string WorkOrderNo { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string ForwardToSITE { get; set; }

        [StringLength(50)]
        public string ForwardToPMC { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ApprovalStatus { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        [StringLength(50)]
        public string RegType { get; set; }

        [StringLength(50)]
        public string RABillType { get; set; }

        public decimal? RABillNo { get; set; }

        [StringLength(50)]
        public string BillReceive { get; set; }

        public int? ID { get; set; }
    }
}

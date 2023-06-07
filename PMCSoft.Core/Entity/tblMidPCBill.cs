namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMidPCBill")]
    public partial class tblMidPCBill
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
        public string RegType { get; set; }

        [StringLength(50)]
        public string NatureOfWorkID { get; set; }

        public string WorkOrderNo { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        [StringLength(50)]
        public string RABillType { get; set; }

        public decimal? RABillNo { get; set; }

        public DateTime? RABillDate { get; set; }

        [StringLength(50)]
        public string ApprovalStatus { get; set; }

        public string AccFile { get; set; }

        [StringLength(50)]
        public string PreparedBy { get; set; }

        [StringLength(50)]
        public string CheckedBy { get; set; }

        [StringLength(50)]
        public string Accountant { get; set; }

        [StringLength(50)]
        public string ApprovedForPaymentBy { get; set; }

        public string SignatureOfPC { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblIssuePDCRequest")]
    public partial class tblIssuePDCRequest
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string IssueID { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        [StringLength(50)]
        public string BankID { get; set; }

        [StringLength(50)]
        public string BranchID { get; set; }

        [StringLength(50)]
        public string ChequeNo { get; set; }

        public decimal? Amount { get; set; }

        public DateTime? IssueDate { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }
    }
}

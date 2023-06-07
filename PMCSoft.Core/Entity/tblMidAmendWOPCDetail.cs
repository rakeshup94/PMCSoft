namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMidAmendWOPCDetail")]
    public partial class tblMidAmendWOPCDetail
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        public string WONo { get; set; }

        public DateTime? WODate { get; set; }

        public string Subject { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ApprovalStatus { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        [StringLength(50)]
        public string FinYear { get; set; }

        public int? WONumber { get; set; }

        public DateTime? AffectiveDate { get; set; }

        public int? ID { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblApprovalLevelForWorkOrder")]
    public partial class tblApprovalLevelForWorkOrder
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string ApprovalLevel2 { get; set; }

        [StringLength(50)]
        public string ApprovalLevel3 { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        public DateTime? ModifiedDate { get; set; }
    }
}

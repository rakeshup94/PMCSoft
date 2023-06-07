namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblItemIssue")]
    public partial class tblItemIssue
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public string ItemIssueId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        public DateTime? IssueDate { get; set; }

        [StringLength(50)]
        public string IssueTower { get; set; }

        [StringLength(50)]
        public string ItemGroupID { get; set; }

        [StringLength(50)]
        public string ItemID { get; set; }

        [StringLength(50)]
        public string UnitID { get; set; }

        [StringLength(50)]
        public string Make { get; set; }

        [StringLength(50)]
        public string PartNo { get; set; }

        public decimal? AvailableQty { get; set; }

        public decimal? IssueQty { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}

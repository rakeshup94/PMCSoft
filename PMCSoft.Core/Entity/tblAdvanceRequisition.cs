namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblAdvanceRequisition")]
    public partial class tblAdvanceRequisition
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string ARId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string VendorId { get; set; }

        [StringLength(50)]
        public string TypeId { get; set; }

        public string VendorAddress { get; set; }

        [StringLength(50)]
        public string AnysecurityCreated { get; set; }

        [StringLength(50)]
        public string SecurityId { get; set; }

        public decimal? Amount { get; set; }

        [StringLength(50)]
        public string Reasion { get; set; }

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

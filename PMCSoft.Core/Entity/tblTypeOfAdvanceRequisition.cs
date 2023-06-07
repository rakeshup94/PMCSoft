namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblTypeOfAdvanceRequisition")]
    public partial class tblTypeOfAdvanceRequisition
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public string Type { get; set; }

        [StringLength(50)]
        public string TypeId { get; set; }

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

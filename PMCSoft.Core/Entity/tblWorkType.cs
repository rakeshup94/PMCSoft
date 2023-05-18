namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblWorkType")]
    public partial class tblWorkType
    {
        [Key]
        public int TrandId { get; set; }

        [StringLength(50)]
        public string WorkTypeCode { get; set; }

        [StringLength(500)]
        public string WorkTypeName { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }
    }
}

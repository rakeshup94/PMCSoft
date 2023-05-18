namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblBulkMaterialFixedDescriptionMaster")]
    public partial class tblBulkMaterialFixedDescriptionMaster
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(10)]
        public string SNo { get; set; }

        public string DescriptionName { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string Id { get; set; }
    }
}

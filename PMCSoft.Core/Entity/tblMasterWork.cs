namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMasterWork")]
    public partial class tblMasterWork
    {
        [Key]
        public int TransID { get; set; }

        public string Details { get; set; }

        [StringLength(10)]
        public string Status { get; set; }
    }
}

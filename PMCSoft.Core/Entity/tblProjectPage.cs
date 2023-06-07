namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblProjectPage")]
    public partial class tblProjectPage
    {
        [Key]
        public int TransId { get; set; }

        public string PageName { get; set; }

        public int? MenuHeaderId { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblWorkDoneMaster")]
    public partial class tblWorkDoneMaster
    {
        [Key]
        public int TransId { get; set; }

        public string WDName { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }
    }
}

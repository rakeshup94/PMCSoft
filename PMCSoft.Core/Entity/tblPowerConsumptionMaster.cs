namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPowerConsumptionMaster")]
    public partial class tblPowerConsumptionMaster
    {
        [Key]
        public int TransId { get; set; }

        public string Detail { get; set; }

        [StringLength(10)]
        public string Status { get; set; }
    }
}

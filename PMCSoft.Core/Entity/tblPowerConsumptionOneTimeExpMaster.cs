namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPowerConsumptionOneTimeExpMaster")]
    public partial class tblPowerConsumptionOneTimeExpMaster
    {
        [Key]
        public int TransId { get; set; }

        public string Detail { get; set; }

        public string ProjectId { get; set; }

        public string CompanyId { get; set; }

        [StringLength(50)]
        public string Createdby { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int? TransIdPCON { get; set; }
    }
}

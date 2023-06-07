namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblReconciliationStatementMaster")]
    public partial class tblReconciliationStatementMaster
    {
        [Key]
        public int Transid { get; set; }

        public string Recon_Desc { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        public string Formula { get; set; }
    }
}

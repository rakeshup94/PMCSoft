namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPaymentTermsMaster")]
    public partial class tblPaymentTermsMaster
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public string Particulars { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblDebtorPaymentType")]
    public partial class tblDebtorPaymentType
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string PaymentType { get; set; }
    }
}

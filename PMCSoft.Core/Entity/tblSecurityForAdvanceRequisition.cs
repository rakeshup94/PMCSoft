namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblSecurityForAdvanceRequisition")]
    public partial class tblSecurityForAdvanceRequisition
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string SecurityID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public string PaymentSecurity { get; set; }

        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }
    }
}

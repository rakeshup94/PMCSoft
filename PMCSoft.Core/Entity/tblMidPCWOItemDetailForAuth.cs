namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMidPCWOItemDetailForAuth")]
    public partial class tblMidPCWOItemDetailForAuth
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        public string Item { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? Quantity { get; set; }

        public decimal? Rate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? ID { get; set; }

        public int? AppID { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMidWORemarkForPIC")]
    public partial class tblMidWORemarkForPIC
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        public string WONo { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        public int? ID { get; set; }

        public int? AppID { get; set; }

        [StringLength(50)]
        public string AppFrom { get; set; }

        [StringLength(50)]
        public string AppTo { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string Reamarks { get; set; }
    }
}

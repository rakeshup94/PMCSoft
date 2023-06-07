namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblUnitMaster")]
    public partial class tblUnitMaster
    {
        [Key]
        public int TransID { get; set; }

        public string UnitName { get; set; }

        [StringLength(50)]
        public string UnitCode { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string UnitID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }
    }
}

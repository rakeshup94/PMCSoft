namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblStockMaterialMasterByClient")]
    public partial class tblStockMaterialMasterByClient
    {
        [Key]
        public int TransID { get; set; }

        public string Detail { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }
    }
}

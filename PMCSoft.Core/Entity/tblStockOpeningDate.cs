namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblStockOpeningDate")]
    public partial class tblStockOpeningDate
    {
        [Key]
        public int TransId { get; set; }

        public DateTime? StoreOpeningDate { get; set; }

        public string ProjectId { get; set; }

        public string CompanyId { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

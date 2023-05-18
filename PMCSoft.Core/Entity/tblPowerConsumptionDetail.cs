namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPowerConsumptionDetail")]
    public partial class tblPowerConsumptionDetail
    {
        [Key]
        public int TransId { get; set; }

        public string ProjectId { get; set; }

        public string ComapnyId { get; set; }

        public int? PMonth { get; set; }

        public int? PYear { get; set; }

        public DateTime? PStartDate { get; set; }

        public DateTime? PEndDate { get; set; }

        public string PCId { get; set; }

        public string Detail { get; set; }

        public decimal? Amt { get; set; }

        public string Remarks { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyWorkDonePlanMaster")]
    public partial class tblMonthlyWorkDonePlanMaster
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public int? WDMParticularId { get; set; }

        [StringLength(50)]
        public string WDMParticularName { get; set; }

        public decimal? Unit { get; set; }

        public decimal? Rate { get; set; }

        public decimal? AwardedValue { get; set; }

        public decimal? PlanQty { get; set; }

        public decimal? PlanAmt { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

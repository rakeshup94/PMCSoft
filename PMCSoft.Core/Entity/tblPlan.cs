namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPlan")]
    public partial class tblPlan
    {
        [Key]
        public int Tranid { get; set; }

        public string ParticularsId { get; set; }

        public string CompanyId { get; set; }

        public string ProjectId { get; set; }

        public string PlanMonth { get; set; }

        public string PlanYear { get; set; }

        public DateTime? PlanDate { get; set; }

        public string ParticularsName { get; set; }

        public decimal? PlanValue { get; set; }

        public decimal? SumPlanValue { get; set; }

        public decimal? PlanParcentageValue { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? Createddate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}

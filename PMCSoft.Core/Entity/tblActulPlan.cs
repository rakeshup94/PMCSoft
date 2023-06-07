namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblActulPlan")]
    public partial class tblActulPlan
    {
        [Key]
        public int TransId { get; set; }

        public string ProjectId { get; set; }

        public string CompanyId { get; set; }

        public DateTime? ActulPlanDate { get; set; }

        public string ActualPlanMonth { get; set; }

        public string ActualPlanYear { get; set; }

        public string ParticularsId { get; set; }

        public string ParticularsName { get; set; }

        public decimal? PlanValue { get; set; }

        public decimal? PlanParcentage { get; set; }

        public decimal? ActualValue { get; set; }

        public decimal? ActualParcentage { get; set; }

        public decimal? Variance { get; set; }

        public decimal? VarianceParcentage { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

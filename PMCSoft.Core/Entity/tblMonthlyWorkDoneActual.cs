namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyWorkDoneActual")]
    public partial class tblMonthlyWorkDoneActual
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public string PlanMonth { get; set; }

        public string PlanYear { get; set; }

        public int? WDMParticularId { get; set; }

        [StringLength(50)]
        public string WDMParticularName { get; set; }

        public int? WDDMParticularId { get; set; }

        [StringLength(50)]
        public string WDDMParticularName { get; set; }

        public int? WDSubDID { get; set; }

        [StringLength(50)]
        public string WDSubParticularsName { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? Rate { get; set; }

        public decimal? AwardedValue { get; set; }

        public decimal? PlanQty { get; set; }

        public decimal? PlanAmt { get; set; }

        public decimal? ActualQty { get; set; }

        public decimal? ActualAmt { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? MonthStartDate { get; set; }
    }
}

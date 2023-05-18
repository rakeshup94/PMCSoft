namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyLabourMonthAndUpToDateMaster")]
    public partial class tblMonthlyLabourMonthAndUpToDateMaster
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string RABILLId { get; set; }

        [StringLength(50)]
        public string MUMonth { get; set; }

        [StringLength(50)]
        public string MUYear { get; set; }

        public string MonthlyLaberId { get; set; }

        public decimal? MonthValueA { get; set; }

        public decimal? UpToDateValueA { get; set; }

        public decimal? MonthValueB { get; set; }

        public decimal? UpToDateValueB { get; set; }

        public decimal? MonthValueC { get; set; }

        public decimal? UpToDateValueC { get; set; }

        public decimal? MonthValueD { get; set; }

        public decimal? UpToDateValueD { get; set; }

        public decimal? MonthValueE { get; set; }

        public decimal? UpToDateValueE { get; set; }

        public decimal? MonthValueF { get; set; }

        public decimal? UpToDateValueF { get; set; }

        public decimal? MonthValueG { get; set; }

        public decimal? UpToDateValueG { get; set; }

        public decimal? MonthValueH { get; set; }

        public decimal? UpToDateValueH { get; set; }

        public decimal? MonthValueI { get; set; }

        public decimal? UpToDateValueI { get; set; }

        public decimal? MonthValueJ { get; set; }

        public decimal? UpToDateValueJ { get; set; }

        public decimal? MonthValueK { get; set; }

        public decimal? UpToDateValueK { get; set; }

        public decimal? MonthValueL { get; set; }

        public decimal? UpToDateValueL { get; set; }

        public decimal? MonthValuePer { get; set; }

        public decimal? UpToDateValuePer { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

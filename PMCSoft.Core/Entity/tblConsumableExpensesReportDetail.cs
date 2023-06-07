namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblConsumableExpensesReportDetail")]
    public partial class tblConsumableExpensesReportDetail
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public int? CMonth { get; set; }

        public int? CYear { get; set; }

        public DateTime? CDate { get; set; }

        public string ConExpId { get; set; }

        public string ItemName { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? Qty { get; set; }

        public decimal? Amt { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }
    }
}

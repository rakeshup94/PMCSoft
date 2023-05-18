namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMonthlyDirectExpenses")]
    public partial class tblMonthlyDirectExpens
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string TrackerID { get; set; }

        [StringLength(50)]
        public string ParticularID { get; set; }

        public string Particular { get; set; }

        public decimal? PPlan { get; set; }

        public decimal? PPlan1 { get; set; }

        public decimal? PActual { get; set; }

        public decimal? PActual1 { get; set; }

        public decimal? PVariance { get; set; }

        public decimal? PVariance1 { get; set; }

        public decimal? CPlan { get; set; }

        public decimal? CPlan1 { get; set; }

        public decimal? CActual { get; set; }

        public decimal? CActual1 { get; set; }

        public decimal? CVariance { get; set; }

        public decimal? CVariance1 { get; set; }

        public decimal? NPlan { get; set; }

        public decimal? NPlan1 { get; set; }

        [StringLength(50)]
        public string Month { get; set; }

        [StringLength(50)]
        public string Year { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

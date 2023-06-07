namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblEquipmentExpenses")]
    public partial class tblEquipmentExpens
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string ExpID { get; set; }

        public DateTime? ExpDate { get; set; }

        public string EquipmentDetail { get; set; }

        public DateTime? PMDate { get; set; }

        public decimal? PMRepairs { get; set; }

        public decimal? PMFuel { get; set; }

        public DateTime? CMDate { get; set; }

        public decimal? CMRepairs { get; set; }

        public decimal? CMFuel { get; set; }

        public DateTime? UTDate { get; set; }

        public decimal? UTRepairs { get; set; }

        public decimal? UTFuel { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblDailyWorkProgramme")]
    public partial class tblDailyWorkProgramme
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string WPID { get; set; }

        public DateTime? WPDate { get; set; }

        public string EngInCharge { get; set; }

        public string Block { get; set; }

        [StringLength(50)]
        public string ItemID { get; set; }

        public string ItemOfWork { get; set; }

        public string Area { get; set; }

        public int? LabourSK { get; set; }

        public int? LabourSEMI { get; set; }

        public int? LabourUNSK { get; set; }

        public int? LabourOT { get; set; }

        public string Supervisor { get; set; }

        public string Foreman { get; set; }

        public string Engineer { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string WPNumber { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        [StringLength(50)]
        public string WPStatus { get; set; }

        public string Remark { get; set; }

        [StringLength(50)]
        public string Productive { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblLabourMaster")]
    public partial class tblLabourMaster
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public string LabourName { get; set; }

        [StringLength(50)]
        public string LabourNumber { get; set; }

        [StringLength(50)]
        public string LabourType { get; set; }

        [StringLength(10)]
        public string LabourStatus { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

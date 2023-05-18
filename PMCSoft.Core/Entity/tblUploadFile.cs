namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblUploadFile")]
    public partial class tblUploadFile
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string UploadID { get; set; }

        public string FileName { get; set; }

        public string FileNameSys { get; set; }

        public decimal? FileSize { get; set; }

        [StringLength(50)]
        public string FileStatus { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        public int? ID { get; set; }
    }
}

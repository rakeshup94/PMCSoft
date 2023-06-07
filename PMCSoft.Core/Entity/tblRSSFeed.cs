namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblRSSFeed
    {
        [Key]
        public int TransID { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string FileName { get; set; }

        public string FileNameOriginal { get; set; }

        public decimal? FileSize { get; set; }

        public string CircularNo { get; set; }

        [StringLength(50)]
        public string DeptID { get; set; }

        [StringLength(50)]
        public string DesgID { get; set; }
    }
}

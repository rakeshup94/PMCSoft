namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblPCBillFileUpload")]
    public partial class tblPCBillFileUpload
    {
        [Key]
        public int TransId { get; set; }

        public string FileName { get; set; }

        public string FilePath { get; set; }

        [StringLength(50)]
        public string FileType { get; set; }

        [StringLength(50)]
        public string FileSize { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string BillID { get; set; }

        [StringLength(50)]
        public string PCID { get; set; }

        [StringLength(100)]
        public string WorkOrderNo { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string FileNameSystem { get; set; }
    }
}

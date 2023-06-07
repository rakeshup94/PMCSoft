namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblPCRemark
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string BillID { get; set; }

        [StringLength(50)]
        public string PCID { get; set; }

        public string WorkOrderNo { get; set; }

        [StringLength(50)]
        public string RemarkFrom { get; set; }

        [StringLength(50)]
        public string RemarkTo { get; set; }

        public string Remarks { get; set; }

        [StringLength(50)]
        public string ForwardTo { get; set; }

        public decimal? ValueOfWorkDone { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string WOID { get; set; }
    }
}

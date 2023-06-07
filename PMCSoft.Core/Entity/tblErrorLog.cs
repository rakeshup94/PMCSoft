namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblErrorLog")]
    public partial class tblErrorLog
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string EmpID { get; set; }

        public string ErrorLog { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

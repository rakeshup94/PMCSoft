namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblGeneralStaffAttendance")]
    public partial class tblGeneralStaffAttendance
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string EmpID { get; set; }

        [StringLength(50)]
        public string OfficialEMPID { get; set; }

        public string EmpName { get; set; }

        [StringLength(50)]
        public string DeptID { get; set; }

        [StringLength(50)]
        public string DesgID { get; set; }

        public string MobileNo { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string AttnID { get; set; }

        [StringLength(50)]
        public string EmpType { get; set; }
    }
}

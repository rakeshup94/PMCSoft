namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblGeneralStaffMaster")]
    public partial class tblGeneralStaffMaster
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string ProjectID { get; set; }

        [StringLength(50)]
        public string EmpID { get; set; }

        public string FName { get; set; }

        public string LName { get; set; }

        public string MobileNo { get; set; }

        public DateTime? DateOfBirth { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string DeptID { get; set; }

        [StringLength(50)]
        public string DesgID { get; set; }

        public DateTime? DOJ { get; set; }

        [StringLength(50)]
        public string OfficialEmpID { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string EmployeeType { get; set; }
    }
}

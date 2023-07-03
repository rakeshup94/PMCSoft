namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblEmployeeMaster")]
    public partial class tblEmployeeMaster
    {
        [Key]
        public int TransID { get; set; }

        public long? UserId { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public string ProjectID { get; set; }

        [StringLength(50)]
        public string EmpID { get; set; }

        public string FName { get; set; }

        public string LName { get; set; }

        public string Address { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        public string ZipCode { get; set; }

        public string MobileNo { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(50)]
        public string AccountType { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string AltEmail { get; set; }

        [StringLength(50)]
        public string ReportingTo { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

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
        public string EmpType { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblLogInformation")]
    public partial class tblLogInformation
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        [StringLength(50)]
        public string UserId { get; set; }

        public DateTime? LogInTime { get; set; }

        public DateTime? LogOutTime { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? LogActivity { get; set; }
    }
}

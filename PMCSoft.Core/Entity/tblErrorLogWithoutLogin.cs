namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblErrorLogWithoutLogin")]
    public partial class tblErrorLogWithoutLogin
    {
        [Key]
        public int TransID { get; set; }

        public string ErrorLog { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblAccountType")]
    public partial class tblAccountType
    {
        [Key]
        public int TransID { get; set; }

        public int? ID { get; set; }

        [StringLength(50)]
        public string AccountType { get; set; }
    }
}

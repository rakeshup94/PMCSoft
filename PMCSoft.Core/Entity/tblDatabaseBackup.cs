namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblDatabaseBackup")]
    public partial class tblDatabaseBackup
    {
        [Key]
        public int BackupId { get; set; }

        [StringLength(150)]
        public string DatabaseName { get; set; }

        [StringLength(250)]
        public string BackupPath { get; set; }

        public DateTime? CreatedOn { get; set; }

        public int? CreatedBy { get; set; }
    }
}

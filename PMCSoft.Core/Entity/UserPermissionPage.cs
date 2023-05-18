namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserPermissionPage")]
    public partial class UserPermissionPage
    {
        [Key]
        public int TransId { get; set; }

        public int? PageTransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string UserId { get; set; }

        [StringLength(50)]
        public string Pagevalue { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblRole")]
    public partial class tblRole
    {
        [Key]
        public int RoleId { get; set; }

        [Required]
        [StringLength(150)]
        public string RoleName { get; set; }

        public bool IsPublished { get; set; }

        public long CreatedBy { get; set; }

        public DateTime CreatedOn { get; set; }
    }
}

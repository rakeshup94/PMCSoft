namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMenuHeader")]
    public partial class tblMenuHeader
    {
        [Key]
        public int TransId { get; set; }

        public string MenuHeaderName { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }


    [Table("tblRoleMenu")]
    public partial class tblRoleMenu
    {
        [Key]
        public int MenuId { get; set; }
        [Key]
        public int RoleId { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }








}

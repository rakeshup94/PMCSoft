namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMenuX")]
    public partial class tblMenuX
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MenuId { get; set; }

        public int? ParentId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string MenuName { get; set; }

        [StringLength(500)]
        public string NavigateURL { get; set; }
    }
}

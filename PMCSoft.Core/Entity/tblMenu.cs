namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMenu")]
    public partial class tblMenu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblMenu()
        {
            tblMenu1 = new HashSet<tblMenu>();
        }

        [Key]
        public int MenuId { get; set; }

        public int? ParentId { get; set; }

        [StringLength(50)]
        public string MenuIcon { get; set; }

        [Required]
        [StringLength(100)]
        public string MenuName { get; set; }

        [StringLength(500)]
        public string MenuDesc { get; set; }

        public float? MenuOrderNo { get; set; }
        public bool IsAction { get; set; }

        [StringLength(500)]
        public string NavigateURL { get; set; }
        public byte MenuStatus { get; set; }
        public int Culture { get; set; }
        public bool IsPublished { get; set; }

        public long CreatedBy { get; set; }

        public DateTime CreatedOn { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblMenu> tblMenu1 { get; set; }

        public virtual tblMenu tblMenu2 { get; set; }
    }
}

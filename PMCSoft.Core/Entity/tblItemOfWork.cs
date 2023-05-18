namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblItemOfWork")]
    public partial class tblItemOfWork
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblItemOfWork()
        {
            tblItemOfWork1 = new HashSet<tblItemOfWork>();
        }

        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string ItemID { get; set; }

        public string ItemOfWork { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public int? CategoryId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblItemOfWork> tblItemOfWork1 { get; set; }

        public virtual tblItemOfWork tblItemOfWork2 { get; set; }
    }
}

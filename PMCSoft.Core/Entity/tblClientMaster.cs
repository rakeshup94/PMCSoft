namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblClientMaster")]
    public partial class tblClientMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblClientMaster()
        {
            tblCompanyMasters = new HashSet<tblCompanyMaster>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ClientId { get; set; }

        public long UserId { get; set; }

        [StringLength(10)]
        public string Initial { get; set; }

        [StringLength(50)]
        public string Logo { get; set; }

        [StringLength(200)]
        public string Note { get; set; }

        [StringLength(50)]
        public string Currency { get; set; }

        [StringLength(50)]
        public string PanNo { get; set; }

        [StringLength(50)]
        public string TanNo { get; set; }

        [StringLength(50)]
        public string GSTNo { get; set; }

        [StringLength(50)]
        public string PhoneNo { get; set; }

        [StringLength(50)]
        public string FaxNo { get; set; }

        [StringLength(50)]
        public string TimeZone { get; set; }

        [StringLength(50)]
        public string Culture { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        public string Logitude { get; set; }

        [StringLength(50)]
        public string Latitude { get; set; }

        [StringLength(200)]
        public string WebAddress { get; set; }

        public bool IsPublished { get; set; }

        public long CreatedBy { get; set; }

        public DateTime CreatedOn { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCompanyMaster> tblCompanyMasters { get; set; }
    }
}

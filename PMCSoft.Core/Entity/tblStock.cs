namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblStock")]
    public partial class tblStock
    {
        [Key]
        [Column(Order = 0)]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string Vendor_ID { get; set; }

        [StringLength(50)]
        public string ItemGroupID { get; set; }

        [StringLength(50)]
        public string ItemID { get; set; }

        [StringLength(50)]
        public string UnitID { get; set; }

        public decimal? Item_Quantity { get; set; }

        public decimal? Update_Quantity { get; set; }

        public decimal? Issue_Quantity { get; set; }

        public decimal? Total_Quantity { get; set; }

        public decimal? Item_Rate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblMaterialReceive")]
    public partial class tblMaterialReceive
    {
        [Key]
        [Column(Order = 0)]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string MaterialReceiveId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string Gate_Entry_No { get; set; }

        [StringLength(50)]
        public string PO_No { get; set; }

        public DateTime? PO_Date { get; set; }

        public DateTime? Received_Date { get; set; }

        public string Received_By { get; set; }

        [StringLength(50)]
        public string Vendor_ID { get; set; }

        [StringLength(50)]
        public string Bill_Challan_No { get; set; }

        public DateTime? Bill_Challan_Date { get; set; }

        [StringLength(50)]
        public string ItemGroupID { get; set; }

        [StringLength(50)]
        public string ItemID { get; set; }

        [StringLength(50)]
        public string UnitID { get; set; }

        public decimal? Item_Quantity { get; set; }

        public decimal? Item_Rate { get; set; }

        public string Item_Remarks { get; set; }

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

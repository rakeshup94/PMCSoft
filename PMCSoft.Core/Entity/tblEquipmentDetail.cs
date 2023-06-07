namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblEquipmentDetail")]
    public partial class tblEquipmentDetail
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public double? RepairCost { get; set; }

        public double? FuelCost { get; set; }

        [StringLength(50)]
        public string EquipmentNumber { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ExpenseDate { get; set; }
    }
}

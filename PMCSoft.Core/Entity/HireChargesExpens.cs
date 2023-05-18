namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HireChargesExpenses")]
    public partial class HireChargesExpens
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string HireChargesId { get; set; }

        public DateTime? HireChargesDate { get; set; }

        public string Description { get; set; }

        public string Model { get; set; }

        public string VendorId { get; set; }

        public string DateOfInstallation { get; set; }

        public decimal? Qty { get; set; }

        public decimal? Amount { get; set; }

        public string PurposeOfWork { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string HireChargeMonth { get; set; }

        [StringLength(50)]
        public string HireChargeYear { get; set; }
    }
}

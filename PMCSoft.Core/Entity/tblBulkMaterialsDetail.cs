namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblBulkMaterialsDetail
    {
        [Key]
        public int TransId { get; set; }

        [StringLength(50)]
        public string ProjectId { get; set; }

        [StringLength(50)]
        public string CompanyId { get; set; }

        public DateTime? MonthStartDate { get; set; }

        [StringLength(50)]
        public string RabillId { get; set; }

        [StringLength(50)]
        public string RaBillNo { get; set; }

        [StringLength(50)]
        public string DescriptionId { get; set; }

        public int? MasterTransId { get; set; }

        public string Description { get; set; }

        [StringLength(50)]
        public string Unit { get; set; }

        public decimal? QtyExecuted { get; set; }

        public decimal? CementCoff { get; set; }

        public decimal? CementT { get; set; }

        public decimal? Agg10Coff { get; set; }

        public decimal? Agg10Total { get; set; }

        public decimal? Agg20Coff { get; set; }

        public decimal? Agg20Total { get; set; }

        public decimal? CoarseSandCoff { get; set; }

        public decimal? CoarseSandTotal { get; set; }

        public decimal? FineSandCoff { get; set; }

        public decimal? FineSandTotal { get; set; }

        public decimal? BricksCoff { get; set; }

        public decimal? Bricksotal { get; set; }

        public decimal? BindingWireCoff { get; set; }

        public decimal? BindingWireTotal { get; set; }

        public decimal? FlyCoff { get; set; }

        public decimal? FlyTotal { get; set; }

        public decimal? PlasticiserCoff { get; set; }

        public decimal? PlasticiserTotal { get; set; }

        public decimal? Other1Coff { get; set; }

        public decimal? Other1Total { get; set; }

        public decimal? Other2Coff { get; set; }

        public decimal? Other2Total { get; set; }

        public decimal? Other3Coff { get; set; }

        public decimal? Other3Total { get; set; }

        public decimal? Other4Coff { get; set; }

        public decimal? Other4Total { get; set; }

        public decimal? Other5Coff { get; set; }

        public decimal? Other5Total { get; set; }

        public string Remarks { get; set; }

        public DateTime? ReceivedAsOnDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(10)]
        public string Status { get; set; }
    }
}

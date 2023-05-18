namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblVendorMaster")]
    public partial class tblVendorMaster
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        public string PRJID { get; set; }

        [StringLength(50)]
        public string VendorID { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        public string MobileNo { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public string VendorType { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string VendorTypeCode { get; set; }

        [StringLength(50)]
        public string PanNo { get; set; }

        [StringLength(50)]
        public string TinNo { get; set; }

        [StringLength(50)]
        public string EccNo { get; set; }

        public string Vat { get; set; }

        [StringLength(50)]
        public string RegistrationType { get; set; }

        [StringLength(50)]
        public string PinCode { get; set; }

        [StringLength(50)]
        public string SalesTaxNo { get; set; }

        [StringLength(50)]
        public string CSTNo { get; set; }

        [StringLength(50)]
        public string ServiceTaxNo { get; set; }

        public string PhoneNo { get; set; }

        [StringLength(50)]
        public string BlackListStatus { get; set; }

        [StringLength(200)]
        public string PFNo { get; set; }

        [StringLength(200)]
        public string ESINo { get; set; }

        [StringLength(50)]
        public string AadharNo { get; set; }

        public string ContactPerson { get; set; }

        public string ContactNo { get; set; }

        public decimal? ServiceTaxValue { get; set; }

        [StringLength(50)]
        public string GSTNo { get; set; }

        public DateTime? GSTEffectiveDate { get; set; }

        public string WorkTypeCode { get; set; }
    }
}

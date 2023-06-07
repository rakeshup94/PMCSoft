namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblProjectParticularsDetailA")]
    public partial class tblProjectParticularsDetailA
    {
        [Key]
        public int TransID { get; set; }

        [StringLength(50)]
        public string CompanyID { get; set; }

        [StringLength(50)]
        public string PRJID { get; set; }

        public string NameOfProject { get; set; }

        public string ProjectClause { get; set; }

        public string ProjectAmendments { get; set; }

        public string Location { get; set; }

        public string LocationClause { get; set; }

        public string LocationAmendments { get; set; }

        public DateTime? DateOfAward { get; set; }

        public string AwardClause { get; set; }

        public string AwardAmendments { get; set; }

        public string LOINo { get; set; }

        public string LOINoClause { get; set; }

        public string LOINoAmendments { get; set; }

        public DateTime? LOIDate { get; set; }

        public string LOIDateClause { get; set; }

        public string LOIDateAmendments { get; set; }

        public string NameOfRegion { get; set; }

        public string RegionClause { get; set; }

        public string RegionAmendments { get; set; }

        public string ProjectInchargeName { get; set; }

        [StringLength(50)]
        public string ProjectInchargeMobileNo { get; set; }

        public string InchargeClause { get; set; }

        public string InchargeAmendments { get; set; }

        public string ClientName { get; set; }

        public string ClientAddress { get; set; }

        [StringLength(50)]
        public string ClientMobileNo { get; set; }

        public string ClientClause { get; set; }

        public string ClientAmendments { get; set; }

        public string ProjectManagerName { get; set; }

        public string ProjectManagerAddress { get; set; }

        [StringLength(50)]
        public string ProjectManagerMobileNo { get; set; }

        public string ProjectManagerClause { get; set; }

        public string ProjectManagerAmendments { get; set; }

        public string ArchitectName { get; set; }

        public string ArchitectAddress { get; set; }

        [StringLength(50)]
        public string ArchitectMobileNo { get; set; }

        public string ArchitectClause { get; set; }

        public string ArchitectAmendments { get; set; }

        public string StructuralConsultantName { get; set; }

        public string StructuralConsultantAddress { get; set; }

        [StringLength(50)]
        public string StructuralConsultantMobileNo { get; set; }

        public string StructuralClause { get; set; }

        public string StructuralAmendments { get; set; }

        public string MechanicalName { get; set; }

        public string MechanicalAddress { get; set; }

        [StringLength(50)]
        public string MechanicalMobileNo { get; set; }

        public string MechanicalClause { get; set; }

        public string MechanicalAmendments { get; set; }

        public string ElectricalName { get; set; }

        public string ElectricalAddress { get; set; }

        [StringLength(50)]
        public string ElectricalMobileNo { get; set; }

        public string ElectricalClause { get; set; }

        public string ElectricalAmendments { get; set; }

        public string PlumbingName { get; set; }

        public string PlumbingAddress { get; set; }

        [StringLength(50)]
        public string PlumbingMobileNo { get; set; }

        public string PlumbingClause { get; set; }

        public string PlumbingAmendments { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ClientCountry { get; set; }

        [StringLength(50)]
        public string ClientState { get; set; }

        [StringLength(50)]
        public string ClientCity { get; set; }

        [StringLength(50)]
        public string ProjectManagerCountry { get; set; }

        [StringLength(50)]
        public string ProjectManagerState { get; set; }

        [StringLength(50)]
        public string ProjectManagerCity { get; set; }

        [StringLength(50)]
        public string ArchitectCountry { get; set; }

        [StringLength(50)]
        public string ArchitectState { get; set; }

        [StringLength(50)]
        public string ArchitectCity { get; set; }

        [StringLength(50)]
        public string StructuralCountry { get; set; }

        [StringLength(50)]
        public string StructuralState { get; set; }

        [StringLength(50)]
        public string StructuralCity { get; set; }

        [StringLength(50)]
        public string MechanicalCountry { get; set; }

        [StringLength(50)]
        public string MechanicalState { get; set; }

        [StringLength(50)]
        public string MechanicalCity { get; set; }

        [StringLength(50)]
        public string ElectricalCountry { get; set; }

        [StringLength(50)]
        public string ElectricalState { get; set; }

        [StringLength(50)]
        public string ElectricalCity { get; set; }

        [StringLength(50)]
        public string PlumbingCountry { get; set; }

        [StringLength(50)]
        public string PlumbingState { get; set; }

        [StringLength(50)]
        public string PlumbingCity { get; set; }

        public DateTime? StipulatedDateOfStart { get; set; }

        public DateTime? ActualDateOfStart { get; set; }

        public DateTime? StipulatedDateOfFinish { get; set; }

        public string StipulatedDateStartClause { get; set; }

        public string StipulatedDateStartAmendments { get; set; }

        public string ActualDateStartClause { get; set; }

        public string ActualDateStartAmendments { get; set; }

        [StringLength(50)]
        public string StipulatedDateFinishClause { get; set; }

        public string StipulatedDateFinishAmendments { get; set; }

        [StringLength(6)]
        public string ClientZipCode { get; set; }

        [StringLength(6)]
        public string ProjectManagerZipCode { get; set; }

        [StringLength(6)]
        public string ArchitectZipCode { get; set; }

        [StringLength(6)]
        public string StructuralZipCode { get; set; }

        [StringLength(6)]
        public string MechanicalZipCode { get; set; }

        [StringLength(6)]
        public string ElectricalZipCode { get; set; }

        [StringLength(6)]
        public string PlumbingZipCode { get; set; }

        [StringLength(50)]
        public string ClientPhoneNo { get; set; }

        [StringLength(50)]
        public string ProjectManagerPhoneNo { get; set; }

        [StringLength(50)]
        public string ArchitectPhoneNo { get; set; }

        [StringLength(50)]
        public string StructuralPhoneNo { get; set; }

        [StringLength(50)]
        public string MechanicalPhoneNo { get; set; }

        [StringLength(50)]
        public string ElectricalPhoneNo { get; set; }

        [StringLength(50)]
        public string PlumbingPhoneNo { get; set; }

        public decimal? OriginalContractValue { get; set; }

        [StringLength(300)]
        public string OCVWord { get; set; }

        public string OCVClause { get; set; }

        public string OCVAmendments { get; set; }

        public decimal? RevisedContractValue { get; set; }

        [StringLength(300)]
        public string RCVWord { get; set; }

        public string RCVClause { get; set; }

        public string RCVAmendments { get; set; }

        public decimal? ExpectedContractValue { get; set; }

        [StringLength(300)]
        public string ECVWord { get; set; }

        public string ECVClause { get; set; }

        public string ECVAmendments { get; set; }

        [StringLength(50)]
        public string ClientEmail { get; set; }

        [StringLength(50)]
        public string ClientFax { get; set; }

        [StringLength(50)]
        public string ProjectManagerEmail { get; set; }

        [StringLength(50)]
        public string ProjectManagerFax { get; set; }

        [StringLength(50)]
        public string ArchitectEmail { get; set; }

        [StringLength(50)]
        public string ArchitectFax { get; set; }

        [StringLength(50)]
        public string StructuralEmail { get; set; }

        [StringLength(50)]
        public string StructuralFax { get; set; }

        [StringLength(50)]
        public string MechanicalEmail { get; set; }

        [StringLength(50)]
        public string MechanicalFax { get; set; }

        [StringLength(50)]
        public string ElectricalEmail { get; set; }

        [StringLength(50)]
        public string ElectricalFax { get; set; }

        [StringLength(50)]
        public string PlumbingEmail { get; set; }

        [StringLength(50)]
        public string PlumbingFax { get; set; }
    }
}

namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblState
    {
        [Key]
        [StringLength(50)]
        public string StateID { get; set; }

        [StringLength(50)]
        public string CountryID { get; set; }

        [StringLength(150)]
        public string StateName { get; set; }

        public bool? stStatus { get; set; }
    }
}

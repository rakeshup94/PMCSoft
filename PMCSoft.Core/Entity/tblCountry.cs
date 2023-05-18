namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblCountry
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string CountryID { get; set; }

        [StringLength(150)]
        public string CnName { get; set; }

        [Key]
        [Column(Order = 1)]
        public bool CnStatus { get; set; }
    }
}

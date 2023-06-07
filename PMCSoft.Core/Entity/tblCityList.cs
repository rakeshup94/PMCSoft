namespace PMCSoft.Core.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblCityList")]
    public partial class tblCityList
    {
        [Key]
        [StringLength(50)]
        public string CityID { get; set; }

        [StringLength(50)]
        public string StateID { get; set; }

        [StringLength(150)]
        public string CityName { get; set; }

        public bool? ctStatus { get; set; }
    }
}

using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace PMCSoft.Core.Models.Navigation
{
    public class NavModel : AuditableEntity
    {
        [Display(Name = "S.No.")]
        public int MenuId { get; set; }
        [Display(Name = "Root")]
        public int? ParentId { get; set; }

        [Display(Name = "Name")]
        public string MenuName { get; set; }
        [Display(Name = "Icon")]
        public string MenuIcon { get; set; }
        [Display(Name = "URL")]
        public string NavigateURL { get; set; }
        public string Description { get; set; }
        [Display(Name = "Order No.")]
        public double OrderNo { get; set; }
        public bool IsAction { get; set; }
        public IEnumerable<SelectedList> MenuList { get; set; }
        public virtual ICollection<NavModel> SubMenu { get; set; }


    }





}

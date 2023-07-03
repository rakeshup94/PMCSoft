using System.Collections.Generic;


namespace PMCSoft.Core.Models.Navigation
{
    public class NavModel : AuditableEntity
    {
        public int MenuId { get; set; }
        public int? ParentId { get; set; }
        public string MenuName { get; set; }
        public string MenuIcon { get; set; }
        public string NavigateURL { get; set; }
        public string Description { get; set; }
        public double OrderNo { get; set; }
        public bool IsAction { get; set; }
        public IEnumerable<SelectedList> MenuList { get; set; }
        public virtual ICollection<NavModel> SubMenu { get; set; }


    }
}

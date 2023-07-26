using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Models.Account
{

    public class RoleModel : AuditableEntity
    {
        public int RoleId { get; set; }
        public string RoleName { get; set; }

        public virtual ICollection<NavModel> SubMenu { get; set; }

    }



    public class RoleMenuModel : AuditableEntity
    {
        public int RoleId { get; set; }


        public IList<string> SelectedRights { get; set; }
        public IEnumerable<SelectedList> RoleList { get; set; }
        public virtual IEnumerable<RoleMenu> NavList { get; set; }

    }

    public class RoleMenu
    {
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        public string MenuIcon { get; set; }
        public bool IsChecked { get; set; }
    }



}

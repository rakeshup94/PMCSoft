
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Repository
{
    public interface INavigationRepository : IGenericRepository<tblMenu>
    {

        IEnumerable<NavModel> GetAllMenu();
        IEnumerable<NavModel> GetMenu(bool IsPublished);
        IEnumerable<NavModel> GetMenuList(bool IsPublished);
        IEnumerable<NavModel> GetAccessibleMenu(bool IsAction, bool IsPublished);
        IEnumerable<NavModel> GetUserMenu(long UserId, bool IsPublished);
        IEnumerable<NavModel> GetRoleMenu(int RoleId, bool IsPublished);
        NavModel GetMenuItem(int MenuId);
        IEnumerable<SelectedList> GetNavSelectList(bool IsPublished);

    }
}

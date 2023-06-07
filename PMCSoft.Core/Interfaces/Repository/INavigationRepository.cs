using PMCSoft.Core.Entity;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Repository
{

    public interface INavigationRepository : IGenericRepository<tblMenuHeader>
    {
        IEnumerable<MenuModel> GetMenus(string _userId, string _projectId);
        List<MenuModel> LoadMenus(IEnumerable<MenuModel> menus, int ParentId);


    }
}

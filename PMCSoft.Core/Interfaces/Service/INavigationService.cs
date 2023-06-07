using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Service
{
    public interface INavigationService
    {
        List<MenuModel> GetMenus(string _userId, string _projectId);
    }
}

using PMCSoft.Core.Models.Navigation;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PMCSoft.Core.Models.Account;

namespace PMCSoft.Core.Interfaces.Service
{
    public interface IUserService
    {
        int SaveRole(RoleModel model);
        IEnumerable<RoleModel> GetAllRole();
        IEnumerable<RoleModel> GetRole(bool IsPublished);

        RoleModel GetRoleById(int roleId);
    }



}

using PMCSoft.Core.Entity;
using PMCSoft.Core.Models.Account;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Repository
{
    public interface IUserRepository : IGenericRepository<tblUser>
    {

        IEnumerable<RoleModel> GetAllRole();
        IEnumerable<RoleModel> GetRole(bool IsPublished);
    }
}

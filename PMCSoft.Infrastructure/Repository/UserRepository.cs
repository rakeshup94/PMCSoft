


using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Threading.Tasks;

namespace PMCSoft.Infrastructure.Repository
{
    public class UserRepository : GenericRepository<tblUser>, IUserRepository
    {
        public UserRepository(IDataContext context)
          : base(context)
        {
        }
        public PMCSoftContext Context
        {
            get { return base.entities as PMCSoftContext; }
        }

        public IEnumerable<RoleModel> GetAllRole()
        {
            var data = (from role in Context.tblRoles
                        select new RoleModel
                        {
                            RoleId = role.RoleId,
                            RoleName = role.RoleName,
                        }).OrderBy(x => x.RoleId).ToList();
            return data;

        }
        public IEnumerable<RoleModel> GetRole(bool IsPublished)
        {

            var data = (from role in Context.tblRoles.Where(x => x.IsPublished == IsPublished)
                        select new RoleModel
                        {
                            RoleId = role.RoleId,
                            RoleName = role.RoleName,
                        }).OrderBy(x => x.RoleId).ToList();
            return data;
        }

    }
}

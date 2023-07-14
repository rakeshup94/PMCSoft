using PMCSoft.Core.Common;
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models.Account;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;

namespace PMCSoft.Infrastructure.Services
{
    public class UserService : IUserService
    {
        private IUnitOfWork IU { get; set; }
        private IUserRepository UserRepo { get; set; }

        private IGenericRepository<tblRole> RoleRepo { get; set; }

        public UserService(IUnitOfWork _IU)
        {
            this.IU = _IU;
            this.UserRepo = IU.UserRepository;
            this.RoleRepo = IU.GenericRepository<tblRole>();

        }
        public int SaveRole(RoleModel _model)
        {
            tblRole role;
            if (_model.RoleId > 0)
            {
                role = this.RoleRepo.Get(x => x.RoleId == _model.RoleId);

            }
            else
            {
                role = new tblRole();
            }
            role.RoleId = _model.RoleId;
            role.RoleName = _model.RoleName;
            role.IsPublished = _model.IsPublished;
            role.CreatedBy = _model.CreatedBy;
            role.CreatedOn = _model.CreatedOn;
            if (_model.RoleId > 0)
            {
                this.RoleRepo.Update(role);

            }
            else
            {
                this.RoleRepo.Add(role);
            }
            this.IU.SaveChanges();
            return role.RoleId;
        }

        public IEnumerable<RoleModel> GetAllRole()
        {
            return this.UserRepo.GetAllRole();
        }
        public IEnumerable<RoleModel> GetRole(bool IsPublished)
        {
            var result = this.UserRepo.GetRole(IsPublished);
            return result;
        }

        public RoleModel GetRoleById(int roleId)
        {
            var res = this.RoleRepo.Get(x => x.RoleId == roleId);
            return new RoleModel() { RoleId = res.RoleId, RoleName = res.RoleName };

        }


        public int UpdateRole(RoleModel _model)
        {
            var role = this.RoleRepo.Get(x => x.RoleId == _model.RoleId);
            role.RoleName = _model.RoleName;
            role.IsPublished = _model.IsPublished;
            role.CreatedBy = _model.CreatedBy;
            role.CreatedOn = _model.CreatedOn;
            this.RoleRepo.Update(role);
            this.IU.SaveChanges();
            return role.RoleId;
        }


    }
}

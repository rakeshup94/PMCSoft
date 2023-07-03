
using PMCSoft.Core.Common;
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using System.Web.UI.WebControls;


namespace PMCSoft.Infrastructure.Services
{
    public class NavigationService : INavigationService
    {
        private IUnitOfWork IU { get; set; }
        private INavigationRepository NavRepository { get; set; }

        private IGenericRepository<tblRoleMenu> RoleMenuRepo { get; set; }

        public NavigationService(IUnitOfWork _IU)
        {
            this.IU = _IU;
            this.NavRepository = IU.NavRepository;
            this.RoleMenuRepo = IU.GenericRepository<tblRoleMenu>();

        }

        #region Rakesh
        public int AddMenu(NavModel _model)
        {
            int menuId = -1000;

            tblMenu nav = new tblMenu();
            nav.MenuId = menuId;
            nav.ParentId = _model.ParentId;
            nav.IsAction = _model.IsAction;
            nav.MenuIcon = _model.MenuIcon;
            nav.MenuName = _model.MenuName;
            nav.MenuDesc = _model.Description;
            nav.MenuOrderNo = _model.OrderNo;
            nav.MenuStatus = _model.Status;
            nav.IsPublished = _model.IsPublished;
            nav.CreatedBy = _model.CreatedBy;
            nav.CreatedOn = _model.CreatedOn;
            this.NavRepository.Add(nav);

            tblRoleMenu _roleMenu = new tblRoleMenu();
            _roleMenu.MenuId = nav.MenuId;
            _roleMenu.RoleId = (int)RoleType.SuperAdmin;
            _roleMenu.CreatedBy = _model.CreatedBy;
            _roleMenu.CreatedOn = _model.CreatedOn;
            this.RoleMenuRepo.Add(_roleMenu);
            this.IU.SaveChanges();
            return nav.MenuId;

        }
        public void UpdateMenu(NavModel _model)
        {
            tblMenu nav = this.NavRepository.Get(x => x.MenuId == _model.MenuId);
            nav.ParentId = _model.ParentId;
            nav.IsAction = _model.IsAction;
            nav.MenuIcon = _model.MenuIcon;
            nav.MenuName = _model.MenuName;
            nav.MenuDesc = _model.Description;
            nav.MenuOrderNo = _model.OrderNo;
            nav.MenuStatus = _model.Status;
            nav.IsPublished = _model.IsPublished;
            nav.CreatedBy = _model.CreatedBy;
            nav.CreatedOn = _model.CreatedOn;
            this.NavRepository.Update(nav);
            this.IU.SaveChanges();
        }
        public IEnumerable<NavModel> GetAllMenu()
        {

            return this.NavRepository.GetAllMenu();
        }
        public IEnumerable<NavModel> GetMenu(bool IsPublished)
        {
            var result = this.NavRepository.GetMenu(IsPublished);
            return result;

        }


        public IEnumerable<NavModel> GetMenuList(bool IsPublished)
        {
            var result = this.NavRepository.GetMenuList(IsPublished);
            return result;
        }

        public IEnumerable<NavModel> GetAccessibleMenu(bool IsAction, bool IsPublished)
        {
            var result = this.NavRepository.GetAccessibleMenu(IsAction, IsPublished);
            return result;
        }

        public IEnumerable<NavModel> GetUserMenu(long UserId, bool IsPublished)
        {
            var result = this.NavRepository.GetUserMenu(UserId, IsPublished);
            return result;
        }

        public IEnumerable<NavModel> GetRoleMenu(int RoleId, bool IsPublished)
        {
            var result = this.NavRepository.GetRoleMenu(RoleId, IsPublished);
            return result;
        }

        public NavModel GetMenuItem(int _MenuId)
        {
            var result = this.NavRepository.GetMenuItem(_MenuId);
            return result;
        }

        public int AddMenuMapping(string[] _MenuRight, int RoleId)
        {
            List<tblRoleMenu> updatedRight = _MenuRight.Select(x => new tblRoleMenu { MenuId = Convert.ToInt32(x), RoleId = RoleId }).ToList();
            List<tblRoleMenu> OldRight = this.RoleMenuRepo.GetAll(x => x.RoleId == RoleId).ToList();
            var addedRights = updatedRight.Select(a => new { a.MenuId, a.RoleId }).Except(OldRight.Select(b => new { b.MenuId, b.RoleId })).ToList();
            var deletedRights = OldRight.Select(a => new { a.MenuId, a.RoleId }).Except(updatedRight.Select(b => new { b.MenuId, b.RoleId })).ToList();
            foreach (var rgt in addedRights)
            {
                tblRoleMenu dbmRight = new tblRoleMenu() { RoleId = rgt.RoleId, MenuId = rgt.MenuId };
                this.RoleMenuRepo.Add(dbmRight);
            }
            foreach (var rgt in deletedRights)
            {
                tblRoleMenu dbmRight = this.RoleMenuRepo.Get(x => x.RoleId == rgt.RoleId && x.MenuId == rgt.MenuId);
                this.RoleMenuRepo.Remove(dbmRight);
            }
            this.IU.SaveChanges();
            return addedRights.Count;
        }

        #endregion
    }
}

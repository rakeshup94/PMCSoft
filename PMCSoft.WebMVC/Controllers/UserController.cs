using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PMCSoft.Web.Controllers
{
    public class UserController : BaseController
    {
        IUserService userSrv;

        INavigationService navSrv;



        public UserController(IUserService _userSrv, INavigationService _navSrv)
        {
            userSrv = _userSrv;
            navSrv = _navSrv;
        }
        [HttpGet]
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Roles()
        {
            var result = userSrv.GetAllRole(User.UserId, true);
            return View(result);
        }
        [HttpGet]
        public ActionResult CreateRole(int? roleId)
        {
            RoleModel model;
            if (roleId.HasValue && roleId.Value != 0)
            {
                model = userSrv.GetRoleById(roleId.Value);
            }
            else
            {
                model = new RoleModel();

            }
            model.IsPublished = true;
            model.CreatedBy = User.UserId;
            model.CreatedOn = DateTime.Now;
            return View(model);
        }
        [HttpPost]
        public ActionResult CreateRole(RoleModel model)
        {
            model.CreatedBy = User.UserId;
            model.CreatedOn = DateTime.Now;
            var result = userSrv.SaveRole(model);
            return RedirectToAction("Roles");
        }

        [HttpGet]
        public ActionResult MapRoleMenu()
        {
            RoleMenuModel model = new RoleMenuModel();
            model.RoleList = userSrv.GetAllRole(User.UserId, true).Select(x => new SelectedList { ItemId = x.RoleId, ItemName = x.RoleName });
            model.NavList = userSrv.GetUserMenu(User.UserId, true);
            return View(model);
        }


        [HttpPost]
        public ActionResult MapRoleMenu(RoleMenuModel model)
        {
            model.CreatedBy = User.UserId;
            model.CreatedOn = DateTime.Now;
            //var result = userSrv.SaveRole(model);
            return RedirectToAction("Roles");
        }



        public JsonResult GetRoleMenu(int RoleId)
        {
            try
            {

                return Json(userSrv.GetRoleMenu(RoleId, true));
            }
            catch (Exception ex)
            {

                return ThrowJsonError(ex);
            }

        }











    }
}
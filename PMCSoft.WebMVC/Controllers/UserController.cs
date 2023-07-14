using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PMCSoft.WebMVC.Controllers
{
    public class UserController : Controller
    {

        IUserService userSrv;
        public UserController(IUserService _userSrv)
        {
            userSrv = _userSrv;
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Roles()
        {
            var result = userSrv.GetAllRole();
            return View(result);
        }
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
            return View(model);
        }
        [HttpPost]
        public ActionResult CreateRole(RoleModel model)
        {
            var result = userSrv.SaveRole(model);
            return RedirectToAction("Roles");
        }
    }
}

using PMCSoft.Core.Interfaces.Service;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.Mvc;
using PMCSoft.Core.Common;

using System.Web.Script.Serialization;
using System.Web.SessionState;
using PMCSoft.Core.Models.Navigation;
using PMCSoft.Web.Filters;
using PMCSoft.Core.Models;
using PMCSoft.Web.Models;

namespace PMCSoft.Web.Controllers
{
    public class NavigationController : BaseController
    {
        INavigationService navSrv;

        public NavigationController()
        {

        }
        public NavigationController(INavigationService _navSrv)
        {
            navSrv = _navSrv;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            NavModel model = new NavModel();
            model.IsAction = true;
            model.MenuList = this.navSrv.GetNavSelectList(true);
            return View(model);
        }


        [HttpPost]
        public ActionResult Create(NavModel model)
        {
            if (ModelState.IsValid)
            {

                model.CreatedBy = User.UserId;
                model.CreatedOn = DateTime.Now;
                model.Status = (byte)Status.Active;
                model.CultureId = User.CultureId;
                model.IsPublished = true;

                if (model.MenuId == 0)
                {
                    this.navSrv.AddMenu(model);
                }
                else
                {
                    this.navSrv.UpdateMenu(model);

                }
            }
            return RedirectToAction("Create");
        }


        public ActionResult EditMenu(int MenuId)
        {



            

            NavModel model = this.navSrv.GetMenuItem(MenuId);
            model.MenuList = this.navSrv.GetMenu(true).Select(n => new SelectedList
            { ItemId = n.MenuId, ItemName = n.MenuName });
            return View("~/Views/Navigation/Create.cshtml", model);

        }


        public PartialViewResult MenuList()
        {
            IEnumerable<NavModel> result = this.navSrv.GetAllMenu().OrderBy(x => x.MenuId);
            return PartialView("~/Views/Navigation/_menuList.cshtml", result);
        }



        public ActionResult RoleMapping()


        {

            IEnumerable<NavModel> result = this.navSrv.GetMenuList(true).OrderByDescending(x => x.MenuId);
            return View(result);
        }




        public ActionResult CreateMapping()
        {
            IEnumerable<NavModel> result = this.navSrv.GetMenuList(true).OrderByDescending(x => x.MenuId);
            return RedirectToAction("CreateMapping", result);
        }


        [HttpPost]

        public ActionResult CreateMapping(string[] MenuRight, int RoleId)
        {
            var model = this.navSrv.AddMenuMapping(MenuRight, RoleId);
            return RedirectToAction("CreateMapping");
        }

        public PartialViewResult MenuItems()
        {
            var result = this.navSrv.GetUserMenu(User.UserId, true);
            return PartialView("_menuItems", result);
        }


        









    }

}
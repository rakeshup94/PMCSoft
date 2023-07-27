
using PMCSoft.Core.Interfaces.Service;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.Mvc;
using PMCSoft.Core.Common;

using System.Web.Script.Serialization;
using System.Web.SessionState;
using PMCSoft.Core.Models.Navigation;
using PMCSoft.WebMVC.Filters;
using PMCSoft.Core.Models;
using PMCSoft.Web.Models;

namespace PMCSoft.WebMVC.Controllers
{
    public class NavigationController : BaseController
    {
        INavigationService navSrv;


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

            IEnumerable<NavModel> result = this.navSrv.GetAllMenu().OrderByDescending(x => x.MenuId);
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


        //public PartialViewResult userNavigation()
        //{
        //    IEnumerable<NavModel> model;
        //    int typeId = Convert.ToInt32(User.roles[0]);
        //    if (Session["Navigation"] == null)
        //    {
        //        model = Inav.GetMenu(User.CultureId, User.UserId, typeId).OrderByDescending(x => x.OrderNo).Reverse();
        //        Session["Navigation"] = model;
        //    }
        //    else
        //    {
        //        model = (IEnumerable<NavModel>)Session["Navigation"];
        //    }
        //    UserEntity UserType = (UserEntity)typeId;
        //    if (UserType == UserEntity.Branch || UserType == UserEntity.BranchUser)
        //    {
        //        long ScopeId = Convert.ToInt64(User.roles[1]);

        //        bool flag = Iusr.CheckSequence(ScopeId);

        //        if (!flag)
        //        {
        //            TempData["SequenceMsg"] = "You need to initialize  Document Sequence Number to Make Booking.";
        //        }
        //    }
        //    return PartialView(model);
        //}

        //private List<NavModel> RecursiveRemove(List<NavModel> model)
        //{
        //    foreach (var item in model)
        //    {
        //        if (item.SubMenu.Count <= 0 && item.IsRight == false)
        //        {
        //            model.Remove(item);

        //        }
        //        else if (item.SubMenu.Count > 0)
        //        {
        //            RecursiveRemove(item.SubMenu.ToList());

        //        }
        //    }
        //    return model;
        //}









        //public PartialViewResult _LeftMenu()
        //{

        //    ViewBag.ShowMaster = false;
        //    if (User.UserId == 1)
        //    {
        //        ViewBag.ShowMaster = true;
        //    }
        //    int serviceId = 12;
        //    ViewBag.ShowUser = true;

        //    List<UserType> lstUserType = this.IusrType.GetUserBasedUserTypes(User.UserId, serviceId, User.CultureId, Convert.ToInt32(User.roles[0])).OrderByDescending(x => x.OrderNo).ToList();
        //    ViewBag.UserType = lstUserType;
        //    if (lstUserType.Count == 0)
        //    {
        //        ViewBag.ShowUser = false;
        //    }
        //    IEnumerable<ServiceModel> lst = Iusr.GetMenuList(User.UserId, User.CultureId, Convert.ToInt32(User.roles[0])).AsEnumerable();

        //    int typeId = Convert.ToInt32(User.roles[0]);
        //    UserEntity UserType = (UserEntity)typeId;

        //    if (UserType == UserEntity.Branch || UserType == UserEntity.BranchUser)
        //    {
        //        long ScopeId = Convert.ToInt64(User.roles[1]);

        //        bool flag = Iusr.CheckSequence(ScopeId);

        //        if (!flag)
        //        {
        //            TempData["SequenceMsg"] = "You need to initialize  Document Sequence Number to Make Booking.";
        //        }
        //    }


        //    return PartialView("~/Views/Shared/_LeftMenu.cshtml", lst);
        //}






        //public ActionResult CreateMapping()
        //{
        //    var result = this.Isrv.BindUserType(User.CultureId);
        //    ViewBag.UserType = result;
        //    return View();
        //}
        //[SkipPermission]
        //[HttpPost]
        //public PartialViewResult MappingMenuRights(int userType)
        //{

        //    IEnumerable<ServiceModel> result = Inav.GetMenuRights(userType, User.CultureId);
        //    return PartialView("~/Views/Navigation/_mapMenuRights.cshtml", result);
        //}









    }

}

using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Infrastructure.Repository;
using PMCSoft.Infrastructure.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace PMCSoft.WebMVC.Controllers
{
    public class NavigationController : BaseController
    {
        INavigationService NavSrv;
        public NavigationController(INavigationService _NavSrv)
        {
            NavSrv = _NavSrv;
        }


        public NavigationController()
        {
            this.NavSrv = new NavigationService(new UnitOfWork());
        }
        // GET: Navigation
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult MenuItems()
        {
           
            List<MenuModel> models = this.NavSrv.GetMenus(User.EmpNo, User.ProjectNo);
            return PartialView("_menuItems", models);

        }




    }
}

using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.ViewModel;
using PMCSoft.Core.ViewModel.Security;
using PMCSoft.Core.ViewModel.Users;
using PMCSoft.Core.ViewModel.CreditLimit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PMCSoft.Core.Common;
using PMCSoft.Core.ViewModel.Navigation;
using PMCSoft.Web.Filters;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace PMCSoft.WebMVC.Controllers
{


    [SessionState(SessionStateBehavior.ReadOnly)]
    public class NavigationController : BaseController
    {


        INavigationService Inav;
        ICommonService Isrv;
        public NavigationController(INavigationService _Inav, ICommonService _Isrv)
        {
            Inav = _Inav;
            Isrv = _Isrv;

        }

        public ActionResult Create()
        {
            NavModel model = new NavModel();
            model.MenuList = Isrv.BindMenuList(User.CultureId);
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
                    Inav.AddMenu(model);
                }
                else
                {
                    Inav.UpdateMenu(model);

                }
            }
            return RedirectToAction("Create");
        }


        public ActionResult EditMenu(int MenuId)
        {
            NavModel model = Inav.GetMenuItem(User.CultureId, MenuId);
            model.MenuList = Isrv.BindMenuList(User.CultureId);
            return View("~/Views/Navigation/Create.cshtml", model);

        }


        public PartialViewResult MenuList()
        {
            int cultId = User.CultureId;
            IEnumerable<NavModel> result = Inav.GetSystemMenu(cultId).OrderByDescending(x => x.MenuId);
            return PartialView("~/Views/Navigation/_menuList.cshtml", result);
        }
        [SkipPermission]
        public PartialViewResult _Header()
        {
            int TypeId = Convert.ToInt32(User.roles[0]);

            long Usrid = User.UserId;
            if (TypeId == (int)UserEntity.MainAgentUser || TypeId == (int)UserEntity.BranchUser || TypeId == (int)UserEntity.BranchSubAgentUser)
            {
                Usrid = User.ParentId;
            }
            IEnumerable<EmailNotificationAlerts> Result = EmailNotificationService.GetEmailAlert(Usrid, TypeId);
            CreditBalance crdBal = new CreditBalance();
            long ScopeId = Convert.ToInt64(User.roles[1]);

            if (TypeId == 6)
            {
                crdBal = ICredit.GetAgentCreditBalance(ScopeId);
            }
            if (TypeId == 12)
            {
                crdBal = ICredit.GetStaffCreditBalance(User.UserId, ScopeId);
                if (crdBal == null || crdBal.CreditLimit == 0)
                {
                    crdBal = ICredit.GetAgentCreditBalance(ScopeId);
                }
            }
            ViewBag.CreditBalance = crdBal;
            return PartialView("~/Views/Shared/_Header.cshtml", Result);
        }

        [SkipPermission]
        public PartialViewResult userNavigation()
        {
            IEnumerable<NavModel> model;
            int typeId = Convert.ToInt32(User.roles[0]);
            if (Session["Navigation"] == null)
            {
                model = Inav.GetMenu(User.CultureId, User.UserId, typeId).OrderByDescending(x => x.OrderNo).Reverse();
                Session["Navigation"] = model;
            }
            else
            {
                model = (IEnumerable<NavModel>)Session["Navigation"];
            }
            UserEntity UserType = (UserEntity)typeId;
            if (UserType == UserEntity.Branch || UserType == UserEntity.BranchUser)
            {
                long ScopeId = Convert.ToInt64(User.roles[1]);

                bool flag = Iusr.CheckSequence(ScopeId);

                if (!flag)
                {
                    TempData["SequenceMsg"] = "You need to initialize  Document Sequence Number to Make Booking.";
                }
            }
            return PartialView(model);
        }

        private List<NavModel> RecursiveRemove(List<NavModel> model)
        {
            foreach (var item in model)
            {
                if (item.SubMenu.Count <= 0 && item.IsRight == false)
                {
                    model.Remove(item);

                }
                else if (item.SubMenu.Count > 0)
                {
                    RecursiveRemove(item.SubMenu.ToList());

                }
            }
            return model;
        }


        [SkipPermission]

        public string EmailNotification()
        {
            long UsrID = User.UserId;
            if (Convert.ToInt32(User.roles[0]) == (int)UserEntity.MainAgentUser || Convert.ToInt32(User.roles[0]) == (int)UserEntity.BranchUser || Convert.ToInt32(User.roles[0]) == (int)UserEntity.BranchSubAgentUser)
            {
                UsrID = User.ParentId;
            }

            List<EmailNotificationAlerts> DbServicelist = EmailNotificationService.GetEmailAlert(UsrID, Convert.ToInt32(User.roles[0])).ToList();

            string output = new JavaScriptSerializer().Serialize(DbServicelist);
            return output;

        }

        [SkipPermission]
        public ActionResult _LeftMenuWithHeader()
        {


            IEnumerable<EmailNotificationAlerts> Result = EmailNotificationService.GetEmailAlert(User.UserId, Convert.ToInt32(User.roles[0]));
            CreditBalance crdBal = new CreditBalance();
            if (Convert.ToInt32(User.roles[0]) == 6)
            {
                crdBal = ICredit.GetAgentCreditBalance(User.UserId);
            }
            ViewBag.CreditBalance = crdBal;
            ViewBag.Srvcoll = ReturnSrv();
            return PartialView("~/Views/Shared/_HeaderTopMenu.cshtml", Result);
        }

        public IEnumerable<ServiceModel> ReturnSrv()
        {

            ViewBag.ShowMaster = false;
            if (User.UserId == 1)
            {
                ViewBag.ShowMaster = true;
            }
            int serviceId = 12;
            ViewBag.ShowUser = true;

            List<UserType> lstUserType = this.IusrType.GetUserBasedUserTypes(User.UserId, serviceId, User.CultureId, Convert.ToInt32(User.roles[0])).OrderByDescending(x => x.OrderNo).ToList();
            ViewBag.UserType = lstUserType;
            if (lstUserType.Count == 0)
            {
                ViewBag.ShowUser = false;
            }
            IEnumerable<ServiceModel> lst = Iusr.GetMenuList(User.UserId, User.CultureId, Convert.ToInt32(User.roles[0])).AsEnumerable();

            int typeId = Convert.ToInt32(User.roles[0]);
            UserEntity UserType = (UserEntity)typeId;

            if (UserType == UserEntity.Branch || UserType == UserEntity.BranchUser)
            {
                long ScopeId = Convert.ToInt64(User.roles[1]);

                bool flag = Iusr.CheckSequence(ScopeId);

                if (!flag)
                {
                    TempData["SequenceMsg"] = "You need to initialize  Document Sequence Number to Make Booking.";
                }
            }
            return lst;

        }

        [SkipPermission]
        public PartialViewResult _LeftMenu()
        {

            ViewBag.ShowMaster = false;
            if (User.UserId == 1)
            {
                ViewBag.ShowMaster = true;
            }
            int serviceId = 12;
            ViewBag.ShowUser = true;

            List<UserType> lstUserType = this.IusrType.GetUserBasedUserTypes(User.UserId, serviceId, User.CultureId, Convert.ToInt32(User.roles[0])).OrderByDescending(x => x.OrderNo).ToList();
            ViewBag.UserType = lstUserType;
            if (lstUserType.Count == 0)
            {
                ViewBag.ShowUser = false;
            }
            IEnumerable<ServiceModel> lst = Iusr.GetMenuList(User.UserId, User.CultureId, Convert.ToInt32(User.roles[0])).AsEnumerable();

            int typeId = Convert.ToInt32(User.roles[0]);
            UserEntity UserType = (UserEntity)typeId;

            if (UserType == UserEntity.Branch || UserType == UserEntity.BranchUser)
            {
                long ScopeId = Convert.ToInt64(User.roles[1]);

                bool flag = Iusr.CheckSequence(ScopeId);

                if (!flag)
                {
                    TempData["SequenceMsg"] = "You need to initialize  Document Sequence Number to Make Booking.";
                }
            }


            return PartialView("~/Views/Shared/_LeftMenu.cshtml", lst);
        }





        [SkipPermission]
        public ActionResult CreateMapping()
        {
            var result = this.Isrv.BindUserType(User.CultureId);
            ViewBag.UserType = result;
            return View();
        }
        [SkipPermission]
        [HttpPost]
        public PartialViewResult MappingMenuRights(int userType)
        {

            IEnumerable<ServiceModel> result = Inav.GetMenuRights(userType, User.CultureId);
            return PartialView("~/Views/Navigation/_mapMenuRights.cshtml", result);
        }




        [HttpPost]
        [SkipPermission]
        public ActionResult CreateMapping(string[] MenuRight, string ddlUserType)
        {
            var model = Inav.AddMenuMapping(MenuRight, ddlUserType);
            return RedirectToAction("CreateMapping");
        }





    }

}
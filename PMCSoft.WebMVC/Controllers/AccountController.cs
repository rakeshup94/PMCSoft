using Newtonsoft.Json;
using PMCSoft.Core.Models.Account;
using PMCSoft.WebMVC.Models;
using PMCSoft.WebMVC.Models.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PMCSoft.WebMVC.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult SignIn()
        {
            var model = new SignInModel();
            return View(model);
        }

        public ActionResult SignIn(SignInModel model)
        {
            Session["Android"] = model.Android;
            bool flag = false, parentIsActive = true; string Message = string.Empty;
            if (ModelState.IsValid)
            {
                try
                {
                    AccountUser CurrentUser = IAcSrv.LoginUser(model.Email, model.Password);
                    if (CurrentUser.UserId != 0)
                    {
                        long userID = CurrentUser.UserId, parentID = CurrentUser.ParentId;
                        while (userID != 1 && parentID != 1 && parentIsActive)
                        {
                            if (userID != CurrentUser.UserId)
                                parentID = this.Iusr.GetParent(userID);
                            long status = this.Iusr.GetUserStatus(parentID);
                            if (status == 0)
                            {
                                parentIsActive = false;
                                Message = "Account is disabled";
                            }
                            userID = parentID;
                        }
                    }
                    if (CurrentUser.LoginId > 0 && parentIsActive)
                    {
                        CustomSerializePrincipal serializeModel = new CustomSerializePrincipal();
                        serializeModel.LoginId = CurrentUser.LoginId;
                        serializeModel.UserId = CurrentUser.UserId;
                        serializeModel.FirstName = CurrentUser.FirstName;
                        serializeModel.LastName = CurrentUser.LastName;
                        serializeModel.MiddleName = CurrentUser.MiddleName;
                        serializeModel.CultureId = CurrentUser.CultureId;
                        serializeModel.TimeZone = CurrentUser.TimeZone;
                        serializeModel.UserTypeId = CurrentUser.UserTypeId;
                        serializeModel.ScopeId = CurrentUser.ScopeId;
                        serializeModel.ParentId = CurrentUser.ParentId;

                        #region Nupur
                        Session["EmailID"] = model.Email;
                        Session["UserID"] = serializeModel.UserId;

                        if (model.RememberMe)
                        {
                            HttpCookie cookie = new HttpCookie("Login");
                            cookie.Values.Add("EmailID", model.Email);
                            cookie.Values.Add("Password", model.Password);
                            cookie.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(cookie);
                        }
                        if (model.Android == 1)
                        {
                            HttpCookie cookie = new HttpCookie("Android");
                            cookie.Values.Add("MobileApp", "1");
                            cookie.Expires = DateTime.Now.AddDays(120);
                            Response.Cookies.Add(cookie);
                        }

                        #endregion

                        string[] roles = new string[10];
                        roles[0] = CurrentUser.UserTypeId.ToString();
                        roles[1] = CurrentUser.ScopeId.ToString();
                        roles[2] = CurrentUser.ParentId.ToString();
                        roles[3] = CurrentUser.TimeZone;
                        roles[4] = CurrentUser.ClientId.ToString();
                        roles[5] = CurrentUser.RoleId.ToString();
                        roles[6] = "~/images/Profile_Img/" + CurrentUser.ProfilePath;
                        serializeModel.roles = roles;
                        PermissionManager.setPermissions(CurrentUser);
                        var sessionSection = (System.Web.Configuration.SessionStateSection)System.Web.Configuration.WebConfigurationManager.GetSection("system.web/sessionState");
                        var logintime = sessionSection.Timeout.TotalMinutes / 2;
                        string userData = JsonConvert.SerializeObject(serializeModel);



                        FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                                 1,
                                model.Email,
                                 DateTime.Now,
                                 DateTime.Now.AddMinutes(logintime),
                                 false,
                                 userData);
                        string encTicket = FormsAuthentication.Encrypt(authTicket);
                        HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                        Response.Cookies.Add(faCookie);
                        flag = true;
                        Message = "Success";
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(Message))
                            Message = CurrentUser.ProfilePath;
                    }
                }
                catch (Exception ex)
                {
                    Message = "Technical Issue";
                    HandleException.ExceptionLogging(ExceptionSource.B2B, ex.Source, ex.Message + "\n\r" + ex.StackTrace, false);
                }
            }
            else
            {
                Message = "not validate";
            }
            return Json(new { flag, Message }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LogOut()
        {

            FormsAuthentication.SignOut();
            PermissionManager.logout();
            int? iApp;
            //if (Convert.ToInt32(Session["Android"]) == 1)
            //{
            //    iApp = int.Parse(Session["Android"].ToString());
            //}
            if (Request.Cookies["Android"] != null)
            {
                iApp = int.Parse(Request.Cookies["Android"].Values["MobileApp"]);
            }
            else
            {
                iApp = null;
            }

            //  Session.Remove("Android");
            ClearSession();

            return RedirectToAction("Login", "Account", new { App = iApp });


        }



    }
}
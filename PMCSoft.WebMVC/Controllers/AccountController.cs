using Newtonsoft.Json;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models.Account;
using PMCSoft.Infrastructure.Repository;
using PMCSoft.Infrastructure.Services;
using PMCSoft.Web.Models;
using PMCSoft.Web.Models.Account;
using PMCSoft.Core.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Configuration;

namespace PMCSoft.WebMVC.Controllers
{
    public class AccountController : Controller
    {
        IAccountService accSrv;
        public AccountController(IAccountService _accSrv)
        {
            accSrv = _accSrv;
        }
        //public AccountController()
        //{
        //    this.accSrv = new AccountService(new UnitOfWork());
        //}


        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult SignIn()
        {
            var model = new SignInModel();
            return View(model);
        }
        //public async Task<IActionResult> GetProductDetail(int ProductId)
        //{
        //    return Ok(await prodSrv.GetProductDetail(ProductId));
        //}
        [HttpPost]
        public async Task<ActionResult> SignIn(SignInModel model)
        {

            if (ModelState.IsValid)
            {
                model.Password = model.Password.CreateMD5Hash();
                var _result = await accSrv.LoginUser(model.Email, model.Password);
                var user = _result.Data;
                if (_result.Result)
                {
                    CustomSerializePrincipal serializeModel = new CustomSerializePrincipal();
                    serializeModel.UserId = user.UserId;
                    serializeModel.ProjectId = user.ProjectId;
                    serializeModel.EmpNo = user.EmpNo;
                    serializeModel.ProjectNo = user.ProjectNo;
                    serializeModel.CompanyId = user.CompanyId;
                    serializeModel.LoginId = user.LoginId;
                    serializeModel.CultureId = user.CultureId;
                    serializeModel.UserTypeId = user.UserTypeId;
                    serializeModel.UserType = user.UserType;
                    serializeModel.Email = user.Email;
                    serializeModel.EmpName = user.EmpName;
                    serializeModel.FirstName = user.FirstName;
                    serializeModel.LastName = user.LastName;

                    if (model.RememberMe)
                    {
                        HttpCookie cookie = new HttpCookie("SignIn");
                        cookie.Values.Add("Email", model.Email);
                        cookie.Values.Add("Password", model.Password);
                        cookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cookie);
                    }
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

                    var returnUrl = user.UserTypeId == 1 ? "~/Admin/Home.aspx" : "~/User/Home.aspx";
                    return RedirectPermanent(returnUrl);

                }
                else
                {
                    ModelState.AddModelError(string.Empty, _result.Message);
                    return RedirectToAction("SignIn");
                }


            }
            return RedirectToAction("SignIn");
        }

        public ActionResult SignOut()
        {

            FormsAuthentication.SignOut();
            return RedirectToAction("SignIn");


        }



    }
}
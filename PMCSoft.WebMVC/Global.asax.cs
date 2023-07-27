using Newtonsoft.Json;
using PMCSoft.Web.Models;
using System.Web;
using System;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace PMCSoft.WebMVC
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            UnityConfig.RegisterComponents();
        }








        protected void Application_PostAuthenticateRequest(object sender, EventArgs e)
        {

            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            var sessionSection = (System.Web.Configuration.SessionStateSection)System.Web.Configuration.WebConfigurationManager.GetSection("system.web/sessionState");
            var logintime = sessionSection.Timeout.TotalMinutes / 2;
            if (authCookie != null)
            {

                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                CustomSerializePrincipal serializeModel = JsonConvert.DeserializeObject<CustomSerializePrincipal>(authTicket.UserData);
                CustomPrincipal newUser = new CustomPrincipal(authTicket.Name);
                newUser.UserId = serializeModel.UserId;
                newUser.UserTypeId = serializeModel.UserTypeId;
                newUser.ProjectId = serializeModel.ProjectId;
                newUser.EmpNo = serializeModel.EmpNo;
                newUser.ProjectNo = serializeModel.ProjectNo;
                newUser.CompanyId = serializeModel.CompanyId;
                newUser.LoginId = serializeModel.LoginId;
                newUser.CultureId = serializeModel.CultureId;
                newUser.UserType = serializeModel.UserType;
                newUser.Email = serializeModel.Email;
                newUser.EmpName = serializeModel.EmpName;
                newUser.FirstName = serializeModel.FirstName;
                newUser.LastName = serializeModel.LastName;     
                newUser.roles = serializeModel.roles;
                HttpContext.Current.User = newUser;
                authTicket = new FormsAuthenticationTicket(authTicket.Version + 1, authTicket.Name,
                    DateTime.Now, DateTime.Now.AddMinutes(logintime),
                    authTicket.IsPersistent, authTicket.UserData);
                string encTicket = FormsAuthentication.Encrypt(authTicket);
                HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                Response.Cookies.Add(faCookie);
            }
            //else
            //{
            //    var exception = Server.GetLastError();
            //    Response.Clear();
            //    Server.ClearError();
            //    var routeData = new RouteData();
            //    routeData.Values["controller"] = "Account";
            //    routeData.Values["action"] = "Login";
            //    Response.StatusCode = 500;
            //    IController controller = new AccountController();
            //    var rc = new RequestContext(new HttpContextWrapper(Context), routeData);
            //    controller.Execute(rc);
            //}


        }


        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception exception = Server.GetLastError();
            //ExceptionHelper.ExceptionLogging(exception.Source, exception.Message + "\n\r" + "\n\r" + exception.StackTrace, false);
            //Server.ClearError();
            //Response.Redirect("/Error/_error");
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }











    }
}

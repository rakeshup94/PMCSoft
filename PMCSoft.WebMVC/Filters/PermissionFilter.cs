
using PMCSoft.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace PMCSoft.Web.Filters
{
    public class PermissionFilter : ActionFilterAttribute
    {
        public string IdParamName { get; set; }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.ActionDescriptor.GetCustomAttributes(typeof(SkipPermissionAttribute), false).Any())
            {
                return;
            }
            else
            {
                base.OnActionExecuting(filterContext);
                HttpRequestBase request = filterContext.HttpContext.Request;
                HttpResponseBase response = filterContext.HttpContext.Response;
                if ((request.AcceptTypes.Contains("application/json")) == false)
                {
                    if (request.IsAjaxRequest())
                    {
                        #region Preventing caching of ajax request in IE browser
                        response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                        response.Cache.SetValidUntilExpires(false);
                        response.Cache.SetCacheability(HttpCacheability.NoCache);
                        response.Cache.SetNoStore();
                        #endregion
                    }

                    string currentActionName = filterContext.ActionDescriptor.ActionName;
                    string currentControllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;

                    string currentParameter = "N/A";
                    if(!string.IsNullOrEmpty(IdParamName))
                    {
                        if (filterContext.ActionParameters.ContainsKey(IdParamName))
                        {


                            currentParameter = Convert.ToString(filterContext.ActionParameters[IdParamName]);
                        }
                    }

                    //get LoggedInUser Permissions
                    PermissionManager userPermissions = PermissionManager.getPermissions();

                    //All Features are allowed for SuperAdmin - disablePermissioning
                    if (userPermissions != null)
                    {
                        bool hasPermission = false;
                        //hasPermission = Common.isFeaturePresentInList(userPermissions.accessibleFeatures, currentControllerName, currentActionName, currentParameter);

                        if (!hasPermission)
                        {
                            //return 'not authorized' content
                            filterContext.Result = new ViewResult
                            {                               
                                ViewName = "AccessDenied"
                            };
                        }

                    }
                    //Redirect to login Page
                    else
                    {

                        filterContext.Result = new RedirectToRouteResult(
                                     new System.Web.Routing.RouteValueDictionary { { "controller", "Account" }, { "action", "Login" }, { "Area", "" } });
                    }
                }



            }
        }

    }


    public class CustomExceptionAttribute : FilterAttribute, IExceptionFilter
    {
        void IExceptionFilter.OnException(ExceptionContext filterContext)
        {
            Exception e = filterContext.Exception;
            //Log Exception e
            filterContext.ExceptionHandled = true;
            filterContext.Result = new ViewResult()
            {
                ViewName = "Error"
            };
        }
    }


    public class SkipPermissionAttribute : Attribute
    {
    }

    public class SessionTimeoutAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContext ctx = HttpContext.Current;
            CustomPrincipal User = ctx.User as CustomPrincipal;
            if (User == null)
            {
                filterContext.Result = new RedirectResult("~/Account/Login");
                return;
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
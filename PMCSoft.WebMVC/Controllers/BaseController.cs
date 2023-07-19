using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Configuration;
using PMCSoft.WebMVC.Models;

namespace PMCSoft.WebMVC.Controllers
{
    [Authorize]
    public class BaseController : Controller
    {
        protected virtual new CustomPrincipal User
        {
            get { return HttpContext.User as CustomPrincipal; }
        }









        public JsonResult ThrowJsonError(Exception e)
        {
            //Logger.Error(e.Message, e);
            //HandleException.ExceptionLogging(ExceptionSource.B2B, e.Source, e.Message + "\n\r" + "User :" + User.UserId + "\n\r" + e.StackTrace, false);
            Response.StatusCode = (int)System.Net.HttpStatusCode.BadRequest;
            Response.StatusDescription = e.Message;
            return Json(new { Message = e.Message, StatusCode = -1 }, JsonRequestBehavior.AllowGet);
        }
        //public string ThrowStringError(Exception ex)
        //{
        //    //Logger.Error(e.Message, e);
        //    HandleException.ExceptionLogging(ExceptionSource.B2B, ex.Source, ex.Message + "\n\r" + "User :" + User.UserId + "\n\r" + ex.StackTrace, false);
        //    Response.StatusCode = (int)System.Net.HttpStatusCode.BadRequest;
        //    Response.StatusDescription = ex.Message;
        //    var result = new { Message = ex.Message, StatusCode = -1 };
        //    return result.ToJSON();
        //}




    }
}
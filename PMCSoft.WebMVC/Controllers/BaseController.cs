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

    
    }
}
using PMCSoft.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMCSoft.Web
{
    public class BaseUserControl :System.Web.UI.UserControl
    {
        protected virtual CustomPrincipal User
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }
    }
}
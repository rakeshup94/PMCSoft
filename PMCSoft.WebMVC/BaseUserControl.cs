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

        
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (!HttpContext.Current.Request.IsAuthenticated)
            {
                //Response.Redirect("~/Account/SignIn");
            }
        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMCSoft.Web.Models
{
    public class RenderActionViewModel
    {
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public object RouteValues { get; set; }
    }
}
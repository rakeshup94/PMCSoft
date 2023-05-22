using PMCSoft.WebMVC.Models;
using System.Web;

namespace PMCSoft.WebMVC
{
    public class BaseMasterPage : System.Web.UI.MasterPage
    {
        protected virtual CustomPrincipal User
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }
    }
}
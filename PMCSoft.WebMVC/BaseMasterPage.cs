using PMCSoft.Web.Models;
using System.Web;

namespace PMCSoft.Web
{
    public class BaseMasterPage : System.Web.UI.MasterPage
    {
        protected virtual CustomPrincipal User
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }
    }
}
using PMCSoft.WebMVC.Models;
using System.Web;

namespace PMCSoft.WebMVC
{
    public class BasePage : System.Web.UI.Page
    {
        protected virtual new CustomPrincipal User
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }
    }
}
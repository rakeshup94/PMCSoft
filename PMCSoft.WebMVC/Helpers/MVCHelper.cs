using PMCSoft.Web.Controllers;
using PMCSoft.Web.Models;
using System;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace PMCSoft.Web.Helpers
{

    //Here the Dummy controller with Dummy view
    public class DummyController : Controller
    {
        public ActionResult PartialRender()
        {
            return PartialView();
        }
    }









    public static class MVCHelper
    {
        //Render a partial view, like Keith's solution
        private static void RenderPartial(string partialViewName, object model)
        {
            HttpContextBase httpContextBase = new HttpContextWrapper(HttpContext.Current);
            RouteData routeData = new RouteData();
            routeData.Values.Add("controller", "Dummy");
            ControllerContext controllerContext = new ControllerContext(new RequestContext(httpContextBase, routeData), new DummyController());
            IView view = FindPartialView(controllerContext, partialViewName);
            ViewContext viewContext = new ViewContext(controllerContext, view, new ViewDataDictionary { Model = model }, new TempDataDictionary(), httpContextBase.Response.Output);
            view.Render(viewContext, httpContextBase.Response.Output);
        }
        //Find the view, if not throw an exception
        private static IView FindPartialView(ControllerContext controllerContext, string partialViewName)
        {
            ViewEngineResult result = ViewEngines.Engines.FindPartialView(controllerContext, partialViewName);
            if (result.View != null)
            {
                return result.View;
            }
            StringBuilder locationsText = new StringBuilder();
            foreach (string location in result.SearchedLocations)
            {
                locationsText.AppendLine();
                locationsText.Append(location);
            }
            throw new InvalidOperationException(String.Format("Partial view {0} not found. Locations Searched: {1}", partialViewName, locationsText));
        }

        //Here the method that will be called from MasterPage or Aspx
        public static void RenderAction(string controllerName, string actionName, object routeValues)
        {
            RenderPartial("PartialRender", new RenderActionViewModel() { ControllerName = controllerName, ActionName = actionName, RouteValues = routeValues });
        }












    }
}
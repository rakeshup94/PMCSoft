using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Infrastructure.Services;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace PMCSoft.WebMVC
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers
            // e.g. container.RegisterType<ITestService, TestService>();
            container.RegisterType<IAccountService, AccountService>();
            container.RegisterType<INavigationService, NavigationService>();
            //container.RegisterType<ICommonService, CommonService>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}
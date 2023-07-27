using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Infrastructure.Repository;
using PMCSoft.Infrastructure.Services;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace PMCSoft.Web
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
            container.RegisterType<IUserService, UserService>();

            container.RegisterType<IUnitOfWork, UnitOfWork>();
            container.RegisterType<IDataContext, PMCSoftContext>();
            //container.RegisterType<ICommonService, CommonService>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}
using PMCSoft.Core.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Infrastructure.Services
{
    public class NavigationService : INavigationService
    {
        private IUnitOfWork IU { get; set; }

        
        public NavigationService(IUnitOfWork _IU)
        {
            this.IU = _IU;
       
        }

        public List<MenuModel> GetMenus(string _userId, string _projectId)
        {
            
            List<MenuModel> menuItemsList = new List<MenuModel>();
            var menuItems = this.IU.NavRepository.GetMenus(_userId, _projectId);
           
            
            if (menuItems != null)
            {
                menuItemsList = this.IU.NavRepository.LoadMenus(menuItems, 0);
            }
            return menuItemsList;
        }

    }
}

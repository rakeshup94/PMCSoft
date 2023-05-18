
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using static System.Collections.Specialized.BitVector32;


namespace PMCSoft.Infrastructure.Repository
{
    public class NavigationRepository : GenericRepository<tblMenuHeader>, INavigationRepository
    {
        public NavigationRepository(IDataContext context)
          : base(context)
        {
        }
        public PMCSoftContext Context
        {
            get { return base.entities as PMCSoftContext; }
        }

        public IEnumerable<MenuModel> GetMenus(string _userId, string _projectId)
        {

            try
            {
                var data = from nav in Context.tblMenus.Where(x => x.IsPublished == true)
                           join user in Context.PermissionPages.Where(x => ((x.Status == "E") && (x.ProjectId == _projectId) && (x.UserId == _userId))) on nav.MenuId equals user.PageTransId
                           select new MenuModel
                           {
                               MenuId = nav.MenuId,
                               ParentId = nav.ParentId.HasValue ? nav.ParentId.Value : 0,
                               MenuName = nav.MenuName,
                               MenuIcon = nav.MenuIcon,
                               OrderNo = nav.MenuOrderNo,
                               IsAction = nav.IsAction,
                               MenuUrl = nav.NavigateURL,
                           };
                return data;

            }
            catch (Exception ex)
            {
                throw ex;


            }




        }

        public List<MenuModel> LoadMenus(IEnumerable<MenuModel> menus, int ParentId)
        {
            List<MenuModel> nodes = new List<MenuModel>();
            nodes = (from node in menus
                     where node.ParentId == ParentId
                     orderby node.OrderNo
                     select new MenuModel
                     {
                         MenuId = node.MenuId,
                         ParentId = node.ParentId,
                         OrderNo = node.OrderNo,
                         MenuName = node.MenuName,
                         MenuUrl = node.MenuUrl,
                         MenuList = (ParentId != node.MenuId ?
                              LoadMenus(menus, node.MenuId) :
                     new List<MenuModel>())
                     }).ToList();
            return nodes;
        }

    }




}


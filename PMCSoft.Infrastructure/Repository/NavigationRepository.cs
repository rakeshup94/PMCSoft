
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;

namespace PMCSoft.Infrastructure.Repository
{
    public class NavigationRepository : GenericRepository<tblMenu>, INavigationRepository
    {
        public NavigationRepository(IDataContext context)
      : base(context)
        {
        }
        public PMCSoftContext Context
        {
            get { return base.entities as PMCSoftContext; }
        }

        public IEnumerable<NavModel> GetAllMenu()
        {
            var data = (from nav in Context.tblMenus
                        select new NavModel
                        {
                            MenuId = nav.MenuId,
                            ParentId = nav.ParentId,
                            MenuName = nav.MenuName,
                            MenuIcon = nav.MenuIcon,
                            IsAction = nav.IsAction,
                            OrderNo = nav.MenuOrderNo.HasValue ? nav.MenuOrderNo.Value : 0.0f
                        }).OrderBy(x => x.ParentId).ToList();
            return data;
        }
        public IEnumerable<NavModel> GetMenu(bool IsPublished)
        {
            var data = (from nav in Context.tblMenus.Where(x => x.IsPublished == IsPublished)
                        select new NavModel
                        {
                            MenuId = nav.MenuId,
                            ParentId = nav.ParentId,
                            MenuName = nav.MenuName,
                            MenuIcon = nav.MenuIcon,
                            IsAction = nav.IsAction,
                            OrderNo = nav.MenuOrderNo.HasValue ? nav.MenuOrderNo.Value : 0.0f
                        }).OrderBy(x => x.MenuId).ToList();
            return data;
        }
        public IEnumerable<NavModel> GetAccessibleMenu(bool IsAction, bool IsPublished)
        {
            var data = (from nav in Context.tblMenus.Where(x => x.IsAction == IsAction && x.IsPublished == IsPublished)
                        select new NavModel
                        {
                            MenuId = nav.MenuId,
                            ParentId = nav.ParentId,
                            MenuName = nav.MenuName,
                            MenuIcon = nav.MenuIcon,
                        }).OrderBy(x => x.MenuId).ToList();
            return data;
        }


        public IEnumerable<NavModel> GetMenuList(bool IsPublished)
        {
            List<NavModel> allData = (from nav in Context.tblMenus.Where(x => x.IsPublished == IsPublished)
                                      select new NavModel
                                      {
                                          MenuId = nav.MenuId,
                                          ParentId = nav.ParentId.HasValue ? nav.ParentId.Value : 0,
                                          MenuName = nav.MenuName,
                                          MenuIcon = nav.MenuIcon,
                                          IsAction = nav.IsAction,
                                          OrderNo = nav.MenuOrderNo.HasValue ? nav.MenuOrderNo.Value : 0.0f
                                      }).OrderBy(x => x.ParentId).ToList();
            var result = this.BindHierarchy(allData, 0);

            return result;

    
        }


        public IEnumerable<NavModel> GetUserMenu(long UserId, bool IsPublished)
        {
            var status = new SqlParameter();
            status.ParameterName = "@IsPublished";
            status.Direction = ParameterDirection.Input;
            status.SqlDbType = SqlDbType.Bit;
            status.Value = IsPublished;
            var user = new SqlParameter();
            user.ParameterName = "@UserId";
            user.Direction = ParameterDirection.Input;
            user.SqlDbType = SqlDbType.BigInt;
            user.Value = UserId;

            List<NavModel> allData = null;
            using (SqlCommand command = (SqlCommand)Context.Database.Connection.CreateCommand())
            {

                SqlDataAdapter adapter = new SqlDataAdapter();
                command.CommandText = @"Select x.*,y.RoleId,z.MenuId,xx.MenuName from tblUser x inner join tblUserRoles y on x.UserId=y.UserId 
inner join tblRoleMenu z on y.RoleId=z.RoleId inner join  tblMenu xx on z.MenuId=xx.MenuId
Where x.UserId=@UserId and xx.IsPublished=@IsPublished";
                command.CommandType = CommandType.Text;
                command.Parameters.Add(status);
                command.Parameters.Add(user);
                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet("Data");
                adapter.Fill(dataSet);
                allData = (dataSet.Tables[0].AsEnumerable().Select(dataRow => new NavModel
                {

                    MenuId = dataRow.Field<int>("MenuId"),
                    MenuName = dataRow.Field<string>("MenuName") ?? string.Empty,
                    MenuIcon = dataRow.Field<string>("MenuIcon") ?? string.Empty,
                    OrderNo = dataRow.Field<float>("MenuOrderNo"),
                    IsAction = dataRow.Field<bool>("IsAction"),
                    ParentId = dataRow.Field<int>("ParentId"),

                })).ToList();

            }
            var menuList = allData.Where(x => x.ParentId == 0);
  
            var result = this.BindHierarchy(menuList, 0);

            return result;
        }


        public IEnumerable<NavModel> GetRoleMenu(int RoleId, bool IsPublished)
        {
            var status = new SqlParameter();
            status.ParameterName = "@IsPublished";
            status.Direction = ParameterDirection.Input;
            status.SqlDbType = SqlDbType.Bit;
            status.Value = IsPublished;
            var user = new SqlParameter();
            user.ParameterName = "@RoleId";
            user.Direction = ParameterDirection.Input;
            user.SqlDbType = SqlDbType.Int;
            user.Value = RoleId;

            List<NavModel> allData = null;
            using (SqlCommand command = (SqlCommand)Context.Database.Connection.CreateCommand())
            {

                SqlDataAdapter adapter = new SqlDataAdapter();
                command.CommandText = @"Select x.MenuId,x.MenuName,x.IsAction,x.MenuIcon,x.MenuDesc,x.MenuOrderNo,x.MenuStatus,z.RoleName from tblMenu x inner join tblRoleMenu y 
on x.MenuId=y.MenuId inner join tblRole z on y.RoleId=z.RoleId
Where z.RoleId=@RoleId and x.IsPublished=@IsPublished";
                command.CommandType = CommandType.Text;
                command.Parameters.Add(status);
                command.Parameters.Add(user);
                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet("Data");
                adapter.Fill(dataSet);
                allData = (dataSet.Tables[0].AsEnumerable().Select(dataRow => new NavModel
                {

                    MenuId = dataRow.Field<int>("MenuId"),
                    MenuName = dataRow.Field<string>("MenuName") ?? string.Empty,
                    MenuIcon = dataRow.Field<string>("MenuIcon") ?? string.Empty,
                    OrderNo = dataRow.Field<float>("MenuOrderNo"),
                    IsAction = dataRow.Field<bool>("IsAction"),
                    ParentId = dataRow.Field<int>("ParentId"),

                })).ToList();

            }
            var menuList = allData.Where(x => x.ParentId == 0);
         
            var result = this.BindHierarchy(menuList, 0);

            return result;
        }

        public NavModel GetMenuItem(int _MenuId)
        {
            var data = (from nav in Context.tblMenus.Where(x => x.MenuId == _MenuId)
                        select new NavModel
                        {
                            MenuId = nav.MenuId,
                            ParentId = nav.ParentId,
                            MenuName = nav.MenuName,
                            MenuIcon = nav.MenuIcon,
                            Description = nav.MenuDesc,
                            IsAction = nav.IsAction,
                            OrderNo = nav.MenuOrderNo.HasValue ? nav.MenuOrderNo.Value : 0.0f
                        }).FirstOrDefault();
            return data;
        }




    
        private IEnumerable<NavModel> BindHierarchy(IEnumerable<NavModel> MenuList, int? parentId)
        {
            var childMenus = MenuList.Where(o => o.ParentId == parentId).ToList();
            var menuTree = new List<NavModel>();
            foreach (var menu in childMenus)
            {
                //            var t = new Team();
                var children = BindHierarchy(MenuList, menu.MenuId);
                //			t.Email=team.team,
                menu.SubMenu = children.ToList();
                menuTree.Add(menu);
            }
            return menuTree.OrderByDescending(x => x.OrderNo).Reverse();
        }





















    }
}

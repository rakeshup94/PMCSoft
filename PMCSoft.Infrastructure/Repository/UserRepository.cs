


using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Threading.Tasks;

namespace PMCSoft.Infrastructure.Repository
{
    public class UserRepository : GenericRepository<tblUser>, IUserRepository
    {
        public UserRepository(IDataContext context)
          : base(context)
        {
        }
        public PMCSoftContext Context
        {
            get { return base.entities as PMCSoftContext; }
        }

        public IEnumerable<RoleModel> GetAllRole()
        {
            var data = (from role in Context.tblRoles
                        select new RoleModel
                        {
                            RoleId = role.RoleId,
                            RoleName = role.RoleName,
                        }).OrderBy(x => x.RoleId).ToList();
            return data;

        }
        public IEnumerable<RoleModel> GetRole(bool IsPublished)
        {

            var data = (from role in Context.tblRoles.Where(x => x.IsPublished == IsPublished)
                        select new RoleModel
                        {
                            RoleId = role.RoleId,
                            RoleName = role.RoleName,
                        }).OrderBy(x => x.RoleId).ToList();
            return data;
        }



        public IEnumerable<RoleMenu> GetUserMenu(long UserId, bool IsPublished)
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

            var action = new SqlParameter();
            action.ParameterName = "@IsAction";
            action.Direction = ParameterDirection.Input;
            action.SqlDbType = SqlDbType.Bit;
            action.Value = true;

            List<RoleMenu> menuList = null;
            using (SqlCommand command = (SqlCommand)Context.Database.Connection.CreateCommand())
            {

                SqlDataAdapter adapter = new SqlDataAdapter();
                command.CommandText = @"Select x.*,y.RoleId,z.UserId from  tblMenu x inner join tblRoleMenu y on x.MenuId=y.MenuId 
inner join tblUserRoles z on y.RoleId=z.RoleId
Where z.UserId=@UserId and x.IsPublished=@IsPublished and x.IsAction=@IsAction";
                command.CommandType = CommandType.Text;
                command.Parameters.Add(status);
                command.Parameters.Add(user);
                command.Parameters.Add(action);
                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet("Data");
                adapter.Fill(dataSet);
                menuList = (dataSet.Tables[0].AsEnumerable().Select(dataRow => new RoleMenu
                {
                    MenuId = dataRow.Field<int>("MenuId"),
                    MenuName = dataRow.Field<string>("MenuName") ?? string.Empty,
                    MenuIcon = dataRow.Field<string>("MenuIcon") ?? string.Empty,
                    IsChecked = true

                })).ToList();

            }


            return menuList;
        }













        public IEnumerable<RoleMenu> GetRoleMenu(long RoleId, bool IsPublished)
        {
            var status = new SqlParameter();
            status.ParameterName = "@IsPublished";
            status.Direction = ParameterDirection.Input;
            status.SqlDbType = SqlDbType.Bit;
            status.Value = IsPublished;
            var Role = new SqlParameter();
            Role.ParameterName = "@RoleId";
            Role.Direction = ParameterDirection.Input;
            Role.SqlDbType = SqlDbType.BigInt;
            Role.Value = RoleId;

            var action = new SqlParameter();
            action.ParameterName = "@IsAction";
            action.Direction = ParameterDirection.Input;
            action.SqlDbType = SqlDbType.Bit;
            action.Value = true;


            List<RoleMenu> menuList = null;
            using (SqlCommand command = (SqlCommand)Context.Database.Connection.CreateCommand())
            {

                SqlDataAdapter adapter = new SqlDataAdapter();
                command.CommandText = @"Select x.*,y.RoleId,z.UserId from  tblMenu x inner join tblRoleMenu y on x.MenuId=y.MenuId 
Where y.RoleId=@RoleId and x.IsPublished=@IsPublished and x.IsAction=@IsAction";
                command.CommandType = CommandType.Text;
                command.Parameters.Add(status);
                command.Parameters.Add(Role);
                command.Parameters.Add(action);

                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet("Data");
                adapter.Fill(dataSet);
                menuList = (dataSet.Tables[0].AsEnumerable().Select(dataRow => new RoleMenu
                {
                    MenuId = dataRow.Field<int>("MenuId"),
                    MenuName = dataRow.Field<string>("MenuName") ?? string.Empty,
                    MenuIcon = dataRow.Field<string>("MenuIcon") ?? string.Empty,
                    IsChecked = true



                })).ToList();

            }


            return menuList;
        }












    }
}

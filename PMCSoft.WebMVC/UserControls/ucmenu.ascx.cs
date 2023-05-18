using System;   using IExpro.Core.DAL;   
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using IExpro.Core.Interfaces.Service;
using IExpro.Infrastructure.Repository;
using IExpro.Infrastructure.Services;
using IExpro.Core.Common;
using IExpro.Core.Models;

public partial class UserControls_ucmenu : System.Web.UI.UserControl
{



    INavigationService NavSrv;
    bool IsUpdated = false;
    public UserControls_ucmenu(INavigationService _NavSrv)
    {

        NavSrv = _NavSrv;
    }

    public UserControls_ucmenu()
    {
        this.NavSrv = new NavigationService(new UnitOfWork());
    }



    protected void Page_Load(object sender, EventArgs e)
    {

        IsUpdated = Convert.ToBoolean(ConfigurationManager.AppSettings["IsUpdate"]);



     

            if (Session["varUserId"] != null)
            {
                DataSet ds = new DataSet();
                string connStr = ErpGlobal.DBCONNECTIONSTRING;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    //string sql = @"select MenuID,DisplayName,NavigateURL,parentid,ToolTip,case NavigateURL when '' then 'false' else 'true' end Selectable from formname ";//inner join UserRights UR on UR.MenuId=formname.MenuId";
                    string sql = @"select UR.MenuID,Upper(DisplayName) As DisplayName,NavigateURL,parentid,ToolTip,case NavigateURL when '' then 'false' else 'true' end Selectable from formname inner join UserRights UR on UR.MenuId=formname.MenuId where UR.userid=" + Session["varuserid"] + " and CompanyId=" + Session["varCompanyId"] + " AND Isvisible=1 order By UR.Menuid ";
                    //            string sql = @"select MenuID,DisplayName,NavigateURL,parentid,ToolTip,case NavigateURL when '' then 'false' else 'true' end Selectable from formname WHERE (MenuID IN (SELECT Menuid FROM UserRights WHERE (UserId=" + Session["varuserid"] + @")))
                    //                            UNION select MenuID,DisplayName,NavigateURL,parentid,ToolTip,case NavigateURL when '' then 'false' else 'true' end Selectable from formname WHERE (ParentId IN (SELECT U.Menuid FROM UserRights AS U INNER JOIN FormName AS F ON U.Menuid = F.MenuID WHERE (F.ParentId IS NOT NULL) AND (U.UserId=" + Session["varuserid"] + @")))";

                    SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                    da.Fill(ds);
                    da.Dispose();
                }
                ds.DataSetName = "Menus";
                ds.Tables[0].TableName = "Menu";
                DataRelation relation = new DataRelation("ParentChild",
                ds.Tables["Menu"].Columns["MenuID"],
                ds.Tables["Menu"].Columns["parentid"], true);
                relation.Nested = true;
                ds.Relations.Add(relation);
                xmlDataSource.Data = ds.GetXml();
                xmlDataSource.EnableCaching = false;
            }



   


    }
}
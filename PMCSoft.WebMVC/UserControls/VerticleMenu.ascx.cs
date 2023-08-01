
using PMCSoft.Core.Common;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Navigation;
using PMCSoft.Infrastructure.Repository;
using PMCSoft.Infrastructure.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMCSoft.Web.UserControls
{
    public partial class VerticleMenu : BaseUserControl
    {
        INavigationService navSrv;
        List<NavModel> models = new List<NavModel>();
        public VerticleMenu(INavigationService _NavSrv)
        {
            navSrv = _NavSrv;
        }
        public VerticleMenu()
        {
            this.navSrv = new NavigationService(new UnitOfWork());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //var result = this.navSrv.GetUserMenu(User.UserId, true);
                //this.rptCategories.DataSource = result;
                //this.rptCategories.DataBind();
            }
        }
        protected void rptMenu_OnItemBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (this.models != null)
                    {
                        NavModel drv = e.Item.DataItem as NavModel;
                        string parentId = drv.MenuId.ToString();
                        string parentTitle = drv.MenuName.ToString();
                        NavModel _menu = this.models.Where(x => x.MenuId == drv.MenuId).FirstOrDefault();
                        if (_menu.MenuList.Count() > 0)
                        {
                            StringBuilder sb = new StringBuilder();
                            sb.Append("<ul id='" + parentId + "' class='nav nav-second-level'>");
                            foreach (var item in _menu.SubMenu)
                            {
                                string childId = item.MenuId.ToString();
                                string childTitle = item.MenuName.ToString();
                                IEnumerable<NavModel> childRow = item.SubMenu;
                                item.NavigateURL = this.GetItemUrl(item.NavigateURL);
                                sb.Append("<li>");
                                if (childRow.Count() > 0)
                                {
                                    sb.Append("<a class='second-level-heading' href='" + item.NavigateURL + "'>");
                                    sb.Append("<span class='submenu-title'>" + item.MenuName.FirstCharToUpper() + "</span>");
                                    sb.Append("<span class='fa arrow  text-white'></span></a>");
                                    CreateChild(sb, childId, childTitle, childRow);
                                    sb.Append("</li>");
                                }
                                else
                                {
                                    sb.Append("<a href='" + item.NavigateURL + "'>");
                                    sb.Append("<span class='submenu-title'>" + item.MenuName.FirstCharToUpper() + "</span>");
                                    sb.Append("</a>");
                                    sb.Append("</li>");
                                }
                            }
                            sb.Append("</ul>");
                            (e.Item.FindControl("ltrlSubMenu") as Literal).Text = sb.ToString();
                        }
                    }
                }
            }
        }

        private StringBuilder CreateChild(StringBuilder sb, string parentId, string parentTitle, IEnumerable<NavModel> parentRows)
        {
            if (parentRows.Count() > 0)
            {
                sb.Append("<ul id='" + parentTitle + "' class='nav nav-third-level'>");
                foreach (var item in parentRows)
                {
                    string childId = item.MenuId.ToString();
                    string childTitle = item.MenuName.ToString();
                    IEnumerable<NavModel> childRow = item.SubMenu;
                    item.NavigateURL = this.GetItemUrl(item.NavigateURL);
                    if (childRow.Count() > 0)
                    {
                        sb.Append("<li><a class='second-level-heading' href='" + item.NavigateURL + "'>");
                        sb.Append("<span class='submenu-title'>" + item.MenuName.FirstCharToUpper() + "</span>");
                        sb.Append("<span class='fa arrow  text-white'></span></a>");
                        CreateChild(sb, childId, childTitle, childRow);
                        sb.Append("</li>");
                    }
                    else
                    {
                        sb.Append("<li><a href='" + item.NavigateURL + "'>");
                        sb.Append("<span class='submenu-title'>" + item.MenuName.FirstCharToUpper() + "</span>");
                        sb.Append("</a>");
                        sb.Append("</li>");
                    }
                }
                sb.Append("</ul>");
            }
            return sb;
        }

        public string FirstCharToUpper(string input)
        {
            switch (input)
            {
                case null: throw new ArgumentNullException(nameof(input));
                case "": throw new ArgumentException($"{nameof(input)} cannot be empty", nameof(input));
                default: return input[0].ToString().ToUpper() + input.Substring(1).ToLower();
            }
        }

        public string GetItemUrl(string input)
        {
            try
            {
                if (!string.IsNullOrEmpty(input))
                {


                    return Page.ResolveUrl(input.Replace("../", "~/"));


                }
                else
                {
                    return "#";
                }
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

    }
}
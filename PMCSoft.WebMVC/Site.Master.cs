using System;   using IExpro.Core.DAL;   
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace IExproERP.UI
{
    public partial class SiteMaster : MasterPage
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["varCompanyId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["varcompanyId"].ToString() == "20")
                {
                    //   trheader.Visible = false;
                }
                imgLogo.ImageUrl.DefaultIfEmpty();
                if (File.Exists(Server.MapPath("~/Images/Logo/" + Session["varCompanyId"] + "_company.gif")))
                {
                    imgLogo.ImageUrl = "~/Images/Logo/" + Session["varCompanyId"] + "_company.gif?" + DateTime.Now.ToString("dd-MMM-yyyy");
                }
                LblCompanyName.Text = Session["varCompanyName"].ToString();
                LblUserName.Text = Session["varusername"].ToString();
                LblFrmName.Text = Page.Title.ToUpper().ToString();
             

            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            UtilityModule.LogOut(Convert.ToInt32(Session["varuserid"]));
            Session["varuserid"] = null;
            Session["varCompanyId"] = null;
            string message = "you are successfully loggedout..";
            Response.Redirect("~/Login.aspx?Message=" + message + "");
        }
      
    }

}
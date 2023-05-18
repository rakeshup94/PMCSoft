


using System;
using System.Web.UI;


namespace PMCSoft.WebMVC
{
    public partial class SiteMaster : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{

            //    if (Session["varCompanyId"] == null)
            //    {
            //        Response.Redirect("~/Login.aspx");
            //    }
            //    if (Session["varcompanyId"].ToString() == "20")
            //    {
            //        //   trheader.Visible = false;
            //    }
            //    imgLogo.ImageUrl.DefaultIfEmpty();
            //    if (File.Exists(Server.MapPath("~/Images/Logo/" + Session["varCompanyId"] + "_company.gif")))
            //    {
            //        imgLogo.ImageUrl = "~/Images/Logo/" + Session["varCompanyId"] + "_company.gif?" + DateTime.Now.ToString("dd-MMM-yyyy");
            //    }
            //    LblCompanyName.Text = Session["varCompanyName"].ToString();
            //    LblUserName.Text = Session["varusername"].ToString();
            //    LblFrmName.Text = Page.Title.ToUpper().ToString();


            //}
        }
       

        protected void ltnLogout_Click(object sender, EventArgs e)
        {

        }
    }

}
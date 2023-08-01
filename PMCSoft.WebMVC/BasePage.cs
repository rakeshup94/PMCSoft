using PMCSoft.Infrastructure.Data;
using PMCSoft.Web.Models;
using System;
using System.Web;

namespace PMCSoft.Web
{

    public class BasePage : System.Web.UI.Page
    {
        protected BALPMC PMC
        {
            get { return new BALPMC(); }
        }

        protected virtual new CustomPrincipal User
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }



        //// on your base page
        //protected void TryAction(Action action)
        //{
        //    try
        //    {
        //        action();
        //    }
        //    catch (Exception e)
        //    {
        //        // write exception to output (Response.Write(str))
        //    }
        //}

        //protected void TryFunction<T>(Func<T> func)
        //{

        //    try
        //    {
        //        return func();
        //    }
        //    catch (Exception e)
        //    {
        //        // write exception to output (Response.Write(str))

        //        return default(T);// have to return something now because it's a function.
        //    }
        //}




        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    TryAction(() => {
        //        // Do stuff here - save to database etc
        //    });
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    return TryFunction<string>(() => {
        //        // Do stuff here - save to database etc
        //        return "woo";
        //    });
        //}

        public void Page_Error(Object sender, EventArgs e)
        {
           // Request.IsAuthenticated = true;
            // Implementation here
        }




        public void ShowMessage(string message)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        //protected void Page_Load(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        Business obj = new Business();
        //        obj.SomeMethod();
        //    }
        //    catch (Exception ex)
        //    {
        //        ShowMessage(ex.Message);
        //    }



        //}
        //protected override void OnInit(EventArgs e)
        //{
        //    base.OnInit(e);
        //    this.Error += CatchError;
        //}

        //void CatchError(object sender, EventArgs e)
        //{
        //    // Handle exception here..
        //    Exception Err = Server.GetLastError();

        //    throw Err;
        //    //Server.ClearError();
        //    // pass exception to the page via url paramters 
        //    //Response.Redirect(Request.Url.ToString() + "?Ex =" + Err.Message);

        //}

        // use that query string to display messgae..
    }
}
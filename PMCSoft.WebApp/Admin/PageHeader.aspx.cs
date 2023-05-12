using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
 
using PMCSoft.Infrastructure.Data;
public partial class Admin_PageHeader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text != "")
            {
                Hashtable ht = new Hashtable();
                ht.Add("@MenuHeaderName", txtName.Text);
                DataTable DT = PMCApp.Get(ht, "CheckMenuHeader");
                if (DT.Rows.Count > 0)
                {
                    string scripts = "alert('Page name  already exists.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }

                else
                {

                    Hashtable ht1 = new Hashtable();
                    ht1.Add("@MenuHeaderName", txtName.Text);
                    PMCApp.Get(ht1, "InsertMenuHeader");
                    txtName.Text = "";
                    // GetUnit();
                    string scripts = "alert('Insert Successfully.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }


            }
            else
            {
                string scripts = "alert('Kindly fill Page name.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        catch (Exception ex)
        {
            string scripts = "alert('Some error occurs.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {


    }
}

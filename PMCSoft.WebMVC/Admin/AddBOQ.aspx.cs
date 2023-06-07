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


namespace PMCSoft.Web.Admin
{
    public partial class AddBOQ : System.Web.UI.Page
    {
        BALPMC PMC = new BALPMC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                BindProject();
            }
        }
        public void BindProject()
        {
            try
            {
                PMC.BindProjectDdl(ddlProject);
                PMC.BindProjectDdl(ddlProjectSub);
                PMC.BindProjectDdl(ddlProjectSubPart);
            }
            catch (Exception ex)
            { throw ex; }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
        protected void btnSubSubmit_Click(object sender, EventArgs e)
        {

        }
        protected void btnSubCancel_Click(object sender, EventArgs e)
        {

        }
        protected void btnPartSubmit_Click(object sender, EventArgs e)
        {

        }
        protected void btnPartCancel_Click(object sender, EventArgs e)
        {

        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {

        }
        protected void btnBOQUpload_Click(object sender, EventArgs e)
        {

        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonList1.SelectedValue.ToString() == "0")
                {
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                }
                else if (RadioButtonList1.SelectedValue.ToString() == "1")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}

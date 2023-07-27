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
    public partial class BOQItems : BasePage
    {
        BALPMC PMC = new BALPMC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUnit();
            }
        }
        public void GetUnit()
        {
            try
            {
                PMC.BindUnitddl(ddlUnit);
                PMC.BindUnitddl(ddlSubUnit);
                PMC.BindUnitddl(ddlPartUnit);
            }
            catch (Exception ex)
            { }
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
    }
}
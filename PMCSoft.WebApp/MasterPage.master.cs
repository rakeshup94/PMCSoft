using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
 
using PMCSoft.Infrastructure.Data;
using PMCSoft.Infrastructure.Data;

namespace WebApp
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null || Session["UserName"] == null || Session["CompID"] == null || Session["AName"] == null || Session["UserEmail"] == null || Session["AID"] == null || Session["PRJID"] == null)
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    //Menu1.Visible = false;
                    Response.Redirect("~/Login.aspx?Value=" + "2");
                }
                else
                {
                    Hashtable ht = new Hashtable();
                    ht.Add("@UserId", Session["UserId"]);
                    DataTable dt = PMCApp.Get(ht, "PagePermission");
                    if (dt.Rows.Count > 0)
                    {
                        for (int k = 0; k < dt.Rows.Count; k++)
                        {
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Project" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                PRJIDId.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Add Project" && dt.Rows[k]["PageValue"].Equals("True"))
                                {
                                    AddPrjId.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Add Project" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    AddPrjId.Visible = false;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View/Edit Project" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    PrjidView.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View/Edit Project" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    PrjidView.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Project" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                PRJIDId.Visible = false;
                                AddPrjId.Visible = false;
                                PrjidView.Visible = false;
                            }
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Master" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                if (dt.Rows[k]["PageName"].ToString() == "Department" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    //  IdDept.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Department" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    //   IdDept.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Designation" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    //IdDesignation.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Designation" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    //  IdDesignation.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Bank/Branch" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    //  IDBankandBranch.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Bank/Branch" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    //  IDBankandBranch.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Unit" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    // IdUnit.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Unit" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    // IdUnit.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Item Group" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    // IdItemGroup.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Item Group" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    //  IdItemGroup.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Item Master" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    //IdItemMaster.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Item Master" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    //IdItemMaster.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Advance Requisition Type" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    //IdTypeOfAdvanceRequisition.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Advance Requisition Type" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    // IdTypeOfAdvanceRequisition.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Security" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    // IdSecurity.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Security" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    // IdSecurity.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Inventory Opening Date" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    // IdInventoryOpeningDate.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Inventory Opening Date" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    // IdInventoryOpeningDate.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Master" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                //IdMaster.Visible = false;
                                // IdDept.Visible = false;
                                // IdDesignation.Visible = false;

                                // IDBankandBranch.Visible = false;

                                //IdUnit.Visible = false;
                                //IdItemGroup.Visible = false;
                                //   IdItemMaster.Visible = false;

                                // IdTypeOfAdvanceRequisition.Visible = false;
                                // IdSecurity.Visible = false;
                                //IdInventoryOpeningDate.Visible = false;

                            }




                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "User" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                IDUser.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Add User" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdAddUser.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Add User" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdAddUser.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View User" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdViewUser.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View User" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdViewUser.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "User" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                IDUser.Visible = false;
                                IdAddUser.Visible = false;
                                IdViewUser.Visible = false;
                            }
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                IdStaffS.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Add Staff" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdAddStaff.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Add Staff" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdAddStaff.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View Staff" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdViewStaff.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View Staff" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdViewStaff.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Staff" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                IdStaffS.Visible = false;
                                IdAddStaff.Visible = false;
                                IdViewStaff.Visible = false;
                            }
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Notification" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                IdNotification.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Add Notification" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdAddNotification.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Add Notification" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdAddNotification.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Notification" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                IdNotification.Visible = false;
                                IdAddNotification.Visible = false;

                            }
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("True"))
                            {
                                IdReport.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdWorkProgrammeReport.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Work Programe Report" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdWorkProgrammeReport.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdMorningReport.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Morning Report" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdMorningReport.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdStaffAttendance.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Staff Attendance" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdStaffAttendance.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdMaterialReciveByProjectwise.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Project wise" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdMaterialReciveByProjectwise.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdMaterialReciveByProjectDate.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Date wise" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdMaterialReciveByProjectDate.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdMaterialReciveProjectAndVendor.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Material Recieved Vendor wise" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdMaterialReciveProjectAndVendor.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdMonthlyVWD.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "View Monthly VWD" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdMonthlyVWD.Visible = false;

                                }
                                if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdRaChart.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "RA Chart" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdRaChart.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Report" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                IdReport.Visible = false;
                                IdWorkProgrammeReport.Visible = false;
                                IdMorningReport.Visible = false;
                                IdStaffAttendance.Visible = false;
                                IdMaterialReciveByProjectwise.Visible = false;
                                IdMaterialReciveProjectAndVendor.Visible = false;
                                IdMonthlyVWD.Visible = false;
                                IdRaChart.Visible = false;


                            }
                            if (dt.Rows[k]["MenuHeaderName"].ToString() == "Permission" && dt.Rows[k]["PageValue"].Equals("True"))
                            {
                                IdPermission.Visible = true;
                                if (dt.Rows[k]["PageName"].ToString() == "Add Permission" && dt.Rows[k]["PageValue"].Equals("True"))
                                {

                                    IdAddPermission.Visible = true;
                                }
                                if (dt.Rows[k]["PageName"].ToString() == "Add Permission" && dt.Rows[k]["PageValue"].Equals("False"))
                                {
                                    IdPermission.Visible = false;

                                }

                            }
                            else if (dt.Rows[k]["MenuHeaderName"].ToString() == "Permission" && dt.Rows[k]["MenuHeadervalue"].Equals("False"))
                            {
                                IdPermission.Visible = false;
                            }





                        }
                    }
                }
            }
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            try
            {
                string Value = "1";
                //string url = string.Format("~/Login.aspx?Value={0}", Server.UrlEncode(Value));
                //Response.Redirect(url);
                Response.Redirect("~/Login.aspx?Value=" + "1");
            }
            catch (Exception ex)
            { }
        }
        protected void ImgImage_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Admin/Home.aspx");
            }
            catch (Exception ex)
            { }
        }
        protected void ImgSetting_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Admin/ChangePassword.aspx");
            }
            catch (Exception ex)
            { }
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {
            // MenuItem menuItem = ((MenuItem)e.Item);

            //if (menuItem.Parent == null)
            //    Menu1.Items.Remove(menuItem);
            //else
            //    menuItem.Parent.ChildItems.Remove(menuItem);


        }
    }
}
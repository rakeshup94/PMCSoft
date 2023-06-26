using INGM.Core.ViewModel.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INGM.Web.Models
{
    public class PermissionManager
    {
        static readonly string PERMISSION_SESSIONNAME = "UserPermissions";
        AccountUser _loggedInUserContact;

        List<AccessRight> _accessibleFeatures = new List<AccessRight>();


        public static bool enablePermissioningSystem
        {
            get { return true; }
        }

        public AccountUser loggedInUserContact
        {
            get { return _loggedInUserContact; }
            set { _loggedInUserContact = value; }
        }

        public List<AccessRight> accessibleFeatures
        {
            get { return _accessibleFeatures; }
            set { _accessibleFeatures = value; }
        }
        public static PermissionManager getPermissions()
        {
            PermissionManager userPermissions = SessionManager.getSession<PermissionManager>(PERMISSION_SESSIONNAME);
            return userPermissions;
        }
        public static void setPermissions(AccountUser loggedInUser)
        {
            PermissionManager userPermissions = new PermissionManager();
            userPermissions.loggedInUserContact = loggedInUser;
            userPermissions.accessibleFeatures = loggedInUser.lstRight.ToList();
            SessionManager.setSession<PermissionManager>(PERMISSION_SESSIONNAME, userPermissions);
        }
        public static void logout()
        {
            SessionManager.setSession<PermissionManager>(PERMISSION_SESSIONNAME, null);
        }
        public static List<string> getAccessibleRightsControlID()
        {
            PermissionManager userPermissions = PermissionManager.getPermissions();
            return userPermissions.accessibleFeatures.Select(x => x.RightCode.ToString()).ToList();
        }




        public static int getAccessRight(string rightCode)
        {
            //bool Istrue = false;

            int count = 0;

            if (SessionManager.checkIfSessionExist(PERMISSION_SESSIONNAME))
            {
                PermissionManager userPermissions = PermissionManager.getPermissions();
                count = userPermissions.accessibleFeatures.Where(x => x.RightCode == rightCode).ToList().Count;
            }


            return count;


            //var result = userPermissions.accessibleFeatures.Where(x => x.RightCode == rightCode).ToList();
            //if (result.Count>0)
            //{
            //    Istrue = true;
            //}
            //return Istrue;
        }

    }
    public class JsonPermissionManager
    {
        bool _enablePerm;
        List<string> _controlIDS = new List<string>();
        public bool enablePerm
        {
            get { return _enablePerm; }
            set { _enablePerm = value; }
        }
        public List<string> controlIDS
        {
            get { return _controlIDS; }
            set { _controlIDS = value; }
        }
    }
}
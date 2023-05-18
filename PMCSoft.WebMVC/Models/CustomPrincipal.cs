
using System.Linq;
using System.Security.Principal;


namespace PMCSoft.WebMVC.Models
{
    public class CustomPrincipal : IPrincipal
    {
        public IIdentity Identity { get; private set; }
        public bool IsInRole(string role)
        {
            if (roles.Any(r => role.Contains(r)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public CustomPrincipal(string Username)
        {
            this.Identity = new GenericIdentity(Username);
        }
        public long UserId { get; set; }
        public int ProjectId { get; set; }
        public string EmpNo { get; set; }
        public string ProjectNo { get; set; }
        public string CompanyId { get; set; }

        public long LoginId { get; set; }
        public int CultureId { get; set; }
        public int UserTypeId { get; set; }
        public string UserType { get; set; }

        public string Email { get; set; }
        public string EmpName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string[] roles { get; set; }
        public string TimeZone { get; set; }
       



    }



    public class CustomSerializePrincipal
    {
        public long UserId { get; set; }
        public int ProjectId { get; set; }
        public string EmpNo { get; set; }
        public string ProjectNo { get; set; }
        public string CompanyId { get; set; }

        public long LoginId { get; set; }
        public int CultureId { get; set; }
        public int UserTypeId { get; set; }
        public string UserType { get; set; }

        public string Email { get; set; }
        public string EmpName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string[] roles { get; set; }
        public string TimeZone { get; set; }


    }



















}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Models.Account
{
    public class AccountUser
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




    }
}


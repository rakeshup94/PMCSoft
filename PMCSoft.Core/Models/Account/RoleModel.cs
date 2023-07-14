using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Models.Account
{

    public class RoleModel : AuditableEntity
    {
        public int RoleId { get; set; }
        public string RoleName { get; set; }
      
    }
}

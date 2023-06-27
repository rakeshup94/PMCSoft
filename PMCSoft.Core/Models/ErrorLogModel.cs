using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Models
{
    public class ErrorLogModel
    {
        public long LogId { get; set; }
        public string MachinName { get; set; }
        public string HostName { get; set; }
        public string MachinUser { get; set; }
        public string IPAddress { get; set; }
        public string UserAgentInfo { get; set; }
        public string LoginId { get; set; }     
        public string UserTimeZone { get; set; }
        public string UserCulture { get; set; }
        public string URL { get; set; }
        public string Message { get; set; }
        public string Source { get; set; }
        public string StackTrace { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        
    }
}

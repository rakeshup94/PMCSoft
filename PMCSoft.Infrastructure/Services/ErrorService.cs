
using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Infrastructure.Services
{
    public class ErrorService : IErrorService
    {
        private IUnitOfWork IU { get; set; }
        private IGenericRepository<tblException> ExceptRepo { get; set; }
        public ErrorService(IUnitOfWork _IU)
        {
            this.IU = _IU;
            this.ExceptRepo = IU.GenericRepository<tblException>();
        }
        public long AddErrorLog(ErrorLogModel model)
        {
            tblException exModel = new tblException();

            exModel.MachineName = model.MachinName;
            exModel.MachinUser = model.MachinUser;
            exModel.IpAddress = model.IPAddress;
            exModel.UserAgentInfo = model.UserAgentInfo;
            exModel.LoginId = model.LoginId;
            exModel.TimeZone = model.UserTimeZone;
            exModel.Culture = model.UserCulture;            
            exModel.URL = model.URL;
            exModel.Message = model.Message;
            exModel.Source = model.Source;
            exModel.StackTrace = model.StackTrace;

            exModel.OccuredBy = model.CreatedBy;
            exModel.OccuredOn = model.CreatedOn;



            this.ExceptRepo.Add(exModel);
            this.IU.SaveChanges();
            return exModel.ExceptionId;
        }




        public IEnumerable<ErrorLogModel> ErrorList()
        {

            var item = this.ExceptRepo.GetAll();
            var lst = item.Select(x => new ErrorLogModel
                {
                    LogId = x.ExceptionId,
                    MachinName = x.MachineName,
                    MachinUser = x.MachinUser,
                    IPAddress = x.IpAddress,
                    UserAgentInfo = x.UserAgentInfo,
                    LoginId = x.LoginId,
                    UserTimeZone = x.TimeZone,
                    UserCulture = x.Culture,
                    URL = x.URL,
                    Message = x.Message,
                    Source = x.Source,
                    StackTrace = x.StackTrace,
                    CreatedOn = x.OccuredOn,
                });
            return lst;
        }










    }
}



using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models.Account;
using PMCSoft.Infrastructure.Repository;

namespace PMCSoft.Infrastructure.Services
{
    public class AccountService : IAccountService
    {


        private IUnitOfWork IU { get; set; }
        private IAccountRepository AccountRepo { get; set; }


        public AccountService(IUnitOfWork _IU)
        {
            this.IU = _IU;
            this.AccountRepo = IU.AccontRepo;

        }
        public AccountService()
        {
            this.IU = new UnitOfWork();
            this.AccountRepo = IU.AccontRepo;

        }
        public AccountUser LoginUser(string email, string password)
        {
            AccountUser model = this.AccountRepo.AuthenticateUser(email, password);
            return model;
        }






    }
}

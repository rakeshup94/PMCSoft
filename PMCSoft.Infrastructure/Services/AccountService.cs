

using PMCSoft.Core.Interfaces.Repository;
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using PMCSoft.Infrastructure.Repository;
using System.Threading.Tasks;

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
        public async Task<ServiceResponse<AccountUser>> LoginUser(string _email, string _password)
        {
            return await this.AccountRepo.Authentication(_email, _password);
        }






    }
}

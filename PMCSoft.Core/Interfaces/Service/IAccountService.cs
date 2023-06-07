using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Service
{
    public interface IAccountService
    {
        Task<ServiceResponse<AccountUser>> LoginUser(string _email, string _password);
       

    }
}


 
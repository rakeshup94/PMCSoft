using PMCSoft.Core.Entity;
using PMCSoft.Core.Models;
using PMCSoft.Core.Models.Account;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Repository
{
    public interface IAccountRepository : IGenericRepository<tblEmployeeMaster>
    {
        AccountUser AuthenticateUser(string _email, string _password);
        Task<ServiceResponse<AccountUser>> Authentication(string _email, string _password);
    }
}

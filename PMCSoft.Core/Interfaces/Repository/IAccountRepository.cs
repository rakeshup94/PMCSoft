using PMCSoft.Core.Entity;
using PMCSoft.Core.Models.Account;


namespace PMCSoft.Core.Interfaces.Repository
{
    public interface IAccountRepository : IGenericRepository<tblEmployeeMaster>
    {
        AccountUser AuthenticateUser(string _email, string _password);
     
    }
}

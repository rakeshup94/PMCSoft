using PMCSoft.Core.Models.Account;


namespace PMCSoft.Core.Interfaces.Service
{
    public interface IAccountService
    {
        AccountUser LoginUser(string _email, string _password);
      
    }
}


 
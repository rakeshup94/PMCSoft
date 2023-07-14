
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Repository
{
    public interface IUnitOfWork
    {
        IGenericRepository<T> GenericRepository<T>() where T : class;

        /// <summary>
        /// This region  is  created by user Rakesh
        /// </summary>    
        #region Rakesh
        IAccountRepository AccontRepo { get; }
        INavigationRepository NavRepository { get; }
        IUserRepository UserRepository { get; }

        #endregion

        void SaveChanges();



    }



}

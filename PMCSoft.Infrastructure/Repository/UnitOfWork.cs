using PMCSoft.Core.Entity;
using PMCSoft.Core.Interfaces.Common;
using PMCSoft.Core.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Linq;



namespace PMCSoft.Infrastructure.Repository
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {

        protected IDataContext entities = null;

        public UnitOfWork(IDataContext Context)
        {
            entities = Context;
        }

        public UnitOfWork()
        {
            entities = new PMCSoftContext();
        }

        public Dictionary<Type, object> repositories = new Dictionary<Type, object>();
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public IGenericRepository<T> GenericRepository<T>() where T : class
        {
            if (repositories.Keys.Contains(typeof(T)) == true)
            {
                return repositories[typeof(T)] as IGenericRepository<T>;
            }
            IGenericRepository<T> repo = new GenericRepository<T>(entities);
            repositories.Add(typeof(T), repo);
            return repo;
        }







        private IAccountRepository _AccontRepo;
        public IAccountRepository AccontRepo
        {
            get
            {
                if (_AccontRepo != null)
                    return _AccontRepo;
                else
                    return _AccontRepo = new AccountRepository(entities);

            }

        }



        private INavigationRepository _NavRepository;
        public INavigationRepository NavRepository
        {
            get
            {
                if (_NavRepository != null)
                    return _NavRepository;
                else
                    return _NavRepository = new NavigationRepository(entities);

            }

        }
        private IUserRepository _UserRepository;
        public IUserRepository UserRepository
        {
            get
            {
                if (_UserRepository != null)
                    return _UserRepository;
                else
                    return _UserRepository = new UserRepository(entities);

            }

        }



        public void SaveChanges()
        {
            entities.Save();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    entities.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }






    }

}

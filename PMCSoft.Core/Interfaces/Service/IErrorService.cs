
using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Service
{
    public interface IErrorService
    {

        /// <summary>
        /// This region is  created by user Rakesh
        /// </summary>    
        #region Rakesh
        //Changes in add and update methods are done by ragini for multi-currency,added new argument of lstCurr
        long AddErrorLog(ErrorLogModel model);
        IEnumerable<ErrorLogModel> ErrorList();

        #endregion




    }
}

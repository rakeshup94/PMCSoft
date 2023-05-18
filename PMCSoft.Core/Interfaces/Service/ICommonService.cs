using PMCSoft.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMCSoft.Core.Interfaces.Service
{
    public interface ICommonService
    {
        List<MenuModel> GetCompanyList();
        List<MenuModel> GetCustomerList();
        List<MenuModel> GetSessionList();
        List<MenuModel> GetDocTypeList();
        List<MenuModel> GetPrintTypeList();
    }
}

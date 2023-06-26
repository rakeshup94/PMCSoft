using INGM.Web.Models.Transfer;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INGM.Web.Helpers
{
    public class StaticCache
    {
        public static void LoadStaticCache()
        {
            HttpContext.Current.Application["CachList"] = SqlHelper.GetCatchList();
        }
        public static Hashtable GetCatchList()
        {
            return HttpContext.Current.Application["CachList"] as Hashtable;
        }

    }
}
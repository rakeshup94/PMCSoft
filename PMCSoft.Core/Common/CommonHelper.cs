using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace PMCSoft.Core.Common
{



    public static class StringExtensions
    {
        public static string FirstCharToUpper(this string input)
        {
            switch (input)
            {
                case null: throw new ArgumentNullException(nameof(input));
                case "": throw new ArgumentException($"{nameof(input)} cannot be empty", nameof(input));
                default: return input[0].ToString().ToUpper() + input.Substring(1).ToLower();
            }
        }
    }


    public static class CommonHelper
    {
        public static string GetURI()
        {
            var urlBuilder = new UriBuilder(HttpContext.Current.Request.Url.AbsoluteUri) { Path = HttpContext.Current.Request.ApplicationPath, Query = null, Fragment = null };
            return urlBuilder.Uri.ToString();
        }
    }
}


using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml;
using System.Xml.Linq;
using System.Net;
using System.ComponentModel;

using System.Collections;
using System.Web.Routing;

namespace PMCSoft.Web.Helpers
{

    public static class CommonHelper
    {

        public static string GetNavPath(this string navURL)
        {
            UrlHelper Url = new UrlHelper(HttpContext.Current.Request.RequestContext);
            string path = "#";
            if (!string.IsNullOrEmpty(navURL))
            {
                path = Url.Content("~/" + navURL);
            }
            return path;
        }

        public static byte[] ConvertToBytes(HttpPostedFileBase image)
        {
            byte[] imageBytes = null;
            BinaryReader reader = new BinaryReader(image.InputStream);
            imageBytes = reader.ReadBytes((int)image.ContentLength);
            return imageBytes;
        }



        public static DateTime traWebDate(this string dateStr)
        {

            string dateTimeStr = dateStr;
            DateTime dte = DateTime.ParseExact(dateTimeStr.Trim(), "d MMM, yy", CultureInfo.InvariantCulture);
            return dte;
        }

        public static string ImagePath(this string imgPath, string noimgPath)
        {
            bool flag = File.Exists(HttpContext.Current.Server.MapPath(imgPath));
            imgPath = flag ? imgPath : noimgPath;
            return imgPath;
        }

        public static string GetIP()
        {
            string ipAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipAddress == null || ipAddress == "")
            {
                ipAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            return ipAddress;
        }

        public static string GetIPCountry(string ipAddress)
        {
            try
            {
                WebClient wc = new WebClient();
                var strJson = wc.DownloadString("http://api.ipstack.com/" + ipAddress + "?access_key=d7811d945b93d68f1d6a1a7eda909912&output=json");
                var ip = Newtonsoft.Json.Linq.JObject.Parse(strJson);
                return ip["country_name"].ToString();

            }
            catch
            {
                return "";
            }
        }

        public static string AlterFormat(this string strDate, string oldFormat, string newFormat)
        {
            DateTime dte = DateTime.ParseExact(strDate.Trim(), oldFormat, CultureInfo.InvariantCulture);
            return dte.ToString(newFormat);
        }

        public static string AlterFormat(this string strDate, int buffer, string oldFormat, string newFormat)
        {
            DateTime dte = DateTime.ParseExact(strDate.Trim(), oldFormat, CultureInfo.InvariantCulture);
            dte = dte.AddDays(buffer);
            return dte.ToString(newFormat);
        }

        public static XmlDocument ToXmlDocument(this XDocument xDocument)
        {
            var xmlDocument = new XmlDocument();
            using (var xmlReader = xDocument.CreateReader())
            {
                xmlDocument.Load(xmlReader);
            }
            return xmlDocument;
        }

        public static XmlDocument ToXmlDocument(this XElement xElement)
        {
            var xmlDocument = new XmlDocument();
            using (var xmlReader = xElement.CreateReader())
            {
                xmlDocument.Load(xmlReader);
            }
            return xmlDocument;
        }

        public static decimal ToFixed(this decimal amount, int digit)
        {

            return Math.Round(amount, digit);
        }

    }
}
using INGM.Core.ViewModel.Account;
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
using INGM.Web.Models.Transfer;
using System.Collections;

namespace INGM.Web.Helpers
{

    public static class Common
    {
        public static string ItemName(this LocationType _item)
        {
            string result = string.Empty;
            if (_item.PointType == 1)
            {
                result = _item.ItemName + "(" + _item.ItemCode + ")" + ", " + _item.City + ", " + _item.Country;
            }
            else
            {
                result = _item.ItemName + "(" + _item.CityCode + ")" + ", " + _item.City + ", " + _item.Country;
            }
            return result;
        }
        public static int GetSortOrder(this LocationType _item, string _search)
        {
            int order = 0;


            if (_item.PointType == 1)
            {
                bool ItemCode = _item.ItemCode.ToUpper().StartsWith(_search);
                bool CityCode = _item.CityCode.ToUpper().StartsWith(_search);
                bool ItemName = _item.ItemName.ToUpper().StartsWith(_search);
                if (ItemCode && CityCode && ItemName)
                {
                    order = 0;
                }
                else if (ItemCode && CityCode)
                {
                    order = 1;
                }
                else if (ItemCode && ItemName)
                {
                    order = 2;
                }
                else if (CityCode && ItemName)
                {
                    order = 3;
                }
                else if (ItemCode)
                {
                    order = 4;
                }
                else if (CityCode)
                {
                    order = 5;
                }
                else if (ItemName)
                {
                    order = 6;
                }
                else
                {
                    order = 7;
                }

            }
            else
            {
                bool CityCode = _item.CityCode.ToUpper().StartsWith(_search);
                bool ItemName = _item.ItemName.ToUpper().StartsWith(_search);
                bool CityName = _item.City.ToUpper().StartsWith(_search);
                if (CityCode && CityName && ItemName)
                {
                    order = 0;
                }
                else if (CityCode && CityName)
                {
                    order = 1;
                }
                else if (CityCode && ItemName)
                {
                    order = 2;
                }
                else if (CityName && ItemName)
                {
                    order = 3;
                }
                else if (CityCode)
                {
                    order = 4;
                }
                else if (CityName)
                {
                    order = 5;
                }
                else if (ItemName)
                {
                    order = 6;
                }
                else
                {
                    order = 7;
                }
            }
            return order;
        }

        public static bool SearchEvent(this LocationType Item, string searchText)
        {
            bool flag = false;

            if (Item.PointType == 1)
            {
                flag = Item.ItemCode.ToUpper().Contains(searchText)
                    || Item.CityCode.ToUpper().Contains(searchText)
                    || Item.ItemName.ToUpper().Contains(searchText);
            }
            else
            {
                flag = Item.CityCode.ToUpper().Contains(searchText)
                 || Item.ItemName.ToUpper().Contains(searchText)
                 || Item.City.ToUpper().Contains(searchText);
            }
            return flag;
        }



        public static Destination GetDestination(this string cityCode)
        {
            Destination result = SqlHelper.GetDestination().FirstOrDefault(x => x.CityCode == cityCode);
            return result;
        }


















        public static bool FirstSearch(this LocationType Item, string searchText)
        {
            bool flag = false;
            if (searchText.Length == 3 && Item.PointType == 1)
            {
                flag = Item.ItemCode.ToUpper().StartsWith(searchText.ToUpper()) || Item.CityCode.ToUpper().StartsWith(searchText.ToUpper());
            }
            else if (searchText.Length == 3 && Item.PointType == 2)
            {
                flag = Item.CityCode.ToUpper().StartsWith(searchText.ToUpper()) || Item.City.ToUpper().StartsWith(searchText.ToUpper()) || Item.Country.ToUpper().StartsWith(searchText.ToUpper()) || Item.ItemName.ToUpper().Contains(searchText.ToUpper());
            }
            else if (searchText.Length > 3)
            {
                flag = Item.CityCode.ToUpper().StartsWith(searchText.ToUpper()) || Item.City.ToUpper().StartsWith(searchText.ToUpper()) || Item.Country.ToUpper().StartsWith(searchText.ToUpper()) || Item.ItemName.ToUpper().Contains(searchText.ToUpper());
            }
            return flag;
        }



        public static bool SecondSearch(this LocationType Item, string searchText, int type, string cityCode)
        {
            bool flag = false;
            if (searchText.Length == 3 && Item.PointType == 1)
            {
                flag = (Item.PointType != type && Item.CityCode == cityCode) && (Item.ItemCode.ToUpper().StartsWith(searchText.ToUpper()) || Item.City.ToUpper().StartsWith(searchText.ToUpper()) || Item.Country.ToUpper().StartsWith(searchText.ToUpper()));
            }
            else if (searchText.Length == 3 && Item.PointType == 2)
            {
                flag = (Item.PointType != type && Item.CityCode == cityCode) && (Item.City.ToUpper().StartsWith(searchText.ToUpper()) || Item.Country.ToUpper().StartsWith(searchText.ToUpper()) || Item.ItemName.ToUpper().Contains(searchText.ToUpper()));
            }
            else if (searchText.Length > 3)
            {
                flag = (Item.PointType != type && Item.CityCode == cityCode) && (Item.City.ToUpper().StartsWith(searchText.ToUpper()) || Item.Country.ToUpper().StartsWith(searchText.ToUpper()) || Item.ItemName.ToUpper().Contains(searchText.ToUpper()));
            }
            return flag;
        }



        public static int CustomOR(this LocationType item, string searchText)
        {
            int flag = 0;
            bool CityCode = item.CityCode.ToUpper().Contains(searchText);
            bool ItemName = item.ItemName.ToUpper().Contains(searchText);
            bool CityName = item.City.ToUpper().Contains(searchText);
            if (ItemName && CityCode && CityName)
            {
                flag = 0;
            }
            else if (ItemName && CityCode)
            {
                flag = 1;
            }
            else if (ItemName && CityName)
            {
                flag = 2;
            }
            else if (CityName && CityCode)
            {
                flag = 3;
            }
            else if (ItemName)
            {
                flag = 4;
            }
            else if (CityCode)
            {
                flag = 5;
            }
            else if (CityName)
            {
                flag = 6;
            }
            return flag;
        }








        public static byte[] ConvertToBytes(HttpPostedFileBase image)
        {
            byte[] imageBytes = null;
            BinaryReader reader = new BinaryReader(image.InputStream);
            imageBytes = reader.ReadBytes((int)image.ContentLength);
            return imageBytes;
        }
        internal static bool isFeaturePresentInList(List<AccessRight> allFeatureList, string controllerName, string ActionName, string Parameter)
        {
            return allFeatureList.Where(f => f.ControllerName.Equals(controllerName, StringComparison.OrdinalIgnoreCase) && f.ActionName.Equals(ActionName, StringComparison.OrdinalIgnoreCase) && f.Parameter.Equals(Parameter, StringComparison.OrdinalIgnoreCase)).FirstOrDefault() != null;
        }


        public static DateTime travayooDateTime(string dateStr, string timeStr)
        {
            string dateTimeStr = dateStr + " " + timeStr;
            DateTime dte = DateTime.ParseExact(dateTimeStr.Trim(), "d MMM, yy hh:mm tt", CultureInfo.InvariantCulture);
            return dte;
        }
        public static DateTime travayooDate(string dateStr)
        {

            string dateTimeStr = dateStr;
            DateTime dte = DateTime.ParseExact(dateTimeStr.Trim(), "d MMM, yy", CultureInfo.InvariantCulture);
            return dte;
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



        public static string ConvertModelToByte(object obj)
        {
            MemoryStream ms = new MemoryStream();
            using (BsonWriter writer = new BsonWriter(ms))
            {
                JsonSerializer serializer = new JsonSerializer();
                serializer.Serialize(writer, obj);
            }
            string data = Convert.ToBase64String(ms.ToArray());
            return data;
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

    }
    public static class JSONHelper
    {
        public static string ToJSON(this object obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(obj);
        }

        public static string ToJSON(this object obj, int recursionDepth)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.RecursionLimit = recursionDepth;
            return serializer.Serialize(obj);
        }
        public static string Truncate(this string source, int length)
        {
            if (source != null)
            {
                if (source.Length > length)
                {
                    source = source.Substring(0, length);
                }
            }

            return source;
        }
    }

    public class travyooMarkup
    {
        public int Type { get; set; }
        public decimal Amount { get; set; }
    }

    public class CostModel
    {
        public decimal SuplCost { get; set; }
        public decimal ClientCost { get; set; }
        public decimal ClientMarkup { get; set; }
        public decimal ClientOffer { get; set; }
        public decimal ClienSale { get; set; }
        public decimal tAgentCost { get; set; }
        public decimal tAgentSale { get; set; }
        public decimal CustCost { get; set; }
    }





}
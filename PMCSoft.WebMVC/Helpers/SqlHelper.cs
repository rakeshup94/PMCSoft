using INGM.Web.Models.Transfer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using INGM.Web.Helpers;
using System.Xml.Linq;
using System.Configuration;
using System.Collections;

namespace INGM.Web.Helpers
{
    public class DataHelper
    {
        public DataHelper()
        {

        }
        public void SaveTranferFile()
        {
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["StaticConstr"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);

                IEnumerable<XElement> suplList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new XElement("LocationType", new XAttribute("PointType", dataRow.Field<int>("PointType")), new XAttribute("ItemCode", dataRow.Field<string>("ItemCode")),
                new XAttribute("ItemType", dataRow.Field<string>("ItemType")),
                new XAttribute("CityCode", dataRow.Field<string>("CityCode")),
                new XAttribute("string", dataRow.Field<string>("ItemName")))
             );
                XDocument LocationList = new XDocument(new XElement("Locations", suplList));
                conn.Close();
                string FilePath = ConfigurationManager.AppSettings["TransferPath"];
                FilePath = new Uri(FilePath).LocalPath;
                LocationList.Save(FilePath);

            }







        }
    }


    public static class SqlHelper
    {
        static string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["StaticConstr"].ConnectionString;
        private static Hashtable htData;
        public static Hashtable GetCatchList()
        {
            htData = new Hashtable();
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 6);//1
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                List<LocationType> airportList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new LocationType
                {
                    PointType = 1,
                    ItemCode = dataRow.Field<string>("ItemCode"),
                    ItemType = dataRow.Field<string>("ItemType"),
                    ItemName = dataRow.Field<string>("ItemName"),
                    CityCode = dataRow.Field<string>("CityCode"),
                    City = dataRow.Field<string>("CityName"),
                    Country = dataRow.Field<string>("CountryName"),
                }).ToList();
                List<LocationType> hotelList = dataSet.Tables[1].AsEnumerable().Select(dataRow => new LocationType
                {
                    PointType = 2,
                    ItemCode = dataRow.Field<string>("ItemCode"),
                    ItemType = dataRow.Field<string>("ItemType"),
                    ItemName = dataRow.Field<string>("ItemName"),
                    CityCode = dataRow.Field<string>("CityCode"),
                    City = dataRow.Field<string>("CityName"),
                    Country = dataRow.Field<string>("CountryName"),
                }).ToList();

                List<Destination> destList = dataSet.Tables[2].AsEnumerable().Select(dataRow => new Destination
                {
                    CityCode = dataRow.Field<string>("DestinationCode"),
                    CityName = dataRow.Field<string>("DestinationName"),
                    CountryCode = dataRow.Field<string>("CountryCode"),
                    CountryName = dataRow.Field<string>("CountryName"),
                }).ToList();


                htData.Add("ListAirport", airportList);
                htData.Add("ListHotel", hotelList);
                htData.Add("ListDestination", destList);
                conn.Close();
                return htData;
            }
        }









        public static IEnumerable<LocationType> GetSource(string searchText, int type, string cityCode)
        {

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 2);
                cmd.Parameters.AddWithValue("@search", searchText);
                cmd.Parameters.AddWithValue("@type", type);
                cmd.Parameters.AddWithValue("@City", cityCode);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);

                IEnumerable<LocationType> suplList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new LocationType
                {
                    PointType = dataRow.Field<int>("PointType"),
                    ItemCode = dataRow.Field<string>("ItemCode"),
                    ItemType = dataRow.Field<string>("ItemType"),
                    CityCode = dataRow.Field<string>("CityCode"),
                    ItemName = dataRow.Field<string>("ItemName"),
                });
                conn.Close();
                return suplList;
            }
        }




        public static IEnumerable<LocationType> GetSource(string searchText)
        {



            string SearchTxt = "";
            string SearchText = searchText;
            SearchText = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9]").Replace(SearchText, " ");
            // Split the text into words.
            var Words = SearchText.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (var Word in Words)
            {
                SearchTxt += Word.ToString().ToLower() + ",";
            }
            if (!string.IsNullOrEmpty(SearchTxt))
            {
                SearchTxt = SearchTxt.Substring(0, SearchTxt.Length - 1);
            }


            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 3);
                cmd.Parameters.AddWithValue("@search", SearchTxt);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                IEnumerable<LocationType> suplList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new LocationType
                {
                    PointType = dataRow.Field<int>("PickupType"),
                    ItemCode = dataRow.Field<string>("ItemCode"),
                    ItemType = dataRow.Field<string>("ItemType"),
                    CityCode = dataRow.Field<string>("CityCode"),
                    ItemName = dataRow.Field<string>("ItemName"),
                    City = dataRow.Field<string>("CityName"),
                    Country = dataRow.Field<string>("CountryName")
                });
                conn.Close();
                return suplList;
            }
        }

        public static IEnumerable<LocationType> GetSource(string searchText, string cityCode,int flag)
        {
            string SearchTxt = "";
            string SearchText = searchText;
            SearchText = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9]").Replace(SearchText, " ");
            // Split the text into words.
            var Words = SearchText.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (var Word in Words)
            {
                SearchTxt += Word.ToString().ToLower() + ",";
            }
            if (!string.IsNullOrEmpty(SearchTxt))
            {
                SearchTxt = SearchTxt.Substring(0, SearchTxt.Length - 1);
            }

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", flag);
                cmd.Parameters.AddWithValue("@search", SearchTxt);
                cmd.Parameters.AddWithValue("@City", cityCode);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);

                IEnumerable<LocationType> suplList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new LocationType
                {
                    PointType = dataRow.Field<int>("PickupType"),
                    ItemCode = dataRow.Field<string>("ItemCode"),
                    ItemType = dataRow.Field<string>("ItemType"),
                    CityCode = dataRow.Field<string>("CityCode"),
                    ItemName = dataRow.Field<string>("ItemName"),
                    City = dataRow.Field<string>("CityName"),
                    Country = dataRow.Field<string>("CountryName")
                });
                conn.Close();
                return suplList;
            }
        }

        public static IEnumerable<Destination> GetDestination()
        {


            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 6);//1
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);

                IEnumerable<Destination> destList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new Destination
                {
                    CityCode = dataRow.Field<string>("DestinationCode"),
                    CityName = dataRow.Field<string>("DestinationName"),
                    CountryCode = dataRow.Field<string>("CountryCode"),
                    CountryName = dataRow.Field<string>("CountryName"),
                }).ToList();



                return destList;
            }











        }
        public static void SaveTranferFile()
        {
            //List<LocationType> lst = new List<LocationType>();
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "TransferProc";
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);

                IEnumerable<XElement> suplList = dataSet.Tables[0].AsEnumerable().Select(dataRow => new XElement("LocationType", new XAttribute("PointType", dataRow.Field<int>("PointType")), new XAttribute("ItemCode", dataRow.Field<string>("ItemCode")),
                new XAttribute("ItemType", dataRow.Field<string>("ItemType")),
                new XAttribute("CityCode", dataRow.Field<string>("CityCode")),
                new XAttribute("string", dataRow.Field<string>("ItemName")))
             );
                XDocument LocationList = new XDocument(new XElement("Locations", suplList));
                conn.Close();
                string FilePath = ConfigurationManager.AppSettings["TransferPath"];
                FilePath = new Uri(FilePath).LocalPath;
                LocationList.Save(FilePath);



                //SqlDataReader reader = cmd.ExecuteReader();
                //while (reader.Read())
                //{
                //    LocationType item = new LocationType();
                //    item.PointType = reader["PointType"] == DBNull.Value ? 0 : (int)reader["PointType"];
                //    item.ItemCode = reader["ItemCode"] == DBNull.Value ? "" : (string)reader["ItemCode"];
                //    item.ItemName = reader["ItemName"] == DBNull.Value ? "" : (string)reader["ItemName"];
                //    item.Type = reader["Type"] == DBNull.Value ? "" : (string)reader["Type"];
                //    item.CityCode = reader["CityCode"] == DBNull.Value ? "" : (string)reader["CityCode"];

                //    //string City = reader["CityName"] == DBNull.Value ? "" : (string)reader["CityName"];
                //    string Country = reader["CountryName"] == DBNull.Value ? "" : (string)reader["CountryName"];

                //    if (item.PointType == 1)
                //    {
                //        item.ItemName = item.ItemName + " (" + item.ItemCode + "," + Country + ")";
                //    }
                //    else
                //    {
                //        item.ItemName = item.ItemName + " (" + item.CityCode + "," + Country + ")";
                //    }
                //    lst.Add(item);
                //}


            }







        }













    }
}
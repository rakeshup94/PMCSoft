using System;
using System.Data;
using System.Configuration;//ConfigurationManager
using System.Web; //HttpRequest -n to find physical location to save pdf file.
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO; //FileStream
using System.Net.Mail;
using System.Net;

using System.Reflection;
using System.Collections;

using System.Xml.Serialization;
using System.Globalization;
using System.Text;
namespace PMCSoft.Infrastructure.Data
{
    public class ATCommon
    {

        public static SqlConnection GetConnection()
        {
            SqlConnection vConnection = null;
            try
            {
                String vConnectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
                vConnection = new SqlConnection(vConnectionString);
                vConnection.Open();
            }
            catch (Exception xe) { xe.ToString(); }
            return vConnection;
        }
        public static void FillDrpDown(ListControl pDropDown, System.Data.DataTable pDataSet, String pFirstItem, String pTextField, String pValueField, String pFirstValue)
        {
            pDropDown.Items.Clear();
            if (pFirstItem != "")
            {
                System.Web.UI.WebControls.ListItem vListItem = new System.Web.UI.WebControls.ListItem(pFirstItem, pFirstValue);
                pDropDown.Items.Add(vListItem);
            }
            pDropDown.AppendDataBoundItems = true;
            pDropDown.DataSource = pDataSet;
            pDropDown.DataTextField = pTextField;
            pDropDown.DataValueField = pValueField;
            pDropDown.DataBind();
        }


        public static string SerializeToXml<T>(T value)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(T));

            // create a MemoryStream here, we are just working
            // exclusively in memory
            System.IO.Stream stream = new System.IO.MemoryStream();

            // The XmlTextWriter takes a stream and encoding
            // as one of its constructors
            System.Xml.XmlTextWriter xtWriter = new System.Xml.XmlTextWriter(stream, Encoding.UTF8);

            serializer.Serialize(xtWriter, value);

            xtWriter.Flush();

            // go back to the beginning of the Stream to read its contents
            stream.Seek(0, System.IO.SeekOrigin.Begin);

            // read back the contents of the stream and supply the encoding
            System.IO.StreamReader reader = new System.IO.StreamReader(stream, Encoding.UTF8);

            string result = reader.ReadToEnd();
            return result;
        }
        public static System.Data.DataTable RetDT(String pQry)
        {
            using (SqlConnection vConnection = ATCommon.GetConnection())
            {
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(pQry, vConnection);
                DataSet vDataSet = new DataSet();
                vDataAdapter.Fill(vDataSet);
                return vDataSet.Tables[0].Copy();
            }
        }
        public static DataRow RetDR(String pQry)
        {
            System.Data.DataTable vDT = RetDT(pQry);
            DataRow vDR = null;
            if (vDT.Rows.Count > 0)
                vDR = vDT.Rows[0];
            return vDR;
        }
    }
}
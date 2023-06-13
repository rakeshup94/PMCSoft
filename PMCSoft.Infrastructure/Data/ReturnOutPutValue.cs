using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
namespace PMCSoft.Infrastructure.Data
{
    public class ReturnOutPutValue
    {
        public static string Conn = ConfigurationManager.ConnectionStrings["PMCSoftContext"].ConnectionString;
        public ReturnOutPutValue()
        {

        }
        private static SqlConnection OpenConn()
        {
            try
            {
                SqlConnection Connection = new SqlConnection();
                Connection = GetConn();
                Connection.Open();
                return Connection;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        private static SqlConnection GetConn()
        {
            try
            {
                if (Conn == string.Empty)
                {
                    Conn = ConfigurationManager.AppSettings["PMCSoftContext"].ToString();
                }
                return new SqlConnection(Conn);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        private static void CloseConnection(SqlConnection con)
        {
            try
            {
                if ((con != null) && (con.State & ConnectionState.Open) == ConnectionState.Open)
                {
                    con.Close();
                    con.Dispose();
                }
            }
            catch
            {
                con = null;
            }
        }
        public static void CheckMaxID(string SPName, string EPMail, out string mass)
        {
            try
            {
                SqlCommand CMD = new SqlCommand(SPName, OpenConn());
                CMD.CommandType = CommandType.StoredProcedure;
                CMD.Parameters.Add("@EmpMail", SqlDbType.VarChar).Value = EPMail;
                CMD.Parameters.Add("@Result", SqlDbType.VarChar, 40);
                CMD.Parameters["@Result"].Direction = ParameterDirection.Output;
                CMD.ExecuteNonQuery();
                CMD.Connection.Close();
                mass = CMD.Parameters["@Result"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static void OutputOneInt(string SPName, out string mass)
        {
            try
            {
                SqlCommand CMD = new SqlCommand(SPName, OpenConn());
                CMD.CommandType = CommandType.StoredProcedure;
                CMD.Parameters.Add("@IW", SqlDbType.Int);
                CMD.Parameters["@IW"].Direction = ParameterDirection.Output;
                CMD.ExecuteNonQuery();
                CMD.Connection.Close();
                mass = CMD.Parameters["@IW"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static void OutputOneIntOneString(string SPName, string Input, out string mass)
        {
            try
            {
                SqlCommand CMD = new SqlCommand(SPName, OpenConn());
                CMD.CommandType = CommandType.StoredProcedure;
                CMD.Parameters.Add("@FValue", SqlDbType.VarChar).Value = Input;
                CMD.Parameters.Add("@SValue", SqlDbType.Int);
                CMD.Parameters["@SValue"].Direction = ParameterDirection.Output;
                CMD.ExecuteNonQuery();
                CMD.Connection.Close();
                mass = CMD.Parameters["@SValue"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}
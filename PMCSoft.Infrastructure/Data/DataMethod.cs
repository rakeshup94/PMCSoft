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

/// <summary>
/// Summary description for DataMathed
/// </summary>
namespace PMCSoft.Infrastructure.Data
{
    public class DALL
    {
        public static string Conn = ConfigurationManager.AppSettings["DBConnectionString"].ToString();
        public DALL()
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
                    Conn = ConfigurationManager.AppSettings["DBConnectionString"].ToString();
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
        public static DataTable SPReturnDatatable(string SPName, params SqlParameter[] commondParameter)
        {
            SqlDataAdapter DAdapter = new SqlDataAdapter(SPName, OpenConn());
            DataTable DTable = new DataTable();
            DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = DAdapter.SelectCommand.Parameters.Add(p1);
                pram.Direction = ParameterDirection.Input;
            }
            DAdapter.Fill(DTable);
            DAdapter.Dispose();
            SqlConnection.ClearAllPools();
            return DTable;
        }
        public static DataTable SPReturnDatatable(string SPName)
        {
            SqlDataAdapter DAdapter = new SqlDataAdapter(SPName, OpenConn());
            DataTable DTable = new DataTable();
            DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DAdapter.Fill(DTable);
            DAdapter.Dispose();
            SqlConnection.ClearAllPools();
            return DTable;
        }
        public static DataSet SPReturnDataSet(string SPName, params SqlParameter[] commondParameter)
        {
            SqlDataAdapter DAdapter = new SqlDataAdapter(SPName, OpenConn());
            DataSet DSet = new DataSet();
            DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = DAdapter.SelectCommand.Parameters.Add(p1);
                pram.Direction = ParameterDirection.Input;
            }
            DAdapter.Fill(DSet);
            DAdapter.Dispose();
            SqlConnection.ClearAllPools();
            return DSet;
        }
        public static DataSet SPReturnDataSet(string SPName)
        {
            SqlDataAdapter DAdapter = new SqlDataAdapter(SPName, OpenConn());
            DataSet DTable = new DataSet();
            DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DAdapter.Fill(DTable);
            DAdapter.Dispose();
            SqlConnection.ClearAllPools();
            return DTable;
        }
        public static DataTable SPReturnDatatableOUTPUTParm(string SPName, params SqlParameter[] commondParameter)
        {
            SqlDataAdapter DAdapter = new SqlDataAdapter(SPName, OpenConn());
            DataTable DTable = new DataTable();
            DAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = DAdapter.SelectCommand.Parameters.Add(p1);
                pram.Direction = ParameterDirection.Output;
            }
            DAdapter.Fill(DTable);
            DAdapter.Dispose();
            SqlConnection.ClearAllPools();
            return DTable;
        }
        public static int SPInsertInputOutPutPrm(string SPName, params SqlParameter[] commondParameter)
        {
            SqlCommand CMD = new SqlCommand(SPName, OpenConn());
            CMD.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = CMD.Parameters.Add(p1);
                pram.Direction = ParameterDirection.InputOutput;
            }
            int RowEffected = CMD.ExecuteNonQuery();
            SqlConnection.ClearAllPools();
            return RowEffected;
        }
        public static int SPInsert(string SPName, params SqlParameter[] commondParameter)
        {
            SqlCommand CMD = new SqlCommand(SPName, OpenConn());
            CMD.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = CMD.Parameters.Add(p1);
                pram.Direction = ParameterDirection.Input;
            }
            int RowEffected = CMD.ExecuteNonQuery();
            SqlConnection.ClearAllPools();
            return RowEffected;
        }
        public static int SQLQInsert(string SPName)
        {
            try
            {
                SqlCommand CMD = new SqlCommand(SPName, OpenConn());
                CMD.CommandType = CommandType.StoredProcedure;
                int RowEffected = CMD.ExecuteNonQuery();
                SqlConnection.ClearAllPools();
                return RowEffected;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static int SPInsertOUTINPUT(string SPName, params SqlParameter[] commondParameter)
        {
            SqlCommand CMD = new SqlCommand(SPName, OpenConn());
            CMD.CommandType = CommandType.StoredProcedure;
            SqlParameter pram;
            foreach (SqlParameter p1 in commondParameter)
            {
                pram = CMD.Parameters.Add(p1);
            }
            int RowEffected = CMD.ExecuteNonQuery();
            SqlConnection.ClearAllPools();
            return RowEffected;
        }

    }
}
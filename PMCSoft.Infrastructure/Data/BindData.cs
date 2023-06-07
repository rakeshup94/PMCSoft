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
/// Summary description for BindData
/// </summary>
namespace PMCSoft.Infrastructure.Data
{
    public class BindData
    {
        public static string Conn = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        public BindData()
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
        public static void BindGridView(string SP, GridView gv)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            gv.DataSource = DT;
            gv.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindGridViewWithSNo(string SP, GridView gv)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            DT.Columns.Add("SNo");
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["SNo"] = i + 1;
            }
            gv.DataSource = DT;
            gv.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindDataList(string SP, DataList DS)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            DS.DataSource = DT;
            DS.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindDataListWithSNo(string SP, DataList DS)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                DT.Columns.Add("SNo");
                for (int i = 0; i < DT.Rows.Count; i++)
                {
                    DT.Rows[i]["SNo"] = i + 1;
                }
            }
            DS.DataSource = DT;
            DS.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindDDL(string SP, DropDownList ddl, string strdmember, string strvmember)
        {
            SqlDataAdapter DA = new SqlDataAdapter(SP, OpenConn());
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DTable = new DataTable();
            DA.Fill(DTable);
            ddl.DataSource = DTable;
            ddl.DataTextField = strdmember;
            ddl.DataValueField = strvmember;
            ddl.DataBind();
            DA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindGridView(string SP, GridView gv, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            gv.DataSource = DT;
            gv.DataBind();
            SqlConnection.ClearAllPools();
        }
        public static void BindDataList(string SP, DataList DS, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            DS.DataSource = DT;
            DS.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindGridViewWithSNo(string SP, GridView gv, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            DT.Columns.Add("SNo");
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["SNo"] = i + 1;
            }
            gv.DataSource = DT;
            gv.DataBind();
            SqlConnection.ClearAllPools();
        }
        public static void BindDataListWithSNo(string SP, DataList DS, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            DT.Columns.Add("SNo");
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["SNo"] = i + 1;
            }
            DS.DataSource = DT;
            DS.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindDDL(string SP, DropDownList ddl, string strdmember, string strvmember, params SqlParameter[] COMPM)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPM)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            ddl.DataSource = DT;
            ddl.DataTextField = strdmember;
            ddl.DataValueField = strvmember;
            ddl.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindRepeter(string SP, Repeater RP, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            RP.DataSource = DT;
            RP.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindRepeter(string SP, Repeater RP)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            RP.DataSource = DT;
            RP.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindRepeterWithSNo(string SP, Repeater RP)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                DT.Columns.Add("SNo");
                for (int i = 0; i < DT.Rows.Count; i++)
                {
                    DT.Rows[i]["SNo"] = i + 1;
                }
            }

            RP.DataSource = DT;
            RP.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindRepeterWithSNo(string SP, Repeater RP, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);


            DT.Columns.Add("SNo");
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["SNo"] = i + 1;
            }

            RP.DataSource = DT;
            RP.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindForm(string SP, FormView FV, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            FV.DataSource = DT;
            FV.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindForm(string SP, FormView FV)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            FV.DataSource = DT;
            FV.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindFormViewWithSNo(string SP, FormView FV)
        {
            SqlDataAdapter da = new SqlDataAdapter(SP, OpenConn());
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            da.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                DT.Columns.Add("SNo");
                for (int i = 0; i < DT.Rows.Count; i++)
                {
                    DT.Rows[i]["SNo"] = i + 1;
                }
            }

            FV.DataSource = DT;
            FV.DataBind();
            da.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindFormViewWithSNo(string SP, FormView FV, params SqlParameter[] COMPam)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPam)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            DT.Columns.Add("SNo");
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["SNo"] = i + 1;
            }

            FV.DataSource = DT;
            FV.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
        public static void BindChk(string SP, CheckBoxList ddl, string strdmember, string strvmember, params SqlParameter[] COMPM)
        {
            SqlDataAdapter DataA = new SqlDataAdapter(SP, OpenConn());
            DataTable DT = new DataTable();
            DataA.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter Pm1;
            foreach (SqlParameter p1 in COMPM)
            {
                Pm1 = DataA.SelectCommand.Parameters.Add(p1);
                Pm1.Direction = ParameterDirection.Input;
            }
            DataA.Fill(DT);
            ddl.DataSource = DT;
            ddl.DataTextField = strdmember;
            ddl.DataValueField = strvmember;
            ddl.DataBind();
            DataA.Dispose();
            SqlConnection.ClearAllPools();
        }
    }
}
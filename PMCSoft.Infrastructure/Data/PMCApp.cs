using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Collections;


namespace PMCSoft.Infrastructure.Data
{
    public class PMCApp
    {
        private static string sqlconnectionstring;
  
        private static string strEmail_From;

        private static string strServerName;
        static PMCApp()
        {

            
            sqlconnectionstring = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            strServerName = "118.139.182.92";
            strEmail_From = "info@sitaone.com";
        }
        public static SqlConnection OpenConnection()
        {
            SqlConnection objsqlconnection;
            try
            {
                objsqlconnection = new SqlConnection();
                objsqlconnection = GetConnection();
                objsqlconnection.Open();
                return objsqlconnection;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static SqlConnection GetConnection()
        {
            try
            {
                return new SqlConnection(sqlconnectionstring);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithOneStringValue(string pProcedureName, string Email)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@email_id", SqlDbType.VarChar).Value = Email;
                objdataadapter.SelectCommand.ExecuteReader(); 
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable); 
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDropDownDetail(string pProcedureName)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithTwoStringValue(string pProcedureName, string FValue, string SValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithOneDateTimeOneIntValue(string pProcedureName, string FValue, int SValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.DateTime).Value = DateTime.Parse(FValue);
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.Int).Value = SValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithThreeStringTwoIntValue(string pProcedureName, string FValue, string SValue, int TValue, int FourthValue, string FifthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.Int).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.Int).Value = FourthValue;
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.VarChar).Value = FifthValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithThreeStringValue(string pProcedureName, string FValue, string SValue, string TValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static void SendMail(string to, string subject, string body)
        {
            MailMessage message = new MailMessage(strEmail_From, to, subject, body);
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient(strServerName);
            client.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");
            client.Send(message);
            client.Timeout = 500;
        }
        public static void SendMailMultiple(string from, string to, string subject, string body)
        {
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            try
            {
                MailAddress fromAddress = new MailAddress(from);
                message.From = fromAddress;
                if (!(to.Contains(",")))
                {
                    message.To.Add(to);
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;
                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");
                    smtpClient.Send(message);
                }
                else if (to.Contains(","))
                {
                    string[] words = to.Split(',');
                    foreach (string mailto in words)
                    {
                        message.To.Add(mailto);
                    }
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;
                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");
                    smtpClient.Send(message);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void SendMailWithAttchment(string from, string to, string Cc, string subject, string body, string attachmentCollection)
        {
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            try
            {
                MailAddress fromAddress = new MailAddress(from);
                message.From = fromAddress;
                if (!(to.Contains(",")))
                {
                    message.To.Add(to);
                    if (Cc != null && Cc != string.Empty)
                    {
                        Cc = Cc + "," + from;
                        string[] CCwords = Cc.Split(',');
                        foreach (string mailCc in CCwords)
                        {
                            message.CC.Add(mailCc);
                        }
                    }
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;

                    //foreach (Attachment attachment in attachmentCollection)
                    if (attachmentCollection != null && attachmentCollection != string.Empty)
                    {
                        char[] sepID = new char[] { ',' };
                        string[] strSplitArrID = attachmentCollection.Split(sepID);
                        foreach (string attachment in strSplitArrID)
                        {
                            Attachment BillAttach = new Attachment(System.Web.HttpContext.Current.Server.MapPath("~/Upload/MailFile/" + attachment));
                            message.Attachments.Add(BillAttach);
                        }
                    }
                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");

                    smtpClient.Send(message);
                }
                else if (to.Contains(","))
                {
                    string[] words = to.Split(',');
                    foreach (string mailto in words)
                    {
                        message.To.Add(mailto);
                    }
                    if (Cc != null && Cc != string.Empty)
                    {
                        Cc = Cc + "," + from;
                        string[] CCwords = Cc.Split(',');
                        foreach (string mailCc in CCwords)
                        {
                            message.CC.Add(mailCc);
                        }
                    }
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;
                    
                    if (attachmentCollection != null && attachmentCollection != string.Empty)
                    {
                        char[] sepID = new char[] { ',' };
                        string[] strSplitArrID = attachmentCollection.Split(sepID);
                        foreach (string attachment in strSplitArrID)
                        {
                            Attachment BillAttach = new Attachment(System.Web.HttpContext.Current.Server.MapPath("~/Upload/MailFile/" + attachment));
                            message.Attachments.Add(BillAttach);
                        }
                    }
                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");

                    smtpClient.Send(message);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void SendMailWithCc(string from, string to, string Cc, string subject, string body)
        {
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            try
            {
                MailAddress fromAddress = new MailAddress(from);
                message.From = fromAddress;

                if (to.Contains(","))
                {
                    string[] words = to.Split(',');
                    foreach (string mailto in words)
                    {
                        message.To.Add(mailto);
                    }
                    if (Cc != null && Cc != string.Empty)
                    {
                        Cc = Cc + "," + from;
                        string[] CCwords = Cc.Split(',');
                        foreach (string mailCc in CCwords)
                        {
                            message.CC.Add(mailCc);
                        }
                    }
                    else
                    {
                        Cc = from;
                    }
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;

                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");

                    smtpClient.Send(message);
                }
                else if (!(to.Contains(",")))
                {
                    message.To.Add(to);
                    if (Cc != null && Cc != string.Empty)
                    {
                        Cc = Cc + "," + from;
                        string[] CCwords = Cc.Split(',');
                        foreach (string mailCc in CCwords)
                        {
                            message.CC.Add(mailCc);
                        }
                    }
                    else
                    {
                        Cc = from;
                    }
                    message.Subject = subject;
                    message.IsBodyHtml = true;
                    message.Body = body;

                    smtpClient.Host = "118.139.182.92";
                    smtpClient.Port = 25;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@sitaone.com", "abcd1234");

                    smtpClient.Send(message);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void LoginCheckUser(string pProcedureName, string pEmailid, string pPassword, out string pId, out string pName, out string pCompID)
        {
            SqlCommand objsqlcommand;
            try
            {
                objsqlcommand = new SqlCommand(pProcedureName, OpenConnection());
                objsqlcommand.CommandType = CommandType.StoredProcedure;
                objsqlcommand.Parameters.Add("@Email", SqlDbType.VarChar).Value = pEmailid.ToString();
                objsqlcommand.Parameters.Add("@Password", SqlDbType.VarChar).Value = pPassword.ToString();
                objsqlcommand.Parameters.Add("@Id", SqlDbType.VarChar);
                objsqlcommand.Parameters.Add("@Name", SqlDbType.VarChar);
                objsqlcommand.Parameters.Add("@CompID", SqlDbType.VarChar);

                objsqlcommand.Parameters["@Id"].Direction = ParameterDirection.Output;
                objsqlcommand.Parameters["@Name"].Direction = ParameterDirection.Output;
                objsqlcommand.Parameters["@CompID"].Direction = ParameterDirection.Output;

                objsqlcommand.ExecuteNonQuery();
                objsqlcommand.Connection.Close();
                pId = objsqlcommand.Parameters["@Id"].Value.ToString();                
                pName = objsqlcommand.Parameters["@Name"].Value.ToString();
                pCompID = objsqlcommand.Parameters["@CompID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw (ex);
            }

        }
        public static void FindTransId(string pProcedureName, string ProjID, string EmpID, out int pTransId)
        {
            try
            {
                SqlCommand cmd;
                cmd = new SqlCommand(pProcedureName, OpenConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ProjId", SqlDbType.VarChar).Value = ProjID;
                cmd.Parameters.Add("@EmpID", SqlDbType.VarChar).Value = EmpID;
                cmd.Parameters.Add("@TransId", SqlDbType.Int);
                cmd.Parameters["@TransId"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                pTransId = Convert.ToInt32(cmd.Parameters["@TransId"].Value.ToString());
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithFourStringValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.VarChar).Value = FourthValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithSixStringValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue, 
            string FifthValue, string SixthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.VarChar).Value = FourthValue;
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.VarChar).Value = FifthValue;
                objdataadapter.SelectCommand.Parameters.Add("@SixthValue", SqlDbType.VarChar).Value = SixthValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithFiveStringValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue,
            string FifthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.VarChar).Value = FourthValue;
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.VarChar).Value = FifthValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static string GetOneStringValueWithOneStringValueNew(string pProcedureName, string Email)
        {
            SqlCommand cmd;
            object value;
            try
            {
                string Password;
                cmd = new SqlCommand(pProcedureName, OpenConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email_Id", SqlDbType.VarChar).Value = Email;
                value = cmd.ExecuteScalar();
                if (value != null)
                {
                    Password = value.ToString();
                }
                else
                {
                    Password = "Null";
                }
                cmd.Connection.Close();
                return Password;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static string GetOneStringValueWithTwoStringValue(string pProcedureName, string FValue, string SValue)
        {
            SqlCommand cmd;
            object value;
            try
            {
                string Password;
                cmd = new SqlCommand(pProcedureName, OpenConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                cmd.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                value = cmd.ExecuteScalar();
                if (value != null)
                {
                    Password = value.ToString();
                }
                else
                {
                    Password = "Null";
                }
                cmd.Connection.Close();
                return Password;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithTwoDatetimeAndThreeStringValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue,
            string FifthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.DateTime).Value = DateTime.Parse(FValue);
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.DateTime).Value = DateTime.Parse(SValue);
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.VarChar).Value = FourthValue;
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.VarChar).Value = FifthValue;
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithThreeStringAndTwoDateTimeValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue,
            string FifthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.DateTime).Value = DateTime.Parse(FourthValue);
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.DateTime).Value = DateTime.Parse(FifthValue);
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithOneDatetimeAndThreeStringValue(string pProcedureName, string FValue, string SValue, string TValue, string FourthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.DateTime).Value = DateTime.Parse(FourthValue);
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithTwoDatetimeValue(string pProcedureName, string FValue, string SValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.DateTime).Value = DateTime.Parse(FValue);
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.DateTime).Value = DateTime.Parse(SValue);
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable GetDataTableWithFourStringWithTwoDateTimeValue(string pProcedureName, string FValue, string SValue, string TValue, 
            string FourthValue, string FifthValue, string SixthValue)
        {
            SqlDataAdapter objdataadapter;
            DataTable objdatatable;
            try
            {
                objdataadapter = new SqlDataAdapter(pProcedureName, OpenConnection());
                objdataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                objdataadapter.SelectCommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objdataadapter.SelectCommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objdataadapter.SelectCommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;
                objdataadapter.SelectCommand.Parameters.Add("@FourthValue", SqlDbType.VarChar).Value = FourthValue;
                objdataadapter.SelectCommand.Parameters.Add("@FifthValue", SqlDbType.DateTime).Value = DateTime.Parse(FifthValue);
                objdataadapter.SelectCommand.Parameters.Add("@SixthValue", SqlDbType.DateTime).Value = DateTime.Parse(SixthValue);
                objdataadapter.SelectCommand.ExecuteReader();
                objdataadapter.SelectCommand.Connection.Close();

                objdatatable = new DataTable();
                objdataadapter.Fill(objdatatable);
                objdataadapter.Dispose();
                return objdatatable;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public static DataTable Get(Hashtable pParameterValues, String pQueryCode)
        {
            try
            {
                using (SqlConnection vSqlConnection = PMCApp.OpenConnection())
                {
                    SqlCommand vSqlCommand = new SqlCommand(pQueryCode, vSqlConnection);
                    vSqlCommand.CommandType = CommandType.StoredProcedure;
                    AddParameters(pParameterValues, ref vSqlCommand);

                    DataTable vDataTable = new DataTable();
                    vDataTable.Load(vSqlCommand.ExecuteReader());
                    SqlConnection.ClearAllPools();
                    return vDataTable;
                }
            }
            catch (Exception xe)
            {
                throw new Exception(xe.ToString());
            }
        }
        public static void AddParameters(Hashtable pParameterValues, ref SqlCommand pSqlCommand)
        {
            IDictionaryEnumerator vEnumerator = pParameterValues.GetEnumerator();
            while (vEnumerator.MoveNext())
            {
                String vKey = vEnumerator.Key.ToString();
                object vInfo = vEnumerator.Value;
                SqlParameter vSqlParameter = new SqlParameter();
                vSqlParameter.ParameterName = vKey;
                vSqlParameter.Value = vInfo;
                vSqlParameter.Direction = ParameterDirection.Input;
                vSqlParameter.SqlDbType = SqlDbType.VarChar;
                pSqlCommand.Parameters.Add(vSqlParameter);
            }
        }
        public static void UpdateThreeStringValue(string pProcedureName, string FValue, string SValue, string TValue)
        {
            SqlCommand objsqlcommand;
            try
            {
                objsqlcommand = new SqlCommand(pProcedureName, OpenConnection());
                objsqlcommand.CommandType = CommandType.StoredProcedure;
                objsqlcommand.Parameters.Add("@FValue", SqlDbType.VarChar).Value = FValue;
                objsqlcommand.Parameters.Add("@SValue", SqlDbType.VarChar).Value = SValue;
                objsqlcommand.Parameters.Add("@TValue", SqlDbType.VarChar).Value = TValue;

                objsqlcommand.ExecuteNonQuery();
                objsqlcommand.Connection.Close();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}
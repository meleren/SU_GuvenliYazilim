using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CORSExample
{
    public class DB
    {
        public static SqlConnection Connect()
        {
            string str = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            return conn;
        }

        public static void Close(SqlConnection conn)
        {
            conn.Close();
            conn.Dispose();
        }
    }
}
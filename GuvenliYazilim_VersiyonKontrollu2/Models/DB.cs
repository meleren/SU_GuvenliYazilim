using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GuvenliYazilim_VersiyonKontrollu2.Models
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
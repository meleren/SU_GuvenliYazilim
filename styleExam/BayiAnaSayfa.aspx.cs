using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class BayiAnaSayfa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //SQLBağlantım için yeni bir connection nesnesi, sorgum için yeni bir sqlcommand nesnesi ve veri listeleme
            //için yeni bir SQLDatareader nesnesi oluşturdum. Sonra bağlantı ConfigurationManager kullanarak bağlantımı
            //sağlıyorum ve komut satırımı yazıyorum.
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT * FROM Urunler", conn);

            try
            {
                //Bağlantımı açıyorum.
                conn.Open();
                reader = comm.ExecuteReader();
                //DropDownList için verilerimi yazıyorum. Databinding yapıyorum.
                DropDownList1.DataSource = reader;
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataTextField = "Tanim";
                DropDownList1.DataBind();
                reader.Close();
            }
            //Hata olursa..
            catch
            {
                Response.Write("Bir hata oluştu");
            }
            //Bağlantımı kapatıyorum
            finally
            {
                conn.Close();
            }
        }
          
    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Btn1_Click(object sender, System.EventArgs e)
    {
        Label3.Text = "Sepete Eklendi";
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.ServiceModel.Activation;
using System.Web.Script.Serialization;  

namespace CORSExample
{
    public class Service1 : IService1
    {
        //[System.Web.Services.WebMethod]
        public string GetAll()
        {

            SqlConnection conn = DB.Connect();

            string query = " SELECT Id,Tanim,Birim,BirimFiyat, Marka FROM Urunler ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
           // cmd.Parameters.Add("@Tanim", SqlDbType.VarChar, 20).Value = "%" + Tanim + "%";
            // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


            SqlDataReader dr = cmd.ExecuteReader();

            Data.Urunler Ana = new Data.Urunler();
            Ana.Liste = new List<Data.Urun>();


            while (dr.Read())
            {

                Data.Urun aa = new Data.Urun();
                aa.Id = Convert.ToInt16(dr["Id"].ToString());
                aa.Tanim = dr["Tanim"].ToString();
                aa.Birim = dr["Birim"].ToString();
                aa.Marka = dr["Marka"].ToString();
                aa.BirimFiyat = Convert.ToDouble(dr["BirimFiyat"].ToString());
                Ana.Liste.Add(aa);

            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            string ss = serializer.Serialize(Ana);

            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return ss;
        }
        //[System.Web.Services.WebMethod]
        public string GetUrunListesi(string Tanim)
        {

            SqlConnection conn = DB.Connect();

            string query = " SELECT Id,Tanim,Birim,BirimFiyat, Marka FROM Urunler where Tanim like  @Tanim";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Tanim", SqlDbType.VarChar, 20).Value = "%" + Tanim + "%";
            // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


            SqlDataReader dr = cmd.ExecuteReader();

            Data.Urunler Ana = new Data.Urunler();
            Ana.Liste = new List<Data.Urun>();


            while (dr.Read())
            {

                Data.Urun aa = new Data.Urun();
                aa.Id = Convert.ToInt16(dr["Id"].ToString());
                aa.Tanim = dr["Tanim"].ToString();
                aa.Birim = dr["Birim"].ToString();
                aa.Marka = dr["Marka"].ToString();
                aa.BirimFiyat = Convert.ToDouble(dr["BirimFiyat"].ToString());
                Ana.Liste.Add(aa);

            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            string ss = serializer.Serialize(Ana);

            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return ss;
        }

       // [System.Web.Services.WebMethod]
        public string GetUrun(int Id)
        {

            SqlConnection conn = DB.Connect();

            string query = " SELECT Id,Tanim,Birim,BirimFiyat, Marka FROM Urunler where Id =  @Id";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Tanim", SqlDbType.Int).Value = Id;

            SqlDataReader dr = cmd.ExecuteReader();

            Data.Urunler Ana = new Data.Urunler();
            Ana.Liste = new List<Data.Urun>();


            while (dr.Read())
            {

                Data.Urun aa = new Data.Urun();
                aa.Id = Convert.ToInt16(dr["Id"].ToString());
                aa.Tanim = dr["Tanim"].ToString();
                aa.Birim = dr["Birim"].ToString();
                aa.Marka = dr["Marka"].ToString();
                aa.BirimFiyat = Convert.ToDouble(dr["BirimFiyat"].ToString());
                Ana.Liste.Add(aa);

            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            string ss = serializer.Serialize(Ana);

            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return ss;
        }
    }
}

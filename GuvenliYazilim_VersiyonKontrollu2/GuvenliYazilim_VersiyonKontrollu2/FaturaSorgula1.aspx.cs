using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using GuvenliYazilim_VersiyonKontrollu2.Models;

namespace GuvenliYazilim_VersiyonKontrollu2
{
    public partial class FaturaSorgula1 : BasePageToptanci
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string FaturaGetir(string BayiAdi)
        {

            SqlConnection conn = DB.Connect();

            string query = " select m.Tarih,m.BayiId,m.Id, sum(d.BirimFiyat*d.Miktar) Tutar," +
          " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
          " from FaturaMaster m inner join FaturaDetay d on m.Id=d.MasterId " +
          " where exists(select Tanim from Bayiler where Id=m.BayiId and Tanim like @Tanim) " +
          " group by m.Tarih,m.BayiId,m.Id ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Tanim", SqlDbType.VarChar, 50).Value = "%" + BayiAdi + "%";

            // cmd.Parameters.Add("@Tarih1", SqlDbType.VarChar, 20).Value = SqlDbType.Date.;
            // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


            SqlDataReader dr = cmd.ExecuteReader();

            Data.FaturalarToplam Ana = new Data.FaturalarToplam();
            Ana.Liste = new List<Data.FaturaToplam>();


            while (dr.Read())
            {

                Data.FaturaToplam aa = new Data.FaturaToplam();
                aa.FaturaNo = Convert.ToInt16(dr["Id"].ToString());
                //aa.SiparisNo = Convert.ToInt16(dr["SiparisNo"].ToString());
                aa.BayiAdi = dr["BayiAdi"].ToString();
                aa.BayiId = Convert.ToInt16(dr["BayiId"].ToString());
                aa.Tarih = Convert.ToDateTime(dr["Tarih"].ToString());
                aa.Tutar = Convert.ToDouble(dr["Tutar"].ToString());
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


        [System.Web.Services.WebMethod]
        public static string GetDetay(int FaturaNo)
        {

            SqlConnection conn = DB.Connect();

            string query = " select m.Tarih,m.BayiId,m.Id FaturaNo, d.UrunId,d.Miktar, d.BirimFiyat,d.Id,d.Birim,d.BirimFiyat*d.Miktar Tutar," +
          " isnull((select Tanim from Urunler where Id=d.UrunId ),'') UrunAdi, " +
          " isnull((select Adres from Bayiler where Id=m.BayiId ),'') Adres, " +
          " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
          " from FaturaMaster m inner join  FaturaDetay d on m.Id=d.MasterId " +
          " where m.Id= @Id ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = FaturaNo;
            // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


            SqlDataReader dr = cmd.ExecuteReader();

            //Data.Siparisler Ana = new Data.Siparisler();
            Data.Faturalar Ana = new Data.Faturalar();
            Ana.Liste = new List<Data.Fatura>();



            while (dr.Read())
            {
                Data.Fatura aa = new Data.Fatura();

                aa.FaturaNo = Convert.ToInt16(dr["FaturaNo"].ToString());
                aa.BayiAdi = dr["BayiAdi"].ToString();
                aa.Adres = dr["Adres"].ToString();
                aa.BayiId = Convert.ToInt16(dr["BayiId"].ToString());
                aa.Tarih = Convert.ToDateTime(dr["Tarih"].ToString());
                aa.UrunAdi = dr["UrunAdi"].ToString();
                aa.UrunId = Convert.ToInt16(dr["UrunId"].ToString());
                aa.Birim = dr["Birim"].ToString();
                aa.BirimFiyat = Convert.ToDouble(dr["BirimFiyat"].ToString());
                aa.Miktar = Convert.ToDouble(dr["Miktar"].ToString());
                aa.Tutar = Convert.ToDouble(dr["Tutar"].ToString());
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

        [System.Web.Services.WebMethod]
        public static string FaturaSil(int FaturaNo)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            Data.DonenDeger aa = new Data.DonenDeger();
            if (FaturaNo == 0)
            {
                aa.Id = 0;
                aa.Durum = "";
                string str = serializer.Serialize(aa);

                return str;
            }


            SqlConnection conn = DB.Connect();
            string query = " delete FaturaDetay where MasterId= @MasterId " +
                           " delete FaturaMaster where Id= @Id select * from FaturaMaster where Id= @Id2";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@MasterId", SqlDbType.Int, 20).Value = FaturaNo;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = FaturaNo;
            cmd.Parameters.Add("@Id2", SqlDbType.Int, 20).Value = FaturaNo;


            SqlDataReader dr = cmd.ExecuteReader();





            if (dr.Read())
            {

                dr.Close();
                dr.Dispose();
                DB.Close(conn);
                cmd.Dispose();
                aa.Id = 0;
                aa.Durum = "";
                string str = serializer.Serialize(aa);

                return str;
            }

            aa.Id = FaturaNo;
            aa.Durum = "Başarılı";



            string ss = serializer.Serialize(aa);

            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return ss;
        }
    }
}
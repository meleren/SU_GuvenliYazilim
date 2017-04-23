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
    public partial class SiparisEkle1 : BasePageBayi
    {
        int bayiId;
        protected void Page_Load(object sender, EventArgs e)
        {
            bayiId = Convert.ToInt16(Session["User_BayiId"].ToString());
        }
        [System.Web.Services.WebMethod]
        public static string GetSiparisListesi(string MasterId)
        {

            SqlConnection conn = DB.Connect();

            string query =// " SELECT MasterId,UrunId,Birim,BirimFiyat,Miktar FROM SiparisDetay where MasterId like  @MasterId";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

                " select m.Tarih,m.BayiId,m.Id SiparisNo, d.UrunId,d.Miktar, d.BirimFiyat,d.Id,d.Birim,d.BirimFiyat*d.Miktar Tutar," +
          " isnull((select Tanim from Urunler where Id=d.UrunId ),'') UrunAdi, " +
          " isnull((select Adres from Bayiler where Id=m.BayiId ),'') Adres, " +
          " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
          " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId ";
            //" where m.Id= @MasterId" ;



            SqlCommand cmd = new SqlCommand(query, conn);
            // cmd.Parameters.Add("@MasterId", SqlDbType.Int).Value = "%" + MasterId + "%";
            // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


            SqlDataReader dr = cmd.ExecuteReader();
            
            Data.Siparisler Ana = new Data.Siparisler();
            Ana.Liste = new List<Data.Siparis>();


            while (dr.Read())
            {

                Data.Siparis aa = new Data.Siparis();
                aa.Id = Convert.ToInt16(dr["Id"].ToString());
                aa.SiparisNo = Convert.ToInt16(dr["SiparisNo"].ToString());
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
        public static string GetUrun(int Id)
        {

            SqlConnection conn = DB.Connect();

            string query = " SELECT Id,Tanim,Birim,BirimFiyat, Marka FROM Urunler where Id =  @Id";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;

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

        [System.Web.Services.WebMethod]
        public static string SiparisEkle(Data.UrunSiparis Gelen)
        {

            int Id; double Miktar; string Birim; double BirimFiyat; int UrunId; int BayiId;

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            //Data.Urunxx Gelenxx= (Data.Urunxx)serializer.DeserializeObject(Gelen);

            Id = Gelen.Id;
            BayiId = Gelen.BayiId;
            UrunId = Gelen.UrunId;
            Miktar = Gelen.Miktar;
            Birim = Gelen.Birim;
            BirimFiyat = Gelen.BirimFiyat;


            Data.DonenDeger aa = new Data.DonenDeger();



            SqlConnection conn = DB.Connect();
            SqlCommand cmd;
            string query;
            SqlDataReader dr;
            if (Id == 0)
            {
                query =// " insert into SiparisDetay(Tanim,Birim,BirimFiyat) select @Tanim, @Birim, @BirimFiyat select scope_identity() Id ";

                " insert into SiparisMaster(Tarih,BayiId) select @Tarih, @BayiId" +

                           " Declare @newid int set @newid= scope_identity() " +
                           "  insert into SiparisDetay( MasterId, UrunId, Birim, Miktar, BirimFiyat)" +
                           "  select @newid, @UrunId,@Birim,@Miktar, @BirimFiyat select @newid Id ";

                cmd = new SqlCommand(query, conn);
                cmd.Parameters.Add("@Tarih", SqlDbType.DateTime).Value = System.DateTime.Today;
                cmd.Parameters.Add("@BayiId", SqlDbType.Int).Value = BayiId;
                cmd.Parameters.Add("@UrunId", SqlDbType.Int).Value = UrunId;
                cmd.Parameters.Add("@Birim", SqlDbType.VarChar, 20).Value = Birim;
                cmd.Parameters.Add("@Miktar", SqlDbType.Float).Value = Miktar;
                cmd.Parameters.Add("@BirimFiyat", SqlDbType.Float).Value = BirimFiyat;
                dr = cmd.ExecuteReader();
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
            }
            else
            {
                query = " update SiparisDetay set UrunId= @UrunId, Birim= @Birim,BirimFiyat=  @BirimFiyat Miktar= @Miktar where Id= @Id select @Id Id ";

                cmd = new SqlCommand(query, conn);
                cmd.Parameters.Add("@UrunId", SqlDbType.Int).Value = UrunId;
                cmd.Parameters.Add("@Birim", SqlDbType.VarChar, 20).Value = Birim;
                cmd.Parameters.Add("@Miktar", SqlDbType.Float).Value = Miktar;
                cmd.Parameters.Add("@BirimFiyat", SqlDbType.Float).Value = BirimFiyat;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
                dr = cmd.ExecuteReader();
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
            }

            aa.Id = Id;
            aa.Durum = "Başarılı";

            string ss = serializer.Serialize(aa);

            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return ss;
        }

        [System.Web.Services.WebMethod]
        public static string SiparisSil(int Id)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            Data.DonenDeger aa = new Data.DonenDeger();
            if (Id == 0)
            {
                aa.Id = 0;
                aa.Durum = "";
                string str = serializer.Serialize(aa);

                return str;
            }


            SqlConnection conn = DB.Connect();
            string query = " delete SiparisDetay where Id= @Id select * from SiparisDetay where Id= @Id2";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = Id;
            cmd.Parameters.Add("@Id2", SqlDbType.Int, 20).Value = Id;


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

            aa.Id = Id;
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
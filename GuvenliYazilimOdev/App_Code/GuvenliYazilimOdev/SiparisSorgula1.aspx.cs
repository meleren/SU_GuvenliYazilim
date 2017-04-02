using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiparisSorgula1 : BasePageToptanci
//public partial class SiparisSorgula1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsAsync)
        { return; }
    }
    [System.Web.Services.WebMethod]
    public static string GetAll()
    {

        SqlConnection conn = DB.Connect();

        string query = " select m.Tarih,m.BayiId,m.Id SiparisNo, sum(d.BirimFiyat*d.Miktar) Tutar," +
      " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
      " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId " +
      " where not exists(select Id from FaturaDetay where SiparisDetayId=d.Id ) group by m.Tarih,m.BayiId,m.Id ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

        SqlCommand cmd = new SqlCommand(query, conn);
        // cmd.Parameters.Add("@Tarih1", SqlDbType.VarChar, 20).Value = SqlDbType.Date.;
        // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        SqlDataReader dr = cmd.ExecuteReader();

        Data.SiparislerToplami Ana = new Data.SiparislerToplami();
        Ana.Liste = new List<Data.SiparisToplam>();


        while (dr.Read())
        {

            Data.SiparisToplam aa = new Data.SiparisToplam();
            aa.SiparisNo = Convert.ToInt16(dr["SiparisNo"].ToString());
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
    public static string GetGrid()
    {

        SqlConnection conn = DB.Connect();

        string query = " select m.Tarih,m.BayiId,m.Id SiparisNo, sum(d.BirimFiyat*d.Miktar) Tutar," +
      " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
      " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId " +
      " where not exists(select Id from FaturaDetay where SiparisDetayId=d.Id ) group by m.Tarih,m.BayiId,m.Id ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

        SqlCommand cmd = new SqlCommand(query, conn);
        // cmd.Parameters.Add("@Tarih1", SqlDbType.VarChar, 20).Value = SqlDbType.Date.;
        // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        SqlDataReader dr = cmd.ExecuteReader();

        Data.SiparislerToplami Ana = new Data.SiparislerToplami();
        Ana.Liste = new List<Data.SiparisToplam>();


        while (dr.Read())
        {

            Data.SiparisToplam aa = new Data.SiparisToplam();
            aa.SiparisNo = Convert.ToInt16(dr["SiparisNo"].ToString());
            aa.BayiAdi = dr["BayiAdi"].ToString();
            aa.BayiId = Convert.ToInt16(dr["BayiId"].ToString());
            aa.Tarih = Convert.ToDateTime(dr["Tarih"].ToString());
            aa.Tutar = Convert.ToDouble(dr["Tutar"].ToString());
            Ana.Liste.Add(aa);

        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        string ss = "var gridData =[" + serializer.Serialize(Ana)+"]";

        dr.Close();
        dr.Dispose();
        DB.Close(conn);
        cmd.Dispose();
        return ss;
    }

    [System.Web.Services.WebMethod]
    public static string GetDetay(int SiparisNo)
    {

        SqlConnection conn = DB.Connect();

        string query = " select m.Tarih,m.BayiId,m.Id SiparisNo, d.UrunId,d.Miktar, d.BirimFiyat,d.Id,d.Birim,d.BirimFiyat*d.Miktar Tutar," +
      " isnull((select Tanim from Urunler where Id=d.UrunId ),'') UrunAdi, " +
      " isnull((select Adres from Bayiler where Id=m.BayiId ),'') Adres, " +
      " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
      " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId " +
      " where m.Id= @Id and not exists(select Id from FaturaDetay where SiparisDetayId=d.Id )";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = SiparisNo;
        // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        SqlDataReader dr = cmd.ExecuteReader();

        //Data.Siparisler Ana = new Data.Siparisler();
        Data.Siparisler Ana = new Data.Siparisler();
        Ana.Liste = new List<Data.Siparis>();
       


        while (dr.Read())
        {
            Data.Siparis aa = new Data.Siparis();
 
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
    public static string FaturaKayit(int SiparisNo)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        Data.DonenDeger aa = new Data.DonenDeger();
        if (SiparisNo == 0)
        {
            aa.Id = 0;
            aa.Durum = "";
            string str = serializer.Serialize(aa);

            return str;
        }
        /* var deserializedResult = serializer.Deserialize<Data.GelenDeger>(PSiparis);*/
        //int SiparisNo = 2;
        SqlConnection conn = DB.Connect();
        string query = " select d.Id " +
      " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId " +
      " where m.Id= @Id and not exists(select Id from FaturaDetay where SiparisDetayId=d.Id )";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = SiparisNo;


        SqlDataReader dr = cmd.ExecuteReader();

        //Data.Siparisler Ana = new Data.Siparisler();
        Data.Siparisler Ana = new Data.Siparisler();
        Ana.Liste = new List<Data.Siparis>();



        if (! dr.Read())
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
        dr.Close();
        DB.Close(conn);
        cmd.Dispose();
        
        conn = DB.Connect();

        query = " insert into FaturaMaster(Tarih,BayiId,Adres) select m.Tarih,m.BayiId,isnull((select Tanim from Bayiler where Id=m.BayiId ),'')"+
            "            from SiparisMaster m where  m.Id= @Id "+
            " Declare @newid int set @newid= scope_identity() " +
            "  insert into FaturaDetay( MasterId, UrunId, Birim, Miktar, BirimFiyat, SiparisDetayId)"+
            "  select @newid, d.UrunId,d.Birim,d.Miktar, d.BirimFiyat, d.Id " +
            " from SiparisDetay d where d.MasterId= @MasterId  and not exists(select Id from FaturaDetay where SiparisDetayId=d.Id )  select @newid FaturaId"; 

        cmd = new SqlCommand(query, conn);
        cmd.Parameters.Add("@Id", SqlDbType.Int, 20).Value = SiparisNo;
        cmd.Parameters.Add("@MasterId", SqlDbType.Int, 20).Value = SiparisNo;
        // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            aa.Id = Convert.ToInt16(dr["FaturaId"].ToString());
            aa.Durum = "Başarılı";

        }
        else
        {
            aa.Id = 0;
            aa.Durum = "";

        }

        string ss = serializer.Serialize(aa);

        dr.Close();
        dr.Dispose();
        DB.Close(conn);
        cmd.Dispose();
        return ss;
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

//public partial class UrunSorgula : System.Web.UI.Page
public partial class UrunSorgula : BasePageToptanci
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    public static string GetUrunListesi(string Tanim)
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
    public static string UrunKaydet(Data.Urunxx Gelen)
    {

        int Id; string Tanim; string Birim; double BirimFiyat;

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        //Data.Urunxx Gelenxx= (Data.Urunxx)serializer.DeserializeObject(Gelen);

        Id = Gelen.Id;
        Tanim = Gelen.Tanim;
        Birim = Gelen.Birim;
        BirimFiyat = Gelen.BirimFiyat;

        Data.DonenDeger aa = new Data.DonenDeger();



        SqlConnection conn = DB.Connect();
        SqlCommand cmd;
        string query;
        SqlDataReader dr;
        if (Id == 0)
        {
            query = " insert into Urunler(Tanim,Birim,BirimFiyat) select @Tanim, @Birim, @BirimFiyat select scope_identity() Id ";

            cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Tanim", SqlDbType.VarChar, 20).Value = Tanim;
            cmd.Parameters.Add("@Birim", SqlDbType.VarChar, 20).Value = Birim;
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
            query = " update Urunler set Tanim= @Tanim, Birim= @Birim,BirimFiyat=  @BirimFiyat where Id= @Id select @Id Id ";

            cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@Tanim", SqlDbType.VarChar, 20).Value = Tanim;
            cmd.Parameters.Add("@Birim", SqlDbType.VarChar, 20).Value = Birim;
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
    public static string UrunSil(int Id)
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
        string query = " delete Urunler where Id= @Id select * from Urunler where Id= @Id2";

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
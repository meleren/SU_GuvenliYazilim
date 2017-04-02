using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for Sorgular
/// </summary>
public class Sorgular
{
	public Sorgular()
	{
    }
	[System.Web.Services.WebMethod]
    public static string GetAll()
    {

        SqlConnection conn = DB.Connect();

        string query = " select m.Tarih,m.BayiId,m.Id SiparisNo, d.UrunId,d.Miktar, d.BirimFiyat,d.Id,d.Birim,d.BirimFiyat*d.Miktar Tutar," +
      " isnull((select Tanim from Urunler where Id=d.UrunId ),'') UrunAdi, " +
      " isnull((select Tanim from Bayiler where Id=m.BayiId ),'') BayiAdi " +
      " from SiparisMaster m inner join SiparisDetay d on m.Id=d.MasterId " +
      " where not exists(select Id from FaturaDetay where SiparisDetayId=d.Id ) ";// and m.Tarih between isnull( @Tarih1 , m.Tarih) and isnull( @Tarih2 , m.Tarih)"; 

        SqlCommand cmd = new SqlCommand(query, conn);
       // cmd.Parameters.Add("@Tarih1", SqlDbType.VarChar, 20).Value = SqlDbType.Date.;
       // cmd.Parameters.Add("@Tarih2", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        SqlDataReader dr = cmd.ExecuteReader();

        //Data.Siparisler Ana = new Data.Siparisler();
        Data.Siparis aa = new Data.Siparis();
        

        if (dr.Read())
        {
             
            aa.SiparisNo = Convert.ToInt16(dr["SiparisNo"].ToString());
            aa.BayiAdi = dr["BayiAdi"].ToString();
            aa.BayiId = Convert.ToInt16(dr["BayiId"].ToString());
            aa.Tarih = Convert.ToDateTime(dr["Tarih"].ToString());
            aa.UrunAdi = dr["UrunAdi"].ToString();
            aa.UrunId = Convert.ToInt16(dr["UrunId"].ToString());
            aa.Birim = dr["Birim"].ToString();
            aa.BirimFiyat = Convert.ToDouble(dr["BirimFiyat"].ToString());
            aa.Miktar = Convert.ToDouble(dr["Miktar"].ToString());
            aa.Tutar = Convert.ToDouble(dr["Tutar"].ToString());
          //  Ana.Liste.Add(aa);
            
        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        
        string ss = serializer.Serialize(aa); 
        
        dr.Close();
        dr.Dispose();
        DB.Close(conn);
        cmd.Dispose();
        return ss;
    
	}
}
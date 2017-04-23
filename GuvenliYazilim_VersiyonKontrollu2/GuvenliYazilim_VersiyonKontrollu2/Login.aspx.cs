using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GuvenliYazilim_VersiyonKontrollu2.Models;

namespace GuvenliYazilim_VersiyonKontrollu2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User_Kod"] = null;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            
            if (Session["User_Kod"] == null)
            {
                if (SifreKontrol() == false)
                {
                    Message.ShowMessage(this, "Kullanıcı/Şifre Hatalı");
                    //LblMesaj.Visible = true;
                }
                else
                {
                    SayfaCagir();
                }
            }
            else
            {
                SayfaCagir();
            }
        }

        public bool SifreKontrol()
        {
            SqlConnection conn = DB.Connect();
            //güvenli giriş 

            string query = " select KulAdi,KulAdi Tanim,Yetki,BayiId from Kullanici where KulAdi= @KulAdi and Sifre= @Sifre";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add("@KulAdi", SqlDbType.VarChar, 20).Value = TxtKullanici.Text;
            cmd.Parameters.Add("@Sifre", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);

            /*
            //güvensiz giriş için
            string query = " select KulAdi,KulAdi Tanim,Yetki,BayiId from Kullanici where KulAdi= '" + TxtKullanici.Text + "' and Sifre= '" + TxtSifre.Text + "'"; 
            // güvensiz Kullanıcı: ' or 1=1--
         
            SqlCommand cmd = new SqlCommand(query, conn);
               
             */



            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.Read())
            {
                HttpCookie LoginCookie = new HttpCookie("SecureOdev_Login");
                LoginCookie["User"] = TxtKullanici.Text;

                LoginCookie.Expires = DateTime.Now.Date.AddDays(365);
                Response.Cookies.Add(LoginCookie);

                Session["User_Kod"] = dr["KulAdi"].ToString();
                Session["User_Name"] = dr["Tanim"].ToString();
                Session["User_BayiId"] = dr["BayiId"].ToString();
                Session["User_Yetki"] = dr["Yetki"].ToString();
                Session["User_GirisZamani"] = System.DateTime.Now.ToString();
                Session["User_IP"] = HttpContext.Current.Request.UserHostAddress;

                dr.Close();
                dr.Dispose();
                DB.Close(conn);
                return true;
            }
            dr.Close();
            dr.Dispose();
            DB.Close(conn);
            cmd.Dispose();
            return false;
        }
        protected void SayfaCagir()
        {
            if (Session["User_Kod"] != null)
            {
                // Message.ShowMessage(this, "deneme");
                // Message.ShowMessage(this, Session["User_Yetkixxx"].ToString());

                if (Session["User_Yetki"].ToString() == "1")
                {
                    Response.Redirect("~/BayiAnaSayfa1.aspx");
                }
                else if (Session["User_Yetki"].ToString() == "2")
                {
                    Response.Redirect("~/ToptanciAnaSayfa1.aspx");
                }
            }
        }
    }
}
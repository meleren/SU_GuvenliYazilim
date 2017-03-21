using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null)
        {
            Response.Redirect("~/AnaSayfa.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                HttpCookie LoginCookie = Request.Cookies["SecureOdev_Login"];
                if (LoginCookie != null)
                {
                    TxtKullanici.Text = LoginCookie["User"];
                }
            }
            if (TxtKullanici.Text == "")
                TxtKullanici.Focus();
            else
                TxtSifre.Focus();
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] == null)
        {
            if (SifreKontrol() == false)
            {
                Message.ShowMessage(this, "Kullanıcı/Şifre Hatalı");
                //LblMesaj.Visible = true;
            }
            else
            {
                Response.Redirect("~/AnaSayfa.aspx");
            }
        }
        else
        {
            Response.Redirect("~/AnaSayfa.aspx");
        }
    }

    public bool SifreKontrol()
    {
        SqlConnection conn = DB.Connect();

        string query = " select KulAdi,Sifre from Kullanici where KulAdi= @sicilno and Sifre= @Sifre";

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.Add("@sicilno", SqlDbType.VarChar, 20).Value = TxtKullanici.Text;
        cmd.Parameters.Add("@Sifre", SqlDbType.VarChar, 30).Value = TxtSifre.Text; //Sifre.TripleDesc(TbxSifre.Text);


        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.Read())
        {
            HttpCookie LoginCookie = new HttpCookie("SecureOdev_Login");
            LoginCookie["User"] = TxtKullanici.Text;

            LoginCookie.Expires = DateTime.Now.Date.AddDays(365);
            Response.Cookies.Add(LoginCookie);

            Session["User_Id"] = dr["KulAdi"].ToString();
            Session["User_Name"] = dr["KulAdi"].ToString();
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

}
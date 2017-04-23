using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuvenliYazilim_VersiyonKontrollu2.Models
{
    public class BasePage : System.Web.UI.Page
    {
        public BasePage()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private void GirisKontrol()
        {
            if (Session["User_Kod"] != null)
            {
                if (Convert.ToDateTime(Session["User_GirisZamani"].ToString()).AddMinutes(1) < System.DateTime.Now)
                    Session["User_Kod"] = null;
            }
        }
        protected override void InitializeCulture()//Language Choose Method
        {
            GirisKontrol();

        }
    }
}
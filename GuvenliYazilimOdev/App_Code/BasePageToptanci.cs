using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class BasePageToptanci : BasePage
{
    public BasePageToptanci()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private void GirisKontrol()
    {
        if ((Session["User_Kod"] == null) || (Session["User_Yetki"].ToString() != "2"))
        {
            Response.Write("<table width=\"100%\" height=\"100%\" style=\"font-family:Arial, Tahoma, MS Sans Serif; color=#990033\">");
            Response.Write("<tr><td align=\"center\">");
            if (Session["User_Yetki"]!= null)
                Response.Write("<span>" + "Yetkiniz Yok(Yetki seviyesi:" + Session["User_Yetki"].ToString() + ")</span>");
            else
               Response.Write("<span>" + "Yetkiniz Yok "+"</span>");
            Response.Write("<p> <a href=\"../Login.aspx\" title=\"Giriş Sayfası\"> Giriş Sayfası için tıklayın... </a>");

            Response.Write("</td></tr></table>");

            Response.End();
        }
    }
    protected override void InitializeCulture()
    {
        GirisKontrol();

    }
}


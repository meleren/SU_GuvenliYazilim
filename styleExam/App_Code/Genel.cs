﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for Genel
/// </summary>
public class Message
{
    public static void ShowMessage(Page pPage, string sMessage)
    {
        sMessage = sMessage.Replace("\n", "\\n");
        sMessage = sMessage.Replace("\r", "\\r");
        sMessage = sMessage.Replace("\"", "\\\"");
        string sScript = "<script>" +
                         "  alert(\"" + sMessage + "\");" +
                         "</script>";
        pPage.ClientScript.RegisterStartupScript(typeof(string), "P_mesaj", sScript);
    }
}
public class Genel
{
	public Genel()
	{
		//
		// TODO: Add constructor logic here
		//
	}


  
}
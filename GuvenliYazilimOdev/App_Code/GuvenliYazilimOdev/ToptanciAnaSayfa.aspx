<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToptanciAnaSayfa.aspx.cs" Inherits="ToptanciAnaSayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="Script/jquery-1.12.0.min.js"></script>
    <script src="Script/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">KIRTASİYE SANAL MAĞAZA</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="SiparisSorgula.aspx">Bekleyen Siparişler</a></li>
      <li><a href="FaturaSorgula.html">Kesilen Faturalar</a></li>
    </ul>
      <button class="btn btn-danger navbar-btn">Çıkış</button>
  </div>
</nav>
  
<div class="container">
  <h3>TOPTANCI GİRİŞİ</h3>
  <p>Siparişi sorgulamak için siparişler menüsüne girebilirsiniz.</p>
</div>


    </form>
</body>
</html>

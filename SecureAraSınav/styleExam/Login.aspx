<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html >
<head >
  <meta charset="UTF-8">
  
      <link rel="stylesheet" href="css/style.css" >

  
</head>

<body>
  
<form runat="server" >
  <header>Kırtasiye Giriş Ekranı</header>
    <label>Kullanıcı Adı </label>
  &nbsp;<asp:TextBox ID="TxtKullanici" runat="server" ></asp:TextBox>
    <label>Şifre</label>
  <asp:TextBox ID="TxtSifre" runat="server" TextMode="Password" ></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
    <br />
  
    <asp:Button ID="BtnLogin" runat="server" Text="Giriş" OnClick="BtnLogin_Click" Height="31px" Width="293px" />
</form>
  
  
    <p>
        &nbsp;</p>
  
  
</body>
</html>
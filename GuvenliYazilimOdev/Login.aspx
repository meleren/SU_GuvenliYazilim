<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
  
<form runat="server">
  <header>Kırtasiye Giriş Sayfası</header>
  <label>Kullanıcı Adı <span>*</span></label>
  <asp:TextBox ID="TxtKullanici" runat="server" CssClass="TextBox"></asp:TextBox>

  <label>Şifre <span>*</span></label>
  <asp:TextBox ID="TxtSifre" runat="server" TextMode="Password"  CssClass="TextBox"></asp:TextBox>
    <asp:Button ID="BtnLogin" runat="server" Text="Giriş" CssClass="buttonx"  OnClick="BtnLogin_Click" />
</form>
  
  
</body>
</html>

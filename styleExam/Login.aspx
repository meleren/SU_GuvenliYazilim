<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
  
<form runat="server">
  <header>Login</header>
  <label>Username <span>*</span></label>
  <asp:TextBox ID="TxtKullanici" runat="server"></asp:TextBox>
    <label>Password <span>*</span></label>
  <asp:TextBox ID="TxtSifre" runat="server" TextMode="Password"></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
    <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" Height="33px" Width="293px" />
    <br />
</form>
  
  
    <p>
        &nbsp;</p>
  
  
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
  <div class="help">At least 6 character</div>
  <label>Password <span>*</span></label>
  <asp:TextBox ID="TxtSifre" runat="server" TextMode="Password"></asp:TextBox>
  <div class="help">Use upper and lowercase lettes as well</div>
  
    <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
</form>
  
  
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Agri_Market.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    title>Login</title>
    <style>
        body { font-family: Arial; max-width: 400px; margin: 50px auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .link { margin-top: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <form id="form2" runat="server" >
        <h2>Login</h2>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="myemail" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
             <asp:TextBox ID="mypassword" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="loginbtn_Click" />

        <div class="link">
            Don't have an account? <a href="registerPage.aspx">Register here</a>
        </div>

        <asp:Label ID="loginMessage" runat="server" Text="Label"></asp:Label>

        <br />
    </form>
</body>
</html>

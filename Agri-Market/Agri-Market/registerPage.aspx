<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerPage.aspx.cs" Inherits="Agri_Market.registerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Register</title>
    <style>
        body { font-family: Arial; max-width: 400px; margin: 50px auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { background: #28a745; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        .btn:hover { background: #218838; }
        .link { margin-top: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <h2>Register</h2>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="myemail" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="myname" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Surname</label>
            <asp:TextBox ID="mysurname" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <asp:TextBox ID="myphonenum" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="mypassword" runat="server" ></asp:TextBox>
        </div>

        
        <asp:Button ID="mybutton" runat="server" Text="Create Account" OnClick="mybutton_Click" />

        <div class="link">
            Already have an account? <a href="loginPage.aspx">Login here</a>
        </div>

        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>

        <br />
        
    </form>
</body>
</html>

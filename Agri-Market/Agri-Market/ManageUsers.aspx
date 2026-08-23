din<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="Agri_Market.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Manage Users - Agri Market</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eef5e9;
        }

        .users-container {
            max-width: 1050px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .page-title {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 30px;
        }

        .filter-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .filter-button {
            padding: 9px 20px;
            border: 2px solid #81c408;
            border-radius: 20px;
            background-color: white;
            color: #5f9406;
            font-weight: 600;
        }

        .filter-button:hover {
            background-color: #81c408;
            color: white;
        }

        .user-card {
            border: 1px solid #e0e5db;
            border-left: 5px solid #81c408;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 18px;
            background-color: #fbfdf8;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .user-card h4 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .user-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px 25px;
        }

        .user-info p {
            margin-bottom: 5px;
            color: #666;
        }

        .role-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            background-color: #eef7df;
            color: #5f9406;
            font-weight: 700;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #5f9406;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .user-info {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="users-container">

        <h2 class="page-title">
            Manage Users
        </h2>

        <p class="page-subtitle">
            View registered customers, farmers and administrators.
        </p>


        <!-- FILTERS -->
        <div class="filter-buttons">

            <asp:Button
    ID="btnAll"
    runat="server"
    Text="All Users"
    CssClass="filter-button"
    OnClick="btnAll_Click" />

<asp:Button
    ID="btnCustomers"
    runat="server"
    Text="Customers"
    CssClass="filter-button"
    OnClick="btnCustomers_Click" />

<asp:Button
    ID="btnFarmers"
    runat="server"
    Text="Farmers"
    CssClass="filter-button"
    OnClick="btnFarmers_Click" />

<asp:Button
    ID="btnAdmins"
    runat="server"
    Text="Admins"
    CssClass="filter-button"
    OnClick="btnAdmins_Click" />

        </div>


        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


        <!-- USERS WILL APPEAR HERE -->
        <asp:Repeater
            ID="rptUsers"
            runat="server">

            <ItemTemplate>

                <div class="user-card">

                    <h4>
                        <%# Eval("Name") %>
                        <%# Eval("Surname") %>
                    </h4>

                    <div class="user-info">

                        <p>
                            <strong>Email:</strong>
                            <%# Eval("Email") %>
                        </p>

                        <p>
                            <strong>Phone:</strong>
                            <%# Eval("PhoneNumber") %>
                        </p>

                        <p>
                            <strong>User ID:</strong>
                            <%# Eval("UserId") %>
                        </p>

                        <p>
                            <strong>Role:</strong>
                            <span class="role-badge">
                                <%# Eval("UserType") %>
                            </span>
                        </p>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <a href="AdminProfile.aspx" class="back-link">
            ← Back to Admin Profile
        </a>

    </div>
    </form>
</body>
</html>

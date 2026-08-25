<%@ Page Title="Customer Dashboard - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="CustomerProfile.aspx.cs"
    Inherits="Agri_Market.CustomerProfile" %>


<asp:Content ID="CustomerHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .customer-container {
            width: 85%;
            max-width: 1100px;
            margin: 35px auto 60px;
        }

        /* Welcome section */
        .welcome-box {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 30px;
        }

        .welcome-box h1 {
            color: #5fa800;
            margin-bottom: 5px;
        }

        .welcome-box p {
            color: #666;
        }

        /* Dashboard cards */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .dashboard-card {
            background-color: white;
            padding: 25px;
            border-radius: 18px;
            text-decoration: none;
            color: #333;
            transition: 0.2s;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
            color: #333;
        }

        .dashboard-card h3 {
            color: #5fa800;
            margin-bottom: 8px;
        }

        .dashboard-card p {
            color: #666;
        }

        .card-icon {
            font-size: 32px;
            margin-bottom: 10px;
        }

        /* Features that are not finished yet */
        .disabled-card {
            background-color: #f5f5f5;
            color: #888;
        }

        .disabled-card h3 {
            color: #888;
        }

        /* Profile section */
        .profile {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
        }

        .profile h2 {
            color: #5fa800;
            margin-bottom: 25px;
        }

        .profile-row {
            margin-bottom: 15px;
        }

        .profile-label {
            font-weight: bold;
            color: #555;
        }

        .profile-value {
            margin-top: 4px;
            color: #333;
        }

        .logout {
            margin-top: 30px;
        }

        .logout a {
            display: inline-block;
            background-color: #5fa800;
            color: white;
            padding: 11px 20px;
            text-decoration: none;
            border-radius: 8px;
        }

        .logout a:hover {
            background-color: #4c8b00;
            color: white;
        }

        .message {
            color: red;
        }

        @media(max-width: 800px) {

            .dashboard {
                grid-template-columns: 1fr;
            }

            .customer-container {
                width: 92%;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="CustomerMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="customer-container">


        <!-- Welcome -->

        <div class="welcome-box">

            <h1>
                Welcome,
                <asp:Label ID="lblName"
                    runat="server">
                </asp:Label>
            </h1>

            <p>Customer Dashboard</p>

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>



        <!-- Customer Dashboard -->

        <div class="dashboard">


            <!-- Browse Products -->

            <a href="Home.aspx"
                class="dashboard-card">

                <div class="card-icon">🛍️</div>

                <h3>Browse Products</h3>

                <p>
                    Browse fresh products available
                    on Agri Market.
                </p>

            </a>



            <!-- Shopping Cart -->

            <div class="dashboard-card disabled-card">

                <div class="card-icon">🛒</div>

                <h3>My Cart</h3>

                <p>
                    View products added to your
                    shopping cart.
                </p>

            </div>



            <!-- Orders -->

            <div class="dashboard-card disabled-card">

                <div class="card-icon">📦</div>

                <h3>My Orders</h3>

                <p>
                    View your previous and
                    current orders.
                </p>

            </div>


        </div>



        <!-- Personal Information -->

        <div class="profile">

            <h2>My Account Details</h2>


            <div class="profile-row">

                <div class="profile-label">
                    Name
                </div>

                <div class="profile-value">

                    <asp:Label ID="lblProfileName"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <div class="profile-row">

                <div class="profile-label">
                    Surname
                </div>

                <div class="profile-value">

                    <asp:Label ID="lblSurname"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <div class="profile-row">

                <div class="profile-label">
                    Email
                </div>

                <div class="profile-value">

                    <asp:Label ID="lblEmail"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <div class="profile-row">

                <div class="profile-label">
                    Phone Number
                </div>

                <div class="profile-value">

                    <asp:Label ID="lblPhone"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <div class="profile-row">

                <div class="profile-label">
                    Account Type
                </div>

                <div class="profile-value">

                    <asp:Label ID="lblUserType"
                        runat="server">
                    </asp:Label>

                </div>

            </div>



            <div class="logout">

                <a href="LoginPage.aspx">
                    Log Out
                </a>

            </div>


        </div>


    </div>


</asp:Content>

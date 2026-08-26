<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="registerPage.aspx.cs"
    Inherits="Agri_Market.registerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Agri Market - Register</title>

    <!-- Fonts also used by the home page -->
    <link rel="preconnect"
          href="https://fonts.googleapis.com" />

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin="anonymous" />

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;700;800&display=swap"
          rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

    <!-- Existing home-page styles -->
    <link href="css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="css/style.css"
          rel="stylesheet" />

    <style>

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Open Sans', sans-serif;
            background:
                linear-gradient(
                    rgba(31, 68, 17, 0.78),
                    rgba(31, 68, 17, 0.78)
                ),
                url('img/hero-img.jpg');

            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .register-navbar {
            background-color: white;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.12);
        }

        .role-section {
    margin-bottom: 25px;
    padding: 20px;
    background-color: #f5faec;
    border: 2px solid #81c408;
    border-radius: 10px;
}

.role-section h4 {
    font-size: 22px;
    font-weight: 700;
    margin-bottom: 15px;
}

.role-selection {
    font-size: 18px;
    font-weight: 600;
}

.role-selection input {
    width: 18px;
    height: 18px;
    margin-right: 6px;
}

.role-selection label {
    margin-right: 30px;
    cursor: pointer;
}

        .brand-name {
            color: #81c408;
            font-family: 'Raleway', sans-serif;
            font-size: 32px;
            font-weight: 800;
            text-decoration: none;
        }

        .brand-name:hover {
            color: #6da900;
        }

        .nav-link-custom {
            color: #333333;
            font-weight: 600;
            margin-left: 24px;
            text-decoration: none;
            transition: 0.2s;
        }

        .nav-link-custom:hover {
            color: #81c408;
        }

        .register-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding-top: 120px;
            padding-bottom: 60px;
        }

        .register-container {
            width: 94%;
            max-width: 1050px;
            margin: auto;
            background-color: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.28);
        }

        .register-left {
            height: 100%;
            min-height: 650px;
            padding: 50px 42px;
            color: white;
            background:
                linear-gradient(
                    rgba(71, 114, 14, 0.88),
                    rgba(104, 152, 21, 0.88)
                ),
                url('img/banner-fruits.jpg');

            background-size: cover;
            background-position: center;
        }

        .register-left h1 {
            font-family: 'Raleway', sans-serif;
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 18px;
        }

        .register-left-description {
            font-size: 17px;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        .benefit-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 24px;
        }

        .benefit-icon {
            width: 48px;
            height: 48px;
            min-width: 48px;
            margin-right: 15px;
            border-radius: 50%;
            background-color: #ffb524;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
        }

        .benefit-item h5 {
            color: white;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .benefit-item p {
            margin: 0;
            color: rgba(255, 255, 255, 0.9);
        }

        .register-right {
            padding: 42px 48px;
        }

        .register-heading {
            color: #333333;
            font-family: 'Raleway', sans-serif;
            font-size: 34px;
            font-weight: 800;
            text-align: center;
            margin-bottom: 6px;
        }

        .register-subheading {
            color: #777777;
            text-align: center;
            margin-bottom: 28px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            color: #333333;
            font-weight: 600;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: #81c408;
            z-index: 2;
        }

        .registration-input {
            width: 100%;
            height: 48px;
            padding-left: 45px;
            border: 1px solid #dddddd;
            border-radius: 10px;
            transition: 0.2s;
        }

        .registration-input:focus {
            border-color: #81c408;
            box-shadow: 0 0 0 3px rgba(129, 196, 8, 0.15);
            outline: none;
        }

        .role-section {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #e5e5e5;
            border-radius: 12px;
            background-color: #f9fbf5;
        }

        .role-title {
            display: block;
            margin-bottom: 10px;
            color: #333333;
            font-weight: 700;
        }

        .role-options input {
            margin-right: 6px;
        }

        .role-options label {
            margin-right: 28px;
            color: #444444;
            cursor: pointer;
        }

        .admin-panel {
            padding: 15px;
            margin-bottom: 17px;
            border-left: 4px solid #ffb524;
            border-radius: 8px;
            background-color: #fff8e8;
        }

        .farmer-panel {
    padding: 15px;
    margin-bottom: 17px;
    border-left: 4px solid #81c408;
    border-radius: 8px;
    background-color: #f5faec;
}

.farm-description {
    height: auto;
    min-height: 90px;
    padding-top: 12px;
}
        .admin-note {
            display: block;
            margin-top: 6px;
            color: #777777;
            font-size: 13px;
        }

        .register-button {
            width: 100%;
            min-height: 50px;
            border: 2px solid #ffb524;
            border-radius: 25px;
            background-color: #81c408;
            color: white;
            font-size: 16px;
            font-weight: 700;
            transition: 0.2s;
        }

        .register-button:hover {
            background-color: #6da900;
            color: white;
            transform: translateY(-1px);
        }

        .login-link {
            margin-top: 20px;
            text-align: center;
            color: #666666;
        }

        .login-link a {
            color: #81c408;
            font-weight: 700;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .form-message {
            display: block;
            margin-top: 17px;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            font-weight: 600;
        }

        .error-message {
            color: #a80000;
            background-color: #ffe7e7;
        }

        .success-message {
            color: #266400;
            background-color: #eaf7dc;
        }

        .registration-footer {
            color: white;
            text-align: center;
            padding: 18px;
            background-color: rgba(25, 48, 16, 0.88);
        }

        .farmer-panel {
    padding: 18px;
    margin-bottom: 20px;
    background-color: #f5faec;
    border-left: 4px solid #81c408;
    border-radius: 8px;
}
        @media (max-width: 991px) {

            .register-left {
                min-height: auto;
                padding: 35px;
            }

            .register-left h1 {
                font-size: 32px;
            }

            .register-right {
                padding: 35px 25px;
            }

            .register-section {
                padding-top: 145px;
            }
        }

        @media (max-width: 650px) {

            .navbar-links {
                display: none;
            }

            .register-heading {
                font-size: 28px;
            }

            .brand-name {
                font-size: 27px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- Navigation -->
        <div class="container-fluid fixed-top register-navbar">

            <div class="container py-3">

                <div class="d-flex justify-content-between align-items-center">

                    <a href="Home.aspx"
                       class="brand-name">

                        <i class="fas fa-leaf me-2"></i>
                        Agri Market

                    </a>

                    <div class="navbar-links">

                        <a href="Home.aspx"
                           class="nav-link-custom">
                            Home
                        </a>

                        <a href="AllProductsPage.aspx"
                           class="nav-link-custom">
                            Products
                        </a>

                        <a href="LoginPage.aspx"
                           class="nav-link-custom">
                            Login
                        </a>

                        <a href="registerPage.aspx"
                           class="nav-link-custom">
                            Register
                        </a>

                    </div>

                </div>

            </div>

        </div>

        <!-- Registration section -->
        <section class="register-section">

            <div class="register-container">

                <div class="row g-0">

                    <!-- Left information panel -->
                    <div class="col-lg-5">

                        <div class="register-left">

                            <h1>
                                Welcome to Agri Market
                            </h1>

                            <p class="register-left-description">
                                Join our online agricultural marketplace and
                                discover fresh products from trusted sellers.
                            </p>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-seedling"></i>
                                </div>

                                <div>
                                    <h5>Fresh Products</h5>

                                    <p>
                                        Browse agricultural products available
                                        through our online market.
                                    </p>
                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-shopping-basket"></i>
                                </div>

                                <div>
                                    <h5>Simple Shopping</h5>

                                    <p>
                                        Add products to your cart and complete
                                        your purchase easily.
                                    </p>
                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-file-invoice"></i>
                                </div>

                                <div>
                                    <h5>Order History</h5>

                                    <p>
                                        View your previous purchases and
                                        invoices from your account.
                                    </p>
                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-user-shield"></i>
                                </div>

                                <div>
                                    <h5>Customer, Farmer and Admin Access</h5>

                                    <p>
                                        <p>
    Customers shop, farmers manage their farm details,
    while authorised admins manage the platform.
</p>
                                    </p>
                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- Right registration form -->
                    <div class="col-lg-7">

                        <div class="register-right">

                            <h2 class="register-heading">
                                Create an Account
                            </h2>

                            <p class="register-subheading">
                                Enter your information to join Agri Market.
                            </p>

                            <!-- Role choice comes first -->
                            <div class="role-section">

                                <span class="role-title">
                                    Register as
                                </span>

                                <div class="role-section">

    <h4>Register as</h4>

    <asp:RadioButtonList
        ID="roleSelection"
        runat="server"
        CssClass="role-selection"
        RepeatDirection="Horizontal"
        RepeatLayout="Flow"
        AutoPostBack="true"
        OnSelectedIndexChanged="roleSelection_SelectedIndexChanged">

        <asp:ListItem
            Text="Customer"
            Value="Customer"
            Selected="True" />

        <asp:ListItem
            Text="Farmer"
            Value="Farmer" />

        <asp:ListItem
            Text="Admin"
            Value="Admin" />

    </asp:RadioButtonList>

</div>

                            </div>

                            <div class="form-group">

                                <label for="myemail">
                                    Email address
                                </label>

                                <div class="input-wrapper">

                                    <i class="fas fa-envelope"></i>

                                    <asp:TextBox
                                        ID="myemail"
                                        runat="server"
                                        CssClass="registration-input"
                                        TextMode="Email"
                                        placeholder="example@email.com">
                                    </asp:TextBox>

                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6">

                                    <div class="form-group">

                                        <label for="myname">
                                            First name
                                        </label>

                                        <div class="input-wrapper">

                                            <i class="fas fa-user"></i>

                                            <asp:TextBox
                                                ID="myname"
                                                runat="server"
                                                CssClass="registration-input"
                                                placeholder="First name">
                                            </asp:TextBox>

                                        </div>

                                    </div>

                                </div>

                                <div class="col-md-6">

                                    <div class="form-group">

                                        <label for="mysurname">
                                            Surname
                                        </label>

                                        <div class="input-wrapper">

                                            <i class="fas fa-user"></i>

                                            <asp:TextBox
                                                ID="mysurname"
                                                runat="server"
                                                CssClass="registration-input"
                                                placeholder="Surname">
                                            </asp:TextBox>

                                        </div>

                                    </div>

                                </div>

                            </div>

                            <div class="form-group">

                                <label for="myphonenum">
                                    Phone number
                                </label>

                                <div class="input-wrapper">

                                    <i class="fas fa-phone-alt"></i>

                                    <asp:TextBox
                                        ID="myphonenum"
                                        runat="server"
                                        CssClass="registration-input"
                                        placeholder="0712345678">
                                    </asp:TextBox>

                                </div>

                            </div>

                            <div class="form-group">

                                <label for="mypassword">
                                    Password
                                </label>

                                <div class="input-wrapper">

                                    <i class="fas fa-lock"></i>

                                    <asp:TextBox
                                        ID="mypassword"
                                        runat="server"
                                        CssClass="registration-input"
                                        TextMode="Password"
                                        placeholder="Enter your password">
                                    </asp:TextBox>

                                </div>

                               <!-- Only appears when Farmer is selected -->
<asp:Panel
    ID="farmerDetailsPanel"
    runat="server"
    CssClass="farmer-panel"
    Visible="false">

    <div class="form-group">

        <label for="farmName">
            Farm name
        </label>

        <div class="input-wrapper">

            <i class="fas fa-seedling"></i>

            <asp:TextBox
                ID="farmName"
                runat="server"
                CssClass="registration-input"
                placeholder="Farm name">
            </asp:TextBox>

        </div>

    </div>


    <div class="form-group">

        <label for="farmLocation">
            Farm location
        </label>

        <div class="input-wrapper">

            <i class="fas fa-map-marker-alt"></i>

            <asp:TextBox
                ID="farmLocation"
                runat="server"
                CssClass="registration-input"
                placeholder="Farm location">
            </asp:TextBox>

        </div>

    </div>


    <div class="form-group mb-0">

        <label for="farmDescription">
            Farm description
        </label>

        <asp:TextBox
            ID="farmDescription"
            runat="server"
            CssClass="registration-input farm-description"
            TextMode="MultiLine"
            Rows="4"
            placeholder="Tell us a little about the farm">
        </asp:TextBox>

    </div>

</asp:Panel>

                            </div>

                            <!-- Only appears when Admin is selected -->
                            <asp:Panel
                                ID="adminCodePanel"
                                runat="server"
                                CssClass="admin-panel"
                                Visible="false">

                                <div class="form-group mb-0">

                                    <label for="adminCode">
                                        Admin registration code
                                    </label>

                                    <div class="input-wrapper">

                                        <i class="fas fa-key"></i>

                                        <asp:TextBox
                                            ID="adminCode"
                                            runat="server"
                                            CssClass="registration-input"
                                            TextMode="Password"
                                            placeholder="Enter the admin code">
                                        </asp:TextBox>

                                    </div>

                                    <span class="admin-note">
                                        Only authorised people should register
                                        as admins.
                                    </span>

                                </div>

                            </asp:Panel>

                            <asp:Button
                                ID="mybutton"
                                runat="server"
                                Text="Create Account"
                                CssClass="register-button"
                                OnClick="mybutton_Click" />

                            <div class="login-link">

                                Already have an account?

                                <a href="LoginPage.aspx">
                                    Login here
                                </a>

                            </div>

                            <asp:Label
                                ID="lblMessage"
                                runat="server"
                                CssClass="form-message">
                            </asp:Label>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <footer class="registration-footer">

            <p class="mb-0">
                &copy; 2026 Agri Market. Fresh products, simple shopping.
            </p>

        </footer>

    </form>

</body>

</html>

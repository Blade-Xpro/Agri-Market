<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="LoginPage.aspx.cs"
    Inherits="Agri_Market.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Agri Market - Login</title>

    <!-- Fonts used by the home page -->
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

    <!-- Existing Bootstrap and home-page stylesheet -->
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

        .login-navbar {
            background-color: white;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.12);
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

        .login-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding-top: 120px;
            padding-bottom: 60px;
        }

        .login-container {
            width: 94%;
            max-width: 950px;
            margin: auto;
            overflow: hidden;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.28);
        }

        .login-left {
            height: 100%;
            min-height: 570px;
            padding: 55px 42px;
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

        .login-left h1 {
            font-family: 'Raleway', sans-serif;
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 18px;
        }

        .login-left-description {
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
            margin-bottom: 4px;
            color: white;
            font-weight: 700;
        }

        .benefit-item p {
            margin: 0;
            color: rgba(255, 255, 255, 0.9);
        }

        .login-right {
            padding: 55px 50px;
        }

        .login-heading {
            margin-bottom: 7px;
            color: #333333;
            font-family: 'Raleway', sans-serif;
            font-size: 36px;
            font-weight: 800;
            text-align: center;
        }

        .login-subheading {
            margin-bottom: 30px;
            color: #777777;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
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
            z-index: 2;
            color: #81c408;
            transform: translateY(-50%);
        }

        .login-input {
            width: 100%;
            height: 50px;
            padding-left: 45px;
            border: 1px solid #dddddd;
            border-radius: 10px;
            transition: 0.2s;
        }

        .login-input:focus {
            border-color: #81c408;
            outline: none;
            box-shadow: 0 0 0 3px rgba(129, 196, 8, 0.15);
        }

        .login-button {
            width: 100%;
            min-height: 50px;
            margin-top: 5px;
            border: 2px solid #ffb524;
            border-radius: 25px;
            background-color: #81c408;
            color: white;
            font-size: 16px;
            font-weight: 700;
            transition: 0.2s;
        }

        .login-button:hover {
            background-color: #6da900;
            color: white;
            transform: translateY(-1px);
        }

        .register-link {
            margin-top: 22px;
            text-align: center;
            color: #666666;
        }

        .register-link a {
            color: #81c408;
            font-weight: 700;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .home-link {
            margin-top: 12px;
            text-align: center;
        }

        .home-link a {
            color: #555555;
            text-decoration: none;
        }

        .home-link a:hover {
            color: #81c408;
        }

        .form-message {
            display: block;
            margin-top: 18px;
            padding: 10px;
            border-radius: 8px;
            color: #266400;
            background-color: #eaf7dc;
            text-align: center;
            font-weight: 600;
        }

        .login-footer {
            padding: 18px;
            color: white;
            background-color: rgba(25, 48, 16, 0.88);
            text-align: center;
        }

        @media (max-width: 991px) {

            .login-left {
                min-height: auto;
                padding: 35px;
            }

            .login-left h1 {
                font-size: 32px;
            }

            .login-right {
                padding: 40px 25px;
            }

            .login-section {
                padding-top: 145px;
            }
        }

        @media (max-width: 650px) {

            .navbar-links {
                display: none;
            }

            .brand-name {
                font-size: 27px;
            }

            .login-heading {
                font-size: 29px;
            }
        }

    </style>

</head>

<body>

    <!-- Only one server form is allowed -->
    <form id="form1" runat="server">

        <!-- Navigation -->
        <div class="container-fluid fixed-top login-navbar">

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

        <!-- Login section -->
        <section class="login-section">

            <div class="login-container">

                <div class="row g-0">

                    <!-- Left information panel -->
                    <div class="col-lg-5">

                        <div class="login-left">

                            <h1>
                                Welcome Back
                            </h1>

                            <p class="login-left-description">
                                Log in to continue shopping, manage your
                                account and view your Agri Market activity.
                            </p>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                </div>

                                <div>

                                    <h5>Your Shopping Cart</h5>

                                    <p>
                                        Add, remove and update products in
                                        your shopping cart.
                                    </p>

                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-file-invoice"></i>
                                </div>

                                <div>

                                    <h5>Your Invoices</h5>

                                    <p>
                                        Access previous orders and invoices
                                        from your account.
                                    </p>

                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-user-circle"></i>
                                </div>

                                <div>

                                    <h5>Your Profile</h5>

                                    <p>
                                        View and update your personal account
                                        information.
                                    </p>

                                </div>

                            </div>

                            <div class="benefit-item">

                                <div class="benefit-icon">
                                    <i class="fas fa-user-shield"></i>
                                </div>

                                <div>

                                    <h5>Admin Access</h5>

                                    <p>
                                        Admins can manage products and view
                                        system reports.
                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- Right login form -->
                    <div class="col-lg-7">

                        <div class="login-right">

                            <h2 class="login-heading">
                                Login to Your Account
                            </h2>

                            <p class="login-subheading">
                                Enter your email address and password.
                            </p>

                            <div class="form-group">

                                <label for="myemail">
                                    Email address
                                </label>

                                <div class="input-wrapper">

                                    <i class="fas fa-envelope"></i>

                                    <asp:TextBox
                                        ID="myemail"
                                        runat="server"
                                        CssClass="login-input"
                                        TextMode="Email"
                                        placeholder="example@email.com">
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
                                        CssClass="login-input"
                                        TextMode="Password"
                                        placeholder="Enter your password">
                                    </asp:TextBox>

                                </div>

                            </div>

                            <asp:Button
                                ID="loginbtn"
                                runat="server"
                                Text="Login"
                                CssClass="login-button"
                                OnClick="loginbtn_Click" />

                            <div class="register-link">

                                Don't have an account?

                                <a href="registerPage.aspx">
                                    Register here
                                </a>

                            </div>

                            <div class="home-link">

                                <a href="Home.aspx">

                                    <i class="fas fa-arrow-left me-1"></i>
                                    Return to Home

                                </a>

                            </div>

                            <asp:Label
                                ID="loginMessage"
                                runat="server"
                                CssClass="form-message"
                                Visible="false">
                            </asp:Label>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <footer class="login-footer">

            <p class="mb-0">
                &copy; 2026 Agri Market. Fresh products, simple shopping.
            </p>

        </footer>

    </form>

</body>

</html>

<%@ Page Title="Agri Market - Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="Agri_Market.HomePage" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <style>

        body {
            background-color: #eef5e9;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        /* Main welcome section */
        .agri-hero {
            background-color: white;
            padding: 70px 30px;
            margin-bottom: 40px;
        }

        .agri-hero h1 {
            color: #5fa800;
            font-size: 52px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .agri-hero h4 {
            color: #6f9f30;
            margin-bottom: 15px;
        }

        .agri-hero p {
            color: #666;
            font-size: 18px;
            max-width: 650px;
        }

        .shop-btn {
            display: inline-block;
            background-color: #5fa800;
            color: white;
            text-decoration: none;
            padding: 14px 28px;
            border-radius: 25px;
            margin-top: 20px;
            font-weight: 600;
        }

        .shop-btn:hover {
            background-color: #4c8b00;
            color: white;
        }

        .hero-image img {
            width: 100%;
            max-height: 380px;
            object-fit: contain;
        }


        /* Information cards */
        .agri-features {
            padding: 45px 0;
        }

        .feature-card {
            background-color: white;
            border-radius: 18px;
            padding: 30px 20px;
            height: 100%;
            text-align: center;
        }

        .feature-icon {
            font-size: 38px;
            color: #5fa800;
            margin-bottom: 15px;
        }

        .feature-card h5 {
            color: #333;
            font-weight: 600;
        }

        .feature-card p {
            color: #777;
            margin-bottom: 0;
        }


        /* About section */
        .about-agri {
            background-color: white;
            border-radius: 18px;
            padding: 45px;
            margin: 35px auto 60px;
        }

        .about-agri h2 {
            color: #5fa800;
            margin-bottom: 20px;
        }

        .about-agri p {
            color: #666;
            font-size: 17px;
            line-height: 1.7;
        }


        @media (max-width: 768px) {

            .agri-hero {
                text-align: center;
                padding: 45px 20px;
            }

            .agri-hero h1 {
                font-size: 38px;
            }

            .agri-hero p {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-image {
                margin-top: 30px;
            }
        }

    </style>


    <!-- Welcome Section -->
    <div class="container-fluid agri-hero">

        <div class="container">

            <div class="row align-items-center">

                <div class="col-lg-7">

                    <h4>Fresh Produce. Local Farmers.</h4>

                    <h1>Welcome to Agri Market</h1>

                    <p>
                        Agri Market connects customers with farmers
                        and makes it easier to discover fresh fruit,
                        vegetables and other agricultural products.
                    </p>

                    <a href="AllProductsPage.aspx"
                        class="shop-btn">

                        Browse Products

                    </a>

                </div>


                <div class="col-lg-5 hero-image">

                    <img src="img/hero-img-1.png"
                        alt="Fresh agricultural produce" />

                </div>

            </div>

        </div>

    </div>



    <!-- Features -->
    <div class="container agri-features">

        <div class="row g-4">


            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="fas fa-seedling"></i>
                    </div>

                    <h5>Fresh Produce</h5>

                    <p>
                        Browse fruit, vegetables and
                        agricultural products available
                        on Agri Market.
                    </p>

                </div>

            </div>



            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="fas fa-tractor"></i>
                    </div>

                    <h5>Registered Farmers</h5>

                    <p>
                        Farmers can register their farms
                        and manage their information
                        through the system.
                    </p>

                </div>

            </div>



            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="fas fa-shopping-basket"></i>
                    </div>

                    <h5>Simple Shopping</h5>

                    <p>
                        Customers can browse available
                        products and choose the produce
                        they need.
                    </p>

                </div>

            </div>



            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="fas fa-user-check"></i>
                    </div>

                    <h5>Managed Marketplace</h5>

                    <p>
                        Administrators manage users,
                        farmer approvals, orders and
                        system reports.
                    </p>

                </div>

            </div>


        </div>

    </div>



    <!-- About Agri Market -->
    <div class="container">

        <div class="about-agri">

            <div class="row align-items-center">

                <div class="col-lg-8">

                    <h2>About Agri Market</h2>

                    <p>
                        Agri Market is an e-commerce platform
                        designed to connect customers and farmers
                        in one simple marketplace.
                    </p>

                    <p>
                        Customers can discover agricultural
                        products, farmers can maintain their
                        farm information, and administrators
                        manage the activities of the platform.
                    </p>

                </div>


                <div class="col-lg-4 text-center">

                    <a href="Products.aspx"
                        class="shop-btn">

                        View Our Products

                    </a>

                </div>

            </div>

        </div>

    </div>


</asp:Content>

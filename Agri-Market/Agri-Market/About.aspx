<%@ Page Title="About Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="About.aspx.cs"
    Inherits="Agri_Market.About" %>


<asp:Content ID="AboutHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .about-container {
            max-width: 1100px;
            width: 85%;
            margin: 35px auto 60px;
        }

        .about-intro {
            background-color: white;
            padding: 45px;
            border-radius: 18px;
            margin-bottom: 30px;
        }

        .about-intro h1 {
            color: #5fa800;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .about-intro p {
            color: #666;
            font-size: 17px;
            line-height: 1.7;
        }

        .about-section-title {
            color: #37474f;
            font-weight: 700;
            text-align: center;
            margin-bottom: 25px;
        }

        .about-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .about-card {
            background-color: white;
            padding: 30px 25px;
            border-radius: 18px;
            text-align: center;
            border-top: 5px solid #81c408;
        }

        .about-icon {
            font-size: 38px;
            color: #5fa800;
            margin-bottom: 15px;
        }

        .about-card h4 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .about-card p {
            color: #777;
            line-height: 1.6;
        }

        .purpose-box {
            background-color: white;
            padding: 40px;
            border-radius: 18px;
            margin-bottom: 30px;
        }

        .purpose-box h2 {
            color: #5fa800;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .purpose-box p {
            color: #666;
            line-height: 1.7;
            font-size: 17px;
        }

        .browse-button {
            display: inline-block;
            background-color: #5fa800;
            color: white;
            text-decoration: none;
            padding: 13px 27px;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 10px;
        }

        .browse-button:hover {
            background-color: #4c8b00;
            color: white;
        }

        @media (max-width: 850px) {

            .about-cards {
                grid-template-columns: 1fr;
            }

            .about-container {
                width: 92%;
            }

            .about-intro,
            .purpose-box {
                padding: 30px;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="AboutMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="about-container">


        <!-- Introduction -->

        <div class="about-intro">

            <h1>About Agri Market</h1>

            <p>
                Agri Market is an online agricultural marketplace
                that connects customers with farmers and makes it
                easier to discover fresh agricultural products.
            </p>

            <p>
                The platform provides customers with a convenient
                way to browse available produce while giving farmers
                a place to register their farms and participate in
                the marketplace.
            </p>

        </div>



        <!-- Who uses Agri Market -->

        <h2 class="about-section-title">
            Who Uses Agri Market?
        </h2>


        <div class="about-cards">


            <!-- Customers -->

            <div class="about-card">

                <div class="about-icon">
                    <i class="fas fa-shopping-basket"></i>
                </div>

                <h4>Customers</h4>

                <p>
                    Customers can create an account,
                    browse available products and shop
                    for fresh agricultural produce.
                </p>

            </div>



            <!-- Farmers -->

            <div class="about-card">

                <div class="about-icon">
                    <i class="fas fa-tractor"></i>
                </div>

                <h4>Farmers</h4>

                <p>
                    Farmers can register their farms,
                    maintain their farm information and
                    participate in the Agri Market marketplace.
                </p>

            </div>



            <!-- Administrators -->

            <div class="about-card">

                <div class="about-icon">
                    <i class="fas fa-user-cog"></i>
                </div>

                <h4>Administrators</h4>

                <p>
                    Administrators help manage users,
                    farmer approvals, orders and reports
                    to keep the marketplace organised.
                </p>

            </div>


        </div>



        <!-- Purpose -->

        <div class="purpose-box">

            <h2>Our Purpose</h2>

            <p>
                Agri Market aims to provide a simple and organised
                digital marketplace where customers can find fresh
                agricultural products and farmers can connect with
                potential customers.
            </p>

            <p>
                By bringing customers, farmers and marketplace
                management together in one system, Agri Market
                makes agricultural e-commerce easier to access
                and manage.
            </p>

            <a href="Home.aspx"
                class="browse-button">

                Explore Agri Market

            </a>

        </div>


    </div>


</asp:Content>
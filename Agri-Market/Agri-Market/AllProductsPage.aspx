<%@ Page Title="All Products - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AllProductsPage.aspx.cs"
    Inherits="Agri_Market.AllProductsPage" %>


<asp:Content ID="ProductsHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .all-products-container {
            width: 88%;
            max-width: 1200px;
            margin: 35px auto 60px;
        }

        .products-header {
            background-color: white;
            padding: 35px;
            border-radius: 18px;
            margin-bottom: 30px;
        }

        .products-header h1 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .products-header p {
            color: #777;
            margin-bottom: 0;
        }


        /* Category buttons */

        .category-tabs {
            margin-bottom: 30px;
        }

        .category-tabs .nav-link {
            color: #5f9406;
            background-color: white;
            border: 1px solid #dfe8d7;
            border-radius: 25px;
            margin: 5px;
            padding: 10px 24px;
            font-weight: 600;
        }

        .category-tabs .nav-link.active {
            background-color: #81c408;
            color: white;
            border-color: #81c408;
        }


        /* Product cards */

        .product-card {
            background-color: white;
            border-radius: 16px;
            overflow: hidden;
            height: 100%;
            border: 1px solid #e2e7de;
            transition: 0.2s;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        .product-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        .product-body {
            padding: 20px;
        }

        .product-body h4 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .category-badge {
            display: inline-block;
            padding: 5px 12px;
            margin-bottom: 12px;
            border-radius: 15px;
            background-color: #eef7df;
            color: #5f9406;
            font-size: 13px;
            font-weight: 700;
        }

        .view-button {
            display: inline-block;
            margin-top: 8px;
            padding: 9px 18px;
            border: 1px solid #81c408;
            border-radius: 22px;
            color: #5f9406;
            text-decoration: none;
            font-weight: 600;
        }

        .view-button:hover {
            background-color: #81c408;
            color: white;
        }

    </style>

</asp:Content>


<asp:Content ID="ProductsMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="all-products-container">


        <!-- Heading -->

        <div class="products-header">

            <h1>Fresh Products</h1>

            <p>
                Browse fruit and vegetables available
                on Agri Market.
            </p>

        </div>



        <!-- Categories -->

        <ul class="nav nav-pills category-tabs justify-content-center"
            id="productTabs">


            <li class="nav-item">

                <a class="nav-link active"
                    data-bs-toggle="pill"
                    href="#all-products">

                    All Products

                </a>

            </li>


            <li class="nav-item">

                <a class="nav-link"
                    data-bs-toggle="pill"
                    href="#fruits">

                    Fruits

                </a>

            </li>


            <li class="nav-item">

                <a class="nav-link"
                    data-bs-toggle="pill"
                    href="#vegetables">

                    Vegetables

                </a>

            </li>


        </ul>

        <div id="searchResultMessage"
     style="margin-bottom:20px;
            font-weight:600;
            color:#5f9406;">
</div>


        <div class="tab-content">


            <!-- ================================= -->
            <!-- ALL PRODUCTS -->
            <!-- ================================= -->

            <div id="all-products"
                class="tab-pane fade show active">


                <div class="row g-4">


                    <!-- Grapes -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-5.jpg"
                                class="product-image"
                                alt="Grapes" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Grapes</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Oranges -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-1.jpg"
                                class="product-image"
                                alt="Oranges" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Oranges</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Raspberries -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-2.jpg"
                                class="product-image"
                                alt="Raspberries" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Raspberries</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Banana -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-3.jpg"
                                class="product-image"
                                alt="Bananas" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Bananas</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Apricots -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-4.jpg"
                                class="product-image"
                                alt="Apricots" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Apricots</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Apple -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-6.jpg"
                                class="product-image"
                                alt="Apples" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Apples</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Bell Pepper -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-1.jpg"
                                class="product-image"
                                alt="Bell peppers" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Bell Peppers</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Potatoes -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-5.jpg"
                                class="product-image"
                                alt="Potatoes" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Potatoes</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Parsley -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-6.jpg"
                                class="product-image"
                                alt="Parsley" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Parsley</h4>

                                <a href="Products.aspx"
                                    class="view-button">

                                    View Products

                                </a>

                            </div>

                        </div>

                    </div>


                </div>

            </div>



            <!-- ================================= -->
            <!-- FRUITS -->
            <!-- ================================= -->

            <div id="fruits"
                class="tab-pane fade">


                <div class="row g-4">


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-5.jpg"
                                class="product-image"
                                alt="Grapes" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Grapes</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-1.jpg"
                                class="product-image"
                                alt="Oranges" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Oranges</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-2.jpg"
                                class="product-image"
                                alt="Raspberries" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Raspberries</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-3.jpg"
                                class="product-image"
                                alt="Bananas" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Bananas</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-4.jpg"
                                class="product-image"
                                alt="Apricots" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Apricots</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/fruite-item-6.jpg"
                                class="product-image"
                                alt="Apples" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Fruit
                                </span>

                                <h4>Apples</h4>

                            </div>

                        </div>

                    </div>


                </div>

            </div>



            <!-- ================================= -->
            <!-- VEGETABLES -->
            <!-- ================================= -->

            <div id="vegetables"
                class="tab-pane fade">


                <div class="row g-4">


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-1.jpg"
                                class="product-image"
                                alt="Bell peppers" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Bell Peppers</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-5.jpg"
                                class="product-image"
                                alt="Potatoes" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Potatoes</h4>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-6.jpg"
                                class="product-image"
                                alt="Parsley" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Parsley</h4>

                            </div>

                        </div>

                    </div>


                </div>

            </div>


        </div>


    </div>

    <script>

    var parameters =
        new URLSearchParams(window.location.search);

    var searchTerm =
        parameters.get("searchTerm");


    if (searchTerm != null && searchTerm.trim() != "") {

        searchTerm =
            searchTerm.trim().toLowerCase();


        // Hide the category buttons while showing search results
        var tabs =
            document.getElementById("productTabs");

        if (tabs != null) {
            tabs.style.display = "none";
        }


        // Make sure All Products is the visible section
        var allProducts =
            document.getElementById("all-products");

        var panes =
            document.querySelectorAll(".tab-pane");

        panes.forEach(function (pane) {

            pane.classList.remove("show");
            pane.classList.remove("active");

        });

        allProducts.classList.add("show");
        allProducts.classList.add("active");


        // Get all product cards from All Products
        var products =
            allProducts.querySelectorAll(".product-card");

        var numberFound = 0;


        products.forEach(function (product) {

            var productName =
                product.querySelector("h4")
                       .innerText
                       .toLowerCase();

            var category =
                product.querySelector(".category-badge")
                       .innerText
                       .toLowerCase();

            var productColumn =
                product.parentElement;


            if (
                productName.includes(searchTerm) ||
                category.includes(searchTerm)
            ) {

                productColumn.style.display = "";
                numberFound++;

            }
            else {

                productColumn.style.display = "none";

            }

        });


        // Display search result message
        var message =
            document.getElementById(
                "searchResultMessage"
            );


        if (numberFound > 0) {

            message.innerText =
                "Search results for \"" +
                searchTerm +
                "\"";

        }
        else {

            message.innerText =
                "No products found for \"" +
                searchTerm +
                "\"";

        }

    }

    </script>
</asp:Content>

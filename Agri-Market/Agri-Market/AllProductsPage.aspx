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

        .product-message {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #5fa800;
        }


        /* Categories */

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


        /* Products */

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

        .product-price {
            color: #5fa800;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .cart-button {
            display: inline-block;
            margin-top: 8px;
            padding: 9px 18px;
            border: 1px solid #81c408;
            border-radius: 22px;
            background-color: white;
            color: #5f9406;
            font-weight: 600;
        }

        .cart-button:hover {
            background-color: #81c408;
            color: white;
        }

        .view-cart-link {
            display: inline-block;
            margin-left: 15px;
            margin-top: 15px;
            color: #5fa800;
            font-weight: 600;
            text-decoration: none;
        }

        .view-cart-link:hover {
            text-decoration: underline;
        }

    </style>

</asp:Content>



<asp:Content ID="ProductsMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="all-products-container">


        <!-- Header -->

        <div class="products-header">

            <h1>Fresh Products</h1>

            <p>
                Browse fruit and vegetables available
                on Agri Market.
            </p>


            <asp:Label
                ID="lblProductMessage"
                runat="server"
                CssClass="product-message">
            </asp:Label>


            <a href="ShoppingCart.aspx"
                class="view-cart-link">

                View My Cart 🛒

            </a>

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



        <!-- Search message -->

        <div id="searchResultMessage"
            style="margin-bottom:20px;
                   font-weight:600;
                   color:#5f9406;">
        </div>



        <div class="tab-content">


            <!-- ===================================== -->
            <!-- ALL PRODUCTS -->
            <!-- ===================================== -->

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

                                <div class="product-price">R 35.00 / kg</div>

                                <asp:Button
                                    ID="btnGrapesCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Grapes"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 22.00 / kg</div>

                                <asp:Button
                                    ID="btnOrangesCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Oranges"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 40.00 / kg</div>

                                <asp:Button
                                    ID="btnRaspberriesCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Raspberries"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>



                    <!-- Bananas -->

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

                                <div class="product-price">R 20.00 / kg</div>

                                <asp:Button
                                    ID="btnBananasCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Bananas"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 30.00 / kg</div>

                                <asp:Button
                                    ID="btnApricotsCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Apricots"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>



                    <!-- Apples -->

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

                                <div class="product-price">R 25.00 / kg</div>

                                <asp:Button
                                    ID="btnApplesCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Apples"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>



                    <!-- Bell Peppers -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-1.jpg"
                                class="product-image"
                                alt="Bell Peppers" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Bell Peppers</h4>

                                <div class="product-price">R 28.00 / kg</div>

                                <asp:Button
                                    ID="btnPeppersCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Bell Peppers"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 18.00 / kg</div>

                                <asp:Button
                                    ID="btnPotatoesCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Potatoes"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 12.00 / bunch</div>

                                <asp:Button
                                    ID="btnParsleyCartAll"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Parsley"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>


                </div>

            </div>



            <!-- ===================================== -->
            <!-- FRUITS -->
            <!-- ===================================== -->

            <div id="fruits"
                class="tab-pane fade">


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

                                <div class="product-price">R 35.00 / kg</div>

                                <asp:Button
                                    ID="btnGrapesCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Grapes"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 22.00 / kg</div>

                                <asp:Button
                                    ID="btnOrangesCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Oranges"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 40.00 / kg</div>

                                <asp:Button
                                    ID="btnRaspberriesCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Raspberries"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>



                    <!-- Bananas -->

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

                                <div class="product-price">R 20.00 / kg</div>

                                <asp:Button
                                    ID="btnBananasCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Bananas"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 30.00 / kg</div>

                                <asp:Button
                                    ID="btnApricotsCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Apricots"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>



                    <!-- Apples -->

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

                                <div class="product-price">R 25.00 / kg</div>

                                <asp:Button
                                    ID="btnApplesCartFruit"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Apples"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>


                </div>

            </div>



            <!-- ===================================== -->
            <!-- VEGETABLES -->
            <!-- ===================================== -->

            <div id="vegetables"
                class="tab-pane fade">


                <div class="row g-4">


                    <!-- Bell Peppers -->

                    <div class="col-md-6 col-lg-4 col-xl-3">

                        <div class="product-card">

                            <img src="img/vegetable-item-1.jpg"
                                class="product-image"
                                alt="Bell Peppers" />

                            <div class="product-body">

                                <span class="category-badge">
                                    Vegetable
                                </span>

                                <h4>Bell Peppers</h4>

                                <div class="product-price">R 28.00 / kg</div>

                                <asp:Button
                                    ID="btnPeppersCartVegetable"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Bell Peppers"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 18.00 / kg</div>

                                <asp:Button
                                    ID="btnPotatoesCartVegetable"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Potatoes"
                                    OnCommand="AddToCart_Command" />

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

                                <div class="product-price">R 12.00 / bunch</div>

                                <asp:Button
                                    ID="btnParsleyCartVegetable"
                                    runat="server"
                                    Text="Add to Cart"
                                    CssClass="cart-button"
                                    CommandArgument="Parsley"
                                    OnCommand="AddToCart_Command" />

                            </div>

                        </div>

                    </div>


                </div>

            </div>


        </div>


    </div>



    <!-- SEARCH FILTER -->

    <script>

        var parameters =
            new URLSearchParams(window.location.search);

        var searchTerm =
            parameters.get("searchTerm");


        if (searchTerm != null &&
            searchTerm.trim() != "") {

            searchTerm =
                searchTerm.trim().toLowerCase();


            // Hide category buttons during search

            var tabs =
                document.getElementById("productTabs");

            if (tabs != null) {
                tabs.style.display = "none";
            }


            // Show All Products section

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


            // Search products

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

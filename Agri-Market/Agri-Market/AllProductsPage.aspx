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
    .category-filter {
    display: flex;
    justify-content: center;
    gap: 12px;
}

.category-btn {
    background-color: white;
    color: #4f8f00;
    border: 1px solid #4f8f00;
    border-radius: 8px;
    padding: 10px 22px;
    cursor: pointer;
}

.category-btn:hover {
    background-color: #4f8f00;
    color: white;
}
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

      .products-section {
    background: #f7f8f3;
    padding: 50px 0;
}

.product-card {
    background: white;
    border: none;
    border-radius: 18px;
    overflow: hidden;
    height: 100%;
    box-shadow: 0 4px 18px rgba(0,0,0,0.08);
    transition: transform 0.2s ease;
}

.product-card:hover {
    transform: translateY(-5px);
}

.product-image {
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.product-body {
    padding: 22px;
}

.product-name {
    font-size: 22px;
    font-weight: 700;
    color: #263238;
    margin-bottom: 8px;
}

.product-description {
    color: #6c757d;
    min-height: 50px;
}

.product-price {
    font-size: 20px;
    font-weight: 700;
    color: #4f8f00;
    margin: 15px 0 5px;
}

.product-stock {
    font-size: 14px;
    color: #777;
}

.cart-button {
    background: #4f8f00;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 10px 18px;
    margin-top: 12px;
}

.cart-button:hover {
    background: #3d7000;
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

        <div class="category-filter mb-4">

   <asp:Button
    ID="btnAll"
    runat="server"
    Text="All Products"
    CommandArgument="0"
    OnCommand="Category_Command"
    CssClass="category-btn" />

<asp:Button
    ID="btnFruits"
    runat="server"
    Text="Fruits"
    CommandArgument="1"
    OnCommand="Category_Command"
    CssClass="category-btn" />

<asp:Button
    ID="btnVegetables"
    runat="server"
    Text="Vegetables"
    CommandArgument="2"
    OnCommand="Category_Command"
    CssClass="category-btn" />

</div>



        <!-- Search message -->

        <div id="searchResultMessage"
            style="margin-bottom:20px;
                   font-weight:600;
                   color:#5f9406;">
        </div>



       <div class="row g-4">

           <div class="mb-4 d-flex justify-content-end align-items-center">

    <span class="me-2">Sort by:</span>

   <asp:DropDownList
    ID="ddlSort"
    runat="server"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

    <asp:ListItem Text="Name: A - Z" Value="nameAsc" />
    <asp:ListItem Text="Price: Low to High" Value="priceAsc" />

</asp:DropDownList>

</div>
    <asp:Repeater
        ID="rptProducts"
        runat="server">

        <ItemTemplate>

           <div class="col-md-6 col-lg-4 col-xl-3 mb-4">

    <div class="product-card">

        <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'>
            <img
                src='<%# Eval("ImageUrl") %>'
                class="product-image"
                alt='<%# Eval("ProductName") %>' />
        </a>

        <div class="product-body">

            <h4 class="product-name">
                <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'
                   style="text-decoration:none; color:inherit;">
                    <%# Eval("ProductName") %>
                </a>
            </h4>

            <p class="product-description">
                <%# Eval("Description") %>
            </p>

            <div class="product-price">
                R <%# Eval("Price", "{0:0.00}") %>
                / <%# Eval("UnitOfMeasure") %>
            </div>

            <div class="product-stock">
                <%# Eval("StockQuantity") %> available
            </div>

            <asp:Button
                ID="btnAddToCart"
                runat="server"
                Text="Add to Cart"
                CssClass="cart-button"
                CommandArgument='<%# Eval("ProductId") %>'
                OnCommand="AddToCart_Command" />

        </div>

    </div>

</div>
        </ItemTemplate>

    </asp:Repeater>

</div>


   


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProducts.aspx.cs" Inherits="Agri_Market.MyProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>

        .products-container {
            width: 90%;
            max-width: 1200px;
            margin: 50px auto;
        }

        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
        }

        .products-header h2 {
            color: #333;
            margin-bottom: 5px;
        }

        .products-header p {
            color: #777;
        }

        .header-buttons {
            display: flex;
            gap: 10px;
        }

        .dashboard-btn,
        .add-btn {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
        }

        .dashboard-btn {
            border: 1px solid #65a30d;
            color: #65a30d;
            background-color: white;
        }

        .add-btn {
            background-color: #65a30d;
            color: white;
            border: 1px solid #65a30d;
        }

        .product-grid {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .product-card {
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-info {
            padding: 20px;
        }

        .product-name {
            font-size: 21px;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }

        .product-price {
            color: #65a30d;
            font-size: 18px;
            font-weight: 600;
        }

        .product-stock {
            color: #777;
            margin-top: 8px;
        }

        .product-actions {
            display: flex;
            gap: 10px;
            margin-top: 18px;
        }

        .edit-btn {
            background-color: #65a30d;
            color: white;
            border: none;
            padding: 9px 18px;
            border-radius: 7px;
            cursor: pointer;
        }

        .delete-btn {
            background-color: white;
            color: #dc3545;
            border: 1px solid #dc3545;
            padding: 9px 18px;
            border-radius: 7px;
            cursor: pointer;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="products-container">


        <!-- PAGE HEADER -->

        <div class="products-header">

            <div>
                <h2>My Products</h2>
                <p>
                    View and manage the products you sell
                    on Agri Market.
                </p>
            </div>


            <div class="header-buttons">

                
               

                <a href="AddProduct.aspx"
                   class="add-btn">
                    + Add Product
                </a>

                <a href="FarmerProfile.aspx"
   class="dashboard-btn">
    Farmer Profile
</a>

            </div>

        </div>


        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red">
        </asp:Label>


        <!-- FARMER PRODUCTS WILL APPEAR HERE -->

        <div class="product-grid">

            <asp:Repeater
                ID="rptMyProducts"
                runat="server">

                <ItemTemplate>

                    <div class="product-card">

                        <img
                            src='<%# Eval("ImageUrl") %>'
                            class="product-image"
                            alt='<%# Eval("ProductName") %>' />


                        <div class="product-info">

                            <div class="product-name">
                                <%# Eval("ProductName") %>
                            </div>


                            <div class="product-price">

                                R <%# Eval("Price", "{0:0.00}") %>
                                /
                                <%# Eval("UnitOfMeasure") %>

                            </div>


                            <div class="product-stock">

                                Stock:
                                <%# Eval("StockQuantity") %>

                            </div>


                            <div class="product-actions">

                                <asp:Button
    ID="btnEdit"
    runat="server"
    Text="Edit"
    CssClass="edit-btn"
    CommandArgument='<%# Eval("ProductId") %>'
    OnCommand="EditProduct_Command" />

                                <asp:Button
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CssClass="delete-btn"
                                    CommandArgument='<%# Eval("ProductId") %>'
                                    OnCommand="DeleteProduct_Command"/>

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</asp:Content>

<%@ Page Title="Shopping Cart - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ShoppingCart.aspx.cs"
    Inherits="Agri_Market.ShoppingCartPage" %>

<asp:Content ID="CartHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .cart-container {
            width: 88%;
            max-width: 1050px;
            margin: 35px auto 60px;
        }

        .cart-header {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 25px;
        }

        .cart-header h1 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .cart-header p {
            color: #777;
            margin-bottom: 0;
        }

        .cart-box {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
        }

        .cart-item {
            display: grid;
            grid-template-columns: 90px 2fr 1fr 1fr 1fr auto;
            gap: 20px;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #e5e5e5;
        }

        .cart-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 12px;
        }

        .product-name {
            color: #37474f;
            font-weight: 700;
            font-size: 18px;
        }

        .cart-label {
            color: #777;
            font-size: 13px;
        }

        .cart-value {
            color: #333;
            font-weight: 600;
        }

        .quantity-box {
            width: 70px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f5f5f5;
        }

        .remove-button {
            border: none;
            background-color: #f4e9e9;
            color: #b34343;
            padding: 9px 15px;
            border-radius: 20px;
            font-weight: 600;
        }

        .remove-button:hover {
            background-color: #b34343;
            color: white;
        }

        .cart-summary {
            margin-top: 30px;
            padding-top: 25px;
            border-top: 2px solid #eef5e9;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .cart-total {
            font-size: 22px;
            font-weight: 700;
            color: #37474f;
        }

        .cart-total span {
            color: #5fa800;
        }

        .checkout-button {
            background-color: #5fa800;
            color: white;
            border: none;
            padding: 13px 28px;
            border-radius: 25px;
            font-weight: 700;
        }

        .checkout-button:hover {
            background-color: #4c8b00;
        }

        .continue-link {
            display: inline-block;
            margin-top: 25px;
            color: #5fa800;
            font-weight: 600;
            text-decoration: none;
        }

        .empty-cart {
            text-align: center;
            padding: 50px 20px;
            color: #777;
        }

        .cart-message {
            display: block;
            margin-bottom: 20px;
            color: #5fa800;
            font-weight: 600;
        }

        @media(max-width: 850px) {

            .cart-item {
                grid-template-columns: 80px 1fr;
            }

            .cart-summary {
                flex-direction: column;
                align-items: stretch;
            }

            .checkout-button {
                width: 100%;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="CartMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="cart-container">

        <div class="cart-header">

            <h1>My Shopping Cart</h1>

            <p>
                Review the products you want to purchase.
            </p>

        </div>


        <div class="cart-box">

            <asp:Label
                ID="lblCartMessage"
                runat="server"
                CssClass="cart-message">
            </asp:Label>


            <!-- Empty cart -->

            <asp:Panel
                ID="pnlEmptyCart"
                runat="server"
                CssClass="empty-cart"
                Visible="false">

                <h3>Your cart is empty</h3>

                <p>
                    Browse Agri Market and add some fresh products.
                </p>

                <a href="AllProductsPage.aspx"
                    class="continue-link">
                    Browse Products
                </a>

            </asp:Panel>


            <!-- Cart items -->

            <asp:Repeater
                ID="rptCartItems"
                runat="server"
                OnItemCommand="rptCartItems_ItemCommand">

                <ItemTemplate>

                    <div class="cart-item">


                        <img
                            src='<%# Eval("ImageUrl") %>'
                            class="cart-image"
                            alt='<%# Eval("ProductName") %>' />


                        <div>

                            <div class="cart-label">
                                Product
                            </div>

                            <div class="product-name">
                                <%# Eval("ProductName") %>
                            </div>

                        </div>


                        <div>

                            <div class="cart-label">
                                Price
                            </div>

                            <div class="cart-value">
                                R <%# Eval("Price", "{0:F2}") %>
                            </div>

                        </div>


                        <div>

                            <div class="cart-label">
                                Quantity
                            </div>

                            <asp:TextBox
                                ID="txtQuantity"
                                runat="server"
                                Text='<%# Eval("Quantity") %>'
                                CssClass="quantity-box"
                                ReadOnly="true">
                            </asp:TextBox>

                        </div>


                        <div>

                            <div class="cart-label">
                                Total
                            </div>

                            <div class="cart-value">
                                R <%# Eval("LineTotal", "{0:F2}") %>
                            </div>

                        </div>


                        <asp:Button
                            ID="btnRemove"
                            runat="server"
                            Text="Remove"
                            CssClass="remove-button"
                            CommandName="RemoveItem"
                            CommandArgument='<%# Eval("CartItemId") %>' />

                    </div>

                </ItemTemplate>

            </asp:Repeater>


            <!-- Cart summary -->

            <asp:Panel
                ID="pnlCartSummary"
                runat="server"
                Visible="false">

                <div class="cart-summary">

                    <div class="cart-total">

                        Cart Total:

                        <span>
                            R
                            <asp:Label
                                ID="lblCartTotal"
                                runat="server"
                                Text="0.00">
                            </asp:Label>
                        </span>

                    </div>


                    <asp:Button
                        ID="btnCheckout"
                        runat="server"
                        Text="Proceed to Checkout"
                        CssClass="checkout-button"
                        OnClick="btnCheckout_Click" />

                </div>


                <a href="AllProductsPage.aspx"
                    class="continue-link">

                    ← Continue Shopping

                </a>

            </asp:Panel>

        </div>

    </div>

</asp:Content>

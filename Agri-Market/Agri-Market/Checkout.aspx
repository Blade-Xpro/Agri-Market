<%@ Page Title="Checkout - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs"
    Inherits="Agri_Market.CheckoutPage" %>


<asp:Content ID="CheckoutHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .checkout-container {
            width: 88%;
            max-width: 950px;
            margin: 35px auto 60px;
        }

        .checkout-header {
            background-color: white;
            padding: 32px;
            border-radius: 18px;
            margin-bottom: 25px;
        }

        .checkout-header h1 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .checkout-header p {
            color: #777;
            margin-bottom: 0;
        }

        .checkout-box {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 25px;
        }

        .checkout-box h3 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .checkout-item {
            display: grid;
            grid-template-columns: 1fr auto auto;
            gap: 25px;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            align-items: center;
        }

        .product-name {
            font-weight: 700;
            color: #37474f;
        }

        .item-detail {
            color: #777;
        }

        .item-total {
            font-weight: 700;
            color: #5fa800;
        }

        .delivery-label {
            display: block;
            color: #37474f;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .delivery-dropdown {
            width: 100%;
            padding: 12px;
            border: 1px solid #d8dfd2;
            border-radius: 10px;
            background-color: white;
        }

        .order-total {
            margin-top: 25px;
            padding-top: 20px;
            border-top: 2px solid #eef5e9;
            display: flex;
            justify-content: space-between;
            font-size: 22px;
            font-weight: 700;
            color: #37474f;
        }

        .total-value {
            color: #5fa800;
        }

        .checkout-actions {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .back-button {
            color: #5fa800;
            text-decoration: none;
            font-weight: 600;
        }

        .place-order-button {
            border: none;
            background-color: #5fa800;
            color: white;
            padding: 13px 30px;
            border-radius: 25px;
            font-weight: 700;
        }

        .place-order-button:hover {
            background-color: #4d8c00;
        }

        .checkout-message {
            display: block;
            margin-bottom: 20px;
            font-weight: 600;
            color: #b34343;
        }

        @media(max-width: 700px) {

            .checkout-item {
                grid-template-columns: 1fr;
                gap: 5px;
            }

            .checkout-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .place-order-button {
                width: 100%;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="CheckoutMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="checkout-container">


        <div class="checkout-header">

            <h1>Checkout</h1>

            <p>
                Review your order before placing it.
            </p>

        </div>



        <div class="checkout-box">


            <asp:Label
                ID="lblCheckoutMessage"
                runat="server"
                CssClass="checkout-message">
            </asp:Label>


            <h3>Order Summary</h3>


            <asp:Repeater
                ID="rptCheckoutItems"
                runat="server">

                <ItemTemplate>

                    <div class="checkout-item">


                        <div>

                            <div class="product-name">
                                <%# Eval("ProductName") %>
                            </div>

                            <div class="item-detail">
                                Quantity:
                                <%# Eval("Quantity") %>
                            </div>

                        </div>


                        <div class="item-detail">

                            R <%# Eval("Price", "{0:F2}") %>
                            each

                        </div>


                        <div class="item-total">

                            R <%# Eval("LineTotal", "{0:F2}") %>

                        </div>


                    </div>

                </ItemTemplate>

            </asp:Repeater>



            <div style="margin-top:30px;">

                <asp:Label
                    ID="lblDelivery"
                    runat="server"
                    Text="Delivery Method"
                    CssClass="delivery-label">
                </asp:Label>


                <asp:DropDownList
                    ID="ddlDeliveryMethod"
                    runat="server"
                    CssClass="delivery-dropdown">

                    <asp:ListItem
                        Text="Collection"
                        Value="Collection">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Delivery"
                        Value="Delivery">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>



            <div class="order-total">

                <span>
                    Order Total
                </span>

                <span class="total-value">

                    R
                    <asp:Label
                        ID="lblOrderTotal"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </span>

            </div>



            <div class="checkout-actions">


                <a href="ShoppingCart.aspx"
                    class="back-button">

                    ← Back to Cart

                </a>


                <asp:Button
                    ID="btnPlaceOrder"
                    runat="server"
                    Text="Place Order"
                    CssClass="place-order-button"
                    OnClick="btnPlaceOrder_Click" />


            </div>


        </div>


    </div>


</asp:Content>
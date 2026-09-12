<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Agri_Market.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

   <style>

        .orders-container {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
        }

        .orders-container h2 {
            color: #333;
            margin-bottom: 8px;
        }

        .orders-container p {
            color: #777;
            margin-bottom: 30px;
        }

        .order-card {
            background: white;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 18px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-info {
            display: flex;
            gap: 35px;
            align-items: center;
            flex-wrap: wrap;
        }

        .order-number {
            font-weight: 700;
            color: #333;
            font-size: 18px;
        }

        .order-date,
        .order-method,
        .order-status {
            color: #777;
        }

        .order-total {
            color: #5fa800;
            font-weight: 700;
            font-size: 18px;
        }

        .view-btn {
            background: #65a30d;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 20px;
            font-weight: 600;
        }

        .view-btn:hover {
            color: white;
            background: #559000;
        }

        .message {
            color: #777;
            font-size: 17px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="orders-container">

        <h2>My Orders</h2>

        <p>
            View your previous and current Agri Market orders.
        </p>

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <asp:Repeater
            ID="rptOrders"
            runat="server">

            <ItemTemplate>

                <div class="order-card">

                    <div class="order-info">

                        <div class="order-number">
                            Order #<%# Eval("OrderId") %>
                        </div>

                        <div class="order-date">
                            <%# Eval(
                                "OrderDate",
                                "{0:dd MMM yyyy}"
                            ) %>
                        </div>

                        <div class="order-status">
                            Status:
                            <%# Eval("OrderStatus") %>
                        </div>

                        <div class="order-method">
                            <%# Eval("DeliveryMethod") %>
                        </div>

                        <div class="order-total">
                            R <%# Eval(
                                "TotalAmount",
                                "{0:0.00}"
                            ) %>
                        </div>

                    </div>


                    <a
                        class="view-btn"
                        href='Invoice.aspx?orderId=<%# Eval("OrderId") %>'>

                        View Invoice

                    </a>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</asp:Content>

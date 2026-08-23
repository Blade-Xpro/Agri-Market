<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="Agri_Market.ManageOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Manage Orders - Agri Market</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eef5e9;
        }

        .orders-container {
            max-width: 1050px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .page-title {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 30px;
        }

        .order-card {
            background-color: #fbfdf8;
            border: 1px solid #e0e5db;
            border-left: 5px solid #81c408;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .order-header h4 {
            margin: 0;
            color: #37474f;
            font-weight: 700;
        }

        .status-badge {
            background-color: #eef7df;
            color: #5f9406;
            padding: 6px 14px;
            border-radius: 18px;
            font-weight: 700;
        }

        .order-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px 25px;
            margin-bottom: 20px;
        }

        .order-info p {
            margin: 0;
            color: #666;
        }

        .status-section {
            display: flex;
            gap: 12px;
            align-items: center;
            margin-top: 15px;
        }

        .status-dropdown {
            flex: 1;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 8px;
        }

        .update-button {
            padding: 10px 22px;
            border: 2px solid #ffb524;
            border-radius: 22px;
            background-color: #81c408;
            color: white;
            font-weight: 700;
        }

        .update-button:hover {
            background-color: #6eaa07;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #5f9406;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .order-info {
                grid-template-columns: 1fr;
            }

            .status-section {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <div class="orders-container">

        <h2 class="page-title">
            View / Manage Orders
        </h2>

        <p class="page-subtitle">
            View customer orders and update their order status.
        </p>


        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


        <!-- ORDERS WILL APPEAR HERE -->
        <asp:Repeater
    ID="rptOrders"
    runat="server"
    OnItemCommand="rptOrders_ItemCommand">

            <ItemTemplate>

                <div class="order-card">

                    <div class="order-header">

                        <h4>
                            Order #<%# Eval("OrderId") %>
                        </h4>

                        <span class="status-badge">
                            <%# Eval("OrderStatus") %>
                        </span>

                    </div>


                    <div class="order-info">

                        <p>
                            <strong>Customer:</strong>
                            <%# Eval("CustomerName") %>
                        </p>

                        <p>
                            <strong>Order Date:</strong>
                            <%# Eval("OrderDate", "{0:dd MMM yyyy}") %>
                        </p>

                        <p>
                            <strong>Total:</strong>
                            R <%# Eval("TotalAmount", "{0:F2}") %>
                        </p>

                        <p>
                            <strong>Delivery Method:</strong>
                            <%# Eval("DeliveryMethod") %>
                        </p>

                    </div>


                    <div class="status-section">

                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="status-dropdown">

                            <asp:ListItem Text="Pending" Value="Pending" />
                            <asp:ListItem Text="Processing" Value="Processing" />
                            <asp:ListItem Text="Ready" Value="Ready" />
                            <asp:ListItem Text="Completed" Value="Completed" />
                            <asp:ListItem Text="Cancelled" Value="Cancelled" />

                        </asp:DropDownList>


                        <asp:Button
                            ID="btnUpdateStatus"
                            runat="server"
                            Text="Update Status"
                            CssClass="update-button"
                            CommandName="UpdateStatus"
                            CommandArgument='<%# Eval("OrderId") %>' />

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <a href="AdminProfile.aspx" class="back-link">
            ← Back to Admin Profile
        </a>

    </div>
    </form>
</body>
</html>

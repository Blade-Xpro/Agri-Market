<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyInvoices.aspx.cs" Inherits="Agri_Market.MyInvoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
      <style>

        .invoice-container {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
        }

        .invoice-container h2 {
            color: #333;
            margin-bottom: 8px;
        }

        .invoice-container p {
            color: #777;
            margin-bottom: 30px;
        }

        .invoice-card {
            background: white;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 18px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .invoice-info {
            display: flex;
            gap: 45px;
            align-items: center;
        }

        .invoice-number {
            font-weight: 700;
            color: #333;
            font-size: 18px;
        }

        .invoice-date {
            color: #777;
        }

        .invoice-total {
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
    <div class="invoice-container">

        <h2>My Invoices</h2>

        <p>
            View invoices from your previous Agri Market orders.
        </p>


        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <asp:Repeater
            ID="rptInvoices"
            runat="server">

            <ItemTemplate>

                <div class="invoice-card">

                    <div class="invoice-info">

                        <div class="invoice-number">

                            <%# Eval("InvoiceNumber") %>

                        </div>


                        <div class="invoice-date">

                            <%# Eval(
                                "InvoiceDate",
                                "{0:dd MMM yyyy}"
                            ) %>

                        </div>


                        <div class="invoice-total">

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

<%@ Page Title="Invoice - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Invoice.aspx.cs"
    Inherits="Agri_Market.InvoicePage" %>


<asp:Content ID="InvoiceHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .invoice-container {
            width: 88%;
            max-width: 950px;
            margin: 35px auto 60px;
        }

        .invoice-success {
            background-color: #eef7df;
            color: #5f9406;
            padding: 20px 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .invoice-box {
            background-color: white;
            padding: 38px;
            border-radius: 18px;
        }

        .invoice-header {
            display: flex;
            justify-content: space-between;
            gap: 25px;
            padding-bottom: 25px;
            border-bottom: 2px solid #eef5e9;
            margin-bottom: 25px;
        }

        .invoice-header h1 {
            color: #5fa800;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .invoice-header p {
            color: #777;
            margin: 0;
        }

        .invoice-details {
            text-align: right;
        }

        .invoice-details strong {
            color: #37474f;
        }

        .invoice-number {
            color: #5fa800;
            font-weight: 700;
            font-size: 18px;
        }

        .invoice-table-header {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 15px;
            padding: 14px 0;
            border-bottom: 2px solid #ddd;
            color: #37474f;
            font-weight: 700;
        }

        .invoice-item {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 15px;
            padding: 16px 0;
            border-bottom: 1px solid #eee;
            align-items: center;
        }

        .product-name {
            font-weight: 700;
            color: #37474f;
        }

        .line-total {
            color: #5fa800;
            font-weight: 700;
        }

        .invoice-totals {
            width: 350px;
            margin-left: auto;
            margin-top: 30px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            padding: 9px 0;
            color: #666;
        }

        .grand-total {
            border-top: 2px solid #eef5e9;
            margin-top: 8px;
            padding-top: 15px;
            font-size: 21px;
            font-weight: 700;
            color: #37474f;
        }

        .grand-total span:last-child {
            color: #5fa800;
        }

        .invoice-actions {
            margin-top: 35px;
            padding-top: 25px;
            border-top: 1px solid #eee;
            display: flex;
            gap: 15px;
        }

        .invoice-button {
            display: inline-block;
            text-decoration: none;
            border-radius: 24px;
            padding: 11px 22px;
            font-weight: 600;
        }

        .primary-button {
            background-color: #5fa800;
            color: white;
        }

        .primary-button:hover {
            background-color: #4c8b00;
            color: white;
        }

        .secondary-button {
            border: 1px solid #5fa800;
            color: #5fa800;
            background-color: white;
        }

        .invoice-message {
            display: block;
            background-color: #fceaea;
            color: #b34343;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        @media(max-width: 700px) {

            .invoice-header {
                flex-direction: column;
            }

            .invoice-details {
                text-align: left;
            }

            .invoice-table-header {
                display: none;
            }

            .invoice-item {
                grid-template-columns: 1fr;
                gap: 5px;
            }

            .invoice-totals {
                width: 100%;
            }

            .invoice-actions {
                flex-direction: column;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="InvoiceMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="invoice-container">


        <asp:Label
            ID="lblInvoiceMessage"
            runat="server"
            CssClass="invoice-message"
            Visible="false">
        </asp:Label>



        <asp:Panel
            ID="pnlInvoice"
            runat="server"
            Visible="false">


            <div class="invoice-success">

                ✓ Your order has been placed successfully.

            </div>



            <div class="invoice-box">


                <!-- Invoice header -->

                <div class="invoice-header">


                    <div>

                        <h1>Agri Market</h1>

                        <p>
                            Fresh agricultural products
                            from local farmers.
                        </p>

                    </div>


                    <div class="invoice-details">

                        <div class="invoice-number">

                            <asp:Label
                                ID="lblInvoiceNumber"
                                runat="server">
                            </asp:Label>

                        </div>


                        <div>

                            Order:
                            <strong>
                                #
                                <asp:Label
                                    ID="lblOrderNumber"
                                    runat="server">
                                </asp:Label>
                            </strong>

                        </div>


                        <div>

                            Date:

                            <strong>

                                <asp:Label
                                    ID="lblInvoiceDate"
                                    runat="server">
                                </asp:Label>

                            </strong>

                        </div>

                    </div>


                </div>



                <h3 style="color:#37474f;
                           font-weight:700;
                           margin-bottom:20px;">

                    Invoice

                </h3>



                <!-- Column headings -->

                <div class="invoice-table-header">

                    <div>Product</div>

                    <div>Quantity</div>

                    <div>Unit Price</div>

                    <div>Total</div>

                </div>



                <!-- Products -->

                <asp:Repeater
                    ID="rptInvoiceItems"
                    runat="server">

                    <ItemTemplate>


                        <div class="invoice-item">


                            <div class="product-name">

                                <%# Eval("ProductName") %>

                            </div>


                            <div>

                                <%# Eval("Quantity") %>

                            </div>


                            <div>

                                R <%# Eval("UnitPrice", "{0:F2}") %>

                            </div>


                            <div class="line-total">

                                R <%# Eval("LineTotal", "{0:F2}") %>

                            </div>


                        </div>


                    </ItemTemplate>

                </asp:Repeater>



                <!-- Totals -->

                <div class="invoice-totals">


                    <div class="total-row">

                        <span>Subtotal</span>

                        <span>
                            R
                            <asp:Label
                                ID="lblSubtotal"
                                runat="server">
                            </asp:Label>
                        </span>

                    </div>


                    <div class="total-row">

                        <span>Tax</span>

                        <span>
                            R
                            <asp:Label
                                ID="lblTax"
                                runat="server">
                            </asp:Label>
                        </span>

                    </div>


                    <div class="total-row">

                        <span>Discount</span>

                        <span>
                            R
                            <asp:Label
                                ID="lblDiscount"
                                runat="server">
                            </asp:Label>
                        </span>

                    </div>


                    <div class="total-row grand-total">

                        <span>Total</span>

                        <span>
                            R
                            <asp:Label
                                ID="lblTotal"
                                runat="server">
                            </asp:Label>
                        </span>

                    </div>


                </div>



                <!-- Navigation -->

                <div class="invoice-actions">


                    <a href="AllProductsPage.aspx"
                        class="invoice-button primary-button">

                        Continue Shopping

                    </a>


                    <a href="CustomerProfile.aspx"
                        class="invoice-button secondary-button">

                        Customer Dashboard

                    </a>


                </div>


            </div>


        </asp:Panel>


    </div>


</asp:Content>
<%@ Page Title="Reports - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="Agri_Market.Reports" %>


<asp:Content ID="ReportsHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .reports-container {
            max-width: 1100px;
            margin: 35px auto 60px;
            background: white;
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

        /* Filter section */
        .filter-box {
            background: #f8fbf4;
            border: 1px solid #dfe8d7;
            border-left: 5px solid #81c408;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 30px;
        }

        .filter-title {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 18px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: 1fr 1fr auto;
            gap: 15px;
            align-items: end;
        }

        .filter-button {
            padding: 10px 22px;
            border: none;
            border-radius: 22px;
            background-color: #81c408;
            color: white;
            font-weight: 700;
        }

        .filter-button:hover {
            background-color: #6eaa07;
        }


        /* Summary cards */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 35px;
        }

        .summary-card {
            background: #f8fbf4;
            border: 1px solid #dfe8d7;
            border-top: 5px solid #81c408;
            border-radius: 14px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .summary-card h5 {
            color: #777;
            margin-bottom: 12px;
            font-size: 16px;
        }

        .summary-value {
            color: #37474f;
            font-size: 28px;
            font-weight: 700;
        }


        /* Report sections */
        .report-section {
            margin-top: 30px;
            padding: 25px;
            border: 1px solid #e0e5db;
            border-radius: 14px;
            background-color: #fbfdf8;
        }

        .section-title {
            color: #81c408;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .report-table {
            width: 100%;
            border-collapse: collapse;
        }

        .report-table th {
            background-color: #eef7df;
            color: #37474f;
            padding: 12px;
            text-align: left;
        }

        .report-table td {
            padding: 12px;
            border-bottom: 1px solid #e5e5e5;
            color: #666;
        }

        .back-link {
            display: inline-block;
            margin-top: 30px;
            color: #5f9406;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
            color: #4c7c05;
        }

        @media (max-width: 850px) {

            .summary-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .reports-container {
                width: 92%;
                padding: 25px;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="ReportsMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="reports-container">


        <h2 class="page-title">
            Reports
        </h2>

        <p class="page-subtitle">
            View sales, stock and user information for Agri Market.
        </p>



        <!-- Filters -->

        <div class="filter-box">

            <h4 class="filter-title">
                Filter Reports
            </h4>


            <div class="filter-grid">


                <div>

                    <label class="form-label">
                        Start Date
                    </label>

                    <asp:TextBox
                        ID="txtStartDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>



                <div>

                    <label class="form-label">
                        End Date
                    </label>

                    <asp:TextBox
                        ID="txtEndDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>



                <asp:Button
                    ID="btnFilter"
                    runat="server"
                    Text="Apply Filter"
                    CssClass="filter-button"
                    OnClick="btnFilter_Click" />


            </div>

        </div>



        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>



        <!-- Summary -->

        <div class="summary-grid">


            <div class="summary-card">

                <h5>Total Sales Revenue</h5>

                <asp:Label
                    ID="lblTotalRevenue"
                    runat="server"
                    Text="R 0.00"
                    CssClass="summary-value">
                </asp:Label>

            </div>



            <div class="summary-card">

                <h5>Total Orders</h5>

                <asp:Label
                    ID="lblTotalOrders"
                    runat="server"
                    Text="0"
                    CssClass="summary-value">
                </asp:Label>

            </div>



            <div class="summary-card">

                <h5>Total Customers</h5>

                <asp:Label
                    ID="lblTotalCustomers"
                    runat="server"
                    Text="0"
                    CssClass="summary-value">
                </asp:Label>

            </div>



            <div class="summary-card">

                <h5>Total Farmers</h5>

                <asp:Label
                    ID="lblTotalFarmers"
                    runat="server"
                    Text="0"
                    CssClass="summary-value">
                </asp:Label>

            </div>


        </div>



        <!-- Different products sold -->

        <div class="report-section">

            <h4 class="section-title">
                Different Products Sold
            </h4>

            <p>
                Number of different products sold:

                <strong>

                    <asp:Label
                        ID="lblDifferentProducts"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </strong>

            </p>

        </div>



        <!-- Sales graph -->

        <div class="report-section">

            <h4 class="section-title">
                Sales Revenue Over Time
            </h4>

            <p style="color:#777;">
                Shows whether sales are increasing or
                decreasing over time.
            </p>

            <canvas
                id="salesRevenueChart"
                style="width:100%; max-height:400px;">
            </canvas>

        </div>



        <!-- Stock report -->

        <div class="report-section">

            <h4 class="section-title">
                Stock on Hand
            </h4>


            <table class="report-table">


                <thead>

                    <tr>
                        <th>Product</th>
                        <th>Stock Quantity</th>
                        <th>Unit</th>
                    </tr>

                </thead>


                <tbody>


                    <asp:Repeater
                        ID="rptStock"
                        runat="server">


                        <ItemTemplate>

                            <tr>

                                <td>
                                    <%# Eval("ProductName") %>
                                </td>

                                <td>
                                    <%# Eval("StockQuantity") %>
                                </td>

                                <td>
                                    <%# Eval("UnitOfMeasure") %>
                                </td>

                            </tr>

                        </ItemTemplate>


                    </asp:Repeater>


                </tbody>


            </table>


        </div>



        <!-- Registered users -->

        <div class="report-section">

            <h4 class="section-title">
                Registered Users Per Day
            </h4>


            <table class="report-table">


                <thead>

                    <tr>
                        <th>Date</th>
                        <th>Users Registered</th>
                    </tr>

                </thead>


                <tbody>


                    <asp:Repeater
                        ID="rptUserRegistrations"
                        runat="server">


                        <ItemTemplate>

                            <tr>

                                <td>
                                    <%# Eval("RegistrationDate", "{0:dd MMM yyyy}") %>
                                </td>

                                <td>
                                    <%# Eval("UserCount") %>
                                </td>

                            </tr>

                        </ItemTemplate>


                    </asp:Repeater>


                </tbody>


            </table>


        </div>



        <a href="AdminProfile.aspx"
            class="back-link">

            ← Back to Admin Profile

        </a>


    </div>


    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


</asp:Content>
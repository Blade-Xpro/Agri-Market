<%@ Page Title="Pending Farmers - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="PendingFarmers.aspx.cs"
    Inherits="Agri_Market.WebForm1" %>


<asp:Content ID="FarmersHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .pending-container {
            max-width: 900px;
            margin: 35px auto 60px;
            padding: 40px;
            background: white;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .pending-title {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .pending-subtitle {
            color: #6c757d;
            margin-bottom: 30px;
        }

        .farmer-card {
            border: 1px solid #dfe5d8;
            border-left: 5px solid #81c408;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 20px;
            background-color: #fbfdf8;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .farmer-card h4 {
            font-weight: 700;
            color: #37474f;
            margin-bottom: 15px;
        }

        .farmer-card p {
            color: #666;
        }

        .approve-button {
            width: 100%;
            padding: 11px;
            background-color: #81c408;
            border: none;
            border-radius: 25px;
            color: white;
            font-weight: 700;
            font-size: 17px;
            margin-top: 10px;
        }

        .approve-button:hover {
            background-color: #6eaa07;
            color: white;
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
            color: #4c7c05;
        }

        .pending-message {
            display: block;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {

            .pending-container {
                width: 92%;
                padding: 25px;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="FarmersMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="pending-container">


        <h2 class="pending-title">
            Pending Farmer Applications
        </h2>

        <p class="pending-subtitle">
            Review farmers who are waiting for approval.
        </p>



        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="pending-message">
        </asp:Label>



        <asp:Repeater
            ID="rptFarmers"
            runat="server"
            OnItemCommand="rptFarmers_ItemCommand">


            <ItemTemplate>


                <div class="farmer-card">


                    <h4>
                        <%# Eval("FarmName") %>
                    </h4>


                    <p>

                        <strong>Location:</strong>

                        <%# Eval("FarmLocation") %>

                    </p>


                    <p>

                        <strong>Description:</strong>

                        <%# Eval("FarmDescription") %>

                    </p>



                    <asp:Button
                        ID="btnApprove"
                        runat="server"
                        Text="Approve Farmer"
                        CssClass="approve-button"
                        CommandName="Approve"
                        CommandArgument='<%# Eval("FarmerId") %>' />


                </div>


            </ItemTemplate>


        </asp:Repeater>



        <a href="AdminProfile.aspx"
            class="back-link">

            ← Back to Admin Profile

        </a>


    </div>


</asp:Content>
<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="PendingFarmers.aspx.cs"
    Inherits="Agri_Market.WebForm1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Pending Farmers - Agri Market</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <style>
    body {
        margin: 0;
        min-height: 100vh;
        font-family: 'Segoe UI', Arial, sans-serif;

        background:
            linear-gradient(
                rgba(48, 94, 40, 0.88),
                rgba(48, 94, 40, 0.88)
            ),
            url('img/your-background-image.jpg');

        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .pending-container {
        max-width: 900px;
        margin: 80px auto;
        padding: 40px;
        background: rgba(255, 255, 255, 0.97);
        border-radius: 20px;
        box-shadow: 0 10px 35px rgba(0, 0, 0, 0.18);
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
        background-color: #fff;
    }

    .farmer-card h4 {
        font-weight: 700;
        color: #37474f;
    }

    .approve-button {
        width: 100%;
        padding: 11px;
        background-color: #81c408;
        border: 2px solid #ffb524;
        border-radius: 25px;
        color: white;
        font-weight: 700;
        font-size: 17px;
    }

    .approve-button:hover {
        background-color: #6eaa07;
        color: white;
    }
</style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container" style="margin-top: 80px;">

        <h2>Pending Farmer Applications</h2>

        <p>
            Review farmers who are waiting for approval.
        </p>

        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>

        <asp:Repeater
    ID="rptFarmers"
    runat="server"
    OnItemCommand="rptFarmers_ItemCommand">

            <ItemTemplate>

                <div class="card mb-3 p-3">

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

    </div>

</form>

</body>
</html>
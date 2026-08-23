<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerProfile.aspx.cs" Inherits="Agri_Market.FarmerProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Farmer Profile - Agri Market</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eef5e9;
        }

        .profile-container {
            max-width: 850px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .profile-title {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .profile-subtitle {
            color: #777;
            margin-bottom: 30px;
        }

        .section-title {
            color: #81c408;
            font-weight: 700;
            margin-top: 25px;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
        }

        .save-button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            border: 2px solid #ffb524;
            border-radius: 25px;
            background-color: #81c408;
            color: white;
            font-size: 17px;
            font-weight: 700;
        }

        .save-button:hover {
            background-color: #6eaa07;
        }

        .approval-status {
            padding: 10px 15px;
            border-radius: 8px;
            background-color: #f5faec;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">

    <div class="profile-container">

        <h2 class="profile-title">
            Farmer Profile
        </h2>

        <p class="profile-subtitle">
            View and update your farm information.
        </p>


        <div class="approval-status">

            <strong>Approval Status:</strong>

            <asp:Label
                ID="lblApprovalStatus"
                runat="server">
            </asp:Label>

        </div>


        <h4 class="section-title">
            Personal Information
        </h4>

        <div class="row">

            <div class="col-md-6 mb-3">

                <label class="form-label">
                    First Name
                </label>

                <asp:TextBox
                    ID="txtName"
                    runat="server"
                    CssClass="form-control"
                    ReadOnly="true">
                </asp:TextBox>

            </div>


            <div class="col-md-6 mb-3">

                <label class="form-label">
                    Surname
                </label>

                <asp:TextBox
                    ID="txtSurname"
                    runat="server"
                    CssClass="form-control"
                    ReadOnly="true">
                </asp:TextBox>

            </div>

        </div>


        <div class="mb-3">

            <label class="form-label">
                Email
            </label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="form-control"
                ReadOnly="true">
            </asp:TextBox>

        </div>


        <div class="mb-3">

            <label class="form-label">
                Phone Number
            </label>

            <asp:TextBox
                ID="txtPhone"
                runat="server"
                CssClass="form-control"
                ReadOnly="true">
            </asp:TextBox>

        </div>


        <h4 class="section-title">
            Farm Information
        </h4>


        <div class="mb-3">

            <label class="form-label">
                Farm Name
            </label>

            <asp:TextBox
                ID="txtFarmName"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>

        </div>


        <div class="mb-3">

            <label class="form-label">
                Farm Location
            </label>

            <asp:TextBox
                ID="txtFarmLocation"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>

        </div>


        <div class="mb-3">

            <label class="form-label">
                Farm Description
            </label>

            <asp:TextBox
                ID="txtFarmDescription"
                runat="server"
                TextMode="MultiLine"
                Rows="5"
                CssClass="form-control">
            </asp:TextBox>

        </div>


        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Save Changes"
            CssClass="save-button"
            OnClick="btnSave_Click" />


        <br /><br />

        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>

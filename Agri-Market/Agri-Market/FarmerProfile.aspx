<%@ Page Title="Farmer Profile - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="FarmerProfile.aspx.cs"
    Inherits="Agri_Market.FarmerProfile" %>


<asp:Content ID="FarmerHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .farmer-profile-container {
            max-width: 850px;
            margin: 35px auto 60px;
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
            border: none;
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
            padding: 12px 15px;
            border-radius: 8px;
            background-color: #f5faec;
            margin-bottom: 20px;
            border-left: 4px solid #81c408;
        }

        @media (max-width: 768px) {

            .farmer-profile-container {
                width: 92%;
                padding: 25px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="FarmerMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="farmer-profile-container">

        <h2 class="profile-title">
            Farmer Profile
        </h2>

        <a href="AddProduct.aspx"
    class="btn btn-success">

    Add Product

</a>

        <p class="profile-subtitle">
            View and update your farm information.
        </p>


        <!-- Approval Status -->

        <div class="approval-status">

            <strong>Approval Status:</strong>

            <asp:Label
                ID="lblApprovalStatus"
                runat="server">
            </asp:Label>

        </div>



        <!-- Personal Information -->

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



        <!-- Farm Information -->

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


        <br />
        <br />


        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


    </div>


</asp:Content>

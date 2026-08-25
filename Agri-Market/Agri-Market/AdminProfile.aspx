<%@ Page Title="Admin Profile - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="Agri_Market.AdminProfile" %>


<asp:Content ID="AdminHeadContent"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .profile-container {
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

        .role-box {
            padding: 12px 15px;
            margin-bottom: 25px;
            background-color: #f5faec;
            border-radius: 8px;
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


        /* Admin Dashboard */

        .admin-dashboard {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 20px;
            margin-bottom: 35px;
        }

        .dashboard-card {
            background: #f8fbf4;
            border: 1px solid #dfe8d7;
            border-left: 5px solid #81c408;
            border-radius: 14px;
            padding: 25px 20px;
            min-height: 180px;
            text-decoration: none;
            color: #37474f;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
            transition: all 0.25s ease;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 22px rgba(0, 0, 0, 0.12);
            background: #ffffff;
            color: #37474f;
        }

        .dashboard-card h5 {
            font-size: 28px;
            font-weight: 700;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #2f4f4f;
        }

        .dashboard-card p {
            margin: 0;
            font-size: 18px;
            color: #7a7a7a;
            line-height: 1.5;
        }

        .card-icon {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            background: #81c408;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 12px;
        }


        @media (max-width: 768px) {

            .admin-dashboard {
                grid-template-columns: 1fr;
            }

            .profile-container {
                width: 92%;
                padding: 25px;
            }
        }

    </style>

</asp:Content>



<asp:Content ID="AdminMainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="profile-container">


        <h2 class="profile-title">
            Admin Profile
        </h2>

        <p class="profile-subtitle">
            View and manage Agri Market.
        </p>


        <div class="role-box">

            <strong>Role:</strong>

            <asp:Label
                ID="lblRole"
                runat="server"
                Text="Admin">
            </asp:Label>

        </div>



        <!-- Admin Dashboard -->

        <h4 class="section-title">
            Admin Dashboard
        </h4>


        <div class="admin-dashboard">


            <!-- Approve Farmers -->

            <a href="PendingFarmers.aspx"
                class="dashboard-card">

                <div class="card-icon">
                    ✓
                </div>

                <h5>Approve Farmers</h5>

                <p>
                    Review and approve farmer registrations.
                </p>

            </a>



            <!-- Manage Users -->

            <a href="ManageUsers.aspx"
                class="dashboard-card">

                <div class="card-icon">
                    👥
                </div>

                <h5>Manage Users</h5>

                <p>
                    View registered customers,
                    farmers and administrators.
                </p>

            </a>



            <!-- Manage Orders -->

            <a href="ManageOrders.aspx"
                class="dashboard-card">

                <div class="card-icon">
                    📦
                </div>

                <h5>View / Manage Orders</h5>

                <p>
                    View customer orders and
                    manage order statuses.
                </p>

            </a>



            <!-- Reports -->

            <a href="Reports.aspx"
                class="dashboard-card">

                <div class="card-icon">
                    📊
                </div>

                <h5>View Reports</h5>

                <p>
                    View sales, stock and
                    user reports.
                </p>

            </a>


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
                    CssClass="form-control">
                </asp:TextBox>

            </div>


            <div class="col-md-6 mb-3">

                <label class="form-label">
                    Surname
                </label>

                <asp:TextBox
                    ID="txtSurname"
                    runat="server"
                    CssClass="form-control">
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
                CssClass="form-control">
            </asp:TextBox>

        </div>



        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Save Changes"
            CssClass="save-button" />


        <br />
        <br />


        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


    </div>


</asp:Content>

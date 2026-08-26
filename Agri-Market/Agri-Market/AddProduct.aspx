<%@ Page Title="Add Product - Agri Market"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AddProduct.aspx.cs"
    Inherits="Agri_Market.AddProductPage" %>

<asp:Content ID="AddProductHead"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>

        .add-product-container {
            width: 88%;
            max-width: 750px;
            margin: 35px auto 60px;
        }

        .add-product-header {
            background-color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 25px;
        }

        .add-product-header h1 {
            color: #37474f;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .add-product-header p {
            color: #777;
            margin-bottom: 0;
        }

        .product-form {
            background-color: white;
            padding: 35px;
            border-radius: 18px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-label {
            display: block;
            color: #37474f;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d8dfd2;
            border-radius: 10px;
        }

        .description-box {
            min-height: 110px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .add-button {
            background-color: #5fa800;
            color: white;
            border: none;
            padding: 13px 28px;
            border-radius: 25px;
            font-weight: 700;
        }

        .add-button:hover {
            background-color: #4d8c00;
        }

        .back-link {
            margin-left: 15px;
            color: #5fa800;
            font-weight: 600;
            text-decoration: none;
        }

        .product-message {
            display: block;
            margin-bottom: 20px;
            font-weight: 600;
        }

        @media(max-width: 650px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="AddProductMain"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="add-product-container">

        <div class="add-product-header">

            <h1>Add Product</h1>

            <p>
                Add fresh produce to Agri Market.
            </p>

        </div>


        <div class="product-form">

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="product-message"
                Visible="false">
            </asp:Label>


            <!-- Product Name -->

            <div class="form-group">

                <asp:Label
                    ID="lblProductName"
                    runat="server"
                    Text="Product Name"
                    CssClass="form-label">
                </asp:Label>

                <asp:TextBox
                    ID="txtProductName"
                    runat="server"
                    CssClass="form-input"
                    placeholder="e.g. Strawberries">
                </asp:TextBox>

            </div>


            <!-- Category -->

            <div class="form-group">

                <asp:Label
                    ID="lblCategory"
                    runat="server"
                    Text="Category"
                    CssClass="form-label">
                </asp:Label>

                <asp:DropDownList
                    ID="ddlCategory"
                    runat="server"
                    CssClass="form-input">

                    <asp:ListItem
                        Text="Select Category"
                        Value="0">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Fruit"
                        Value="2">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Vegetable"
                        Value="1">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- Description -->

            <div class="form-group">

                <asp:Label
                    ID="lblDescription"
                    runat="server"
                    Text="Description"
                    CssClass="form-label">
                </asp:Label>

                <asp:TextBox
                    ID="txtDescription"
                    runat="server"
                    TextMode="MultiLine"
                    CssClass="form-input description-box"
                    placeholder="Enter a short product description">
                </asp:TextBox>

            </div>


            <div class="form-row">

                <!-- Price -->

                <div class="form-group">

                    <asp:Label
                        ID="lblPrice"
                        runat="server"
                        Text="Price (R)"
                        CssClass="form-label">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtPrice"
                        runat="server"
                        CssClass="form-input"
                        placeholder="25.00">
                    </asp:TextBox>

                </div>


                <!-- Stock -->

                <div class="form-group">

                    <asp:Label
                        ID="lblStock"
                        runat="server"
                        Text="Stock Quantity"
                        CssClass="form-label">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtStock"
                        runat="server"
                        CssClass="form-input"
                        placeholder="50">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Unit -->

            <div class="form-group">

                <asp:Label
                    ID="lblUnit"
                    runat="server"
                    Text="Unit of Measure"
                    CssClass="form-label">
                </asp:Label>

                <asp:DropDownList
                    ID="ddlUnit"
                    runat="server"
                    CssClass="form-input">

                    <asp:ListItem
                        Text="kg"
                        Value="kg">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="each"
                        Value="each">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="bunch"
                        Value="bunch">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- Image -->

            <div class="form-group">

                <asp:Label
                    ID="lblImage"
                    runat="server"
                    Text="Image URL (Optional)"
                    CssClass="form-label">
                </asp:Label>

                <asp:TextBox
                    ID="txtImageUrl"
                    runat="server"
                    CssClass="form-input"
                    placeholder="e.g. img/fruite-item-2.jpg">
                </asp:TextBox>

            </div>


            <asp:Button
                ID="btnAddProduct"
                runat="server"
                Text="Add Product"
                CssClass="add-button"
                OnClick="btnAddProduct_Click" />


            <a href="FarmerProfile.aspx"
                class="back-link">

                Back to Profile

            </a>

        </div>

    </div>

</asp:Content>

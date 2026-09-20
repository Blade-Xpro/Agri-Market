<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteProduct.aspx.cs" Inherits="Agri_Market.DeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <style>

        .delete-container {
            width: 500px;
            margin: 80px auto;
            background-color: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .delete-container h2 {
            color: #dc3545;
            margin-bottom: 10px;
        }

        .warning-text {
            color: #777;
            margin-bottom: 25px;
        }

        .product-info {
            margin-bottom: 20px;
        }

        .product-info p {
            margin: 10px 0;
        }

        .delete-buttons {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .cancel-btn {
            background-color: white;
            color: #65a30d;
            border: 1px solid #65a30d;
            padding: 10px 20px;
            border-radius: 7px;
            cursor: pointer;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 7px;
            cursor: pointer;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="delete-container">

        <h2>Delete Product</h2>

        <p class="warning-text">
            Are you sure you want to delete this product?
        </p>


        <div class="product-info">

            <p>
                <strong>Product:</strong>
                <asp:Label
                    ID="lblProductName"
                    runat="server">
                </asp:Label>
            </p>


            <p>
                <strong>Price:</strong>
                R
                <asp:Label
                    ID="lblPrice"
                    runat="server">
                </asp:Label>
            </p>


            <p>
                <strong>Stock:</strong>
                <asp:Label
                    ID="lblQuantity"
                    runat="server">
                </asp:Label>
            </p>

        </div>


        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red">
        </asp:Label>


        <div class="delete-buttons">

            <asp:Button
                ID="btnCancel"
                runat="server"
                Text="Cancel"
                CssClass="cancel-btn"
                OnClick="btnCancel_Click" />


            <asp:Button
                ID="btnDelete"
                runat="server"
                Text="Delete Product"
                CssClass="delete-btn"
                OnClick="btnDelete_Click" />

        </div>

    </div>

</asp:Content>

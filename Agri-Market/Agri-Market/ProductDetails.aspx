<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Agri_Market.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-5">

    <asp:Label
        ID="lblMessage"
        runat="server"
        ForeColor="Red">
    </asp:Label>

    <div class="row">

        <!-- PRODUCT IMAGE -->
        <div class="col-md-5">

            <asp:Image
                ID="imgProduct"
                runat="server"
                CssClass="img-fluid rounded"
                Style="max-height: 400px; object-fit: cover;" />

        </div>


        <!-- PRODUCT INFORMATION -->
        <div class="col-md-7">

            <h2>
                <asp:Label
                    ID="lblProductName"
                    runat="server">
                </asp:Label>
            </h2>

            <h4 class="text-success mt-3">
                R
                <asp:Label
                    ID="lblPrice"
                    runat="server">
                </asp:Label>
            </h4>

            <p class="mt-4">
                <asp:Label
                    ID="lblDescription"
                    runat="server">
                </asp:Label>
            </p>

            <p>
                <strong>Unit:</strong>

                <asp:Label
                    ID="lblUnit"
                    runat="server">
                </asp:Label>
            </p>

            <p>
                <strong>Available Stock:</strong>

                <asp:Label
                    ID="lblStock"
                    runat="server">
                </asp:Label>
            </p>

            <br />

            <a href="AllProductsPage.aspx"
               class="btn btn-outline-secondary">

                Back to Products

            </a>

        </div>

    </div>

</div>

</asp:Content>

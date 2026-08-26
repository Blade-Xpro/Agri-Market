<%@ Page Title="Product details | Agri Market" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutProduct.aspx.cs" Inherits="Agri_Market.AboutProduct" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container-fluid py-5 mt-5">
        <div class="container py-5">
            <a href="Home.aspx" class="btn border border-secondary rounded-pill px-4 text-primary mb-4">
                <i class="fa fa-arrow-left me-2"></i>Back to products
            </a>

            <asp:Panel ID="pnlProductUnavailable" runat="server" Visible="false" CssClass="alert alert-light border text-center py-5">
                <h3 class="text-primary">Product unavailable</h3>
                <p class="mb-3">This product could not be found or is currently unavailable.</p>
                <a href="Home.aspx" class="btn btn-primary rounded-pill px-4">Browse products</a>
            </asp:Panel>

            <asp:Panel ID="pnlProduct" runat="server" Visible="false">
                <div class="row g-5 align-items-start">
                    <div class="col-lg-6">
                        <div class="rounded border border-secondary overflow-hidden bg-light">
                            <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid w-100" style="height: 460px; object-fit: cover;" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <span class="text-secondary fw-bold text-uppercase"><asp:Label ID="lblCategory" runat="server" /></span>
                        <h1 class="display-5 text-primary mt-2"><asp:Label ID="lblProductName" runat="server" /></h1>
                        <p class="text-dark fs-3 fw-bold mb-1"><asp:Label ID="lblPrice" runat="server" /></p>
                        <p class="text-muted mb-4"><asp:Label ID="lblUnitOfMeasure" runat="server" /></p>
                        <div class="border-top border-bottom py-4 mb-4">
                            <h5 class="text-primary">About this product</h5>
                            <p class="mb-0"><asp:Label ID="lblDescription" runat="server" /></p>
                        </div>
                        <div class="d-flex align-items-center mb-4">
                            <i class="fa fa-boxes text-secondary fs-3 me-3"></i>
                            <div>
                                <small class="d-block text-muted">Available stock</small>
                                <strong><asp:Label ID="lblStockQuantity" runat="server" /></strong>
                            </div>
                        </div>
                        <a href="Home.aspx" class="btn border border-secondary rounded-pill px-4 py-2 text-primary">
                            <i class="fa fa-shopping-basket me-2"></i>Continue browsing
                        </a>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </section>
</asp:Content>

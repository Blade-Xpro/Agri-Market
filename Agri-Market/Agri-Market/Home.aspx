<%@ Page Title="Agri Market | Fresh Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Agri_Market.HomePage" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container-fluid py-5 mt-5">
        <div class="container py-5">
            <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                <h4 class="text-secondary">Fresh from our farmers</h4>
                <h1 class="display-5 text-primary">Featured products</h1>
                <p class="mb-0">Browse a selection of produce currently available on Agri Market.</p>
            </div>

            <asp:Panel ID="pnlNoProducts" runat="server" Visible="false" CssClass="alert alert-light text-center border">
                No products are available right now. Please check back soon.
            </asp:Panel>

            <asp:Panel ID="pnlProductCarousel" runat="server" Visible="false">
                <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner rounded">
                        <asp:Repeater ID="rptFeaturedProducts" runat="server">
                            <ItemTemplate>
                                <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : String.Empty %>'>
                                    <div class="row g-0 bg-light align-items-center">
                                        <div class="col-md-6">
                                            <img src='<%# ResolveUrl(GetImageUrl(Eval("ImageUrl"))) %>' class="d-block w-100 rounded-start" style="height: 360px; object-fit: cover;" alt='<%# GetText(Eval("ProductName")) %>' />
                                        </div>
                                        <div class="col-md-6 p-5">
                                            <span class="text-secondary fw-bold"><%# GetCategoryName(Eval("Category")) %></span>
                                            <h2 class="text-primary mt-2"><a class="text-primary" href='<%# GetProductUrl(Eval("ProductId")) %>'><%# GetText(Eval("ProductName")) %></a></h2>
                                            <p><%# GetText(Eval("Description")) %></p>
                                            <p class="text-dark fs-4 fw-bold mb-0"><%# GetPrice(Eval("Price"), Eval("UnitOfMeasure")) %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon bg-primary rounded-circle p-3" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon bg-primary rounded-circle p-3" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </asp:Panel>
        </div>
    </section>

    <section class="container-fluid fruite py-5">
        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-5">
                <h1 class="text-primary mb-0">Product catalogue</h1>
                <a href="AllProductsPage.aspx" class="btn border border-secondary rounded-pill px-4 text-primary">View all products</a>
            </div>
            <div id="productCatalog" runat="server" class="row g-4">
             </div>


        </div>
    </section>
</asp:Content>

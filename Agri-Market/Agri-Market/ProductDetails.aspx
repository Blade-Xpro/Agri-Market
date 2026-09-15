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

         <hr class="mt-5" />

<h3 class="mt-4">
    Customer Reviews
</h3>

<asp:Label
    ID="lblNoReviews"
    runat="server"
    ForeColor="Gray">
</asp:Label>


<asp:Repeater
    ID="rptReviews"
    runat="server">

    <ItemTemplate>

        <div class="border rounded p-3 mb-3">

            <strong>
                <%# Eval("CustomerName") %>
            </strong>

            <span class="text-warning ms-2">
                <%# Eval("Rating") %> / 5 ★
            </span>

            <p class="mt-2 mb-1">
                <%# Eval("Comment") %>
            </p>

            <small class="text-muted">
                <%# Eval("CreatedDate", "{0:dd MMM yyyy}") %>
            </small>

        </div>

    </ItemTemplate>
    </asp:Repeater>

<hr class="mt-4" />

<asp:Panel
    ID="pnlAddReview"
    runat="server"
    Visible="false">

    <h4 class="mt-4">
        Leave a Review
    </h4>

    <div class="mb-3">

        <label class="form-label">
            Rating
        </label>

        <asp:DropDownList
            ID="ddlRating"
            runat="server"
            CssClass="form-control">

            <asp:ListItem
                Text="Select Rating"
                Value="0">
            </asp:ListItem>

            <asp:ListItem Text="1 ★" Value="1" />
            <asp:ListItem Text="2 ★★" Value="2" />
            <asp:ListItem Text="3 ★★★" Value="3" />
            <asp:ListItem Text="4 ★★★★" Value="4" />
            <asp:ListItem Text="5 ★★★★★" Value="5" />

        </asp:DropDownList>

    </div>


    <div class="mb-3">

        <label class="form-label">
            Comment
        </label>

        <asp:TextBox
            ID="txtReviewComment"
            runat="server"
            TextMode="MultiLine"
            Rows="4"
            CssClass="form-control"
            placeholder="Write your review...">
        </asp:TextBox>

    </div>


    <asp:Button
        ID="btnSubmitReview"
        runat="server"
        Text="Submit Review"
        CssClass="btn btn-success"
    OnClick="btnSubmitReview_Click" />

</asp:Panel>

        <br />

<asp:Label
    ID="lblReviewMessage"
    runat="server">
</asp:Label>
</div>




      
</asp:Content>

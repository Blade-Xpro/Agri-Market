<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsPage.aspx.cs" Inherits="Agri_Market.SearchResultsPage" %>


asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Search Results</h2>
    <asp:Label ID="lblSearchTerm" runat="server" Text=""></asp:Label>
    <div id="resultsContainer" runat="server">
    </div>
</asp:Content>
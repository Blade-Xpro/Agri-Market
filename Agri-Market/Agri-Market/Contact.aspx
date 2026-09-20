<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Agri_Market.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Our AgriMarket contact page.</h3>
    <address>
        AgriMarket <br />
        AgriMarket, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@AgriMarket.com">Support@AgriMarket.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@AgriMarket.com">Marketing@AgriMarket.com</a>
    </address>
</asp:Content>

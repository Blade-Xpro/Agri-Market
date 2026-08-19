using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgriMarketService;
namespace Agri_Market
{
    public partial class SearchResultsPage : System.Web.UI.Page
    {
         Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the search term from the query string
                string searchTerm = Request.QueryString["searchTerm"];

                // Call the WCF service to get the search results
                List<Product> products = client.SearchProducts(searchTerm);

                foreach (var product in products)
                {
                    // Create a new div for each product
                    var productDiv = new HtmlGenericControl("div");
                    productDiv.Attributes["class"] = "product-card";

                    // Create the inner HTML for the product
                    resultsContainer.InnerHtml = $@"
                        <div class='card h-100'>
                            <img src='{product.ImageUrl}' class='card-img-top' alt='{product.Name}'>
                            <div class='card-body'>
                                <h5 class='card-title'>{product.Name}</h5>
                                <p class='card-text'>{product.Description}</p>
                                <p class='card-text'><strong>Price: </strong>${product.Price}</p>
                            </div>
                        </div>";

                    // Add the product div to the results container
                    resultsContainer.Controls.Add(productDiv);
                }
            }
        }
    }
}
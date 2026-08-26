using System;
using System.ServiceModel;
using System.Web;
using Agri_Market.ServiceReference1;

namespace Agri_Market
{
    public partial class AboutProduct : System.Web.UI.Page
    {
        private const string FallbackImageUrl = "~/img/fruite-item-5.jpg";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProduct();
            }
        }

        private void LoadProduct()
        {
            int productId;
            if (!Int32.TryParse(Request.QueryString["productId"], out productId) || productId <= 0)
            {
                ShowProductUnavailable();
                return;
            }

            try
            {
                Product product;
                using (var client = new Service1Client())
                {
                    product = client.GetProductById(productId);
                }

                if (product == null)
                {
                    ShowProductUnavailable();
                    return;
                }

                BindProduct(product);
            }
            catch (EndpointNotFoundException)
            {
                ShowProductUnavailable();
            }
            catch (CommunicationException)
            {
                ShowProductUnavailable();
            }
        }

        private void BindProduct(Product product)
        {
            pnlProduct.Visible = true;
            pnlProductUnavailable.Visible = false;

            imgProduct.ImageUrl = String.IsNullOrWhiteSpace(product.ImageUrl) ? FallbackImageUrl : product.ImageUrl;
            imgProduct.AlternateText = product.ProductName ?? "Agricultural product";
            lblProductName.Text = Encode(product.ProductName);
            lblCategory.Text = Encode(product.Category == null ? "Fresh produce" : product.Category.CategoryName);
            lblDescription.Text = Encode(String.IsNullOrWhiteSpace(product.Description) ? "Product description is not available." : product.Description);
            lblPrice.Text = String.Format("R{0:N2}", product.Price);
            lblUnitOfMeasure.Text = Encode(String.IsNullOrWhiteSpace(product.UnitOfMeasure) ? String.Empty : "Per " + product.UnitOfMeasure);
            lblStockQuantity.Text = String.Format("{0:N2} {1}", product.StockQuantity, Encode(product.UnitOfMeasure));
        }

        private void ShowProductUnavailable()
        {
            pnlProduct.Visible = false;
            pnlProductUnavailable.Visible = true;
        }

        private static string Encode(string value)
        {
            return HttpUtility.HtmlEncode(value ?? String.Empty);
        }
    }
}

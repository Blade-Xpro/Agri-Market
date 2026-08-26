using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Text;
using System.Web;
using Agri_Market.ServiceReference1;

namespace Agri_Market
{
    public partial class HomePage : System.Web.UI.Page
    {
        private const string FallbackImageUrl = "~/img/fruite-item-5.jpg";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            try
            {
                Product[] products;
                using (var client = new Service1Client())
                {
                    products = client.GetAllProducts();
                }

                var activeProducts = new List<Product>();
                if (products != null)
                {
                    foreach (var product in products)
                    {
                        if (product != null)
                        {
                            activeProducts.Add(product);
                        }
                    }
                }

                if (activeProducts.Count == 0)
                {
                    ShowProductsUnavailable();
                    return;
                }

                rptFeaturedProducts.DataSource = activeProducts;
                rptFeaturedProducts.DataBind();
                pnlProductCarousel.Visible = true;
                pnlNoProducts.Visible = false;
                BindProductCatalog(activeProducts);
            }
            catch (EndpointNotFoundException)
            {
                ShowProductsUnavailable();
            }
            catch (CommunicationException)
            {
                ShowProductsUnavailable();
            }
            catch (TimeoutException)
            {
                ShowProductsUnavailable();
            }
        }

        private void BindProductCatalog(IEnumerable<Product> products)
        {
            var markup = new StringBuilder();

            foreach (var product in products)
            {
                markup.AppendFormat(
                    "<div class=\"col-md-6 col-lg-4 col-xl-3\"><a href=\"{0}\" class=\"text-decoration-none\"><div class=\"rounded border h-100\"><img src=\"{1}\" class=\"img-fluid w-100 rounded-top\" style=\"height: 200px; object-fit: cover;\" alt=\"{2}\" /><div class=\"p-4\"><h5 class=\"text-primary\">{3}</h5><p class=\"mb-2 text-dark\">{4}</p><p class=\"mb-0 fw-bold text-dark\">{5}</p></div></div></a></div>",
                    GetProductUrl(product.ProductId),
                    HttpUtility.HtmlAttributeEncode(ResolveUrl(GetImageUrl(product.ImageUrl))),
                    HttpUtility.HtmlAttributeEncode(product.ProductName ?? "Product"),
                    GetText(product.ProductName),
                    GetText(product.Description),
                    GetPrice(product.Price, product.UnitOfMeasure));
            }

            productCatalog.InnerHtml = markup.ToString();
        }

        private void ShowProductsUnavailable()
        {
            pnlNoProducts.Visible = true;
            pnlProductCarousel.Visible = false;
            productCatalog.InnerHtml = "<div class=\"col-12\"><p class=\"text-center text-muted\">The product catalogue is temporarily unavailable.</p></div>";
        }

        protected string GetImageUrl(object imageUrl)
        {
            var value = Convert.ToString(imageUrl);
            return String.IsNullOrWhiteSpace(value) ? FallbackImageUrl : value;
        }

        protected string GetText(object value)
        {
            return HttpUtility.HtmlEncode(Convert.ToString(value) ?? String.Empty);
        }

        protected string GetCategoryName(object category)
        {
            var productCategory = category as Category;
            return GetText(productCategory == null ? "Fresh produce" : productCategory.CategoryName);
        }

        protected string GetPrice(object price, object unitOfMeasure)
        {
            var unit = Convert.ToString(unitOfMeasure);
            var label = String.IsNullOrWhiteSpace(unit) ? String.Empty : " / " + unit;
            return String.Format("R{0:N2}{1}", Convert.ToDecimal(price), GetText(label));
        }

        protected string GetProductUrl(object productId)
        {
            return ResolveUrl("~/AboutProduct.aspx?productId=" + Convert.ToInt32(productId));
        }
    }
}

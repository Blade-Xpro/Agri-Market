using System;
using System.Web;
using System.Web.UI;
using Agri_Market.ServiceReference1;

namespace Agri_Market
{
    public partial class HomePage : System.Web.UI.Page
    {
        private const string FallbackImageUrl = "~/img/fruite-item-5.jpg";

        Service1Client client = new Service1Client();

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
                var products = client.GetAllProducts();

                if (products == null)
                {
                    Response.Write("GetAllProducts returned NULL");
                    return;
                }

                Response.Write("Products returned: " + products.Length);
            }
            catch (Exception ex)
            {
                Response.Write("<pre>" +
                    HttpUtility.HtmlEncode(ex.ToString()) +
                    "</pre>");
            }
        }

        protected string GetImageUrl(object imageUrl)
        {
            var value = Convert.ToString(imageUrl);

            return String.IsNullOrWhiteSpace(value)
                ? FallbackImageUrl
                : value;
        }

        protected string GetText(object value)
        {
            return HttpUtility.HtmlEncode(
                Convert.ToString(value) ?? String.Empty
            );
        }

        protected string GetCategoryName(object category)
        {
            var productCategory = category as Category;

            return GetText(
                productCategory == null
                    ? "Fresh produce"
                    : productCategory.CategoryName
            );
        }

        protected string GetPrice(object price, object unitOfMeasure)
        {
            var unit = Convert.ToString(unitOfMeasure);

            var label = String.IsNullOrWhiteSpace(unit)
                ? String.Empty
                : " / " + unit;

            return String.Format(
                "R{0:N2}{1}",
                Convert.ToDecimal(price),
                GetText(label)
            );
        }

        protected string GetProductUrl(object productId)
        {
            return ResolveUrl(
                "~/AboutProduct.aspx?productId=" +
                Convert.ToInt32(productId)
            );
        }
    }
}
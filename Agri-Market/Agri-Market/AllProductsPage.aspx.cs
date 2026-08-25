using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class AllProductsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void AddToCart_Command(
            object sender,
            CommandEventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }


            int userId =
                Convert.ToInt32(Session["UserId"]);

            string productName =
                e.CommandArgument.ToString();


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();


            try
            {
                var products =
                    client.SearchProducts(productName);


                if (products == null ||
                    products.Length == 0)
                {
                    lblProductMessage.Text =
                        "Product could not be found.";

                    client.Close();
                    return;
                }


                var product =
                    products.FirstOrDefault(p =>
                        p.ProductName.Equals(
                            productName,
                            StringComparison.OrdinalIgnoreCase));


                if (product == null)
                {
                    lblProductMessage.Text =
                        "Product could not be found.";

                    client.Close();
                    return;
                }


                int result =
                    client.addToCart(
                        userId,
                        product.ProductId,
                        1);


                client.Close();


                if (result == 0)
                {
                    lblProductMessage.Text =
                        product.ProductName +
                        " added to your cart.";
                }
                else
                {
                    lblProductMessage.Text =
                        "Unable to add product to cart.";
                }
            }
            catch (Exception ex)
            {
                client.Abort();

                lblProductMessage.Text =
                    ex.GetBaseException().Message;
            }
        }
    }
}
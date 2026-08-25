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
                int result =
                    client.addToCartByName(
                        userId,
                        productName,
                        1);

                client.Close();

                if (result == 0)
                {
                    lblProductMessage.Text =
                        productName + " added to your cart.";
                }
                else if (result == 2)
                {
                    lblProductMessage.Text =
                        "Product could not be found.";
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
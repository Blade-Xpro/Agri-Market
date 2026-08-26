using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCart();
            }
        }


        private void loadCart()
        {
            // Customer must be logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }


            int userId =
                Convert.ToInt32(Session["UserId"]);


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();


            try
            {
                var items =
                    client.getCartItems(userId);


                // No items in the cart
                if (items == null || items.Length == 0)
                {
                    rptCartItems.DataSource = null;
                    rptCartItems.DataBind();

                    pnlEmptyCart.Visible = true;
                    pnlCartSummary.Visible = false;

                    client.Close();

                    return;
                }


                // Display cart items
                rptCartItems.DataSource = items;
                rptCartItems.DataBind();


                pnlEmptyCart.Visible = false;
                pnlCartSummary.Visible = true;


                // Calculate total
                decimal total =
                    items.Sum(item => item.LineTotal);


                lblCartTotal.Text =
                    total.ToString("F2");


                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblCartMessage.Text =
                    ex.GetBaseException().Message;
            }
        }


        protected void rptCartItems_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int cartItemId =
                    Convert.ToInt32(e.CommandArgument);


                ServiceReference1.Service1Client client =
                    new ServiceReference1.Service1Client();


                try
                {
                    int result =
                        client.removeCartItem(cartItemId);

                    client.Close();


                    if (result == 0)
                    {
                        lblCartMessage.Text =
                            "Product removed from cart.";

                        loadCart();
                    }
                    else
                    {
                        lblCartMessage.Text =
                            "Unable to remove product.";
                    }
                }
                catch (Exception)
                {
                    client.Abort();

                    lblCartMessage.Text =
                        "Unable to remove product.";
                }
            }
        }


        protected void btnCheckout_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}

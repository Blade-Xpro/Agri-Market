using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class CheckoutPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCheckout();
            }
        }


        private void loadCheckout()
        {
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


                if (items == null || items.Length == 0)
                {
                    client.Close();

                    Response.Redirect("ShoppingCart.aspx");
                    return;
                }


                rptCheckoutItems.DataSource = items;
                rptCheckoutItems.DataBind();


                decimal total =
                    items.Sum(item => item.LineTotal);


                lblOrderTotal.Text =
                    total.ToString("F2");


                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblCheckoutMessage.Text =
                    ex.GetBaseException().Message;
            }
        }


        protected void btnPlaceOrder_Click(
            object sender,
            EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }


            int userId =
                Convert.ToInt32(Session["UserId"]);


            string deliveryMethod =
                ddlDeliveryMethod.SelectedValue;


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();


            try
            {
                int orderId =
                    client.processCheckout(
                        userId,
                        deliveryMethod
                    );


                client.Close();


                if (orderId > 0)
                {
                    Response.Redirect(
                        "Invoice.aspx?orderId=" + orderId
                    );

                    return;
                }


                if (orderId == -1)
                {
                    lblCheckoutMessage.Text =
                        "Your shopping cart is empty.";
                }
                else if (orderId == -3)
                {
                    lblCheckoutMessage.Text =
                        "One or more products do not have enough stock.";
                }
                else
                {
                    lblCheckoutMessage.Text =
                        "Unable to process your order.";
                }
            }
            catch (Exception ex)
            {
                client.Abort();

                lblCheckoutMessage.Text =
                    ex.GetBaseException().Message;
            }
        }
    }
}
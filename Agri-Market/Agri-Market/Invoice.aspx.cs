using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class InvoicePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadInvoice();
            }
        }


        private void loadInvoice()
        {
            // User must be logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }


            int orderId;


            // Make sure an OrderId exists
            if (!int.TryParse(
                Request.QueryString["orderId"],
                out orderId))
            {
                showError(
                    "The invoice could not be identified."
                );

                return;
            }


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();


            try
            {
                // Get invoice
                var invoice =
                    client.getInvoiceByOrderId(orderId);


                if (invoice == null)
                {
                    client.Close();

                    showError(
                        "Invoice could not be found."
                    );

                    return;
                }


                // Display invoice information
                lblInvoiceNumber.Text =
                    invoice.InvoiceNumber;


                lblOrderNumber.Text =
                    invoice.OrderId.ToString();


                lblInvoiceDate.Text =
                    invoice.InvoiceDate.ToString(
                        "dd MMMM yyyy"
                    );


                lblSubtotal.Text =
                    invoice.Subtotal.ToString("F2");


                lblTax.Text =
                    invoice.TaxAmount.ToString("F2");


                lblDiscount.Text =
                    invoice.DiscountAmount.ToString("F2");


                lblTotal.Text =
                    invoice.TotalAmount.ToString("F2");



                // Get products belonging to order
                var items =
                    client.getOrderItemsByOrderId(
                        orderId
                    );


                rptInvoiceItems.DataSource =
                    items;

                rptInvoiceItems.DataBind();


                pnlInvoice.Visible = true;

                lblInvoiceMessage.Visible = false;


                client.Close();
            }
            catch (Exception)
            {
                client.Abort();

                showError(
                    "Unable to load the invoice."
                );
            }
        }



        private void showError(string message)
        {
            pnlInvoice.Visible = false;

            lblInvoiceMessage.Visible = true;

            lblInvoiceMessage.Text = message;
        }
    }
}
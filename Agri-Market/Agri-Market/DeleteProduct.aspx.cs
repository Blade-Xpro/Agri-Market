using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agri_Market.ServiceReference1;

namespace Agri_Market
{
    public partial class DeleteProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Farmer must be logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProduct();
            }
        }


        private void LoadProduct()
        {
            int productId;

            // Get productId from the URL
            if (!Int32.TryParse(Request.QueryString["productId"], out productId))
            {
                lblMessage.Text = "Invalid product.";
                btnDelete.Enabled = false;
                return;
            }

            int farmerId =
                Convert.ToInt32(Session["UserId"]);

            Service1Client client =
                new Service1Client();

            try
            {
                Product product =
                    client.GetProductById(productId);

                // Product doesn't exist
                if (product == null)
                {
                    lblMessage.Text = "Product not found.";
                    btnDelete.Enabled = false;

                    client.Close();
                    return;
                }

                // Make sure this product belongs to this farmer
                if (product.FarmerId != farmerId)
                {
                    lblMessage.Text =
                        "You cannot delete this product.";

                    btnDelete.Enabled = false;

                    client.Close();
                    return;
                }

                // Display product information
                lblProductName.Text =
                    product.ProductName;

                lblPrice.Text =
                    product.Price.ToString("N2");

                lblQuantity.Text =
                    product.StockQuantity.ToString();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;

                btnDelete.Enabled = false;
            }
        }


        protected void btnDelete_Click(
            object sender,
            EventArgs e)
        {
            int productId;

            if (!Int32.TryParse(
                    Request.QueryString["productId"],
                    out productId))
            {
                lblMessage.Text = "Invalid product.";
                return;
            }

            int farmerId =
                Convert.ToInt32(Session["UserId"]);

            Service1Client client =
                new Service1Client();

            try
            {
                int result =
                    client.deleteProduct(
                        productId,
                        farmerId
                    );

                if (result == 0)
                {
                    client.Close();

                    Response.Redirect(
                        "MyProducts.aspx"
                    );
                }
                else if (result == 1)
                {
                    lblMessage.Text =
                        "Product could not be found.";
                }
                else
                {
                    lblMessage.Text =
                        "The product could not be deleted.";
                }

                if (client.State ==
                    System.ServiceModel.CommunicationState.Opened)
                {
                    client.Close();
                }
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }


        protected void btnCancel_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("MyProducts.aspx");
        }
    }
}
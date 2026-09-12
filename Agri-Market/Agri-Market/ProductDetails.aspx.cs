using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class ProductDetails : System.Web.UI.Page
    {
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

            // Get productId from the URL
            bool validId = int.TryParse(
                Request.QueryString["productId"],
                out productId
            );

            if (!validId)
            {
                lblMessage.Text = "Invalid product.";
                return;
            }


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var product =
                    client.GetProductById(productId);

                if (product == null)
                {
                    lblMessage.Text =
                        "Product could not be found.";

                    client.Close();
                    return;
                }


                lblProductName.Text =
                    product.ProductName;

                lblDescription.Text =
                    product.Description;

                lblPrice.Text =
                    product.Price.ToString("0.00");

                lblUnit.Text =
                    product.UnitOfMeasure;

                lblStock.Text =
                    product.StockQuantity.ToString();

                imgProduct.ImageUrl =
                    product.ImageUrl;


                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }
    
}
}
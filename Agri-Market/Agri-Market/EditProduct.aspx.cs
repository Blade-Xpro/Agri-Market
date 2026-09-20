using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // User must be logged in and be  a farmer
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            
            if (Session["UserType"] == null ||
                Session["UserType"].ToString() != "Farmer")
            {
                Response.Redirect("Home.aspx");
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

            // Get productId from URL
            if (!Int32.TryParse(
                Request.QueryString["productId"],
                out productId))
            {
                showError("Invalid product.");
                btnUpdateProduct.Enabled = false;
                return;
            }

            int farmerId =
                Convert.ToInt32(Session["UserId"]);

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var product =
                    client.GetProductById(productId);

                // Product doesn't exist
                if (product == null)
                {
                    showError("Product not found.");
                    btnUpdateProduct.Enabled = false;

                    client.Close();
                    return;
                }

                // Make sure product belongs to this farmer before editing
                if (product.FarmerId != farmerId)
                {
                    showError(
                        "You cannot edit this product."
                    );

                    btnUpdateProduct.Enabled = false;

                    client.Close();
                    return;
                }

                
                txtProductName.Text =
                    product.ProductName;

                txtDescription.Text =
                    product.Description;

                txtPrice.Text =
                    product.Price.ToString("0.00");

                txtStock.Text =
                    product.StockQuantity.ToString();

                txtImageUrl.Text =
                    product.ImageUrl;


                // Select existing category
                ListItem category =
                    ddlCategory.Items.FindByValue(
                        product.CategoryId.ToString()
                    );

                if (category != null)
                {
                    ddlCategory.ClearSelection();
                    category.Selected = true;
                }


                
                ListItem unit =
                    ddlUnit.Items.FindByValue(
                        product.UnitOfMeasure
                    );

                if (unit != null)
                {
                    ddlUnit.ClearSelection();
                    unit.Selected = true;
                }


                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                showError(
                    ex.GetBaseException().Message
                );

                btnUpdateProduct.Enabled = false;
            }
        }


        protected void btnUpdateProduct_Click(
            object sender,
            EventArgs e)
        {
            lblMessage.Visible = true;


            // PRODUCT ID
            int productId;

            if (!Int32.TryParse(
                Request.QueryString["productId"],
                out productId))
            {
                showError("Invalid product.");
                return;
            }


            
            if (txtProductName.Text.Trim() == "")
            {
                showError(
                    "Please enter the product name."
                );

                return;
            }


            
            int categoryId =
                Convert.ToInt32(
                    ddlCategory.SelectedValue
                );

            if (categoryId == 0)
            {
                showError(
                    "Please select a category."
                );

                return;
            }


            
            decimal price;

            if (!decimal.TryParse(
                    txtPrice.Text,
                    out price) ||
                price <= 0)
            {
                showError(
                    "Please enter a valid price."
                );

                return;
            }


            // STOCK
            int stock;

            if (!int.TryParse(
                    txtStock.Text,
                    out stock) ||
                stock < 0)
            {
                showError(
                    "Please enter a valid stock quantity."
                );

                return;
            }


          
            int farmerId =
                Convert.ToInt32(
                    Session["UserId"]
                );


            
            string productName =
                txtProductName.Text.Trim();

            string description =
                txtDescription.Text.Trim();

            string unit =
                ddlUnit.SelectedValue;

            string imageUrl =
                txtImageUrl.Text.Trim();


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();


            try
            {
                int result =
                    client.updateFarmerProduct(
                        productId,
                        farmerId,
                        categoryId,
                        productName,
                        description,
                        price,
                        unit,
                        stock,
                        imageUrl
                    );


                client.Close();


                if (result == 0)
                {
                    Response.Redirect(
                        "MyProducts.aspx"
                    );
                }
                else if (result == 1)
                {
                    showError(
                        "Product could not be found."
                    );
                }
                else if (result == 2)
                {
                    showError(
                        "Please check the product information."
                    );
                }
                else
                {
                    showError(
                        "Unable to update the product."
                    );
                }
            }
            catch (Exception ex)
            {
                client.Abort();

                showError(
                    ex.GetBaseException().Message
                );
            }
        }


        private void showError(string message)
        {
            lblMessage.Visible = true;
            lblMessage.Text = message;

            lblMessage.Style["color"] =
                "#b34343";
        }
    }
}

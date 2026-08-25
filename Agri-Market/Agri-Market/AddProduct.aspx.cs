using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class AddProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }


        protected void btnAddProduct_Click(
            object sender,
            EventArgs e)
        {
            lblMessage.Visible = true;


            if (txtProductName.Text.Trim() == "")
            {
                showError("Please enter the product name.");
                return;
            }


            int categoryId =
                Convert.ToInt32(
                    ddlCategory.SelectedValue
                );


            if (categoryId == 0)
            {
                showError("Please select a category.");
                return;
            }


            decimal price;

            if (!decimal.TryParse(
                txtPrice.Text,
                out price) ||
                price <= 0)
            {
                showError("Please enter a valid price.");
                return;
            }


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
                    client.addFarmerProduct(
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


                if (result > 0)
                {
                    lblMessage.Text =
                        productName +
                        " was added successfully.";

                    lblMessage.Style["color"] =
                        "#5fa800";

                    clearForm();
                }
                else if (result == -2)
                {
                    showError(
                        "Farmer could not be identified."
                    );
                }
                else if (result == -3)
                {
                    showError(
                        "Please check the product information."
                    );
                }
                else
                {
                    showError(
                        "Unable to add the product."
                    );
                }
            }
            catch (Exception)
            {
                client.Abort();

                showError(
                    "Unable to add the product."
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


        private void clearForm()
        {
            txtProductName.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            txtImageUrl.Text = "";

            ddlCategory.SelectedIndex = 0;
            ddlUnit.SelectedIndex = 0;
        }
    }
}
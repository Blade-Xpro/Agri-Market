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
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var products = client.GetAllProducts();

               
                var filteredProducts =
                    products.Where(p => p.IsActive == true);

                string searchTerm = Request.QueryString["searchTerm"];

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    searchTerm = searchTerm.Trim().ToLower();

                    filteredProducts =
                        filteredProducts.Where(p =>
                            p.ProductName.ToLower().Contains(searchTerm));
                }

                //sorting by category
                int categoryId = 0;

                if (ViewState["CategoryId"] != null)
                {
                    categoryId =
                        Convert.ToInt32(ViewState["CategoryId"]);
                }

                if (categoryId != 0)
                {
                    filteredProducts =
                        filteredProducts.Where(
                            p => p.CategoryId == categoryId);
                }

             //sorting
                if (ddlSort.SelectedValue == "nameAsc")
                {
                    filteredProducts =
                        filteredProducts.OrderBy(
                            p => p.ProductName);
                }
                else if (ddlSort.SelectedValue == "priceAsc")
                {
                    filteredProducts =
                        filteredProducts.OrderBy(
                            p => p.Price);
                }

                
                rptProducts.DataSource =
                    filteredProducts.ToList();

                rptProducts.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblProductMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        protected void ddlSort_SelectedIndexChanged(
    object sender,
    EventArgs e)
        {
            LoadProducts();
        }

        protected void Category_Command(object sender, CommandEventArgs e)
        {
            int categoryId =
                Convert.ToInt32(e.CommandArgument);

            ViewState["CategoryId"] = categoryId;

            LoadProducts();
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

            int productId =
                Convert.ToInt32(e.CommandArgument);

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                int result =
                    client.addToCart(
                        userId,
                        productId,
                        1);

                client.Close();

                if (result == 0)
                {
                    lblProductMessage.Text =
                        "Product added to your cart.";
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
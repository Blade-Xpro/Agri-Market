using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class MyProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMyProducts();
            }
        }

        private void LoadMyProducts()
        {
            // Farmer must be logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            int farmerId =
                Convert.ToInt32(Session["UserId"]);

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var products =
                    client.GetAllProducts();

                var myProducts =
                    products
                    .Where(p =>
                        p.FarmerId == farmerId &&
                        p.IsActive == true)
                    .OrderBy(p => p.ProductName)
                    .ToList();

                rptMyProducts.DataSource = myProducts;
                rptMyProducts.DataBind();

                if (myProducts.Count == 0)
                {
                    lblMessage.Text =
                        "You have not added any products yet.";
                }

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        protected void EditProduct_Command(
    object sender,
    CommandEventArgs e)
        {
            int productId =
                Convert.ToInt32(e.CommandArgument);

            Response.Redirect(
                "EditProduct.aspx?productId=" + productId
            );
        }

        protected void DeleteProduct_Command(object sender, CommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);

            Response.Redirect(
                "DeleteProduct.aspx?productId=" + productId
            );
        }
    }
}
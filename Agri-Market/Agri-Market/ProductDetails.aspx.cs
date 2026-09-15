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
                LoadReviews();

                if (Session["UserType"] != null &&
            Session["UserType"].ToString() == "Customer")
                {
                    pnlAddReview.Visible = true;
                }
                else
                {
                    pnlAddReview.Visible = false;
                }
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

        protected void btnSubmitReview_Click(
    object sender,
    EventArgs e)
        {
            int productId;

            if (!int.TryParse(
                Request.QueryString["productId"],
                out productId))
            {
                lblReviewMessage.Text =
                    "Invalid product.";

                return;
            }

            if (Session["UserId"] == null)
            {
                lblReviewMessage.Text =
                    "Please login first.";

                return;
            }

            int userId =
                Convert.ToInt32(Session["UserId"]);

            int rating =
                Convert.ToInt32(ddlRating.SelectedValue);

            string comment =
                txtReviewComment.Text.Trim();


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                int result =
                    client.addProductReview(
                        productId,
                        userId,
                        rating,
                        comment);


                if (result == 0)
                {
                    lblReviewMessage.ForeColor =
                        System.Drawing.Color.Green;

                    lblReviewMessage.Text =
                        "Review submitted successfully.";

                    ddlRating.SelectedValue = "0";
                    txtReviewComment.Text = "";

                    LoadReviews();
                }
                else if (result == 2)
                {
                    lblReviewMessage.Text =
                        "Please select a rating and enter a comment.";
                }
                else if (result == 3)
                {
                    lblReviewMessage.Text =
                        "Only customers can leave reviews.";
                }
                else if (result == 4)
                {
                    lblReviewMessage.Text =
                        "Product could not be found.";
                }
                else if (result == 5)
                {
                    lblReviewMessage.Text =
                        "You have already reviewed this product.";
                }
                else
                {
                    lblReviewMessage.Text =
                        "Review could not be submitted.";
                }

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblReviewMessage.Text =
                    ex.GetBaseException().Message;
            }
        }
        private void LoadReviews()
        {
            int productId;

            if (!int.TryParse(
                Request.QueryString["productId"],
                out productId))
            {
                return;
            }

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var reviews =
                    client.getProductReviews(productId);

                if (reviews == null ||
                    reviews.Length == 0)
                {
                    lblNoReviews.Text =
                        "No reviews yet.";

                    rptReviews.DataSource = null;
                }
                else
                {
                    lblNoReviews.Text = "";

                    rptReviews.DataSource = reviews;
                }

                rptReviews.DataBind();

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
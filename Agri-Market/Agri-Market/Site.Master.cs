using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["UserType"] == null)
            {
                return;
            }

            string userType = Session["UserType"].ToString();
            int userId;

            if (!int.TryParse(Session["UserId"].ToString(), out userId))
            {
                Session.Clear();
                return;
            }

            loginLink.Visible = false;
            authenticatedAccount.Visible = true;
            userRoleLabel.Text = Server.HtmlEncode(userType);

            if (string.Equals(userType, "Admin", StringComparison.OrdinalIgnoreCase))
            {
                adminNav.Visible = true;
            }
            else if (string.Equals(userType, "Farmer", StringComparison.OrdinalIgnoreCase))
            {
                farmerNav.Visible = true;
                farmerProfileLink.HRef = ResolveUrl("~/FarmerProfile.aspx?farmerId=" + userId);
            }
            else if (string.Equals(userType, "Customer", StringComparison.OrdinalIgnoreCase))
            {
                customerNav.Visible = true;
                customerProfileLink.HRef = ResolveUrl("~/CustomerProfile.aspx?customerId=" + userId);
            }
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = searchBar.Value.Trim();

            if (searchTerm != "")
            {
                Response.Redirect(
                    "AllProductsPage.aspx?searchTerm="
                    + Server.UrlEncode(searchTerm)
                );
            }
        }
    }

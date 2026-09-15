using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Agri_Market
{
    public class Global : HttpApplication
    {
        private static readonly HashSet<string> AdminPages = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "AdminProfile.aspx", "PendingFarmers.aspx", "ManageUsers.aspx", "ManageOrders.aspx", "Reports.aspx"
        };

        private static readonly HashSet<string> FarmerPages = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "FarmerProfile.aspx", "AddProduct.aspx"
        };

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            string pageName = VirtualPathUtility.GetFileName(Request.AppRelativeCurrentExecutionFilePath);
            string requiredRole = AdminPages.Contains(pageName) ? "Admin" : FarmerPages.Contains(pageName) ? "Farmer" : null;

            if (requiredRole == null)
            {
                return;
            }

            string userType = Session["UserType"] as string;
            if (Session["UserId"] == null || string.IsNullOrEmpty(userType))
            {
                Response.Redirect(VirtualPathUtility.ToAbsolute("~/LoginPage.aspx"));
                return;
            }

            if (!string.Equals(userType, requiredRole, StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect(VirtualPathUtility.ToAbsolute("~/Home.aspx"));
            }
        }
    }
}

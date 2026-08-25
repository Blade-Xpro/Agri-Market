using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
}

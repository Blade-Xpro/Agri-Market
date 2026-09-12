using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class MyInvoices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadInvoices();
            }
        }

        private void loadInvoices()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            int userId =
                Convert.ToInt32(Session["UserId"]);

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var invoices =
                    client.getUserInvoices(userId);

                rptInvoices.DataSource = invoices;
                rptInvoices.DataBind();

                if (invoices == null ||
                    invoices.Length == 0)
                {
                    lblMessage.Text =
                        "You do not have any previous invoices yet.";
                }
                else
                {
                    lblMessage.Text = "";
                }

                client.Close();
            }
            catch (Exception)
            {
                client.Abort();

                lblMessage.Text =
                    "Unable to load your invoices.";
            }
        }
    }
}
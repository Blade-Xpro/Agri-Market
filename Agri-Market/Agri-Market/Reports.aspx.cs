using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadReportSummary();
                loadStockReport();
                loadUserRegistrationReport();
            }
        }

        private void loadReportSummary()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var report = client.getReportSummary();

                lblTotalRevenue.Text =
                    "R " + report.TotalRevenue.ToString("F2");

                lblTotalOrders.Text =
                    report.TotalOrders.ToString();

                lblTotalCustomers.Text =
                    report.TotalCustomers.ToString();

                lblTotalFarmers.Text =
                    report.TotalFarmers.ToString();

                lblDifferentProducts.Text =
                    report.DifferentProductsSold.ToString();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        private void loadStockReport()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var stock = client.getStockReport();

                rptStock.DataSource = stock;
                rptStock.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        private void loadUserRegistrationReport()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var registrations =
                    client.getUserRegistrationsPerDay();

                rptUserRegistrations.DataSource = registrations;
                rptUserRegistrations.DataBind();

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
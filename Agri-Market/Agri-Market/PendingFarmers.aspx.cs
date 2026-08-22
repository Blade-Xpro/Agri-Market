using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadPendingFarmers();
            }
        }

        private void loadPendingFarmers()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var farmers = client.getPendingFarmers();

                rptFarmers.DataSource = farmers;
                rptFarmers.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        protected void rptFarmers_ItemCommand(
    object source,
    RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int farmerId =
                    Convert.ToInt32(e.CommandArgument);

                ServiceReference1.Service1Client client =
                    new ServiceReference1.Service1Client();

                try
                {
                    int result =
                        client.approveFarmer(farmerId);

                    client.Close();

                    if (result == 0)
                    {
                        lblMessage.Text =
                            "Farmer approved successfully.";

                        // Reload the list so the approved farmer disappears
                        loadPendingFarmers();
                    }
                    else if (result == 1)
                    {
                        lblMessage.Text =
                            "Farmer could not be found.";
                    }
                    else
                    {
                        lblMessage.Text =
                            "Unable to approve the farmer.";
                    }
                }
                catch (Exception)
                {
                    client.Abort();

                    lblMessage.Text =
                        "The service could not approve the farmer.";
                }
            }
        }
    }
}
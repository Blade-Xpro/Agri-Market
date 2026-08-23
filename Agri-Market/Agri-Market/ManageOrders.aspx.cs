using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadOrders();
            }
        }

        private void loadOrders()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var orders = client.getAllOrders();

                rptOrders.DataSource = orders;
                rptOrders.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        protected void rptOrders_ItemCommand(
    object source,
    RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);

                DropDownList ddlStatus =
                    (DropDownList)e.Item.FindControl("ddlStatus");

                string newStatus =
                    ddlStatus.SelectedValue;

                ServiceReference1.Service1Client client =
                    new ServiceReference1.Service1Client();

                try
                {
                    int result =
                        client.updateOrderStatus(orderId, newStatus);

                    client.Close();

                    if (result == 0)
                    {
                        lblMessage.Text =
                            "Order status updated successfully.";

                        loadOrders();
                    }
                    else if (result == 1)
                    {
                        lblMessage.Text =
                            "Order could not be found.";
                    }
                    else
                    {
                        lblMessage.Text =
                            "Unable to update the order status.";
                    }
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
}
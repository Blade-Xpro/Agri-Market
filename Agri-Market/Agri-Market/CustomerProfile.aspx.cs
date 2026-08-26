using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCustomerProfile();
            }
        }

        private void loadCustomerProfile()
        {
            int customerId;

            // Get the customer ID 
            if (!int.TryParse(
                Request.QueryString["customerId"],
                out customerId))
            {
                lblMessage.Text =
                    "Customer could not be identified.";

                return;
            }


            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                // Get users 
                var users = client.getAllUsers();

                // Find the customer that logged in
                var customer =
                    users.FirstOrDefault(u =>
                        u.UserId == customerId &&
                        u.UserType == "Customer");

                client.Close();


                if (customer == null)
                {
                    lblMessage.Text =
                        "Customer details could not be found.";

                    return;
                }


                // Display customer information
                lblName.Text = customer.Name;
                lblProfileName.Text = customer.Name;
                lblSurname.Text = customer.Surname;

                lblEmail.Text = customer.Email;

                lblPhone.Text = customer.PhoneNumber;

                lblUserType.Text = customer.UserType;
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
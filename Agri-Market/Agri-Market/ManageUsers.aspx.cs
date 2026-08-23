using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadUsers();
            }
        }

        //load users to display for the admin to see
        private void loadUsers()
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var users = client.getAllUsers();

                rptUsers.DataSource = users;
                rptUsers.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }

        private void loadUsersByType(string userType)
        {
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var users = client.getAllUsers();

                var filteredUsers =
                    users.Where(u => u.UserType == userType).ToList();

                rptUsers.DataSource = filteredUsers;
                rptUsers.DataBind();

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();
                lblMessage.Text = ex.GetBaseException().Message;
            }
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            loadUsers();
        }

        protected void btnCustomers_Click(object sender, EventArgs e)
        {
            loadUsersByType("Customer");
        }

        protected void btnFarmers_Click(object sender, EventArgs e)
        {
            loadUsersByType("Farmer");
        }

        protected void btnAdmins_Click(object sender, EventArgs e)
        {
            loadUsersByType("Admin");
        }
    }
}
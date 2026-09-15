using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null ||
        Session["UserType"] == null ||
        Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }
            if (!IsPostBack)
            {
                loadAdminProfile();
            }
        }

        private void loadAdminProfile()
        {
            int adminId =
                Convert.ToInt32(Session["UserId"]);

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var users =
                    client.getAllUsers();

                var admin =
                    users.FirstOrDefault(u =>
                        u.UserId == adminId &&
                        u.UserType == "Admin");

                if (admin != null)
                {
                    txtName.Text = admin.Name;
                    txtSurname.Text = admin.Surname;
                    txtEmail.Text = admin.Email;
                    txtPhone.Text = admin.PhoneNumber;
                }

                client.Close();
            }
            catch (Exception ex)
            {
                client.Abort();

                lblMessage.Text =
                    ex.GetBaseException().Message;
            }
        }


        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("LoginPage.aspx");
        }
    }
}
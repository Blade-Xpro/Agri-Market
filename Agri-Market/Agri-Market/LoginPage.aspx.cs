using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //temp login

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            loginMessage.Visible = true;

            if (myemail.Text == "" || mypassword.Text == "")
            {
                loginMessage.Text = "Please enter your email and password.";
                return;
            }

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            bool result = client.loginUser(
                myemail.Text,
                mypassword.Text
            );

            if (result == true)
            {
                string userType = client.getUserType(myemail.Text);

                if (userType == "Admin")
                {
                    int adminId = client.getUserId(myemail.Text);

                    client.Close();

                    Response.Redirect(
                        "AdminProfile.aspx?adminId=" + adminId);
                }
                else if (userType == "Farmer")
                {
                    int farmerId = client.getUserId(myemail.Text);

                    client.Close();

                    Response.Redirect("FarmerProfile.aspx?farmerId=" + farmerId);
                }
                else
                {
                    int customerId = client.getUserId(myemail.Text);

                    client.Close();

                    Response.Redirect(
                        "CustomerProfile.aspx?customerId=" + customerId);
                }
            }
        }
    }
}
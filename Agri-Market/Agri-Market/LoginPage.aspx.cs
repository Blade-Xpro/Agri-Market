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
                // Get the logged-in user's details once
                string userType = client.getUserType(myemail.Text);
                int userId = client.getUserId(myemail.Text);

                // Keep the logged-in user for cart and transactions
                Session["UserId"] = userId;
                Session["UserType"] = userType;

                client.Close();

                if (userType == "Admin")
                {
                    Response.Redirect(
                        "AdminProfile.aspx?adminId=" + userId
                    );
                }
                else if (userType == "Farmer")
                {
                    Response.Redirect(
                        "FarmerProfile.aspx?farmerId=" + userId
                    );
                }
                else
                {
                    Response.Redirect(
                        "CustomerProfile.aspx?customerId=" + userId
                    );
                }
            }
            else
            {
                client.Close();

                loginMessage.Text =
                    "Incorrect email or password.";
            }
        
    
        }
    }
}
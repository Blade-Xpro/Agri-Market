using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class registerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //  Customer or Admin is selected for registration
        // This runs when Customer or Admin is selected.
        protected void roleSelection_SelectedIndexChanged(
    object sender,
    EventArgs e)
        {
            // Show farmer fields only when Farmer is selected
            farmerDetailsPanel.Visible =
                roleSelection.SelectedValue == "Farmer";

            // Show admin code only when Admin is selected
            adminCodePanel.Visible =
                roleSelection.SelectedValue == "Admin";
        }


        protected void mybutton_Click(
            object sender,
            EventArgs e)
        {
            lblMessage.Text = "";

            // Check whether the normal fields are empty.
            if (myemail.Text == "" ||
                myname.Text == "" ||
                mysurname.Text == "" ||
                myphonenum.Text == "" ||
                mypassword.Text == "")
            {
                lblMessage.CssClass =
                    "form-message error-message";

                lblMessage.Text =
                    "Please complete all the required fields.";

                return;
            }


            // An admin must also enter the admin code.
            if (roleSelection.SelectedValue == "Admin" &&
                adminCode.Text == "")
            {
                lblMessage.CssClass =
                    "form-message error-message";

                lblMessage.Text =
                    "Please enter the admin registration code.";

                return;
            }

            // A farmer must provide their farm details
            if (roleSelection.SelectedValue == "Farmer" &&
                (farmName.Text.Trim() == "" ||
                 farmLocation.Text.Trim() == ""))
            {
                lblMessage.CssClass = "form-message error-message";

                lblMessage.Text =
                    "Please complete the required farm details.";

                return;
            }


            // Create a connection to the WCF service.
            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                // Create the user object sent to the service.
                ServiceReference1.UserTable addUser =
                    new ServiceReference1.UserTable
                    {
                        email = myemail.Text,
                        Name = myname.Text,
                        Surname = mysurname.Text,
                        phoneNumber = myphonenum.Text,

                        // The service hashes this password before saving it.
                        passwordHash = mypassword.Text
                    };


                int result;

                // Call the correct service method.
                if (roleSelection.SelectedValue == "Admin")
                {
                    result = client.registerAdmin(
                        addUser,
                        adminCode.Text
                    );
                }
                else if (roleSelection.SelectedValue == "Farmer")
                {
                    // Create the farmer-specific information
                    ServiceReference1.FarmerDetail farmer =
                        new ServiceReference1.FarmerDetail
                        {
                            FarmName = farmName.Text.Trim(),
                            FarmLocation = farmLocation.Text.Trim(),
                            FarmDescription = farmDescription.Text.Trim()
                        };

                    result = client.registerFarmer(
                        addUser,
                        farmer
                    );
                }
                else
                {
                    // Customer registration
                    result = client.registerUser(addUser);
                }
                client.Close();


                // Check the value returned by the service.
                if (result == 0)
                {
                    lblMessage.CssClass =
                        "form-message success-message";

                    lblMessage.Text =
                        "Your account was created successfully.";

                    Response.Redirect(
                        "LoginPage.aspx",
                        false
                    );

                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
                else if (result == 1)
                {
                    lblMessage.CssClass =
                        "form-message error-message";

                    lblMessage.Text =
                        "Registration failed. Please try again.";
                }
                else if (result == 2)
                {
                    lblMessage.CssClass =
                        "form-message error-message";

                    lblMessage.Text =
                        "An account with this email already exists.";
                }
                else if (result == 3)
                {
                    lblMessage.CssClass =
                        "form-message error-message";

                    lblMessage.Text =
                        "The admin registration code is incorrect.";
                }
                else
                {
                    lblMessage.CssClass =
                        "form-message error-message";

                    lblMessage.Text =
                        "An unexpected registration result was returned.";
                }
            }
            catch (Exception)
            {
                // Stop the client safely if the service call fails.
                client.Abort();

                lblMessage.CssClass =
                    "form-message error-message";

                lblMessage.Text =
                    "The service could not complete the registration.";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agri_Market
{
    public partial class FarmerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadFarmerProfile();
            }
        }

        private void loadFarmerProfile()
        {
            int farmerId;

            // Get the farmer ID 
            if (!int.TryParse(Request.QueryString["farmerId"], out farmerId))
            {
                lblMessage.Text = "Farmer could not be identified.";
                return;
            }

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                var profile = client.getFarmerProfile(farmerId);

                if (profile == null)
                {
                    lblMessage.Text = "Farmer details could not be found.";

                    client.Close();
                    return;
                }

                txtName.Text = profile.Name;
                txtSurname.Text = profile.Surname;
                txtEmail.Text = profile.Email;
                txtPhone.Text = profile.PhoneNumber;

                txtFarmName.Text = profile.FarmName;
                txtFarmLocation.Text = profile.FarmLocation;
                txtFarmDescription.Text = profile.FarmDescription;

                if (profile.IsApproved)
                {
                    lblApprovalStatus.Text = "Approved";
                }
                else
                {
                    lblApprovalStatus.Text = "Pending Approval";
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int farmerId;

            if (!int.TryParse(Request.QueryString["farmerId"], out farmerId))
            {
                lblMessage.Text = "Farmer could not be identified.";
                return;
            }

            ServiceReference1.Service1Client client =
                new ServiceReference1.Service1Client();

            try
            {
                ServiceReference1.FarmerDetail farmer =
                    new ServiceReference1.FarmerDetail
                    {
                        FarmerId = farmerId,
                        FarmName = txtFarmName.Text.Trim(),
                        FarmLocation = txtFarmLocation.Text.Trim(),
                        FarmDescription = txtFarmDescription.Text.Trim()
                    };

                int result = client.updateFarmerDetails(farmer);

                client.Close();

                if (result == 0)
                {
                    lblMessage.Text = "Farm details updated successfully.";
                }
                else if (result == 1)
                {
                    lblMessage.Text = "Farmer could not be found.";
                }
                else
                {
                    lblMessage.Text = "Unable to update farm details.";
                }
            }
            catch (Exception ex)
            {
                client.Abort();
                lblMessage.Text = ex.GetBaseException().Message;
            }
        }
    }
}
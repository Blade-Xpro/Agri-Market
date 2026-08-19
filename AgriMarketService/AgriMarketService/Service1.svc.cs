using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Microsoft.AspNet.Identity;

namespace AgriMarketService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1

    {

        // Connection to the database through the DBML
        DataClasses1DataContext db = new DataClasses1DataContext();

        // Used to hash passwords
        PasswordHasher passwordHasher = new PasswordHasher();

        // Temporary code required when registering a manager so that only an existing 
        private const string adminRegCode = "AGRI2026";
        public void DoWork()
        {

        }


        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public int registerUser(UserTable utable)
        {
            // Check whether the email already exists
            var checkEmail = (from a in db.UserTables
                              where a.email == utable.email
                              select a).SingleOrDefault();

            if (checkEmail == null)
            {
                var newUser = new UserTable
                {
                    email = utable.email,
                    Name = utable.Name,
                    passwordHash = passwordHasher.HashPassword(utable.passwordHash),
                    phoneNumber = utable.phoneNumber,
                    Surname = utable.Surname,
                    userType = "Customer"
                };

                db.UserTables.InsertOnSubmit(newUser);

                try
                {
                    db.SubmitChanges();

                    return 0; // Account created successfully
                }
                catch (Exception ex)
                {
                    ex.GetBaseException();

                    return 1; // Database or registration error
                }
            }

            return 2; // Email already exists
        }

        // Register an adminstrator
        public int registerAdmin(
            UserTable utable,
            string adminCode)
        {
            // Check whether the correct admin code was entered
            if (adminCode != adminRegCode)
            {
                return 3; // Incorrect admin registration code
            }

            // Check whether the email already exists
            var checkEmail = (from a in db.UserTables
                              where a.email == utable.email
                              select a).SingleOrDefault();

            // If the email was not found, create the admin
            if (checkEmail == null)
            {
                var newAdmin = new UserTable
                {
                    email = utable.email,
                    Name = utable.Name,
                    Surname = utable.Surname,
                    phoneNumber = utable.phoneNumber,

                    // Hash the entered password before saving it
                    passwordHash =
                        passwordHasher.HashPassword(utable.passwordHash),

                    // The service automatically makes this user an admin
                    userType = "Admin"
                };

                db.UserTables.InsertOnSubmit(newAdmin);

                try
                {
                    db.SubmitChanges();

                    return 0; // Admin registered successfully
                }
                catch (Exception ex)
                {
                    ex.GetBaseException();

                    return 1; // Database or registration error
                }
            }

            return 2; // Email already exists
        }

        public string TestService()
        {
            return "Agri Market service is working.";
        }
        public List<Product> SearchProducts(string searchTerm)
        {
            var products = (from p in db.Products
                            where p.Name.Contains(searchTerm) || p.Description.Contains(searchTerm)
                            select p).ToList();
            if (products.Count == 0)
            {
                return null;
            }
            else
            {
                return products;
            }

        }
        public Product GetProductById(int productId)
        {
            var product = (from p in db.Products
                           where p.id == productId
                           select p).SingleOrDefault();
            if (product != null)
            {
                return product;
            }
            else
            {
                return null;
            }
        }
        public List<Product> GetAllProducts()
        {
            var products = (from p in db.Products
                            select p).ToList();
            if (products.Count == 0)
            {
                return null;
            }
            else
            {
                return products;
            }
        }

    }


}
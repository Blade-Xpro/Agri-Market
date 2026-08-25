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
                    userType = "Customer",

                    creationDate = DateTime.Now
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

                   
                    userType = "Admin",
                    creationDate = DateTime.Now
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

        //temp login for user

        public bool loginUser(string email, string password)
        {
            var user = (from u in db.UserTables
                        where u.email == email
                        select u).SingleOrDefault();

            if (user == null)
            {
                return false;
            }

            //verify hashed password
            var result = passwordHasher.VerifyHashedPassword(
                user.passwordHash,
                password
            );

            if (result == PasswordVerificationResult.Failed)
            {
                return false;
            }

            return true;
        }

        public string getUserType(string email)
        {
            var user = (from u in db.UserTables
                        where u.email == email
                        select u).SingleOrDefault();

            if (user == null)
            {
                return null;
            }

            return user.userType;
        }

        public int getUserId(string email)
        {
            var user = (from u in db.UserTables
                        where u.email == email
                        select u).SingleOrDefault();

            if (user == null)
            {
                return 0;
            }

            return user.Id;
        }
        public List<Product> SearchProducts(string searchTerm)
        {
            var products = (from p in db.Products
                            where p.ProductName.Contains(searchTerm) || p.Description.Contains(searchTerm)
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
                           where p.ProductId == productId
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

        // Register a farmer
        public int registerFarmer(UserTable utable, FarmerDetail farmer)
        {
            // Check whether the email already exists
            var checkEmail = (from u in db.UserTables
                              where u.email == utable.email
                              select u).SingleOrDefault();

            if (checkEmail != null)
            {
                return 2; // Email already exists
            }

            //  creating the farmer as a normal system user
            var newFarmer = new UserTable
            {
                Name = utable.Name,
                Surname = utable.Surname,
                email = utable.email,
                phoneNumber = utable.phoneNumber,

                passwordHash =
                    passwordHasher.HashPassword(utable.passwordHash),

                userType = "Farmer",
                creationDate = DateTime.Now
            };

            db.UserTables.InsertOnSubmit(newFarmer);

            try
            {
                
                db.SubmitChanges();

                // Using the generated User Id as the FarmerId
                var farmerDetails = new FarmerDetail
                {
                    FarmerId = newFarmer.Id,
                    FarmName = farmer.FarmName,
                    FarmLocation = farmer.FarmLocation,
                    FarmDescription = farmer.FarmDescription,
                    IsApproved = false
                };

                db.FarmerDetails.InsertOnSubmit(farmerDetails);
                db.SubmitChanges();

                return 0; // Farmer registered successfully
            }
            catch (Exception ex)
            {
                ex.GetBaseException();

                return 1; //  reg error
            }
        }

        // Approve a registered farmer
        public int approveFarmer(int farmerId)
        {
            var farmer = (from f in db.FarmerDetails
                          where f.FarmerId == farmerId
                          select f).SingleOrDefault();

            if (farmer == null)
            {
                return 1; // Farmer not found
            }

            farmer.IsApproved = true;

            try
            {
                db.SubmitChanges();

                return 0; // Farmer approved successfully
            }
            catch (Exception)
            {
                return 2; // Database error
            }
        }

        // Get the details of one farmer
        public FarmerDetail getFarmerDetails(int farmerId)
        {
            var farmer = (from f in db.FarmerDetails
                          where f.FarmerId == farmerId
                          select f).SingleOrDefault();

            return farmer;
        }

        // Get farmers that are waiting for approval
        public List<FarmerDTO> getPendingFarmers()
        {
            var farmers = (from f in db.FarmerDetails
                           where f.IsApproved == false
                           select new FarmerDTO
                           {
                               FarmerId = f.FarmerId,
                               FarmName = f.FarmName,
                               FarmLocation = f.FarmLocation,
                               FarmDescription = f.FarmDescription,
                               IsApproved = f.IsApproved
                           }).ToList();

            return farmers;
        }

        public List<OrderDTO> getAllOrders()
        {
            var orders =
                (from o in db.Orders
                 join u in db.UserTables
                     on o.UserId equals u.Id
                 select new OrderDTO
                 {
                     OrderId = o.OrderId,
                     UserId = o.UserId,
                     CustomerName = u.Name + " " + u.Surname,
                     OrderDate = o.OrderDate,
                     OrderStatus = o.OrderStatus,
                     DeliveryMethod = o.DeliveryMethod,
                     TotalAmount = o.TotalAmount
                 }).ToList();

            return orders;
        }

        public List<UserDTO> getAllUsers()
        {
            var users =
                (from u in db.UserTables
                 select new UserDTO
                 {
                     UserId = u.Id,
                     Name = u.Name,
                     Surname = u.Surname,
                     Email = u.email,
                     PhoneNumber = u.phoneNumber,
                     UserType = u.userType
                 }).ToList();

            return users;
        }

        public FarmerProfileDTO getFarmerProfile(int farmerId)
        {
            var profile =
                (from u in db.UserTables
                 join f in db.FarmerDetails
                     on u.Id equals f.FarmerId
                 where u.Id == farmerId
                       && u.userType == "Farmer"
                 select new FarmerProfileDTO
                 {
                     FarmerId = f.FarmerId,

                     Name = u.Name,
                     Surname = u.Surname,
                     Email = u.email,
                     PhoneNumber = u.phoneNumber,

                     FarmName = f.FarmName,
                     FarmLocation = f.FarmLocation,
                     FarmDescription = f.FarmDescription,
                     IsApproved = f.IsApproved
                 }).SingleOrDefault();

            return profile;
        }
        public UserTable getFarmerUserDetails(int farmerId)
        {
            var farmerUser = (from u in db.UserTables
                              where u.Id == farmerId
                              && u.userType == "Farmer"
                              select u).SingleOrDefault();

            return farmerUser;
        }
        // Update farmer details
        public int updateFarmerDetails(FarmerDetail farmer)
        {
            var existingFarmer = (from f in db.FarmerDetails
                                  where f.FarmerId == farmer.FarmerId
                                  select f).SingleOrDefault();

            if (existingFarmer == null)
            {
                return 1; // Farmer not found
            }

            existingFarmer.FarmName = farmer.FarmName;
            existingFarmer.FarmLocation = farmer.FarmLocation;
            existingFarmer.FarmDescription = farmer.FarmDescription;

            try
            {
                db.SubmitChanges();

                return 0; // Details updated successfully
            }
            catch (Exception)
            {
                return 2; // Database error
            }
        }

        public int updateOrderStatus(int orderId, string newStatus)
        {
            var order =
                (from o in db.Orders
                 where o.OrderId == orderId
                 select o).SingleOrDefault();

            if (order == null)
                return 1;

            order.OrderStatus = newStatus;

            try
            {
                db.SubmitChanges();
                return 0;
            }
            catch (Exception)
            {
                return 2;
            }
        }

        public ReportSummaryDTO getReportSummary()
        {
            ReportSummaryDTO report = new ReportSummaryDTO();

            // Total sales revenue
            if (db.Orders.Any())
            {
                report.TotalRevenue =
                    db.Orders.Sum(o => o.TotalAmount);
            }
            else
            {
                report.TotalRevenue = 0;
            }

            // Total orders
            report.TotalOrders =
                db.Orders.Count();

            // Total customers
            report.TotalCustomers =
                db.UserTables.Count(u => u.userType == "Customer");

            // Total farmers
            report.TotalFarmers =
                db.UserTables.Count(u => u.userType == "Farmer");

            // Number of different products that have been sold
            report.DifferentProductsSold =
                db.OrderItems
                  .Select(oi => oi.ProductId)
                  .Distinct()
                  .Count();

            return report;
        }

        public List<StockReportDTO> getStockReport()
        {
            var stock =
                (from p in db.Products
                 select new StockReportDTO
                 {
                     ProductName = p.ProductName,
                     StockQuantity = p.StockQuantity,
                     UnitOfMeasure = p.UnitOfMeasure
                 }).ToList();

            return stock;
        }

        public List<UserRegistrationReportDTO> getUserRegistrationsPerDay()
        {
            var registrations =
                db.UserTables
                  .Select(u => u.creationDate)
                  .AsEnumerable()
                  .GroupBy(date => date.Date)
                  .Select(group => new UserRegistrationReportDTO
                  {
                      RegistrationDate = group.Key,
                      UserCount = group.Count()
                  })
                  .OrderBy(r => r.RegistrationDate)
                  .ToList();

            return registrations;
        }

        public ReportSummaryDTO getReportSummaryByDate(
    DateTime startDate,
    DateTime endDate)
        {
            // Include the whole end date
            DateTime start = startDate.Date;
            DateTime end = endDate.Date.AddDays(1);

            var orders =
                db.Orders.Where(o =>
                    o.OrderDate >= start &&
                    o.OrderDate < end);

            ReportSummaryDTO report =
                new ReportSummaryDTO();

            // Revenue during selected period
            if (orders.Any())
            {
                report.TotalRevenue =
                    orders.Sum(o => o.TotalAmount);
            }
            else
            {
                report.TotalRevenue = 0;
            }

            // Orders during the time
            report.TotalOrders =
                orders.Count();

            // Customers registered during the time
            report.TotalCustomers =
                db.UserTables.Count(u =>
                    u.userType == "Customer" &&
                    u.creationDate >= start &&
                    u.creationDate < end);

            // Farmers registered during that time
            report.TotalFarmers =
                db.UserTables.Count(u =>
                    u.userType == "Farmer" &&
                    u.creationDate >= start &&
                    u.creationDate < end);

            // Different products sold during that time
            report.DifferentProductsSold =
                (from oi in db.OrderItems
                 join o in db.Orders
                     on oi.OrderId equals o.OrderId
                 where o.OrderDate >= start
                       && o.OrderDate < end
                 select oi.ProductId)
                .Distinct()
                .Count();

            return report;
        }

        // temp shopping cart methods

        public List<CartItemDTO> getCartItems(int userId)
        {
            // Find the user's active shopping cart
            var cart =
                (from c in db.ShoppingCarts
                 where c.UserId == userId
                 && c.IsActive == true
                 select c).SingleOrDefault();

            // User has no active cart
            if (cart == null)
            {
                return new List<CartItemDTO>();
            }


            // Get the products inside the cart
            var items =
                (from item in db.ShoppingCartItems
                 join product in db.Products
                     on item.ProductId equals product.ProductId

                 where item.ShoppingCartId == cart.ShoppingCartId

                 select new CartItemDTO
                 {
                     CartItemId = item.CartItemId,
                     ProductId = product.ProductId,
                     ProductName = product.ProductName,
                     Price = product.Price,
                     Quantity = item.Quantity,

                     LineTotal =
                         product.Price * item.Quantity,

                     ImageUrl = product.ImageUrl

                 }).ToList();


            return items;
        }

        public int removeCartItem(int cartItemId)
        {
            var item =
                (from i in db.ShoppingCartItems
                 where i.CartItemId == cartItemId
                 select i).SingleOrDefault();


            if (item == null)
            {
                return 1;
            }


            try
            {
                db.ShoppingCartItems.DeleteOnSubmit(item);

                db.SubmitChanges();

                return 0;
            }
            catch (Exception)
            {
                return 2;
            }
        }
        public int addToCart(int userId, int productId, int quantity)
        {
            try
            {
                // Find the customer's active cart
                var cart = (from c in db.ShoppingCarts
                            where c.UserId == userId
                            && c.IsActive == true
                            select c).SingleOrDefault();

                // If the customer does not have a cart yet,
                // create one
                if (cart == null)
                {
                    cart = new ShoppingCart
                    {
                        UserId = userId,
                        CreatedDate = DateTime.Now,
                        UpdatedDate = DateTime.Now,
                        IsActive = true
                    };

                    db.ShoppingCarts.InsertOnSubmit(cart);
                    db.SubmitChanges();
                }


                // Check whether this product is already in the cart
                var existingItem =
                    (from item in db.ShoppingCartItems
                     where item.ShoppingCartId == cart.ShoppingCartId
                     && item.ProductId == productId
                     select item).SingleOrDefault();


                if (existingItem == null)
                {
                    // Product is not in cart yet
                    ShoppingCartItem newItem =
                        new ShoppingCartItem
                        {
                            ShoppingCartId = cart.ShoppingCartId,
                            ProductId = productId,
                            Quantity = quantity,
                            DateAdded = DateTime.Now
                        };

                    db.ShoppingCartItems.InsertOnSubmit(newItem);
                }
                else
                {
                    // Product already exists, increase quantity
                    existingItem.Quantity += quantity;
                }


                cart.UpdatedDate = DateTime.Now;

                db.SubmitChanges();

                return 0; 
            }
            catch (Exception)
            {
                return 1; 
            }
        }
    }

    





}
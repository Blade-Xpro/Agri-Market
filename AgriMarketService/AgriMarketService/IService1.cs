using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace AgriMarketService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        void DoWork();

        //the register function declaration
       [OperationContract]
        int registerUser(UserTable utable);

        [OperationContract]
        int registerAdmin(UserTable utable, string adminCode);

        // temp login needed for user management
        [OperationContract]
        bool loginUser(string email, string password);

        [OperationContract]
        string getUserType(string email);

        [OperationContract]
        int getUserId(string email);


        [OperationContract]
        Product GetProductById(int productId);

        [OperationContract]
        List<Product> GetAllProducts();

        [OperationContract]
        List<CartItemDTO> getCartItems(int userId);

        [OperationContract]
        int removeCartItem(int cartItemId);

        // [OperationContract]
        // void AddProduct(Product product);

        // [OperationContract]
        // void UpdateProduct(Product product);

        // [OperationContract]
        // void DeleteProduct(int productId);

        // Temporary cart integration
        [OperationContract]
        int addToCart(int userId, int productId, int quantity);



        [OperationContract]
        List<Product> SearchProducts(string searchTerm);

        [OperationContract]
        int registerFarmer(UserTable utable, FarmerDetail farmer);

        [OperationContract]
        int approveFarmer(int farmerId);

        [OperationContract]
        FarmerDetail getFarmerDetails(int farmerId);

        [OperationContract]
        List<FarmerDTO> getPendingFarmers();

        [OperationContract]
        int updateFarmerDetails(FarmerDetail farmer);

        [OperationContract]
        UserTable getFarmerUserDetails(int farmerId);

        [OperationContract]
        FarmerProfileDTO getFarmerProfile(int farmerId);

        [OperationContract]
        List<UserDTO> getAllUsers();

        [OperationContract]
        List<OrderDTO> getAllOrders();

        [OperationContract]
        int updateOrderStatus(int orderId, string newStatus);

        [OperationContract]
        ReportSummaryDTO getReportSummary();

        [OperationContract]
        List<StockReportDTO> getStockReport();

        [OperationContract]
        List<UserRegistrationReportDTO> getUserRegistrationsPerDay();

        [OperationContract]
        ReportSummaryDTO getReportSummaryByDate(DateTime startDate, DateTime endDate);

    }




    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class UserRegistrationReportDTO
    {
        [DataMember]
        public DateTime RegistrationDate { get; set; }

        [DataMember]
        public int UserCount { get; set; }
    }

    [DataContract]
    public class StockReportDTO
    {
        [DataMember]
        public string ProductName { get; set; }

        [DataMember]
        public decimal StockQuantity { get; set; }

        [DataMember]
        public string UnitOfMeasure { get; set; }
    }
    [DataContract]
    public class ReportSummaryDTO
    {
        [DataMember]
        public decimal TotalRevenue { get; set; }

        [DataMember]
        public int TotalOrders { get; set; }

        [DataMember]
        public int TotalCustomers { get; set; }

        [DataMember]
        public int TotalFarmers { get; set; }

        [DataMember]
        public int DifferentProductsSold { get; set; }
    }


    [DataContract]
    public class OrderDTO
    {
        [DataMember]
        public int OrderId { get; set; }

        [DataMember]
        public int UserId { get; set; }

        [DataMember]
        public string CustomerName { get; set; }

        [DataMember]
        public DateTime OrderDate { get; set; }

        [DataMember]
        public string OrderStatus { get; set; }

        [DataMember]
        public string DeliveryMethod { get; set; }

        [DataMember]
        public decimal TotalAmount { get; set; }
    }
    [DataContract]
    public class UserDTO
    {
        [DataMember]
        public int UserId { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string Surname { get; set; }

        [DataMember]
        public string Email { get; set; }

        [DataMember]
        public string PhoneNumber { get; set; }

        [DataMember]
        public string UserType { get; set; }
    }
    [DataContract]
    public class FarmerProfileDTO
    {
        [DataMember]
        public int FarmerId { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string Surname { get; set; }

        [DataMember]
        public string Email { get; set; }

        [DataMember]
        public string PhoneNumber { get; set; }

        [DataMember]
        public string FarmName { get; set; }

        [DataMember]
        public string FarmLocation { get; set; }

        [DataMember]
        public string FarmDescription { get; set; }

        [DataMember]
        public bool IsApproved { get; set; }
    }

    [DataContract]
    public class FarmerDTO
    {
        [DataMember]
        public int FarmerId { get; set; }

        [DataMember]
        public string FarmName { get; set; }

        [DataMember]
        public string FarmLocation { get; set; }

        [DataMember]
        public string FarmDescription { get; set; }

        [DataMember]
        public bool IsApproved { get; set; }
    }
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }

    [DataContract]
    public class CartItemDTO
    {
        [DataMember]
        public int CartItemId { get; set; }

        [DataMember]
        public int ProductId { get; set; }

        [DataMember]
        public string ProductName { get; set; }

        [DataMember]
        public decimal Price { get; set; }

        [DataMember]
        public decimal Quantity { get; set; }

        [DataMember]
        public decimal LineTotal { get; set; }

        [DataMember]
        public string ImageUrl { get; set; }
    }


}


    


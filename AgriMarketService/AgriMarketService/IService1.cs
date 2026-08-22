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



        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        [OperationContract]
        Product GetProductById(int productId);

        [OperationContract]
        List<Product> GetAllProducts();

        [OperationContract]
        void AddProduct(Product product);

        [OperationContract]
        void UpdateProduct(Product product);

        [OperationContract]
        void DeleteProduct(int productId);

        [OperationContract]
        List<Product> SearchProducts(string searchTerm);
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
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
            
        
    }


    


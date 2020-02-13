using Newtonsoft.Json;
using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store.Admin.Pages
{
    public partial class OrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            if (Session["User"] != null)
            {
                var user = Session["User"] as AdminLoginMaster;
                bool IsAdmin = context.AdminLoginMasters.Any(x => x.IsAdmin == true && x.EmailID == user.EmailID);
                if (!IsAdmin)
                {
                    Response.RedirectToRoute("home", null);
                }
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }

        [WebMethod]
        public static string GetAllOrders()
        {
            //OrderDetailsViewModel
            PAWDStoreEntities context = new PAWDStoreEntities();
            var Items = context.Order_Master.Select(x => new AdminOrderViewmodel()
            {
                OrderDate = x.CreatedDate,
                OrderStatus = x.Order_Status,
                OrderType = x.Order_Type,
                Order_ID = x.Order_ID,
                Order_No = x.Order_No,
                Email = x.AdminLoginMaster.EmailID,
                Name = x.AdminLoginMaster.UserName
            }).ToList();
            return JsonConvert.SerializeObject(Items);
        }

        [WebMethod]
        public static string GetOrderItems(int Order_ID)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            var Items = context.Order_Master.Where(x => x.Order_ID == Order_ID).Select(y => new OrderItemsViewModel()
            {
                Order_ID = y.Order_ID,
                BName = y.User_Address_Master.BName,
                BEmail = y.User_Address_Master.BEmail,
                BAddress = y.User_Address_Master.BAddress,
                BCity = y.User_Address_Master.BCity,
                BMobile = y.User_Address_Master.BMobile,
                BState = y.User_Address_Master.BState,
                BZipcode = y.User_Address_Master.BZipcode,
                SName = y.User_Address_Master.SName,
                SAddress = y.User_Address_Master.SAddress,
                SCity = y.User_Address_Master.SCity,
                SEmail = y.User_Address_Master.SEmail,
                SMobile = y.User_Address_Master.SMobile,
                SState = y.User_Address_Master.SState,
                SZipcode = y.User_Address_Master.SZipcode,
                OrderStatus = y.Order_Status,
                OrderDate = y.CreatedDate,
                OrderType = y.Order_Type,
                Order_No = y.Order_No,
                paymentMethod = y.Order_Type,
                OrderItem = y.Order_Item_Master.Select(c => new AdminOrderItemViewModel()
                {
                    Order_Item_ID = c.Order_Item_ID,
                    Order_ID = c.Order_ID,
                    Product_ID = c.Product_ID,
                    ImageName = c.Product_Master.Product_Image_Master.FirstOrDefault().Image_name,
                    Product_Price = c.Price,
                    Product_Title = c.Product_Master.Product_Title,
                    Quantity = c.Quantity,
                    ProductSize = c.Size,
                    ProductShortDescription = c.Product_Master.Product_short_description
                }).ToList()
            }).FirstOrDefault();
            return JsonConvert.SerializeObject(Items);
        }
        [WebMethod]
        public static string ChangeOrderStatus(int Order_ID, string Status)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            var Order = context.Order_Master.FirstOrDefault(x => x.Order_ID == Order_ID);
            if (Order != null)
            {
                Order.Order_Status = Status;
                context.SaveChanges();
            }
            return JsonConvert.SerializeObject(true);
        }
    }
}
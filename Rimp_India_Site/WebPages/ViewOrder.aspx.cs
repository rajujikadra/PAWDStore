using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.WebPages
{
    public partial class ViewOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            if (Session["User"] != null)
            {
                int Order_ID = Convert.ToInt32(Request.QueryString["ID"]);
                var OrderItems = context.Order_Master.Where(x => x.Order_ID == Order_ID).Select(y => new OrderItemsViewModel()
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
                        ProductShortDescription = c.Product_Master.Product_short_description
                    }).ToList()
                }).FirstOrDefault();
                var jsonSerialiser = new JavaScriptSerializer();
                jsonSerialiser.MaxJsonLength = int.MaxValue;
                var Data = jsonSerialiser.Serialize(OrderItems);
                var OID = jsonSerialiser.Serialize(Order_ID);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OrderDetails", "GetOrderDetails(" + Data + ", " + OID + ");", true);
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }
    }
}
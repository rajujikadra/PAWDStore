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
    public partial class ConfirmOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            if (Session["User"] != null)
            {
                int Order_ID = Convert.ToInt32(Request.QueryString["ID"]);
                var OrderItems = context.Order_Master.Where(x => x.Order_ID == Order_ID).Select(y => new OrderDetailsViewModel()
                {
                    OrderDate = y.CreatedDate,
                    Order_ID = y.Order_ID,
                    Order_No = y.Order_No,
                    OrderStatus = y.Order_Status,
                    OrderType = y.Order_Type,
                    OrderItems = y.Order_Item_Master.Select(c => new OrderItemViewModel()
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
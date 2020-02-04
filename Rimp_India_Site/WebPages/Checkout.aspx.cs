using Newtonsoft.Json;
using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.WebPages
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
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
        public static string PlaceOrder(OrderViewModel model)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
                string Order_NO = DateTime.Now.Ticks.ToString();
                if (model.User_Address_ID == 0)
                {
                    var address = new User_Address_Master
                    {
                        BName = model.BName,
                        BAddress = model.BAddress,
                        BCity = model.BCity,
                        BEmail = model.BEmail,
                        BMobile = model.BMobile,
                        BState = model.BState,
                        BZipcode = model.BZipcode,
                        CreatedDate = DateTime.Now,
                        SName = model.SName,
                        SCity = model.SCity,
                        SAddress = model.SAddress,
                        SEmail = model.SEmail,
                        SMobile = model.SMobile,
                        SState = model.SState,
                        SZipcode = model.SZipcode,
                        User_ID = UserID
                    };
                    context.User_Address_Master.Add(address);
                    context.SaveChanges();
                    model.User_Address_ID = address.User_Address_ID;
                }
                var obj = new Order_Master
                {
                    Order_No = Order_NO,
                    Order_Status = "Processing",
                    Order_Type = model.paymentMethod,
                    CreatedDate = DateTime.Now,
                    User_Address_ID = model.User_Address_ID,
                    User_ID = UserID
                };
                context.Order_Master.Add(obj);
                context.SaveChanges();

                var CartItem = context.Cart_Master.Where(x => x.User_ID == UserID).ToList();
                var Items = CartItem.Select(x => new Order_Item_Master()
                {
                    Order_ID = obj.Order_ID,
                    Quantity = x.Quantity,
                    Price = x.Product_Master.Product_Price,
                    Product_ID = x.Product_ID
                }).ToList();
                context.Order_Item_Master.AddRange(Items);
                context.Cart_Master.RemoveRange(CartItem);
                context.SaveChanges();
                return JsonConvert.SerializeObject(obj.Order_ID);
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(0);
            }
        }
    }
}
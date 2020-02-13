using Newtonsoft.Json;
using PAWD_Store.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store.WebPages
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetAllCartItems()
        {
            var Items = new List<CartViewModel>();
            if (HttpContext.Current.Session["User"] == null)
            {
                return JsonConvert.SerializeObject(Items);
            }
            else
            {
                int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
                PAWDStoreEntities context = new PAWDStoreEntities();
                Items = context.Cart_Master.Where(x => x.User_ID == UserID).Select(y => new CartViewModel()
                {
                    Cart_ID = y.Cart_ID,
                    ProductImage = y.Product_Master.Product_Image_Master.FirstOrDefault().Image_name,
                    Product_Price = (decimal)y.Product_Master.Product_Price,
                    Quantity = (int)y.Quantity,
                    Product_Title = y.Product_Master.Product_Title,
                    Product_ID = y.Product_ID,
                    Size = y.Size
                }).ToList();
            }
            return JsonConvert.SerializeObject(Items);
        }
        [WebMethod]
        public static string DeleteProductInCart(int Cart_ID)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            var Item = context.Cart_Master.FirstOrDefault(x => x.Cart_ID == Cart_ID);
            if (Item != null)
            {
                context.Cart_Master.Remove(Item);
                context.SaveChanges();
            }
            return JsonConvert.SerializeObject(true);
        }

        [WebMethod]
        public static string UpdateQuantity(int Cart_ID, int Qty)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var CartItem = context.Cart_Master.FirstOrDefault(x => x.Cart_ID == Cart_ID);
                if (CartItem != null)
                {
                    CartItem.Quantity = Qty;
                    context.SaveChanges();
                }
                return JsonConvert.SerializeObject(true);
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(false);
            }
        }
    }
}
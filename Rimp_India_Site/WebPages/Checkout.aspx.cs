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
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
            string Order_NO = DateTime.Now.Ticks.ToString();
            if (model.User_Address_ID == 0)
            {
                var address = new User_Address_Master{

                };
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
            return null;
        }
    }
}
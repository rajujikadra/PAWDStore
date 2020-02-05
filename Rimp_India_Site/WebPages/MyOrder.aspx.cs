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
    public partial class MyOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            if (Session["User"] == null)
            {
                Response.RedirectToRoute("home", null);

            }
        }
        [WebMethod]
        public static string GetAllOrders()
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var SessionUser = HttpContext.Current.Session["User"] as AdminLoginMaster;
            var Order = context.Order_Master.Where(x => x.User_ID == SessionUser.User_ID).Select(x => new OrderItemsViewModel()
            {
                Order_ID = x.Order_ID,
                BName = x.User_Address_Master.BName,
                BMobile = x.User_Address_Master.BMobile,
                OrderDate = x.CreatedDate,
                Order_No = x.Order_No,
                BEmail = x.User_Address_Master.BEmail
            }).ToList();
            return JsonConvert.SerializeObject(Order);
        }
    }
}
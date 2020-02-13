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
    public partial class MyOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            if (Session["User"] == null)
            {
                Response.RedirectToRoute("home", null);

            }
        }
        [WebMethod]
        public static string GetAllOrders()
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            var SessionUser = HttpContext.Current.Session["User"] as AdminLoginMaster;
            var Order = context.Order_Master.Where(x => x.User_ID == SessionUser.User_ID).Select(x => new OrderItemsViewModel()
            {
                Order_ID = x.Order_ID,
                BName = x.User_Address_Master.BName,
                BMobile = x.User_Address_Master.BMobile,
                OrderDate = x.CreatedDate,
                Order_No = x.Order_No,
                BEmail = x.User_Address_Master.BEmail
            }).OrderByDescending(y => y.Order_ID).ToList();
            return JsonConvert.SerializeObject(Order);
        }
    }
}
using Newtonsoft.Json;
using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetMainMenu()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var List = context.MainMenu_Master.Where(x => x.IsDeleted == false).Select(x => new { x.Menu_ID, x.Menu_Name }).ToList();
                return JsonConvert.SerializeObject(List);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetCategoryMenu()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var List = context.RGetCategory().ToList();
                return JsonConvert.SerializeObject(List.OrderBy(x=> x.Category_ID));
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetSubCategoryMenu()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var List = context.RGetSubCategory().ToList();
                return JsonConvert.SerializeObject(List);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetHomePageProductList()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var list = context.GetHomePageProduct().ToList();
                return JsonConvert.SerializeObject(list);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string AddInquiry(string Name, string Mobile, string Address, string Email, string Subject, string Message, string SubCatName)
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string AddSubsribe(string Email)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                Subscribe_Master obj = new Subscribe_Master();

                var Total_group = context.Email_Group_Master.Take(1).OrderByDescending(x => x.Email_Group_ID).SingleOrDefault();
                if (Total_group != null)
                {
                    var Total_Email = context.Subscribe_Master.Where(x => x.Email_Group_ID == Total_group.Email_Group_ID && x.IsDeleted == false).Count();
                    if (Total_Email < 200)
                    {
                        obj.EmailID = Email;
                        obj.IsDeleted = false;
                        obj.Email_Group_ID = Total_group.Email_Group_ID;
                        context.Subscribe_Master.Add(obj);
                        context.SaveChanges();
                    }
                    else
                    {
                        var GroupName = Total_group.Email_Group_Name.Split('_');
                        var Group_name = GroupName[0] + "_" + GroupName[1] + "_";
                        int group_no = Convert.ToInt32(GroupName[2]) + 1;
                        Group_name = Group_name + group_no.ToString();
                        Email_Group_Master Email_obj = new Email_Group_Master();
                        Email_obj.Email_Group_Name = Group_name;
                        context.Email_Group_Master.Add(Email_obj);
                        context.SaveChanges();
                        int Email_Group_ID = Email_obj.Email_Group_ID;
                        obj.EmailID = Email;
                        obj.IsDeleted = false;
                        obj.Email_Group_ID = Email_Group_ID;
                        context.Subscribe_Master.Add(obj);
                        context.SaveChanges();
                    }
                }
                else
                {
                    Email_Group_Master Obj_Email_Group = new Email_Group_Master();
                    Obj_Email_Group.Email_Group_Name = "Email_Group_1";
                    context.Email_Group_Master.Add(Obj_Email_Group);
                    context.SaveChanges();
                    var id = Obj_Email_Group.Email_Group_ID;
                    Subscribe_Master obj_subscribe = new Subscribe_Master();
                    obj_subscribe.EmailID = Email;
                    obj_subscribe.Email_Group_ID = id;
                    obj_subscribe.IsDeleted = false;
                    context.Subscribe_Master.Add(obj_subscribe);
                    context.SaveChanges();
                }
                var status = "success";
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string get_information()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Information_Master.Take(3).Select(x => new
                {
                    x.Information_ID,
                    x.Title,
                    x.Description,
                    x.CreatedDate
                }).OrderByDescending(t => t.Information_ID).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string get_all_hot_products()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var all_hot_product = context.GetHotProduct().ToList();
                return JsonConvert.SerializeObject(all_hot_product);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string CheckUserLoginOrNot()
        {
            if (HttpContext.Current.Session["User"] != null)
                return JsonConvert.SerializeObject(true);
            return JsonConvert.SerializeObject(false);
        }
        [WebMethod]
        public static string AddToCart(int Product_ID, string Size)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            int User_ID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
            var IsThereInCart = context.Cart_Master.FirstOrDefault(x => x.User_ID == User_ID && x.Product_ID == Product_ID);
            if (IsThereInCart == null)
            {
                var obj = new Cart_Master
                {
                    Product_ID = Product_ID,
                    User_ID = User_ID,
                    Quantity = 1,
                    Size = Size,
                    CreatedDate = DateTime.Now
                };
                context.Cart_Master.Add(obj);
                context.SaveChanges();
            }
            else
            {
                IsThereInCart.Quantity = IsThereInCart.Quantity + 1;
                context.SaveChanges();
            }
            int CartItemCount = context.Cart_Master.Count(x => x.User_ID == User_ID);
            return JsonConvert.SerializeObject(CartItemCount);
        }
        [WebMethod]
        public static string GetCartItemCount()
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
                int count = context.Cart_Master.Count(x => x.User_ID == UserID);
                return JsonConvert.SerializeObject(count);
            }
            return JsonConvert.SerializeObject(0);
        }

        [WebMethod]
        public static string AddProductInCart(int Product_ID, int Qty, string Size)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            int User_ID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
            var IsThereInCart = context.Cart_Master.FirstOrDefault(x => x.User_ID == User_ID && x.Product_ID == Product_ID);
            if (IsThereInCart == null)
            {
                var obj = new Cart_Master
                {
                    Product_ID = Product_ID,
                    User_ID = User_ID,
                    Quantity = Qty,
                    Size = !string.IsNullOrEmpty(Size) ? Size : string.Empty,
                    CreatedDate = DateTime.Now
                };
                context.Cart_Master.Add(obj);
                context.SaveChanges();
            }
            else
            {
                IsThereInCart.Quantity = (IsThereInCart.Quantity + Qty) > 10 ? 10 : (IsThereInCart.Quantity + Qty);
                context.SaveChanges();
            }
            int CartItemCount = context.Cart_Master.Count(x => x.User_ID == User_ID);
            return JsonConvert.SerializeObject(CartItemCount);
        }
    }
}

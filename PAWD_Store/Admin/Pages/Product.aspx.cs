using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using PAWD_Store.Models;


namespace PAWD_Store.Admin.Pages
{
    public partial class Product : System.Web.UI.Page
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
        public static string GetProducts()
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var paroducts = context.GetAllProducts().ToList();
                return JsonConvert.SerializeObject(paroducts);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetSubCatByCatID(int Category_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var sub_cat = context.SubCategory_Master.Where(x => x.Category_ID == Category_ID).Select(y => new { y.SubCategory_ID, y.SubCategory_Name }).ToList();
                return JsonConvert.SerializeObject(sub_cat);

            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetThirdCatBySubCatID(int SubCategory_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var third_cat = context.ThirdCategory_Master.Where(x => x.SubCategory_ID == SubCategory_ID).Select(y => new { y.ThirdCategory_ID, y.ThirdCategory_Name }).ToList();
                return JsonConvert.SerializeObject(third_cat);

            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string AddProducts(string Title, string Short_decription, string Long_description, int Category, int Sub_category, int Third_category, decimal Price)
        {
            try
            {
                Nullable<int> ThirdCatID = null;
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.ProductInsert(Title, Short_decription, Long_description, DateTime.Now, null, Category, Sub_category, Third_category == 0 ? ThirdCatID : Third_category, Price).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetProductByID(int PID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.Product_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Product_Title,
                    y.Product_short_description,
                    y.Product_long_description,
                    y.Created_date,
                    y.Updated_date,
                    y.Category_ID,
                    y.Category_Master.Category_Name,
                    y.SubCategory_ID,
                    y.SubCategory_Master.SubCategory_Name,
                    y.ThirdCategory_ID,
                    y.ThirdCategory_Master.ThirdCategory_Name,
                    y.Product_Price
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateProducts(int ProductID, string Title, string Short_decription, string Long_description, int Category, int Sub_category, int Third_category, decimal Price)
        {
            try
            {
                Nullable<int> ThirdCatID = null;
                PAWDStoreEntities context = new PAWDStoreEntities();
                var Product = context.Product_Master.Where(x => x.Product_ID == ProductID).SingleOrDefault();
                if (Product != null)
                {
                    Product.Product_Title = Title;
                    Product.Product_short_description = Short_decription;
                    Product.Product_long_description = Long_description;
                    Product.Category_ID = Category;
                    Product.SubCategory_ID = Sub_category;
                    Product.ThirdCategory_ID = Third_category == 0 ? ThirdCatID : Third_category;
                    Product.Product_Price = Price;
                    Product.Updated_date = DateTime.Now;
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "fail";
                    return JsonConvert.SerializeObject(status);
                }

            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string DeleteProduct(int Delete_ProductID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var Ck_editor = context.Product_CK_Master.Where(x => x.Product_ID == Delete_ProductID).ToList();
                if (Ck_editor.Count() > 0)
                {
                    foreach (var i in Ck_editor)
                    {
                        context.Product_CK_Master.Remove(i);
                        context.SaveChanges();
                    }
                }
                var Images = context.Product_Image_Master.Where(x => x.Product_ID == Delete_ProductID).ToList();
                if (Images.Count() > 0)
                {
                    foreach (var i in Images)
                    {
                        context.Product_Image_Master.Remove(i);
                        context.SaveChanges();
                    }
                }
                var AllSpec = context.Product_Specification_Master.Where(x => x.Product_ID == Delete_ProductID).ToList();
                if (AllSpec.Count() > 0)
                {
                    context.Product_Specification_Master.RemoveRange(AllSpec);
                    context.SaveChanges();
                }
                //var All_specification_Group = context.Specification_Group_Master.Where(x => x.Product_ID == Delete_ProductID).ToList();
                //if (All_specification_Group.Count() > 0)
                //{
                //    foreach (var i in All_specification_Group)
                //    {
                //        var all_specification_related_group = context.Product_Specification_Master.Where(x => x.Specification_GroupID == i.Specification_GroupID).ToList();
                //        if (all_specification_related_group.Count() > 0)
                //        {
                //            foreach (var x in all_specification_related_group)
                //            {
                //                context.Product_Specification_Master.Remove(x);
                //                context.SaveChanges();
                //            }
                //        }
                //        context.Specification_Group_Master.Remove(i);
                //        context.SaveChanges();
                //    }
                //}
                var Product = context.Product_Master.Where(x => x.Product_ID == Delete_ProductID).SingleOrDefault();
                if (Product != null)
                {
                    context.Product_Master.Remove(Product);
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
        public static string add_hot_product(int ProductID, bool value)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var all_hot_product = context.Product_Master.Where(x => x.IsHotProduct == true).ToList();
                if (value == true)
                {
                    if (all_hot_product.Count() < 6)
                    {
                        var get_product = context.Product_Master.Where(x => x.Product_ID == ProductID).SingleOrDefault();
                        if (get_product != null)
                        {
                            get_product.IsHotProduct = value;
                            context.SaveChanges();
                            var status = "success fully added in hot product";
                            return JsonConvert.SerializeObject(status);
                        }
                        else
                        {
                            var status = "record not found please try again";
                            return JsonConvert.SerializeObject(status);
                        }
                    }
                    else
                    {
                        var status = "please remove some product in to the hot product and then try add";
                        return JsonConvert.SerializeObject(status);
                    }
                }
                else
                {
                    var get_product = context.Product_Master.Where(x => x.Product_ID == ProductID).SingleOrDefault();
                    if (get_product != null)
                    {
                        get_product.IsHotProduct = value;
                        context.SaveChanges();
                        var status = "success fully removed in hot product";
                        return JsonConvert.SerializeObject(status);
                    }
                    else
                    {
                        var status = "record not found please try again";
                        return JsonConvert.SerializeObject(status);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

    }
}
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
    public partial class Category : System.Web.UI.Page
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
            //if (Session["User"] == null)
            //{
            //    Response.RedirectToRoute("home", null);
            //}
            //var user = Session["User"] as AdminLoginMaster;
            //bool IsAdmin = context.AdminLoginMasters.Any(x => x.IsAdmin == true && x.EmailID == user.EmailID);
            //if (!IsAdmin)
            //{
            //    Response.RedirectToRoute("home", null);
            //}
        }
        [WebMethod]
        public static string AddCategory(string CategoryName, int MenuID, bool IsDelete)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.CategoryInsert(CategoryName, MenuID, IsDelete).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string Getategory()
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.RGetCategory().ToList();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string FilterMenuWise(int MenuID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                if(MenuID != 0)
                {
                    var data = context.Category_Master.Where(x => x.Menu_ID == MenuID).Select(y => new
                    {
                        y.Category_ID,
                        y.Menu_ID,
                        y.MainMenu_Master.Menu_Name,
                        y.IsDeleted,
                        y.Category_Name
                    }).ToList();
                    return JsonConvert.SerializeObject(data);
                }
                else
                {
                    var data = context.Category_Master.Select(y => new
                    {
                        y.Category_ID,
                        y.Menu_ID,
                        y.MainMenu_Master.Menu_Name,
                        y.IsDeleted,
                        y.Category_Name
                    }).ToList();
                    return JsonConvert.SerializeObject(data);
                }
               
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }


        [WebMethod]
        public static string GetCategoryByID(int CategoryID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.Category_Master.Where(x => x.Category_ID == CategoryID).Select(y => new { y.Category_ID, y.Category_Name, y.Menu_ID, y.MainMenu_Master.Menu_Name }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string EditCategory(int CategoryID, string CategoryName, int MenuID, bool IsDelete)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var OldCat = context.Category_Master.Where(x => x.Category_ID == CategoryID).SingleOrDefault();
                if (OldCat != null)
                {
                    OldCat.Category_Name = CategoryName;
                    OldCat.Menu_ID = MenuID;
                    OldCat.IsDeleted = IsDelete;
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
        public static string DeleteCategory(int CategoryID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var all_products = context.Product_Master.Where(x => x.Category_ID == CategoryID).ToList();
                if (all_products.Count() > 0)
                {
                    foreach (var i in all_products)
                    {
                        var all_CK_editor = context.Product_CK_Master.Where(x => x.Product_ID == i.Product_ID).ToList();
                        if (all_CK_editor.Count() > 0)
                        {
                            foreach (var x in all_CK_editor)
                            {
                                context.Product_CK_Master.Remove(x);
                                context.SaveChanges();
                            }
                        }
                        var all_images = context.Product_Image_Master.Where(x => x.Product_ID == i.Product_ID).ToList();
                        if (all_images.Count() > 0)
                        {
                            foreach (var t in all_images)
                            {
                                context.Product_Image_Master.Remove(t);
                                context.SaveChanges();
                            }
                        }
                        var all_spec_group = context.Specification_Group_Master.Where(x => x.Product_ID == i.Product_ID).ToList();
                        if (all_spec_group.Count() > 0)
                        {
                            foreach (var s in all_spec_group)
                            {
                                var all_spec = context.Product_Specification_Master.Where(x => x.Specification_GroupID == s.Specification_GroupID).ToList();
                                if (all_spec.Count() > 0)
                                {
                                    foreach (var ss in all_spec)
                                    {
                                        context.Product_Specification_Master.Remove(ss);
                                        context.SaveChanges();
                                    }
                                }
                                context.Specification_Group_Master.Remove(s);
                                context.SaveChanges();
                            }
                        }
                        context.Product_Master.Remove(i);
                        context.SaveChanges();
                    }
                }
                var Category = context.Category_Master.Where(x => x.Category_ID == CategoryID).SingleOrDefault();
                if (Category != null)
                {
                    var SubCat = context.SubCategory_Master.Where(x => x.Category_ID == Category.Category_ID).ToList();
                    foreach (var i in SubCat)
                    {
                        var ThirdCat = context.ThirdCategory_Master.Where(x => x.SubCategory_ID == i.SubCategory_ID).ToList();
                        if (ThirdCat.Count() > 0)
                        {
                            foreach (var x in ThirdCat)
                            {
                                context.ThirdCategory_Master.Remove(x);
                                context.SaveChanges();
                            }
                        }
                        context.SubCategory_Master.Remove(i);
                        context.SaveChanges();
                    }
                    context.Category_Master.Remove(Category);
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
    }
}
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Rimp_India_Site.Models;

namespace Rimp_India_Site.Admin.Pages
{
    public partial class SubCategory : System.Web.UI.Page
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
        public static string GetAllCategory()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.Category_Master.Where(x => x.IsDeleted == false).Select(y => new { y.Category_ID, y.Category_Name, y.MainMenu_Master.Menu_ID, y.MainMenu_Master.Menu_Name }).ToList();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string AddSubCategory(string SubCategoryName, int CategoryID, bool IsDelete, string Image, string ImageName, string Heading, string Description, string Page_Image, string Page_Image_Name)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                byte[] ImageFile = null;
                byte[] PageImage = null;
                if (Image != null && !string.IsNullOrEmpty(Image))
                {
                    ImageFile = Convert.FromBase64String(Image);
                }
                if (Page_Image != null && !string.IsNullOrEmpty(Page_Image))
                {
                    PageImage = Convert.FromBase64String(Page_Image);
                }
                var get_all_sub_cat = context.SubCategory_Master.OrderBy(x => x.Sortable).ToList();
                int sort = 2;
                foreach (var i in get_all_sub_cat)
                {
                    i.Sortable = sort++;
                    context.SaveChanges();
                }
                if (ImageFile != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/SubCategoryImage/{0}", ImageFile));
                    File.WriteAllBytes(filePath, ImageFile);
                }
                if (PageImage != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/SubCategoryHeaderImage/{0}", PageImage));
                    File.WriteAllBytes(filePath, ImageFile);
                }
                var status = context.SubCategoryInsert(SubCategoryName, CategoryID, IsDelete, null, false, ImageName, 1, Heading, Description, null, Page_Image_Name, string.Empty).FirstOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetAllSubCategorys()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = (from C in context.SubCategory_Master
                              join CC in context.Category_Master on C.Category_ID equals CC.Category_ID
                              join M in context.MainMenu_Master on CC.Menu_ID equals M.Menu_ID
                              select new
                              {
                                  SubCategory_ID = C.SubCategory_ID,
                                  SubCategory_Name = C.SubCategory_Name,
                                  CategoryID = C.Category_ID,
                                  IsDeleted = C.IsDeleted,
                                  Category_Name = CC.Category_Name,
                                  Menu_ID = M.Menu_ID,
                                  Menu_Name = M.Menu_Name,
                                  Image = C.Image,
                                  IsHomePage = C.IsHomePage,
                                  ImageName = C.ImageName,
                                  Sortable = C.Sortable
                              }).OrderBy(x => x.Sortable).ToList();
                //var status = context.RGetSubCategory().ToList();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetAllFilterSubCat(int CatID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                if(CatID != 0)
                {
                    var status = (from C in context.SubCategory_Master
                                  join CC in context.Category_Master on C.Category_ID equals CC.Category_ID
                                  join M in context.MainMenu_Master on CC.Menu_ID equals M.Menu_ID
                                  select new
                                  {
                                      SubCategory_ID = C.SubCategory_ID,
                                      SubCategory_Name = C.SubCategory_Name,
                                      CategoryID = C.Category_ID,
                                      IsDeleted = C.IsDeleted,
                                      Category_Name = CC.Category_Name,
                                      Menu_ID = M.Menu_ID,
                                      Menu_Name = M.Menu_Name,
                                      Image = C.Image,
                                      IsHomePage = C.IsHomePage,
                                      ImageName = C.ImageName,
                                      Sortable = C.Sortable
                                  }).Where(t=>t.CategoryID == CatID).OrderBy(x => x.Sortable).ToList();
                    //var status = context.RGetSubCategory().ToList();
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = (from C in context.SubCategory_Master
                                  join CC in context.Category_Master on C.Category_ID equals CC.Category_ID
                                  join M in context.MainMenu_Master on CC.Menu_ID equals M.Menu_ID
                                  select new
                                  {
                                      SubCategory_ID = C.SubCategory_ID,
                                      SubCategory_Name = C.SubCategory_Name,
                                      CategoryID = C.Category_ID,
                                      IsDeleted = C.IsDeleted,
                                      Category_Name = CC.Category_Name,
                                      Menu_ID = M.Menu_ID,
                                      Menu_Name = M.Menu_Name,
                                      Image = C.Image,
                                      IsHomePage = C.IsHomePage,
                                      ImageName = C.ImageName,
                                      Sortable = C.Sortable
                                  }).OrderBy(x => x.Sortable).ToList();
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException; 
            }
        }

        [WebMethod]
        public static string GetSubCategoryByID(int SubCategoryID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).Select(y => new { y.Category_ID,
                    y.Category_Master.Category_Name,
                    y.SubCategory_ID,
                    y.SubCategory_Name,
                    y.ImageName,
                    y.Image,
                    y.Heading,
                    y.Description,
                    y.Page_Image,
                    y.Page_Image_Name
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string EditSubCategory(int SubCategoryID, string SubCategoryName, int CategoryID, bool IsDelete, string Image, string ImageName, string Heading, string Description, string Page_Image, string Page_Image_Name)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                byte[] ImageFile = null;
                byte[] PageImage = null;
                if (Image != null && !string.IsNullOrEmpty(Image))
                {
                    ImageFile = Convert.FromBase64String(Image);
                }
                if(Page_Image != null && !string.IsNullOrEmpty(Page_Image))
                {
                    PageImage = Convert.FromBase64String(Page_Image);
                }
                var SubCat = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                if (SubCat != null)
                {
                    SubCat.SubCategory_Name = SubCategoryName;
                    SubCat.Category_ID = CategoryID;
                    SubCat.IsDeleted = IsDelete;
                    SubCat.Image = null;
                    SubCat.ImageName = ImageName;
                    SubCat.Heading = Heading;
                    SubCat.Description = Description;
                    SubCat.Page_Image = null;
                    SubCat.Page_Image_Name = Page_Image_Name;
                    context.SaveChanges();
                }
                if (ImageFile != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/SubCategoryImage/{0}", ImageName));
                    File.WriteAllBytes(filePath, ImageFile);
                }
                if (PageImage != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/SubCategoryHeaderImage/{0}", Page_Image_Name));
                    File.WriteAllBytes(filePath, PageImage);
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
        public static string ShowOnHomePage(bool IsShowHomePage, int SubCategoryID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                if (IsShowHomePage == true)
                {
                    var AllSubCategoory = context.SubCategory_Master.Where(x => x.IsHomePage == true).ToList();
                    if (AllSubCategoory.Count <= 12)
                    {
                        var Data = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                        if (Data != null)
                        {
                            Data.IsHomePage = IsShowHomePage;
                            context.SaveChanges();
                        }
                        var status = "success";
                        return JsonConvert.SerializeObject(status);
                    }
                    else
                    {
                        var status = "Limit for only 12 image show on home page";
                        return JsonConvert.SerializeObject(status);
                    }
                }
                else
                {
                    var Data = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                    if (Data != null)
                    {
                        Data.IsHomePage = IsShowHomePage;
                        context.SaveChanges();
                    }
                    var status = "This category remove on to the home page";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string DeleteSubCategorys(int SubCategoryID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var SubCat = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                if (SubCat != null)
                {
                    context.SubCategory_Master.Remove(SubCat);
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
        public static string SortableChange(int Soratable, int SubCategoryID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var get_sub_cat_byID = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                var all_subcar_without_one = context.SubCategory_Master.Where(x => x.SubCategory_ID != SubCategoryID).OrderBy(x => x.Sortable).ToList();
                int sort = 2;
                get_sub_cat_byID.Sortable = 1;
                context.SaveChanges();
                foreach (var i in all_subcar_without_one)
                {
                    i.Sortable = sort++;
                    context.SaveChanges();
                }
                //var Cat = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).SingleOrDefault();
                //var MaxSort = context.SubCategory_Master.Max(x => x.Sortable);
                //var change_cat = context.SubCategory_Master.Where(x => x.Sortable == MaxSort).SingleOrDefault();
                //Cat.Sortable = change_cat.Sortable;
                //change_cat.Sortable = Soratable;
                //context.SaveChanges();
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
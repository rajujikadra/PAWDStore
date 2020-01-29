using Newtonsoft.Json;
using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.Admin.Pages
{
    public partial class ThirdCategory : System.Web.UI.Page
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
        public static string GetAllThirdCat()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.ThirdCategory_Master.Select(x => new { x.SubCategory_ID, x.ThirdCategory_ID, x.ThirdCategory_Name, x.SubCategory_Master.SubCategory_Name, x.SubCategory_Master.Category_Master.Menu_ID, x.SubCategory_Master.Category_Master.MainMenu_Master.Menu_Name }).ToList();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string FilterThirdCategory(int SubCatID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                if (SubCatID != 0)
                {
                    var status = context.ThirdCategory_Master.Where(t => t.SubCategory_ID == SubCatID).Select(x => new { x.SubCategory_ID, x.ThirdCategory_ID, x.ThirdCategory_Name, x.SubCategory_Master.SubCategory_Name, x.SubCategory_Master.Category_Master.Menu_ID, x.SubCategory_Master.Category_Master.MainMenu_Master.Menu_Name }).ToList();
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = context.ThirdCategory_Master.Select(x => new { x.SubCategory_ID, x.ThirdCategory_ID, x.ThirdCategory_Name, x.SubCategory_Master.SubCategory_Name, x.SubCategory_Master.Category_Master.Menu_ID, x.SubCategory_Master.Category_Master.MainMenu_Master.Menu_Name }).ToList();
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetThirdCategoryByID(int ThirdCategoryID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.ThirdCategory_Master.Where(y => y.ThirdCategory_ID == ThirdCategoryID).Select(x => new { x.SubCategory_ID, x.ThirdCategory_ID, x.ThirdCategory_Name, x.SubCategory_Master.SubCategory_Name, x.SubCategory_Master.Category_Master.Menu_ID, x.SubCategory_Master.Category_Master.MainMenu_Master.Menu_Name }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string DeleteThirdCategory(int ThirdCatID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.ThirdCategory_Master.Where(y => y.ThirdCategory_ID == ThirdCatID).SingleOrDefault();
                if (status != null)
                {
                    var Product = context.Product_Master.Where(x => x.ThirdCategory_ID == ThirdCatID).ToList();
                    if (Product.Count() > 0)
                    {
                        foreach (var P in Product)
                        {
                            var imapge = context.Product_Image_Master.Where(x => x.Product_ID == P.Product_ID).ToList();
                            if (imapge.Count() > 0)
                            {
                                context.Product_Image_Master.RemoveRange(imapge);
                                context.SaveChanges();
                            }
                            var P_CK = context.Product_CK_Master.Where(x => x.Product_ID == P.Product_ID).ToList();
                            if (P_CK.Count() > 0)
                            {

                                context.Product_CK_Master.RemoveRange(P_CK);
                                context.SaveChanges();
                            }
                            var Specification = context.Product_Specification_Master.Where(x => x.Product_ID == P.Product_ID).ToList();
                            if (Specification.Count() > 0)
                            {
                                context.Product_Specification_Master.RemoveRange(Specification);
                                context.SaveChanges();
                            }
                            var S_Grp = context.Specification_Group_Master.Where(x => x.Product_ID == P.Product_ID).ToList();
                            if (S_Grp.Count() > 0)
                            {
                                context.Specification_Group_Master.RemoveRange(S_Grp);
                                context.SaveChanges();
                            }
                            context.Product_Master.Remove(P);
                            context.SaveChanges();
                        }
                    }
                    context.ThirdCategory_Master.Remove(status);
                    context.SaveChanges();
                }
                var status1 = "success";
                return JsonConvert.SerializeObject(status1);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string AddThirdCategory(string ThirdCategoryName, int SubCatID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.ThirdCategoryInsert(SubCatID, ThirdCategoryName).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string EditThirdCategory(int ThirdCatID, string ThirdCategoryName, int SubCatID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.ThirdCategoryUpdate(ThirdCatID, SubCatID, ThirdCategoryName).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }



        [WebMethod]
        public static string GetAllSubCat()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.SubCategory_Master.Where(x => x.IsDeleted == false).Select(y => new { y.SubCategory_ID, y.SubCategory_Name, y.Category_Master.Menu_ID, y.Category_Master.MainMenu_Master.Menu_Name }).ToList();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }
        }
    }
}
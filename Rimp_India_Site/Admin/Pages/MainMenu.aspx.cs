using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rimp_India_Site.Models;
using Newtonsoft.Json;

namespace Rimp_India_Site.Admin.Pages
{
    public partial class MainMenu : System.Web.UI.Page
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
        public static string AddMenu(string MenuName, bool IsDelete)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.MainMenuInsert(MenuName, IsDelete).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetAllMenu()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.MainMenu_Master.Where(x => x.IsDeleted == false).Select(x => new { x.Menu_ID, x.Menu_Name, x.IsDeleted }).ToList();
                return JsonConvert.SerializeObject(status.OrderByDescending(x=>x.Menu_ID));
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetMenuByID(int MenuID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.MainMenu_Master.Where(x => x.Menu_ID == MenuID).Select(y => new { y.Menu_ID, y.Menu_Name, y.IsDeleted }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string EditMenu(int MenuID, string MenuName, bool IsDelete)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var OldMenu = context.MainMenu_Master.Where(x => x.Menu_ID == MenuID).SingleOrDefault();
                if (OldMenu != null)
                {
                    OldMenu.Menu_Name = MenuName;
                    OldMenu.IsDeleted = IsDelete;
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
        public static string DeleteMenuByID(int MenuID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var Menu = context.MainMenu_Master.Where(x => x.Menu_ID == MenuID).SingleOrDefault();
                if (Menu != null)
                {
                    var category = context.Category_Master.Where(x => x.Menu_ID == Menu.Menu_ID).ToList();
                    foreach (var cat in category)
                    {
                        var SubCategory = context.SubCategory_Master.Where(x => x.Category_ID == cat.Category_ID).ToList();
                        foreach (var SubCat in SubCategory)
                        {
                            context.SubCategory_Master.Remove(SubCat);
                            context.SaveChanges();
                        }
                        context.Category_Master.Remove(cat);
                        context.SaveChanges();
                    }
                    context.MainMenu_Master.Remove(Menu);
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
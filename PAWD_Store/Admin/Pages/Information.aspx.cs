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
    public partial class Information : System.Web.UI.Page
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
        public static string GetInformation()
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Information_Master.Select(x => new { x.Information_ID, x.Title, x.CreatedDate, x.Description }).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string AddInformation(string Title, string Description)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                Information_Master obj = new Information_Master();
                obj.Title = Title;
                obj.Description = Description;
                obj.CreatedDate = DateTime.Now;
                context.Information_Master.Add(obj);
                context.SaveChanges();
                var status = "success";
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetInfoByID(int Info_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Information_Master.Where(x => x.Information_ID == Info_ID).Select(y => new
                {
                    y.Information_ID,
                    y.Title,
                    y.CreatedDate,
                    y.Description
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateInformation(int Info_ID, string Title, string Description)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Information_Master.Where(x => x.Information_ID == Info_ID).SingleOrDefault();
                if (data != null)
                {
                    data.Title = Title;
                    data.Description = Description;
                    data.CreatedDate = DateTime.Now;
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
        public static string DeleteInfo(int Info_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Information_Master.Where(x => x.Information_ID == Info_ID).SingleOrDefault();
                if (data != null)
                {
                    context.Information_Master.Remove(data);
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
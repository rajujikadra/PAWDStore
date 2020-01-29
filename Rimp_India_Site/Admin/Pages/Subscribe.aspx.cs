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
    public partial class Subscribe : System.Web.UI.Page
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
        public static string get_all_subscriber()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var all_email = context.Subscribe_Master.Where(r => r.IsDeleted == false).Select(x => new { x.EmailID, x.Subscribe_ID }).OrderByDescending(y => y.Subscribe_ID).ToList();
                return JsonConvert.SerializeObject(all_email);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetEmailByID(int SubscriberID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Subscribe_Master.Where(x => x.Subscribe_ID == SubscriberID).Select(y => new
                {
                    y.EmailID,
                    y.Email_Group_ID,
                    y.Subscribe_ID
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string UpdateEmail(int SubscriberID, string Email)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Subscribe_Master.Where(x => x.Subscribe_ID == SubscriberID).SingleOrDefault();
                if (data != null)
                {
                    data.EmailID = Email;
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "not found";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string DeleteEmail(int SubscriberID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Subscribe_Master.Where(x => x.Subscribe_ID == SubscriberID).SingleOrDefault();
                if (data != null)
                {
                    data.IsDeleted = true;
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "not found";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
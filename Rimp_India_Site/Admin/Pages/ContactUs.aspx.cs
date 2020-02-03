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
    public partial class ContactUs : System.Web.UI.Page
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
        public static string GetAlllContacts()
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var contacts = context.ContactUS_Master.Select(x => new ContactViewModel()
            {
                Address = x.Address,
                Contact_ID = x.Contact_ID,
                Email = x.Email,
                Message = x.Message,
                Mobile = x.Mobile,
                Name = x.Name,
                Subject = x.Subject,
                CreatedDate = x.CreatedDate
            }).ToList();
            return JsonConvert.SerializeObject(contacts);
        }
        [WebMethod]
        public static string ViewContactDetails(int Contact_ID)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var C = context.ContactUS_Master.Where(x => x.Contact_ID == Contact_ID).Select(y => new ContactViewModel()
            {
                Contact_ID = y.Contact_ID,
                Address = y.Address,
                CreatedDate = y.CreatedDate,
                Email = y.Email,
                Message = y.Message,
                Mobile = y.Mobile,
                Name = y.Name,
                Subject = y.Subject
            }).FirstOrDefault();
            return JsonConvert.SerializeObject(C);
        }
    }
}
using Newtonsoft.Json;
using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store.Admin.Pages
{
    public partial class SendEmail : System.Web.UI.Page
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
        public static string GetAll_EmailGroup()
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Email_Group_Master.Select(x => new
                {
                    x.Email_Group_ID,
                    x.Email_Group_Name
                }).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }



    }
}
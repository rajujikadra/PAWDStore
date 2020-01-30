using Newtonsoft.Json;
using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.WebPages
{
    public partial class MyProfile : System.Web.UI.Page
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
        public static string GetUserDetails()
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var SessionUser = HttpContext.Current.Session["User"] as AdminLoginMaster;
            var user = context.AdminLoginMasters.Where(x => x.User_ID == SessionUser.User_ID).Select(y => new UserDetailsViewModel()
            {
                UserID = y.User_ID,
                UserName = y.UserName,
                EmailID = y.EmailID,
                FirstName = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).FirstName,
                LastName = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).LastName,
                 Website = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).WebSite,
                ProfileImage = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).ProfilePhoto,
                Bio = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).Bio,
                FullName = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).FirstName +  " " + y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).LastName,
                JoinDate = y.JoinDate
            }).FirstOrDefault();
            return JsonConvert.SerializeObject(user);
        }
    }
}
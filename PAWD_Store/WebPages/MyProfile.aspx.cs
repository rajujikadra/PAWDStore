using Newtonsoft.Json;
using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store.WebPages
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            if (Session["User"] == null)
            {
                Response.RedirectToRoute("home", null);

            }
        }
        [WebMethod]
        public static string GetUserDetails()
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
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
                FullName = y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).FirstName + " " + y.UserDetails_Master.FirstOrDefault(x => x.User_Id == y.User_ID).LastName,
                JoinDate = y.JoinDate
            }).FirstOrDefault();
            return JsonConvert.SerializeObject(user);
        }
        [WebMethod]
        public static string AddUserDetails(string FirstName, string LastName, string Website, string ProfileImage, string Bio, string Image_binary)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var user = HttpContext.Current.Session["User"] as AdminLoginMaster;
                var IsThereUser = context.UserDetails_Master.FirstOrDefault(x => x.User_Id == user.User_ID);
                byte[] ImageFile = null;
                if (Image_binary != null && !string.IsNullOrEmpty(Image_binary))
                {
                    ImageFile = Convert.FromBase64String(Image_binary);
                }
                if (ImageFile != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/ProfileImage/" + ProfileImage + ""));
                    File.WriteAllBytes(filePath, ImageFile);
                }
                if (IsThereUser != null)
                {
                    IsThereUser.FirstName = FirstName;
                    IsThereUser.LastName = LastName;
                    IsThereUser.WebSite = Website;
                    IsThereUser.Bio = Bio;
                    IsThereUser.ProfilePhoto = ProfileImage;
                    context.SaveChanges();
                }
                else
                {
                    var U = new UserDetails_Master
                    {
                        FirstName = FirstName,
                        LastName = LastName,
                        Bio = Bio,
                        ProfilePhoto = ProfileImage,
                        WebSite = Website,
                        User_Id = user.User_ID
                    };
                    context.UserDetails_Master.Add(U);
                    context.SaveChanges();
                }
                return JsonConvert.SerializeObject("success");
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject("fail");
            }
        }
    }
}
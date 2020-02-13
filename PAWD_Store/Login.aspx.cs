using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store
{
    public partial class Login : System.Web.UI.Page
    {
        PAWDStoreEntities context = new PAWDStoreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginMessage.Visible = false;
            if (Session["User"] != null)
                Response.RedirectToRoute("home");
        }
        protected void LogIn(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Email.Text) && !string.IsNullOrEmpty(Password.Text))
            {
                var User = context.AdminLoginMasters.FirstOrDefault(x => x.EmailID.ToLower().Trim().Equals(Email.Text.ToLower().Trim()));
                if (User != null)
                {
                    if (User.Password.Equals(Password.Text))
                    {
                        Session["User"] = User;
                        Session["UserName"] = User.UserName;
                        Session["IsAdmin"] = User.IsAdmin;
                        Response.RedirectToRoute("home");
                    }
                    else
                    {
                        LoginMessage.Text = "Error: invalid password.";
                        LoginMessage.Visible = true;
                    }
                }
                else
                {
                    LoginMessage.Text = "Error: Invalid email or password.";
                    LoginMessage.Visible = true;
                }
            }
        }
    }
}
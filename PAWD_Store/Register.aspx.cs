using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store
{
    public partial class Register : System.Web.UI.Page
    {
        PAWDStoreEntities context = new PAWDStoreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmailAlreadyMessage.Visible = false;
            if (Session["User"] != null)
                Response.RedirectToRoute("home");
        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Email.Text) && !string.IsNullOrEmpty(Password.Text) && !string.IsNullOrEmpty(ConfirmPassword.Text) && !string.IsNullOrEmpty(Name.Text))
            {
                bool IsEmailAlreadyUsed = context.AdminLoginMasters.Any(x => x.EmailID.Trim().ToLower().Equals(Email.Text.ToLower().Trim()));
                if (Password.Text.Equals(ConfirmPassword.Text))
                {
                    if (!IsEmailAlreadyUsed)
                    {
                        var obj = new AdminLoginMaster()
                        {
                            EmailID = Email.Text.Trim(),
                            IsAdmin = false,
                            Password = Password.Text,
                            UserName = Name.Text.Trim(),
                            JoinDate = DateTime.Now
                        };
                        context.AdminLoginMasters.Add(obj);
                        context.SaveChanges();
                        Response.RedirectToRoute("login");
                    }
                    else
                    {
                        EmailAlreadyMessage.Visible = true;
                        EmailAlreadyMessage.Text = Email.Text + " email is already taken";
                    }
                }
            }
        }
    }
}
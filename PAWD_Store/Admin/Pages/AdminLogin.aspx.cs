﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PAWD_Store.Models;

namespace PAWD_Store.Admin.Pages
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        PAWDStoreEntities context = new PAWDStoreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            errorMessage.Visible = false;

            if (Session["User"] == null)
            {
                Response.RedirectToRoute("home", null);
            }
            var user = Session["User"] as AdminLoginMaster;
            bool IsAdmin = context.AdminLoginMasters.Any(x => x.IsAdmin == true && x.EmailID == user.EmailID);
            if (!IsAdmin)
            {
                Response.RedirectToRoute("home", null);
            }
        }
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var Admin = context.AdminLoginMasters.Where(x => x.EmailID == txtEmail.Text).FirstOrDefault();
                if (Admin != null)
                {
                    if (Admin.Password == txtPassword.Text)
                    {
                        Session["UserName"] = Admin.UserName;
                        Session["Email"] = Admin.EmailID;
                        Session["UserID"] = Admin.User_ID;
                        Response.RedirectToRoute("Dashboard", null);
                    }
                    else
                    {
                        errorLabel.Text = "Error: Invalid Password.";
                        errorMessage.Visible = true;
                    }
                }
                else
                {
                    errorLabel.Text = "Error: Invalid Email or Password.";
                    errorMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
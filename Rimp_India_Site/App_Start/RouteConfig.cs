using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Rimp_India_Site
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Off;
            routes.EnableFriendlyUrls(settings);
            try
            {
                //Client Side Route
                routes.MapPageRoute("home", "home", "~/Default.aspx");
                routes.MapPageRoute("product", "product/{*ID}", "~/WebPages/ProductPage.aspx");
                routes.MapPageRoute("contact", "contact", "~/WebPages/ContactUs.aspx");
                routes.MapPageRoute("product_list", "product_list/{*ID}", "~/WebPages/ProductList.aspx");
                routes.MapPageRoute("product_list_all_category", "product_Category", "~/WebPages/ProductAllCategoryList.aspx");
                routes.MapPageRoute("aboutus", "aboutus", "~/WebPages/AboutUs.aspx");
                routes.MapPageRoute("latest_information", "latest_information", "~/WebPages/Latest_Information.aspx");
                routes.MapPageRoute("Latest_Update", "Latest_Update/{*ID}", "~/WebPages/LatestUpdate.aspx");
                routes.MapPageRoute("Login", "Login", "~/Login.aspx");
                routes.MapPageRoute("Register", "Register", "~/Register.aspx");
                routes.MapPageRoute("error", "404-PageNotFound", "~/Error.aspx");
                routes.MapPageRoute("cart", "cart", "~/WebPages/Cart.aspx");
                routes.MapPageRoute("profile", "profile", "~/WebPages/MyProfile.aspx");

                //Admin Side Route
                routes.MapPageRoute("AdminLogin", "adminlogin", "~/Admin/Pages/AdminLogin.aspx");
                routes.MapPageRoute("Dashboard", "dashboard", "~/Admin/Pages/AdminDashboard.aspx");
                routes.MapPageRoute("MainMenu", "menu", "~/Admin/Pages/MainMenu.aspx");
                routes.MapPageRoute("Category", "category", "~/Admin/Pages/Category.aspx");
                routes.MapPageRoute("SubCategory", "sub_category", "~/Admin/Pages/SubCategory.aspx");
                routes.MapPageRoute("third_category", "third_category", "~/Admin/Pages/ThirdCategory.aspx");
                routes.MapPageRoute("product_add", "product_adding", "~/Admin/Pages/Product.aspx");
                routes.MapPageRoute("product_images", "product_images/{*ID}", "~/Admin/Pages/ProductImages.aspx");
                routes.MapPageRoute("product_editor", "product_editor/{*ID}", "~/Admin/Pages/Product_CK_Editor.aspx");
                routes.MapPageRoute("product_specification", "product_specification/{*ID}", "~/Admin/Pages/Product_Specification.aspx");
                routes.MapPageRoute("product_specification_group", "product_specification_group/{*ID}", "~/Admin/Pages/Specification_group.aspx");
                routes.MapPageRoute("subscriber_list", "subscriber_list", "~/Admin/Pages/subscribe.aspx");
                routes.MapPageRoute("Information", "Information", "~/Admin/Pages/Information.aspx");
                routes.MapPageRoute("sendemail", "sendemail", "~/Admin/Pages/SendEmail.aspx");
                routes.MapPageRoute("contact", "contact", "~/Admin/Pages/ContactUs.aspx");

                //contact
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}

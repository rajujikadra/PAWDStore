﻿using Newtonsoft.Json;
using Rimp_India_Site.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.WebPages
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            if (Session["User"] == null)
            {
                Response.RedirectToRoute("home", null);
            }
        }
        [WebMethod]
        public static string PlaceOrder(OrderViewModel model)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
                Random generator = new Random();
                string Order_NO = generator.Next(0, 999999).ToString("D6");

                if (model.User_Address_ID == 0)
                {
                    var address = new User_Address_Master
                    {
                        BName = model.BName,
                        BAddress = model.BAddress,
                        BCity = model.BCity,
                        BEmail = model.BEmail,
                        BMobile = model.BMobile,
                        BState = model.BState,
                        BZipcode = model.BZipcode,
                        CreatedDate = DateTime.Now,
                        SName = !string.IsNullOrEmpty(model.SName) ? model.SName : model.BName,
                        SCity = !string.IsNullOrEmpty(model.SCity) ? model.SCity : model.BCity,
                        SAddress = !string.IsNullOrEmpty(model.SAddress) ? model.SAddress : model.BAddress,
                        SEmail = !string.IsNullOrEmpty(model.SEmail) ? model.SEmail : model.BEmail,
                        SMobile = !string.IsNullOrEmpty(model.SMobile) ? model.SMobile : model.BMobile,
                        SState = !string.IsNullOrEmpty(model.SState) ? model.SState : model.BState,
                        SZipcode = !string.IsNullOrEmpty(model.SZipcode) ? model.SZipcode : model.BZipcode,
                        User_ID = UserID
                    };
                    context.User_Address_Master.Add(address);
                    context.SaveChanges();
                    model.User_Address_ID = address.User_Address_ID;
                }
                var obj = new Order_Master
                {
                    Order_No = Order_NO,
                    Order_Status = "Processing",
                    Order_Type = model.paymentMethod,
                    CreatedDate = DateTime.Now,
                    User_Address_ID = model.User_Address_ID,
                    User_ID = UserID
                };
                context.Order_Master.Add(obj);
                context.SaveChanges();

                var CartItem = context.Cart_Master.Where(x => x.User_ID == UserID).ToList();
                var Items = CartItem.Select(x => new Order_Item_Master()
                {
                    Order_ID = obj.Order_ID,
                    Quantity = x.Quantity,
                    Price = x.Product_Master.Product_Price,
                    Size = x.Size,
                    Product_ID = x.Product_ID
                }).ToList();
                context.Order_Item_Master.AddRange(Items);
                context.Cart_Master.RemoveRange(CartItem);
                context.SaveChanges();

                return JsonConvert.SerializeObject(obj.Order_ID);
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(0);
            }
        }

        [WebMethod]
        public static string GetAllAddress()
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            int UserID = (HttpContext.Current.Session["User"] as AdminLoginMaster).User_ID;
            var data = context.User_Address_Master.Where(x => x.User_ID == UserID).Select(y => new OrderViewModel()
            {
                BName = y.BName,
                BEmail = y.BEmail,
                BAddress = y.BAddress,
                BMobile = y.BMobile,
                User_Address_ID = y.User_Address_ID
            }).ToList();
            return JsonConvert.SerializeObject(data);
        }
        [WebMethod]
        public static string GetAddressByID(int User_Address_ID)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var address = context.User_Address_Master.Where(x => x.User_Address_ID == User_Address_ID).Select(x => new OrderItemsViewModel()
            {
                BName = x.BName,
                BAddress = x.BAddress,
                BCity = x.BCity,
                BEmail = x.BEmail,
                BMobile = x.BMobile,
                BState = x.BState,
                BZipcode = x.BZipcode,
                SName = x.SName,
                SCity = x.SCity,
                SAddress = x.SAddress,
                SEmail = x.SEmail,
                SMobile = x.SMobile,
                SState = x.SState,
                SZipcode = x.SZipcode,
                User_Address_ID = x.User_Address_ID                
            }).FirstOrDefault();
            return JsonConvert.SerializeObject(address);
        }

        public void SendConfirmationMail()
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"]);
            message.To.Add(new MailAddress("ToMailAddress"));
            message.Subject = "Test";
            message.IsBodyHtml = true; //to make message body as html  
            message.Body = "<p>Hello</p>";
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com"; //for gmail host  
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["FromEmail"], ConfigurationManager.AppSettings["Password"]);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);
        }
    }
}
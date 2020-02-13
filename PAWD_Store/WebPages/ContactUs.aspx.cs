using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using PAWD_Store.Models;
namespace PAWD_Store.WebPages
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string AddContact(string Name, string Mobile, string Address, string Email, string Subject, string Message)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var obj = new ContactUS_Master
                {
                    Name = Name,
                    Address = Address,
                    Email = Email,
                    Message = Message,
                    Mobile = Mobile,
                    Subject = Subject,
                    CreatedDate = DateTime.Now
                };
                context.ContactUS_Master.Add(obj);
                context.SaveChanges();
                return null;
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
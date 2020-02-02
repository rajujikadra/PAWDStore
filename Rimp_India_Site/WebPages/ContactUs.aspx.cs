using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rimp_India_Site.Models;
namespace Rimp_India_Site.WebPages
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
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var obj = new ContactUS_Master
                {
                    Name = Name,
                    Address = Address,
                    Email = Email,
                    Message = Message,
                    Mobile = Mobile,
                    Subject = Subject
                };
                context.ContactUS_Master.Add(obj);
                context.SaveChanges();
                //MailMessage msg = new MailMessage();
                //msg.To.Add("To Email Address");
                //MailAddress address = new MailAddress("From Email Address");
                //msg.From = address;
                //msg.Subject = Subject;
                //msg.Body = "<img height='100' src=\"http://www.rimpindia.com/img/Image/rimp-logo.png\" ><br/><br/><br/><table border='1'><thead><tr><th>Name</th><th>Address</th><th>Email</th><th>Mobile</th><th>Message</th></tr></thead><tbody><tr><td>" + Name + "</td><td>" + Address + "</td><td>" + Email + "</td><td>" + Mobile + "</td><td>" + Message + "</td></tr></tbody></table>";

                //SmtpClient client = new SmtpClient();
                //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client.EnableSsl = false;
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;

                //NetworkCredential credentials = new NetworkCredential("From Email Address", "Password");
                //client.UseDefaultCredentials = true;
                //client.Credentials = credentials;

                //client.Send(msg);

                return null;
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
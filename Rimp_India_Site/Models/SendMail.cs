using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Rimp_India_Site.Models
{
    public static class SendMail
    {
        public static void SendConfirmationMail(OrderViewModel model, Order_Master Order, List<Order_Item_Master> O_Items)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/OrderConfimationEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{FullName}", model.BName);
            body = body.Replace("{OrderNo}", Order.Order_No);
            body = body.Replace("{BName}", model.BName);
            body = body.Replace("{BEmail}", model.BEmail);
            body = body.Replace("{Bmobile}", model.BMobile);
            body = body.Replace("{BAddress}", model.BAddress);
            body = body.Replace("{BCity}", model.BCity);
            body = body.Replace("{BCity}", model.BCity);
            body = body.Replace("{BState}", model.BCity);
            body = body.Replace("{BZipcode}", model.BCity);

            body = body.Replace("{SName}", model.SName);
            body = body.Replace("{SEmail}", model.SEmail);
            body = body.Replace("{SMobile}", model.SMobile);
            body = body.Replace("{SAddress}", model.SAddress);
            body = body.Replace("{SCity}", model.SCity);
            body = body.Replace("{SState}", model.SState);
            body = body.Replace("{SZipcode}", model.SZipcode);

            string O_str = string.Empty;
            decimal? SubTotal = 0;
            int Tax = 0;
            int Shipping = 0;
            foreach (var o in O_Items)
            {
                O_str += "<tr>";
                O_str += "<td width='50%' style='color:#333;padding:15px;font-size:18px;font-weight: bold; background-color:#e9e9ea;'>" + o.Product_Master.Product_Title;
                if (!string.IsNullOrEmpty(o.Size))
                {
                    O_str += "<br /><p>Size : " + o.Size + "</p>";
                }
                O_str += "</td>";
                O_str += "<td width='10%' style='padding: 15px; font-size:18px;'>" + o.Quantity + "</td>";
                O_str += "<td width='20%' style='padding:15px;font-size:18px;'>₹ " + String.Format("{0:n}", o.Price) + "</td>";
                O_str += "<td width='20%' style='padding: 15px;font-size:18px;'>₹ " + String.Format("{0:n}", (o.Quantity * o.Price)) + "</td>";
                O_str += "</tr>";
                SubTotal = SubTotal + (o.Quantity * o.Price);
            }
            if (SubTotal < 1000 && SubTotal > 0)
                Tax = 30;
            else if (SubTotal < 5000 && SubTotal > 1001)
                Tax = 35;
            else if (SubTotal < 10000 && SubTotal > 5001)
                Tax = 40;
            else
                Tax = 50;

            if (SubTotal < 1000 && SubTotal > 0)
                Shipping = 35;
            else if (SubTotal < 5000 && SubTotal > 1001)
                Shipping = 40;
            else if (SubTotal < 10000 && SubTotal > 5001)
                Shipping = 45;
            else
                Shipping = 50;
            O_str += "<tr>";
            O_str += "<td colspan='2'></td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;font-weight:bold;background-color:#e9e9ea;'>Tax</td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;'>₹ " + String.Format("{0:n}", Tax) + "</td>";
            O_str += "</tr>";

            O_str += "<tr>";
            O_str += "<td colspan='2'></td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;font-weight:bold;background-color:#e9e9ea;'>Shipping Charge</td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;'>₹ " + String.Format("{0:n}", Shipping) + "</td>";
            O_str += "</tr>";

            decimal? GrandTotal = (SubTotal + Tax + Shipping);
            O_str += "<tr>";
            O_str += "<td colspan='2'></td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;font-weight:bold;background-color:#e9e9ea;'>Grand Total</td>";
            O_str += "<td width='20%' style='padding:15px;font-size:18px;'>₹ " + String.Format("{0:n}", GrandTotal) + "</td>";
            O_str += "</tr>";

            body = body.Replace("{OrderItems}", O_str);

            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"]);
                mailMessage.Subject = "PAWD Order Confirmation";
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(model.BEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["FromEmail"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = NetworkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
            //MailMessage message = new MailMessage();
            //SmtpClient smtp = new SmtpClient();
            //message.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"]);
            //message.To.Add(new MailAddress(model.BEmail));
            //message.Subject = "Test";
            //message.IsBodyHtml = true; //to make message body as html  
            //message.Body = body;
            //smtp.Port = 587;
            //smtp.Host = "smtp.gmail.com"; //for gmail host  
            //smtp.EnableSsl = true;
            //smtp.UseDefaultCredentials = false;
            //smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["FromEmail"], ConfigurationManager.AppSettings["Password"]);
            //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtp.Send(message);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rimp_India_Site.Models;
using System.Web.Script.Serialization;
using System.Web.Services;
using Newtonsoft.Json;
using System.IO;
using System.Web.Hosting;

namespace Rimp_India_Site.Admin.Pages
{
    public partial class ProductImages : System.Web.UI.Page
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
                else
                {
                    int Product_ID = Convert.ToInt32(Request.QueryString["ID"]);
                    var ImageList = context.Product_Image_Master.Where(x => x.Product_ID == Product_ID).Select(y => new
                    {
                        y.Procut_image_ID,
                        y.Product_ID,
                        y.Product_image,
                        y.Image_name,
                        y.Created_date,
                        y.Updated_date,
                        y.Product_Master.Product_Title,
                        y.Product_Master.Product_short_description,
                        y.Product_Master.Product_long_description,
                        y.Product_Master.Category_ID,
                        y.Product_Master.SubCategory_ID,
                        y.Product_Master.ThirdCategory_ID,
                        y.Product_Master.Product_Price
                    }).ToList();
                    var jsonSerialiser = new JavaScriptSerializer();
                    jsonSerialiser.MaxJsonLength = int.MaxValue;
                    var Data = jsonSerialiser.Serialize(ImageList);
                    var PID = jsonSerialiser.Serialize(Product_ID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ProductImage", "get_all_product_image_by_PID(" + Data + ", " + PID + ");", true);
                }
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }
        [WebMethod]
        public static string AddProductsImg(int PID, string Image_binary, string Image_name)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                byte[] ImageFile = null;
                if (Image_binary != null && !string.IsNullOrEmpty(Image_binary))
                {
                    ImageFile = Convert.FromBase64String(Image_binary);
                }
                if (ImageFile != null)
                {
                    string filePath = HttpContext.Current.Server.MapPath(string.Format("~/ProductImage/" + Image_name + ""));
                    File.WriteAllBytes(filePath, ImageFile);
                }
                var status = context.ProductImageInsert(PID, null, Image_name, DateTime.Now, null, string.Empty).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateProductsImg(int Image_ID, int PID, string Image_binary, string Image_name)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Product_Image_Master.Where(x => x.Procut_image_ID == Image_ID).SingleOrDefault();
                if (data != null)
                {
                    byte[] ImageFile = null;
                    if (Image_binary != null)
                    {
                        ImageFile = Convert.FromBase64String(Image_binary);
                    }
                    data.Product_ID = PID;
                    data.Image_name = Image_name;
                    data.Product_image = null;
                    data.Updated_date = DateTime.Now;
                    context.SaveChanges();
                    if (ImageFile != null)
                    {
                        string filePath = HttpContext.Current.Server.MapPath(string.Format("~/ProductImage/{0}", Image_name));
                        File.WriteAllBytes(filePath, ImageFile);
                    }
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "No Record Found";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string GetProductImageByID(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var ImageList = context.Product_Image_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Procut_image_ID,
                    y.Product_ID,
                    y.Product_image,
                    y.Image_name,
                    y.Created_date,
                    y.Updated_date,
                    y.Product_Master.Product_Title,
                    y.Product_Master.Product_short_description,
                    y.Product_Master.Product_long_description,
                    y.Product_Master.Category_ID,
                    y.Product_Master.SubCategory_ID,
                    y.Product_Master.ThirdCategory_ID,
                    y.Product_Master.Product_Price
                }).ToList();
                return JsonConvert.SerializeObject(ImageList);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string DeleteProductImage(int P_img_id)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Product_Image_Master.Where(x => x.Procut_image_ID == P_img_id).SingleOrDefault();
                if (data != null)
                {
                    context.Product_Image_Master.Remove(data);
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "No Record Found";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetImageByID(int P_img_id)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Product_Image_Master.Where(x => x.Procut_image_ID == P_img_id).Select(y => new
                {
                    y.Procut_image_ID,
                    y.Product_ID,
                    y.Product_image,
                    y.Image_name,
                    y.Created_date,
                    y.Updated_date,
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetProduct_by_PID(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var single_product = context.Product_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Product_Title,
                    y.Product_short_description,
                    y.Product_long_description
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(single_product);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
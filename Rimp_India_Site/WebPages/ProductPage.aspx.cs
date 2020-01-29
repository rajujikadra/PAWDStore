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

namespace Rimp_India_Site.WebPages
{
    public partial class ProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            int PID = Convert.ToInt32(Request.QueryString["ID"]);
            var GetProduct = context.Product_Master.Where(x => x.Product_ID == PID).Select(y => new
            {
                y.Product_ID,
                y.Product_short_description,
                y.Product_long_description,
                y.Product_Price,
                y.Category_ID,
                y.Category_Master.Category_Name,
                y.SubCategory_ID,
                y.SubCategory_Master.SubCategory_Name,
                y.ThirdCategory_ID,
                y.ThirdCategory_Master.ThirdCategory_Name,
                y.Created_date,
                y.Updated_date,
                y.Product_Title
            }).SingleOrDefault();
            var jsonSerialiser = new JavaScriptSerializer();
            jsonSerialiser.MaxJsonLength = int.MaxValue;
            var Data = jsonSerialiser.Serialize(GetProduct);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SingleProduct", "Product_data_bind(" + Data + ");", true);
        }
        [WebMethod]
        public static string Get_spec_all_group(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Specification_Group_Master.Where(x => x.Product_ID == PID).Select(y=>new {
                    y.Product_ID,
                    y.Product_Master.Product_Title,
                    y.Specification_GroupID,
                    y.Specification_Group_Name
                }).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetCkEditor(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var All_ck = context.Product_CK_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Product_CK_ID,
                    y.CK_Title,
                    y.Description,
                    y.Product_Master.Product_Title,
                    y.Created_date,
                    y.Updated_date
                }).ToList();
                return JsonConvert.SerializeObject(All_ck);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetSpecification(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var all_specification = context.Product_Specification_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Product_Master.Product_Title,
                    y.Product_Specification_ID,
                    y.Specification_Title,
                    y.Specification_Value,
                    y.Specification_GroupID,
                    y.Specification_Group_Master.Specification_Group_Name
                }).ToList();
                return JsonConvert.SerializeObject(all_specification);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetImages(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var all_images = context.Product_Image_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Procut_image_ID,
                    y.Product_image,
                    y.Image_name,
                    y.Created_date,
                    y.Updated_date
                }).ToList();
                return JsonConvert.SerializeObject(all_images);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
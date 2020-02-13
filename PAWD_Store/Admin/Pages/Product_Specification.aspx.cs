using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.Services;
using Newtonsoft.Json;
using PAWD_Store.Models;

namespace PAWD_Store.Admin.Pages
{
    public partial class Product_Specification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
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
                    string ID = Request.QueryString["ID"];

                    int ProductID = Convert.ToInt32(ID.Split('/')[0]);
                    //int ProductID = Convert.ToInt32(ID.Split('/')[1]);

                    var specification_list = context.Product_Specification_Master.Where(x => x.Product_ID == ProductID).Select(y => new
                    {
                        y.Product_Specification_ID,
                        y.Specification_Title,
                        y.Specification_Value,
                        y.Specification_GroupID,
                        y.Specification_Group_Master.Specification_Group_Name,
                        y.Product_ID,
                        y.Product_Master.Product_Title
                    }).OrderByDescending(f => f.Product_Specification_ID).ToList();
                    var jsonSerialiser = new JavaScriptSerializer();
                    jsonSerialiser.MaxJsonLength = int.MaxValue;
                    var Data = jsonSerialiser.Serialize(specification_list);
                    //var Specification_ID = jsonSerialiser.Serialize(Product_Spec_ID);
                    var PID = jsonSerialiser.Serialize(ProductID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ProductSpecification", "get_all_product_Specification_by_PID(" + Data + "," + PID + ");", true);
                }
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }
        [WebMethod]
        public static string GetProSpecByPID(int Product_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var specification_list = context.Product_Specification_Master.Where(x => x.Product_ID == Product_ID).Select(y => new
                {
                    y.Product_Specification_ID,
                    y.Product_ID,
                    y.Specification_Title,
                    y.Specification_Value,
                    y.CreatedDate,
                    y.UpdatedDate,
                    y.Product_Master.Product_Title,
                    y.Product_Master.Product_Price
                }).ToList();
                return JsonConvert.SerializeObject(specification_list);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string AddProductsSpec(int Speec_grpID, int PID, string Spec_title, string Spec_value)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.Product_specification_insert(null, PID, Spec_title, Spec_value, DateTime.Now, null).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetSpecByID(int Spec_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.Product_Specification_Master.Where(x => x.Product_Specification_ID == Spec_ID).Select(y => new
                {
                    y.Product_Specification_ID,
                    y.Product_ID,
                    y.Specification_Title,
                    y.Specification_Value,
                    y.CreatedDate,
                    y.UpdatedDate,
                    y.Product_Master.Product_Title
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateProductsSpec(int Pro_spec_id, int Speec_grpID, int PID, string Spec_title, string Spec_value)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Product_Specification_Master.Where(x => x.Product_Specification_ID == Pro_spec_id).SingleOrDefault();
                if (data != null)
                {
                    data.Specification_Title = Spec_title;
                    data.Specification_Value = Spec_value;
                    data.UpdatedDate = DateTime.Now;
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
        public static string DeleteProductSpec(int Pro_spec_id)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Product_Specification_Master.Where(x => x.Product_Specification_ID == Pro_spec_id).SingleOrDefault();
                if (data != null)
                {
                    context.Product_Specification_Master.Remove(data);
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
    }
}
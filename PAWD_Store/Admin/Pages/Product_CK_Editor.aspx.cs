using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using PAWD_Store.Models;


namespace PAWD_Store.Admin.Pages
{
    public partial class Product_CK_Editor : System.Web.UI.Page
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
                    int Product_ID = Convert.ToInt32(Request.QueryString["ID"]);
                    var ck_list = context.Product_CK_Master.Where(x => x.Product_ID == Product_ID).Select(y => new
                    {
                        y.Product_ID,
                        y.CK_Title,
                        y.Product_CK_ID,
                        y.Description,
                        y.Product_Master.Product_Title,
                        y.Created_date,
                        y.Updated_date
                    }).ToList();
                    var jsonSerialiser = new JavaScriptSerializer();
                    jsonSerialiser.MaxJsonLength = int.MaxValue;
                    var Data = jsonSerialiser.Serialize(ck_list);
                    var PID = jsonSerialiser.Serialize(Product_ID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ProductCKEditor", "get_all_product_ck_editor_by_PID(" + Data + ", " + PID + ");", true);
                }
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }
        [WebMethod]
        public static string AddProductCK(int PID, string CK_Title, string Description)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var status = context.ProductCKInsert(PID, CK_Title, Description, DateTime.Now, null).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetCKByProID(int PID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var ck_list = context.Product_CK_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.CK_Title,
                    y.Product_CK_ID,
                    y.Description,
                    y.Product_Master.Product_Title,
                    y.Created_date,
                    y.Updated_date
                }).ToList();
                return JsonConvert.SerializeObject(ck_list);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string GetCkbyCkID(int Ck_ID)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Product_CK_Master.Where(x => x.Product_CK_ID == Ck_ID).Select(y => new
                {
                    y.Product_ID,
                    y.CK_Title,
                    y.Product_CK_ID,
                    y.Description,
                    y.Product_Master.Product_Title,
                    y.Created_date,
                    y.Updated_date
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(data);

            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateProductCK(int Ck_ID, int PID, string CK_Title, string Description)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Product_CK_Master.Where(x => x.Product_CK_ID == Ck_ID).SingleOrDefault();
                if (data != null)
                {
                    data.CK_Title = CK_Title;
                    data.Description = Description;
                    data.Updated_date = DateTime.Now;
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);

                }
                else
                {
                    var status = "Record not found";
                    return JsonConvert.SerializeObject(status);

                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string DeleteProductCK(int P_ck_id)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                var data = context.Product_CK_Master.Where(x => x.Product_CK_ID == P_ck_id).SingleOrDefault();
                if (data != null)
                {
                    context.Product_CK_Master.Remove(data);
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "Record not found";
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
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

namespace Rimp_India_Site.Admin.Pages
{
    public partial class Specification_group : System.Web.UI.Page
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
                    var all_spec_group = context.Specification_Group_Master.Where(x => x.Product_ID == Product_ID).Select(y => new
                    {
                        y.Product_ID,
                        y.Product_Master.Product_Title,
                        y.Specification_GroupID,
                        y.Specification_Group_Name
                    }).OrderByDescending(t => t.Specification_GroupID).ToList();
                    var jsonSerialiser = new JavaScriptSerializer();
                    jsonSerialiser.MaxJsonLength = int.MaxValue;
                    var Data = jsonSerialiser.Serialize(all_spec_group);
                    var PID = jsonSerialiser.Serialize(Product_ID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ProductSpecificationGroup", "get_all_product_Specification_group_by_PID(" + Data + ", " + PID + ");", true);
                }
            }
            else
            {
                Response.RedirectToRoute("home", null);
            }
        }

        [WebMethod]
        public static string AddProductsSpecGrp(int PID, string Spec_group)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var status = context.Product_specification_group_insert(PID, Spec_group).SingleOrDefault();
                return JsonConvert.SerializeObject(status);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }

        [WebMethod]
        public static string get_all_SpecGrp(int PID)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var all_spec_group = context.Specification_Group_Master.Where(x => x.Product_ID == PID).Select(y => new
                {
                    y.Product_ID,
                    y.Product_Master.Product_Title,
                    y.Specification_GroupID,
                    y.Specification_Group_Name
                }).ToList();
                return JsonConvert.SerializeObject(all_spec_group);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string get_all_SpecGrp_by_id(int Spec_Grp_Id)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Specification_Group_Master.Where(x => x.Specification_GroupID == Spec_Grp_Id).Select(y => new
                {
                    y.Specification_GroupID,
                    y.Specification_Group_Name,
                    y.Product_ID
                }).SingleOrDefault();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string UpdateProductsSpecGrp(int SID, int PID, string Spec_group)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Specification_Group_Master.Where(x => x.Specification_GroupID == SID).SingleOrDefault();
                if (data != null)
                {
                    data.Specification_Group_Name = Spec_group;
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "Record not foound";
                    return JsonConvert.SerializeObject(status);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        [WebMethod]
        public static string delete_spec_grp(int Spec_Grp_Id)
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Specification_Group_Master.Where(x => x.Specification_GroupID == Spec_Grp_Id).SingleOrDefault();
                if (data != null)
                {
                    context.Specification_Group_Master.Remove(data);
                    context.SaveChanges();
                    var status = "success";
                    return JsonConvert.SerializeObject(status);
                }
                else
                {
                    var status = "Record not found !!!";
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
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

namespace PAWD_Store.WebPages
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            int SubCategoryID = Convert.ToInt32(Request.QueryString["ID"]);
            var ProductList = context.GetAllProductSubCategoryWise(SubCategoryID).ToList();
            List<GetAllProductSubCategoryWise_Result> All_product_data = new List<GetAllProductSubCategoryWise_Result>();
            var header = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).Select(y => new
            {
                y.SubCategory_ID,
                y.Heading,
                y.Description,
                y.Page_Image,
                y.Page_Image_Name
            }).SingleOrDefault();


            var List = context.GetSideBarProductList(SubCategoryID).ToList();
            if (List.Count > 0)
            {
                var jsonSerialiser = new JavaScriptSerializer();
                jsonSerialiser.MaxJsonLength = int.MaxValue;
                var Data = jsonSerialiser.Serialize(List);
                var allProduct = jsonSerialiser.Serialize(ProductList);
                var Heading = jsonSerialiser.Serialize(header);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SideBarProductList", "Product_list_side_bar(" + Data + "," + allProduct + "," + Heading + ");", true);
            }
            else
            {
                var CombineData = context.SubCategory_Master.Where(x => x.SubCategory_ID == SubCategoryID).Select(y => new { y.SubCategory_ID, y.SubCategory_Name, y.Category_ID, y.Category_Master.Category_Name }).SingleOrDefault();
                var jsonSerialiser = new JavaScriptSerializer();
                jsonSerialiser.MaxJsonLength = int.MaxValue;
                var Data = jsonSerialiser.Serialize(CombineData);
                var allProduct = jsonSerialiser.Serialize(ProductList);
                var Heading = jsonSerialiser.Serialize(header);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SideBarProductList", "Product_list_side_bar_only_category(" + Data + "," + allProduct + "," + Heading + ");", true);
            }
        }
        [WebMethod]
        public static string GetProductByThirdCategory(int[] ThirdCategoryID, int Sub_cat_id)
        {
            try
            {
                PAWDStoreEntities context = new PAWDStoreEntities();
                if (ThirdCategoryID.Count() > 0)
                {
                    var result = string.Join(",", ThirdCategoryID);
                    var all_product_third_cat_wise = context.GetAllProductThirdCategoryWise(result).ToList();
                    return JsonConvert.SerializeObject(all_product_third_cat_wise);
                }
                else
                {
                    var all_products = context.GetAllProductSubCategoryWise(Sub_cat_id).ToList();
                    return JsonConvert.SerializeObject(all_products);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rimp_India_Site.Models;
using Newtonsoft.Json;

namespace Rimp_India_Site.WebPages
{
    public partial class ProductAllCategoryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string Getproduct_all_category()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var Product = context.GetProductMenu().FirstOrDefault();
                if(Product != null)
                {
                    var AllData = context.GetProductSubCategory(Product.Menu_ID).ToList();
                    return JsonConvert.SerializeObject(AllData);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
        
        [WebMethod]
        public static string GetThirCat()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.ThirdCategory_Master.Select(x => new
                {
                    x.SubCategory_ID,
                    x.ThirdCategory_ID,
                    x.ThirdCategory_Name,
                    x.SubCategory_Master.SubCategory_Name
                }).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
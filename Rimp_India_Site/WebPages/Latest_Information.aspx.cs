using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Rimp_India_Site.Models;

namespace Rimp_India_Site.WebPages
{
    public partial class Latest_Information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rimp_India_DBEntities context = new Rimp_India_DBEntities();
            var Info  = context.Information_Master.Select(x => new
            {
                x.Description,
                x.Information_ID,
                x.Title
            }).OrderByDescending(r => r.Information_ID).ToList();

            var jsonSerialiser = new JavaScriptSerializer();
            jsonSerialiser.MaxJsonLength = int.MaxValue;
            var Data = jsonSerialiser.Serialize(Info);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Information", "bind_latest_update(" + Data + ");", true);
        }
        [WebMethod]
        public static string GetLatestInfo()
        {
            try
            {
                Rimp_India_DBEntities context = new Rimp_India_DBEntities();
                var data = context.Information_Master.OrderByDescending(x => x.Information_ID).ToList();
                return JsonConvert.SerializeObject(data);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
using PAWD_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWD_Store.WebPages
{
    public partial class LatestUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PAWDStoreEntities context = new PAWDStoreEntities();
            int Information_ID = Convert.ToInt32(Request.QueryString["ID"]);
            var information = context.Information_Master.Where(x => x.Information_ID == Information_ID).SingleOrDefault();
            var jsonSerialiser = new JavaScriptSerializer();
            jsonSerialiser.MaxJsonLength = int.MaxValue;
            var Data = jsonSerialiser.Serialize(information);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Information", "get_single_latest_update(" + Data + ");", true);

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rimp_India_Site.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void logoutlbl_Click(object sender, EventArgs e)
        {
            try
            {
                Session["UserName"] = null;
                Session["User"] = null;
                Response.RedirectToRoute("home", null);
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}
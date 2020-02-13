using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PAWD_Store.Startup))]
namespace PAWD_Store
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

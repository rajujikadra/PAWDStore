using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Rimp_India_Site.Startup))]
namespace Rimp_India_Site
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

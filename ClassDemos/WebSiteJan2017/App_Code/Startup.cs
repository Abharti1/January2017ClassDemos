using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebSiteJan2017.Startup))]
namespace WebSiteJan2017
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

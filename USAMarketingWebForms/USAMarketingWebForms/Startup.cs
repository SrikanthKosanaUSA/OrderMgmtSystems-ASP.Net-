using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(USAMarketingWebForms.Startup))]
namespace USAMarketingWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

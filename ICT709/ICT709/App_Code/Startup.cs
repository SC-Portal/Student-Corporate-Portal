using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ICT709.Startup))]
namespace ICT709
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

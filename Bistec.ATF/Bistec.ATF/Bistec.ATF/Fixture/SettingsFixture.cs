using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Bistec.ATF.Fixture
{
    public class SettingsFixture : IDisposable
    {
        public SettingsFixture()
        {
            var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");

            var configuration = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: false)
                .AddJsonFile($"appsettings.{env}.json", optional: true)
                .AddEnvironmentVariables()
                .Build();

            AppSettings = new AppSettings
            {
                BaseAddress = configuration["baseUrl"],
                MinimumResponseTime = int.Parse(configuration["minimumRespinseTime"])

            };


        }

        public AppSettings AppSettings { get; }

        public void Dispose()
        { 
        }
    }
}

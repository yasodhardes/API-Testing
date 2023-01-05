using Refit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bistec.ATF.Fixture
{
    public class RefitFix<TApi> : IDisposable
    {
        public TApi GetRestClient(String baseAddress) => 
            RestService.For<TApi>(baseAddress);

        public void Dispose()
        { }
    }
}

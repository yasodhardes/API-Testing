using Refit;

namespace Bistec.ATF.Fixtures
{
    public class RefitFixture<TApi>: IDisposable
    {
        public TApi GetRestClient(string baseAddress) =>
          RestService.For<TApi>(baseAddress);

        public void Dispose()
        {
        }
    }
}
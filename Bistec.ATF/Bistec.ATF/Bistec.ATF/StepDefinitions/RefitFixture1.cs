namespace Bistec.ATF.StepDefinitions
{
    public class RefitFixture<T>
    {
        private object? settings;

        [When(@"Call the Created Admin API")]
        public async Task WhenCallTheCreatedAdminAPI(ScenarioContext context) => context.Add("TOKEN", (await GetRestClient(settings.AppSettings.BaseAddress).CreateAdmin(new Refit.Models.CreateUserRequest
        {
            username = context.Get<String>("USERNAME"),
            password = context.Get<String>("PASSWORD"),
            extra = context.Get<String>("USERNAME"),
        })).content.AccessCode);

        private object GetRestClient(object baseAddress) => throw new NotImplementedException();
    }
}